package BlueBox::Data::Item;

use strict;

use base qw(Demo::DB::Object);

use BlueBox::Data::Account;
use BlueBox::Data::ItemBoxMap;

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'item',
    auto_load_related_classes => 0,


    columns => [
        account_id  => { type => 'integer', default => '0', not_null => 1 },
        description => { type => 'text', length => 65535 },
        id          => { type => 'serial', not_null => 1 },
        name        => { type => 'varchar', length => 32, not_null => 1 },
        value       => { type => 'numeric', precision => 2, scale => 8 },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        account => {
            class       => 'BlueBox::Data::Account',
            key_columns => { account_id => 'id' },
        },
    ],

    relationships => [
        boxes => {
            map_class => 'BlueBox::Data::ItemBoxMap',
            map_from  => 'item',
            map_to    => 'box',
            type      => 'many to many',
        },
    ],
);

1;

