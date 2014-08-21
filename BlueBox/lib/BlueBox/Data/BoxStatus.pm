package BlueBox::Data::BoxStatus;

use strict;

use base qw(Demo::DB::Object);

use BlueBox::Data::Box;

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'box_status',
    auto_load_related_classes => 0,


    columns => [
        id   => { type => 'serial', not_null => 1 },
        name => { type => 'varchar', length => 32, not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    relationships => [
        boxes => {
            class      => 'BlueBox::Data::Box',
            column_map => { id => 'box_status_id' },
            type       => 'one to many',
        },
    ],
);

1;

