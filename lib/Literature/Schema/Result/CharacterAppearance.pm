use utf8;
package Literature::Schema::Result::CharacterAppearance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Literature::Schema::Result::CharacterAppearance

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

=head1 TABLE: C<character_appearance>

=cut

__PACKAGE__->table("character_appearance");

=head1 ACCESSORS

=head2 character

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 work

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "character",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "work",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</character>

=item * L</work>

=back

=cut

__PACKAGE__->set_primary_key("character", "work");

=head1 RELATIONS

=head2 character

Type: belongs_to

Related object: L<Literature::Schema::Result::Character>

=cut

__PACKAGE__->belongs_to(
  "character",
  "Literature::Schema::Result::Character",
  { id => "character" },
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


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-04-20 15:23:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k2VvpkxMLka2E11gvnBWMg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
