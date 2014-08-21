package BlueBox::Data::Item::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::Item;

sub object_class { 'BlueBox::Data::Item' }

__PACKAGE__->make_manager_methods('items');

1;

