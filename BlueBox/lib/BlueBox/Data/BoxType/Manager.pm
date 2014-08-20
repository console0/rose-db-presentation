package BlueBox::Data::BoxType::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::BoxType;

sub object_class { 'BlueBox::Data::BoxType' }

__PACKAGE__->make_manager_methods('box_type');

1;

