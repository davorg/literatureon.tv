use utf8;
package Literature::Schema::Result::WorkProduct;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::WorkProduct

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

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<work_product>

=cut

__PACKAGE__->table("work_product");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 work_id

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
  "work_id",
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

=head2 work

Type: belongs_to

Related object: L<Literature::Schema::Result::Work>

=cut

__PACKAGE__->belongs_to(
  "work",
  "Literature::Schema::Result::Work",
  { id => "work_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2025-06-05 14:04:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FpYPnX5hNjxIocAGcBvMdQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
