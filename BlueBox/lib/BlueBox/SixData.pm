package BlueBox::Data;

use BlueBox::Data::Account::Manager;
use BlueBox::Data::Account;
use BlueBox::Data::Box::Manager;
use BlueBox::Data::Box;
use BlueBox::Data::BoxStatus::Manager;
use BlueBox::Data::BoxStatus;
use BlueBox::Data::BoxType::Manager;
use BlueBox::Data::BoxType;
use BlueBox::Data::Item::Manager;
use BlueBox::Data::Item;
use BlueBox::Data::ItemBoxMap::Manager;
use BlueBox::Data::ItemBoxMap;
use BlueBox::Data::Location::Manager;
use BlueBox::Data::Location;
use BlueBox::Data::Order::Manager;
use BlueBox::Data::Order;
use BlueBox::Data::Shipment::Manager;
use BlueBox::Data::Shipment;
use BlueBox::Data::Warehouse::Manager;
use BlueBox::Data::Warehouse;
use BlueBox::Data;

# lets add functionality to the raw data objects
sub BlueBox::Data::Account::your_stuff_is_wet
{
    my ($self, %args) = @_;

    print "Sending email to " . $self->email . "\n";
    print "Dear " . $self->username . ",\n";
    print "We are sorry to report that warehouse " . $args{warehouse}->name . " flooded.\n";
    print "You had stuff in that warehouse, so now its basically wrecked.\n\n";
    print "Thanks,\nBlueBox :)";
    
    return;
}

1;
