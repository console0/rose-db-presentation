#!/usr/bin/env perl

use strict;
# include our data objects
use BlueBox::Data;

# All users who have a box a the secondary warehouse
my $users = BlueBox::Data::Account::Manager->get_objects(
                    require_objects => [ 'boxes' ],
                    query => [ 'box.warehouse_id' => 2 ],
                    debug => 1,
            );
foreach my $user (@$users)
{
    print "User " . $user->id . " " . $user->username . " has boxes at warehouse 2\n";
}


