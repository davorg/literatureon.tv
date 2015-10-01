package Literature::Schema::Result::WorkProduct;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Literature::Schema::Result::WorkProduct

=cut

__PACKAGE__->table("work_product");

=head1 ACCESSORS

=head2 work

  data_type: 'integer'
  default_value: 0
  is_foreign_key: 1
  is_nullable: 0

=head2 asin

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "work",
  {
    data_type      => "integer",
    default_value  => 0,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "asin",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
);
__PACKAGE__->set_primary_key("work", "asin");

=head1 RELATIONS

=head2 work

Type: belongs_to

Related object: L<Literature::Schema::Result::Work>

=cut

__PACKAGE__->belongs_to(
  "work",
  "Literature::Schema::Result::Work",
  { id => "work" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-16 19:02:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dJvoeiCsac28gP+/WXuHzQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
