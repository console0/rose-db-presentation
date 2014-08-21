package BlueBox::Data::Item;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'item',

    columns => [
        id          => { type => 'serial', not_null => 1 },
        box_id      => { type => 'integer', not_null => 1 },
        name        => { type => 'varchar', length => 32, not_null => 1 },
        description => { type => 'text', length => 65535 },
        value       => { type => 'numeric', precision => 8, scale => 2 },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        box => {
            class       => 'BlueBox::Data::Box',
            key_columns => { box_id => 'id' },
        },
    ],
);

1;

