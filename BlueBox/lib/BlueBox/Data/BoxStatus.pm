package BlueBox::Data::BoxStatus;

use strict;

use base qw(Demo::DB::Object);

__PACKAGE__->meta->setup(
    table   => 'box_status',

    columns => [
        id   => { type => 'serial', not_null => 1 },
        name => { type => 'varchar', length => 32, not_null => 1 },
    ],

    primary_key_columns => [ 'id' ],

    relationships => [
        box => {
            class      => 'BlueBox::Data::Box',
            column_map => { id => 'status_id' },
            type       => 'one to many',
        },
    ],
);

1;

