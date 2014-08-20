package BlueBox::Data::BoxStatus::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::BoxStatus;

sub object_class { 'BlueBox::Data::BoxStatus' }

__PACKAGE__->make_manager_methods('box_status');

1;

