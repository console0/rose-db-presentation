#!/usr/bin/env perl

use strict;
# include our data objects
use BlueBox::Data;

my @users = qw(userone usertwo userthree userfour console0);

# everything will be at the main warehouse
my $warehouse = BlueBox::Data::Warehouse->new( id => 1 )->load;

foreach my $username (@users)
{
    print "Creating user: $username...";
    my $user = BlueBox::Data::Account->new( username => $username, email => $username . '@wheemail.com' );
    $user->save;
    
    my $location = BlueBox::Data::Location->new( 
                        account => $user, 
                        name => 'Delivery address for ' . $user->username,
                        address => sprintf("%04s",int(rand(9999))) . " Test Rd, Cincinnati, OH 45" . sprintf("%03s",int(rand(999)))
                    );
    $location->save;

    print "done (id " . $user->id . ")\n";


    # lets randomly select some number of boxes to create per user
    my $boxcount = int(rand(9));
    foreach my $box_number ( 0..$boxcount )
    {
        # adding all as large for the sake of an example
        my $new_box = BlueBox::Data::Box->new(
                            account => $user, # as an object
                            box_type_id => 3, # as the id field itself
                            box_status_id => 1,
                            warehouse => $warehouse,
                            name => $user->id . '-' . $box_number . '-' . $user->username . '-large-' . sprintf("%04s",int(rand(9999))) );
        $new_box->save;
    }
}


