#!/usr/bin/env perl

use strict;
# include our data objects
use BlueBox::Data;

# Just get the first user
my $user = BlueBox::Data::Account::Manager->get_objects( limit => 1 )->[0];

my $item = BlueBox::Data::Item->new( 
                account => $user,
                name => 'Huge-Ass Telescope',
                description => 'I have to put this in a lot of boxes',
                value => '5000.00' );
$item->save;

# lets add this to four boxes!
foreach my $box_number ( 0..3 )
{
    # adding all as large for the sake of an example
    my $new_box = BlueBox::Data::Box->new(
                        account => $user, # as an object
                        box_type_id => 3, # as the id field itself
                        box_status_id => 1,
                        warehouse => 1,
                        name => $user->id . '-my-scope-' . $box_number,
                        items => [ $item ] );
    $new_box->save;
}

