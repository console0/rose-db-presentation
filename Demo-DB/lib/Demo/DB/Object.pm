package Demo::DB::Object;
use strict;
use warnings;

use Demo::DB;

use base qw(Rose::DB::Object);

use Rose::DB::Object::Helpers qw(clone_and_reset column_values_as_json init_with_json
    insert_or_update_on_duplicate_key load_speculative
    strip has_loaded_related traverse_depth_first
    column_value_pairs init_with_column_value_pairs
    as_tree init_with_tree init_with_deflated_tree);

use Scalar::Util qw( blessed );

our $VERSION = '1.0';

# Rose::DB::Object::Metadata->column_type_class(password => 'Chameleon5::DB::Column::Password');
# Rose::DB::Object::Metadata->column_type_class(md5 => 'Chameleon5::DB::Column::MD5');

#__PACKAGE__->meta->cached_objects_expire_in('5s');

BEGIN:
{
    *init_db = sub { Demo::DB->new_or_cached(); };
}

1;
