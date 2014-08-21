package BlueBox::Data::Account;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'account',
    auto_load_related_classes => 0,


    columns => [
        id       => { type => 'serial', not_null => 1 },
        username => { type => 'varchar', length => 64 },
        email    => { type => 'varchar', length => 128 },
    ],

    primary_key_columns => [ 'id' ],

    relationships => [
        boxes => {
            class      => 'BlueBox::Data::Box',
            column_map => { id => 'account_id' },
            type       => 'one to many',
        },

        items => {
            class      => 'BlueBox::Data::Item',
            column_map => { id => 'account_id' },
            type       => 'one to many',
        },

        locations => {
            class      => 'BlueBox::Data::Location',
            column_map => { id => 'account_id' },
            type       => 'one to many',
        },

        orders => {
            class      => 'BlueBox::Data::Order',
            column_map => { id => 'account_id' },
            type       => 'one to many',
        },
    ],
);

1;

