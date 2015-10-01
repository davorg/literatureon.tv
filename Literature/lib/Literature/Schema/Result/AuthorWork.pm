use utf8;
package Literature::Schema::Result::AuthorWork;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::AuthorWork

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

=head1 TABLE: C<author_work>

=cut

__PACKAGE__->table("author_work");

=head1 ACCESSORS

=head2 author

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 work

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "author",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "work",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</author>

=item * L</work>

=back

=cut

__PACKAGE__->set_primary_key("author", "work");

=head1 RELATIONS

=head2 author

Type: belongs_to

Related object: L<Literature::Schema::Result::Author>

=cut

__PACKAGE__->belongs_to(
  "author",
  "Literature::Schema::Result::Author",
  { id => "author" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

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


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-10-01 20:37:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:L7uwvvEd9+PMpMMj9MoX3Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
