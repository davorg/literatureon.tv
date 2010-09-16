package Literature::Schema::Result::ActorRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Literature::Schema::Result::ActorRole

=cut

__PACKAGE__->table("actor_role");

=head1 ACCESSORS

=head2 actor

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 production

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 fictional_character

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "actor",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "production",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "fictional_character",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("actor", "production", "fictional_character");

=head1 RELATIONS

=head2 actor

Type: belongs_to

Related object: L<Literature::Schema::Result::Actor>

=cut

__PACKAGE__->belongs_to(
  "actor",
  "Literature::Schema::Result::Actor",
  { id => "actor" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 production

Type: belongs_to

Related object: L<Literature::Schema::Result::Production>

=cut

__PACKAGE__->belongs_to(
  "production",
  "Literature::Schema::Result::Production",
  { id => "production" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

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


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-16 19:02:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TpgRd+UyqsHHJp3opqP0/Q



# You can replace this text with custom content, and it will be preserved on regeneration

sub display_name {
  my $self = shift;

  return $self->actor->name . ' played ' . 
         $self->fictional_character->name . ' in ' .
         $self->production->title . ' (' .
         $self->production->made_by . ', ' .
         $self->production->year . ')';
}

1;



# You can replace this text with custom content, and it will be preserved on regeneration
1;
