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

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<work>

=cut

__PACKAGE__->table("work");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 0

=head2 published

  data_type: 'text'
  default_value: null
  is_nullable: 1

=head2 slug

  data_type: 'text'
  default_value: null
  is_nullable: 1

=head2 type

  data_type: 'text'
  default_value: null
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "published",
  { data_type => "text", default_value => \"null", is_nullable => 1 },
  "slug",
  { data_type => "text", default_value => \"null", is_nullable => 1 },
  "type",
  { data_type => "text", default_value => \"null", is_nullable => 1 },
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


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2025-06-05 14:04:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zODlWKgb9hLYLS4FJVVJbQ

with 'Literature::Role::HasSlug', 'MooX::Role::JSON_LD';

sub slug_cols { return qw[title]; }

sub json_ld_type { $_[0]->type }
sub json_ld_fields { [
  { name => 'title' },
  { datePublished => sub { $_[0]->published ?
	                $_[0]->published->strftime('%Y-%m-%d') : undef } },
] }

sub asins {
  my $self = shift;

  return () unless $self->work_products->count;

  return map { $_->asin } $self->work_products->all;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
