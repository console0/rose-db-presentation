package BlueBox::Data::Location;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    table   => 'location',

    columns => [
        id         => { type => 'serial', not_null => 1 },
        account_id => { type => 'integer', not_null => 1 },
        name       => { type => 'varchar', length => 32, not_null => 1 },
        address    => { type => 'varchar', length => 255, not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        account => {
            class       => 'BlueBox::Data::Account',
            key_columns => { account_id => 'id' },
        },
    ],

    relationships => [
        order => {
            class      => 'BlueBox::Data::Order',
            column_map => { id => 'location_id' },
            type       => 'one to many',
        },

        shipment => {
            class      => 'BlueBox::Data::Shipment',
            column_map => { id => 'location_id' },
            type       => 'one to many',
        },
    ],
);

1;
