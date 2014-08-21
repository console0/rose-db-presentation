package BlueBox::Data::Box;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'box',
    auto_load_related_classes => 0,


    columns => [
        id            => { type => 'serial', not_null => 1 },
        account_id    => { type => 'integer', not_null => 1 },
        box_type_id   => { type => 'integer', default => '0', not_null => 1 },
        box_status_id => { type => 'integer', default => '0', not_null => 1 },
        warehouse_id  => { type => 'integer' },
        name          => { type => 'varchar', length => 32, not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        account => {
            class       => 'BlueBox::Data::Account',
            key_columns => { account_id => 'id' },
        },

        box_status => {
            class       => 'BlueBox::Data::BoxStatus',
            key_columns => { box_status_id => 'id' },
        },

        box_type => {
            class       => 'BlueBox::Data::BoxType',
            key_columns => { box_type_id => 'id' },
        },

        warehouse => {
            class       => 'BlueBox::Data::Warehouse',
            key_columns => { warehouse_id => 'id' },
        },
    ],

    relationships => [
        items => {
            map_class => 'BlueBox::Data::ItemBoxMap',
            map_from  => 'box',
            map_to    => 'item',
            type      => 'many to many',
        },

        shipments => {
            class      => 'BlueBox::Data::Shipment',
            column_map => { id => 'box_id' },
            type       => 'one to many',
        },
    ],
);

1;

