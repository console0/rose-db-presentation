package BlueBox::Data::Order;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    table   => 'order',

    columns => [
        id          => { type => 'serial', not_null => 1 },
        account_id  => { type => 'integer', not_null => 1 },
        location_id => { type => 'integer', not_null => 1 },
        qty         => { type => 'integer', not_null => 1 },
        ordered_on  => { type => 'datetime', not_null => 1 },
        deliver_on  => { type => 'datetime' },
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

