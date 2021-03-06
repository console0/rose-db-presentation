package BlueBox::Data::Shipment;

use strict;

use base qw(Demo::DB::Object);

use BlueBox::Data::Box;
use BlueBox::Data::Location;

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'shipment',
    auto_load_related_classes => 0,


    columns => [
        box_id      => { type => 'integer', not_null => 1 },
        created     => { type => 'datetime', not_null => 1 },
        deliver_on  => { type => 'datetime', not_null => 1 },
        id          => { type => 'serial', not_null => 1 },
        location_id => { type => 'integer', not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        box => {
            class       => 'BlueBox::Data::Box',
            key_columns => { box_id => 'id' },
        },

        location => {
            class       => 'BlueBox::Data::Location',
            key_columns => { location_id => 'id' },
        },
    ],
);

1;

