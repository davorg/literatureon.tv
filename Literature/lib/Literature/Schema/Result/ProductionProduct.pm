package Literature::Schema::Result::ProductionProduct;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Literature::Schema::Result::ProductionProduct

=cut

__PACKAGE__->table("production_product");

=head1 ACCESSORS

=head2 production

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
  "production",
  {
    data_type      => "integer",
    default_value  => 0,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "asin",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
);
__PACKAGE__->set_primary_key("production", "asin");

=head1 RELATIONS

=head2 production

Type: belongs_to

Related object: L<Literature::Schema::Result::Production>

=cut

__PACKAGE__->belongs_to(
  "production",
  "Literature::Schema::Result::Production",
  { id => "production" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-16 19:22:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:B/kvi8Jx8ew/cI0T8tsJSA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
