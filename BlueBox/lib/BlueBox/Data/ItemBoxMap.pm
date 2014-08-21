package BlueBox::Data::ItemBoxMap;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'item_box_map',
    auto_load_related_classes => 0,


    columns => [
        item_id => { type => 'integer', not_null => 1 },
        box_id  => { type => 'integer', not_null => 1 },
    ],

    primary_key_columns => [ 'item_id', 'box_id' ],

    foreign_keys => [
        box => {
            class       => 'BlueBox::Data::Box',
            key_columns => { box_id => 'id' },
        },

        item => {
            class       => 'BlueBox::Data::Item',
            key_columns => { item_id => 'id' },
        },
    ],
);

1;

