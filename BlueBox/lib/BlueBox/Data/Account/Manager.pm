package BlueBox::Data::Account::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use BlueBox::Data::Account;

sub object_class { 'BlueBox::Data::Account' }

__PACKAGE__->make_manager_methods('accounts');

1;

