use utf8;
package Literature::Schema::Result::ProductionProduct;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::ProductionProduct

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<production_product>

=cut

__PACKAGE__->table("production_product");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 production_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 asin

  data_type: 'char'
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "production_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "asin",
  { data_type => "char", is_nullable => 0, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 production

Type: belongs_to

Related object: L<Literature::Schema::Result::Production>

=cut

__PACKAGE__->belongs_to(
  "production",
  "Literature::Schema::Result::Production",
  { id => "production_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-10-01 21:43:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vPLXwNMJRQWtSYhJyZgcKg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
