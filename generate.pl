#!/usr/bin/env perl
use strict;
use warnings;

use Cwd;
use Getopt::Long;
use Demo::DB;
use Rose::DB::Object::Loader;

my ($domain, $schema);
my $db           = Demo::DB->new;
my $host         = $db->host;
my $username     = $db->username;
my $password     = $db->password;

my $embed_schema  = 1;
my $include_views = 0;
my $verbose       = 0;
my @tables;
my @exclude_tables;
my $module;

GetOptions(
    "schema=s" => \$schema,
    "package=s" => \$module,
    "host:s"     => \$host,
    "username:s" => \$username,
    "password:s" => \$password,
    "embed-schema"    => \$embed_schema,
    "include-views"   => \$include_views,
    "verbose"         => \$verbose,
    "table:s"         => \@tables,
    "exclude-table:s" => \@exclude_tables,
);

usage() unless $schema && $module;

$Rose::DB::Object::Loader::Debug = $verbose;
my $require_primary_key = $include_views ? 1 : 0;

my $loader = Rose::DB::Object::Loader->new(
    db_dsn      => "dbi:mysql:database=$schema;host=$host",
    db_username => $username,
    db_schema   => $schema,
    db_password => $password,

    require_primary_key => 0,
    include_views       => $include_views,

    include_tables => @tables ? \@tables : undef,
    exclude_tables => \@exclude_tables,

    class_prefix => "${module}::Data",
    base_classes => [
        "Demo::DB::Object",
    ],
);

my $mod_dir = './' . $module;
my $mod_path = $module;

$mod_path =~ s/\:\:/\//g;
$mod_path =~ s/\/$//g;
$mod_dir =~ s/\:\:/\-/g;
$mod_dir .= '/lib/';
system ("mkdir -p $mod_dir") if (!-f $mod_dir);

use Lingua::EN::Inflect;
my $convention = Rose::DB::Object::ConventionManager->new;
$convention->tables_are_singular(1);
$convention->plural_to_singular_function( sub { my $val = shift; return $val; } );
$convention->singular_to_plural_function(\&Lingua::EN::Inflect::PL);

#$convention->

$loader->convention_manager($convention);
$loader->make_modules(
    module_dir         => $mod_dir,
    with_foreign_keys  => 1,
    with_managers      => 1,
    with_relationships => 1,
    with_unique_keys   => 1,
);

system("echo " . $mod_dir .'/'.$mod_path . '/Data.pm');
system("echo package " .$module . '::Data\; >' . $mod_dir .'/'.$mod_path . '/Data.pm');
system("grep -r package $mod_dir/* | grep Data | cut -d':' -f2- | sed s/^package/use/g | grep -v AutoBase >> " . $mod_dir .'/'.$mod_path . '/Data.pm');
system('echo 1\; >> ' . $mod_dir .'/'.$mod_path . '/Data.pm');


###############################################################################

sub usage
{
    print <<USAGE;
    Example usage: generate-dataobjects.pl --module Your::Code --schema your_schema

    Required arguments:
        --package PACKAGE
                        The package: MyDemo::Thing

        --schema SCHEMA
                        The schema to use to generate the DataObjects.
                        Examples:  your_schema, demo_blog

    Optional arguments:
        --host HOST
                        The MySQL host to connect to.
                        Defaults to the values used by ;

        --username USERNAME
                        The MySQL username to authenticate with.

        --password PASSWORD
                        The MySQL password to authenticate with.

        --embed-schema
                        Embeds the value of --schema in the DataObjects when enabled.
                        Otherwise, the DataObjects will use __PACKAGE__->SCHEMA

        --include-views
                        Generate objects and managers for views in addition to tables.

        --table
                        Ex:  --table registry --table history
                        Generate objects and relationships for the specified table.
                        Can be called multiple times.

        --exclude-table
                        Ex:  --exclude-table audit_log
                        Do not generate objects and relationships for the specified table.
                        Can be called multiple times.

        --verbose
USAGE
    exit 1;
}

# Overriding this method to force schema into our DOs
sub Rose::DB::Object::Metadata::Auto::perl_table_definition
{
      my($self, %args) = @_;

      my $for_setup = $args{'for_setup'};
      my $indent = defined $args{'indent'} ? $args{'indent'} : $self->default_perl_indent;

      my $table = $self->table;
      $table =~ s/'/\\'/;
                                                                                                                                                                                                        
      if($args{'for_setup'})
      {
        $indent = ' ' x $indent;
        # Hacking schema in
        return qq(${indent}schema => @{[ $embed_schema ? "'$schema'" : '__PACKAGE__->SCHEMA' ]},\n${indent}table  => '$table',\n${indent}auto_load_related_classes => 0,\n);

      }

      return qq(__PACKAGE__->meta->table('$table'););
}

