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

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

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
  default_value: null
  is_nullable: 1
  size: 255

=head2 work

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 year

  data_type: 'year'
  default_value: null
  is_nullable: 1
  size: 4

=head2 made_by

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 255

=head2 slug

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 255

=head2 type

  data_type: 'text'
  default_value: null
  is_nullable: 1

=head2 imdb

  data_type: 'char'
  is_nullable: 1
  size: 15

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 255,
  },
  "work",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "year",
  { data_type => "year", default_value => \"null", is_nullable => 1, size => 4 },
  "made_by",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 255,
  },
  "slug",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 255,
  },
  "type",
  { data_type => "text", default_value => \"null", is_nullable => 1 },
  "imdb",
  { data_type => "char", is_nullable => 1, size => 15 },
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
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2025-06-07 12:12:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UbzdQNogjQ+Zdy0MJrzqYQ

__PACKAGE__->many_to_many( actors => 'actor_roles', 'actor' );

with 'Literature::Role::HasSlug', 'MooX::Role::JSON_LD';

use List::Util qw(shuffle);

sub slug_cols { return qw[title year]; }

sub json_ld_type {
  return {
    'Film'      => 'Movie',
    'TV Series' => 'TVSeries',
  }->{$_[0]->type};
}

sub json_ld_fields {
  return [
    { name => 'title' },
    { productionCompany => 'made_by' },
  ];
}

around title => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    return $self->$orig(@_);
  } else {
    return $self->$orig // $self->work->title;
  }
};

sub description{
  my $self = shift;

  my $description = '';

  if ($self->made_by) {
    $description = $self->made_by . ' - ';
  }

  $description .= $self->year;

  return $description;
}

sub products {
  my $self = shift;
  my ($count) = @_;
  $count //= 3;

  my @products = $self->production_products->all;

  if (@products < $count) {
    push @products, $self->work->work_products->all;
  }

  @products = shuffle(@products);

  $#products = $count -1 if $#products >= $count;

  return [ map { $_->asin } @products ];
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
