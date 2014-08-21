#!/usr/bin/env perl

use strict;
# include our data objects
use BlueBox::Data;

my $item = BlueBox::Data::Item::Manager->get_objects( limit => 1 )->[0];

print "Item " . $item->name ."\n";
my $boxes = $item->boxes;
foreach my $box (@$boxes)
{
    print "Part of this item is in box " . $box->name . " warehouse " . $box->warehouse->name . "\n";
}
