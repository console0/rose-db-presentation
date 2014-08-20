package BlueBox::Data::Warehouse;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    table   => 'warehouse',

    columns => [
        id      => { type => 'serial', not_null => 1 },
        name    => { type => 'varchar', length => 32, not_null => 1 },
        address => { type => 'varchar', length => 255, not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    relationships => [
        box => {
            class      => 'BlueBox::Data::Box',
            column_map => { id => 'warehouse_id' },
            type       => 'one to many',
        },
    ],
);

1;

