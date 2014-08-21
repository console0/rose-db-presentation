#!/usr/bin/env perl

use strict;
# include our data objects
use BlueBox::Data;

my $box_name = shift || die("Please enter box name");
 
# lets use the manager class for the object to do the search
# managers return arrayrefs of their object classes
my $results = BlueBox::Data::Box::Manager->get_objects(
                    query => [ name => $box_name ] );

if (my $box = $$results[0])
{
    print "Box located: " . $box->id . "\n";
    #lets use some of the relationships to get additinal info

    print "Located at warehouse " . $box->warehouse->id . ": " . $box->warehouse->address . "\n";
    print "Owned by account: " . $box->account->username . "\n";
}
else
{
    print "Box named $box_name is not tracked in the system\n";
}
