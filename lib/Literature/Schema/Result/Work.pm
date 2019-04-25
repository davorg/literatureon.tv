use utf8;
package Literature::Schema::Result::Work;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::Work

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

=head1 TABLE: C<work>

=cut

__PACKAGE__->table("work");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 published

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 slug

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 type

  data_type: 'enum'
  extra: {list => ["Book","Play"]}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "published",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "slug",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "type",
  {
    data_type => "enum",
    extra => { list => ["Book", "Play"] },
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 author_works

Type: has_many

Related object: L<Literature::Schema::Result::AuthorWork>

=cut

__PACKAGE__->has_many(
  "author_works",
  "Literature::Schema::Result::AuthorWork",
  { "foreign.work" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 character_appearances

Type: has_many

Related object: L<Literature::Schema::Result::CharacterAppearance>

=cut

__PACKAGE__->has_many(
  "character_appearances",
  "Literature::Schema::Result::CharacterAppearance",
  { "foreign.work" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fictional_character_appearances

Type: has_many

Related object: L<Literature::Schema::Result::FictionalCharacterAppearance>

=cut

__PACKAGE__->has_many(
  "fictional_character_appearances",
  "Literature::Schema::Result::FictionalCharacterAppearance",
  { "foreign.work" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 productions

Type: has_many

Related object: L<Literature::Schema::Result::Production>

=cut

__PACKAGE__->has_many(
  "productions",
  "Literature::Schema::Result::Production",
  { "foreign.work" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 work_products

Type: has_many

Related object: L<Literature::Schema::Result::WorkProduct>

=cut

__PACKAGE__->has_many(
  "work_products",
  "Literature::Schema::Result::WorkProduct",
  { "foreign.work_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 authors

Type: many_to_many

Composing rels: L</author_works> -> author

=cut

__PACKAGE__->many_to_many("authors", "author_works", "author");

=head2 characters

Type: many_to_many

Composing rels: L</character_appearances> -> character

=cut

__PACKAGE__->many_to_many("characters", "character_appearances", "character");

=head2 fictional_characters

Type: many_to_many

Composing rels: L</fictional_character_appearances> -> fictional_character

=cut

__PACKAGE__->many_to_many(
  "fictional_characters",
  "fictional_character_appearances",
  "fictional_character",
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2019-04-25 14:55:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xtnwNE+fA9uoIHf4kCRPeA

with 'Literature::Role::HasSlug';

sub slug_cols { return qw[title]; }

sub asins {
  my $self = shift;

  return () unless $self->work_products->count;

  return map { $_->asin } $self->work_products->all;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
