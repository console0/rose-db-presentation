package BlueBox::Data::Order;

use strict;

use base qw(Demo::DB::Object);

use BlueBox::Data::Account;
use BlueBox::Data::Location;

__PACKAGE__->meta->setup(
    schema => 'bluebox',
    table  => 'order',
    auto_load_related_classes => 0,


    columns => [
        account_id  => { type => 'integer', not_null => 1 },
        deliver_on  => { type => 'datetime' },
        id          => { type => 'serial', not_null => 1 },
        location_id => { type => 'integer', not_null => 1 },
        ordered_on  => { type => 'datetime', not_null => 1 },
        qty         => { type => 'integer', not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        account => {
            class       => 'BlueBox::Data::Account',
            key_columns => { account_id => 'id' },
        },

        location => {
            class       => 'BlueBox::Data::Location',
            key_columns => { location_id => 'id' },
        },
    ],
);

1;

