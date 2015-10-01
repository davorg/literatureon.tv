use utf8;
package Literature::Schema::Result::Production;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::Production

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

=head1 TABLE: C<production>

=cut

__PACKAGE__->table("production");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 work

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 year

  data_type: 'year'
  is_nullable: 1

=head2 made_by

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "work",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "year",
  { data_type => "year", is_nullable => 1 },
  "made_by",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 actor_roles

Type: has_many

Related object: L<Literature::Schema::Result::ActorRole>

=cut

__PACKAGE__->has_many(
  "actor_roles",
  "Literature::Schema::Result::ActorRole",
  { "foreign.production" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 production_products

Type: has_many

Related object: L<Literature::Schema::Result::ProductionProduct>

=cut

__PACKAGE__->has_many(
  "production_products",
  "Literature::Schema::Result::ProductionProduct",
  { "foreign.production_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 work

Type: belongs_to

Related object: L<Literature::Schema::Result::Work>

=cut

__PACKAGE__->belongs_to(
  "work",
  "Literature::Schema::Result::Work",
  { id => "work" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-10-01 21:43:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VKyKvC7VRvcrLrcmb7NMKA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
