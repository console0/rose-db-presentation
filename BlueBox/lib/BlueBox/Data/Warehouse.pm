package BlueBox::Data::Warehouse;

use strict;

use base qw(Demo::DB::Object);

use BlueBox::Data::Box;

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'warehouse',
    auto_load_related_classes => 0,


    columns => [
        address => { type => 'varchar', length => 255, not_null => 1 },
        id      => { type => 'serial', not_null => 1 },
        name    => { type => 'varchar', length => 32, not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    relationships => [
        boxes => {
            class      => 'BlueBox::Data::Box',
            column_map => { id => 'warehouse_id' },
            type       => 'one to many',
        },
    ],
);

1;

