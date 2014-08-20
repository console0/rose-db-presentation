package Demo::DB;

use strict;
use warnings;

our $VERSION = '1';
use Rose::DB;

our @ISA = qw(Rose::DB);

__PACKAGE__->use_private_registry;
__PACKAGE__->default_connect_options( mysql_enable_utf8 => 1, mysql_read_default_file => '/etc/my.cnf', mysql_auto_reconnect => 1 );
__PACKAGE__->register_db( domain           => 'demo',
                          type             => 'localhost',
                          driver           => 'mysql',
                          host             => 'localhost',
                          username         => 'root',
                          password         => '' );

# Set the default domain and type
__PACKAGE__->default_domain('demo');
__PACKAGE__->default_type('localhost');

# Load fix-up files, if any
__PACKAGE__->auto_load_fixups;

sub dbi_connect
{
    shift;
    #warn "connecting to DBI using options: " . Dumper([@_]);
    DBI->connect_cached(@_);
}

1;
