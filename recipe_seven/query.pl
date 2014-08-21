#!/usr/bin/env perl

use strict;
# include our data objects
use BlueBox::Data;

my $username = shift || 'console0';
# searching with the manager

my $user = BlueBox::Data::Account::Manager->get_objects(
                    query => [ username => $username ],
            )->[0];

if ($user)
{
    print "Searching for $username found user id " . $user->id . "\n";
}

# how about a "like" search
my $boxes = BlueBox::Data::Box::Manager->get_objects(
                    query => [ name => { like => '%' . $username . '%' } ],
            );

foreach my $box (@$boxes)
{
    print "Searching for $username found box named " . $box->name . "\n";
}

# i just want to use a query

my $sql_boxes = BlueBox::Data::Box::Manager->get_objects_from_sql(
                    sql => "select * from bluebox.box where name like ?",
                    args => [ '%' . $username . '%' ] );

foreach my $box (@$sql_boxes)
{
    print "Searching for $username via sql found box named " . $box->name . "\n";
}
