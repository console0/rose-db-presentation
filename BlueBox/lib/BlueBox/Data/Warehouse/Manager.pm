package BlueBox::Data::Warehouse::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::Warehouse;

sub object_class { 'BlueBox::Data::Warehouse' }

__PACKAGE__->make_manager_methods('warehouses');

1;

