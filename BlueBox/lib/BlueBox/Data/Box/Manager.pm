package BlueBox::Data::Box::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::Box;

sub object_class { 'BlueBox::Data::Box' }

__PACKAGE__->make_manager_methods('boxes');

1;

