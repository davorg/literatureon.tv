use utf8;
package Literature::Schema::Result::Character;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::Character

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

=head1 TABLE: C<character>

=cut

__PACKAGE__->table("character");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 slug

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "slug",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 255,
  },
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
  { "foreign.character" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 character_appearances

Type: has_many

Related object: L<Literature::Schema::Result::CharacterAppearance>

=cut

__PACKAGE__->has_many(
  "character_appearances",
  "Literature::Schema::Result::CharacterAppearance",
  { "foreign.character" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 works

Type: many_to_many

Composing rels: L</character_appearances> -> work

=cut

__PACKAGE__->many_to_many("works", "character_appearances", "work");


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2025-06-05 14:04:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uGIoPtnSjwizUmIoz1Wh2g

with 'Literature::Role::HasSlug', 'MooX::Role::JSON_LD';

sub slug_cols { return qw[name]; }

sub json_ld_type { 'Person' }

sub json_ld_fields {
  [ qw[ name ] ]
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
