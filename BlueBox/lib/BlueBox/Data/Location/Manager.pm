package BlueBox::Data::Location::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::Location;

sub object_class { 'BlueBox::Data::Location' }

__PACKAGE__->make_manager_methods('location');

1;

