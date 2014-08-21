package BlueBox::Data::Location;

use strict;

use base qw(Demo::DB::Object);

use BlueBox::Data::Account;
use BlueBox::Data::Order;
use BlueBox::Data::Shipment;

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'location',
    auto_load_related_classes => 0,


    columns => [
        account_id => { type => 'integer', not_null => 1 },
        address    => { type => 'varchar', length => 255, not_null => 1 },
        id         => { type => 'serial', not_null => 1 },
        name       => { type => 'varchar', length => 32, not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        account => {
            class       => 'BlueBox::Data::Account',
            key_columns => { account_id => 'id' },
        },
    ],

    relationships => [
        orders => {
            class      => 'BlueBox::Data::Order',
            column_map => { id => 'location_id' },
            type       => 'one to many',
        },

        shipments => {
            class      => 'BlueBox::Data::Shipment',
            column_map => { id => 'location_id' },
            type       => 'one to many',
        },
    ],
);

1;

