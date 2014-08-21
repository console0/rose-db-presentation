package BlueBox::Data::Account;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'account',

    columns => [
        id       => { type => 'serial', not_null => 1 },
        username => { type => 'varchar', length => 64 },
    ],

    primary_key_columns => [ 'id' ],

    relationships => [
        box => {
            class      => 'BlueBox::Data::Box',
            column_map => { id => 'account_id' },
            type       => 'one to many',
        },

        location => {
            class      => 'BlueBox::Data::Location',
            column_map => { id => 'account_id' },
            type       => 'one to many',
        },

        order => {
            class      => 'BlueBox::Data::Order',
            column_map => { id => 'account_id' },
            type       => 'one to many',
        },
    ],
);

1;

