use utf8;
package Literature::Schema::Result::Author;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::Author

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

=head1 TABLE: C<author>

=cut

__PACKAGE__->table("author");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 born

  data_type: 'datetime'
  default_value: null
  is_nullable: 1

=head2 died

  data_type: 'datetime'
  default_value: null
  is_nullable: 1

=head2 imdb

  data_type: 'char'
  is_nullable: 0
  size: 15

=head2 slug

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 255

=head2 biography

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "born",
  { data_type => "datetime", default_value => \"null", is_nullable => 1 },
  "died",
  { data_type => "datetime", default_value => \"null", is_nullable => 1 },
  "imdb",
  { data_type => "char", is_nullable => 0, size => 15 },
  "slug",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 255,
  },
  "biography",
  { data_type => "text", is_nullable => 1 },
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
  { "foreign.author" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 works

Type: many_to_many

Composing rels: L</author_works> -> work

=cut

__PACKAGE__->many_to_many("works", "author_works", "work");


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2025-06-08 10:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TMyjbCXz1Kei1lLILZT0Xw

with 'Literature::Role::HasSlug', 'MooX::Role::JSON_LD';

use List::Util qw(shuffle);

sub slug_cols { return qw[name]; }

sub json_ld_type { 'Person' }

sub json_ld_fields {
  [
    'name',
    { birthDate => sub { $_[0]->born->strftime('%Y-%m-%d') } },
    { deathDate => sub { $_[0]->died ?
		     $_[0]->died->strftime('%Y-%m-%d') : undef } },
  ]
}

sub image {
  my $self = shift;
  
  return {
    path => "/authors/" . $self->slug . ".png",
    alt  => 'Portrait of ' . $self->name,
  };
}

sub products {
  my $self = shift;
  my ($count) = @_;
  $count //= 3;

  my @products = map { $_->work_products->all } $self->works->all;

  if (@products < $count) {
    for my $work ($self->works) {
      push @products, $_->production_products for $work->productions->all;
    }
  }

  @products = shuffle(@products);

  $#products = $count -1 if $#products >= $count;

  return [ map { $_->asin } @products ];
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
