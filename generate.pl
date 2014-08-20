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

sub Rose::DB::Object::ConventionManager::table_to_class
{
    my($self, $table, $prefix, $plural) = @_;

    $table =~ s/_(.)/\U$1/g;
    $table =~ s/[^\w:]/_/g;
    $table = ($prefix || '') . ucfirst $table; 
    $table =~ s/Api/API/g;
    $table =~ s/Statu$/Status/g;
    return $table;
}


package Demo::DB::Object::ConventionManager;

use base qw(Rose::DB::Object::ConventionManager);
use Data::Dumper;

sub new
{
    my ($class, %args) = @_;
    my $self = $class->SUPER::new(%args);
    $self->tables_are_singular(1);
    return $self;
}

sub table_to_class
{
    my($self, $table, $prefix, $plural) = @_;

    warn "$table";
    $table = $self->SUPER::table_to_class($table, $prefix, $plural);
    $table =~ s/Api/API/g;
    $table =~ s/Statu$/Status/g;
    return $table;
}

sub looks_like_map_table
{
    my($self, $table) = @_;

    return $table =~ /^(\w+_){2,}map$|^\w+_has_\w+$/;
}

sub AUTOLOAD 
{
    warn Dumper(@_);
    our $AUTOLOAD;
    warn "Attempt to call $AUTOLOAD failed.\n";
}

1;

