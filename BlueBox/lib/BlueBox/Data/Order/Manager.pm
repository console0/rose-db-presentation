package BlueBox::Data::Order::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::Order;

sub object_class { 'BlueBox::Data::Order' }

__PACKAGE__->make_manager_methods('order');

1;

