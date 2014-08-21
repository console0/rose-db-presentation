package BlueBox::Data::Shipment::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::Shipment;

sub object_class { 'BlueBox::Data::Shipment' }

__PACKAGE__->make_manager_methods('shipments');

1;

