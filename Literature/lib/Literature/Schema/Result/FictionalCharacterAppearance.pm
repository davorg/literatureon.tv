package Literature::Schema::Result::FictionalCharacterAppearance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Literature::Schema::Result::FictionalCharacterAppearance

=cut

__PACKAGE__->table("fictional_character_appearance");

=head1 ACCESSORS

=head2 fictional_character

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 work

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "fictional_character",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "work",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("fictional_character", "work");

=head1 RELATIONS

=head2 fictional_character

Type: belongs_to

Related object: L<Literature::Schema::Result::FictionalCharacter>

=cut

__PACKAGE__->belongs_to(
  "fictional_character",
  "Literature::Schema::Result::FictionalCharacter",
  { id => "fictional_character" },
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


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-16 19:02:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WFnVUxHgZteoJXrfQR93rQ



# You can replace this text with custom content, and it will be preserved on regeneration

sub display_name {
  my $self = shift;

  return $self->name . ' appears in ' . $self->work->title;
}

1;



# You can replace this text with custom content, and it will be preserved on regeneration
1;
