package BlueBox::Data::ItemBoxMap::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::ItemBoxMap;

sub object_class { 'BlueBox::Data::ItemBoxMap' }

__PACKAGE__->make_manager_methods('item_box_maps');

1;

