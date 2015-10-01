package Literature::Schema::Result::FictionalCharacter;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Literature::Schema::Result::FictionalCharacter

=cut

__PACKAGE__->table("fictional_character");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 actor_roles

Type: has_many

Related object: L<Literature::Schema::Result::ActorRole>

=cut

__PACKAGE__->has_many(
  "actor_roles",
  "Literature::Schema::Result::ActorRole",
  { "foreign.fictional_character" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fictional_character_appearances

Type: has_many

Related object: L<Literature::Schema::Result::FictionalCharacterAppearance>

=cut

__PACKAGE__->has_many(
  "fictional_character_appearances",
  "Literature::Schema::Result::FictionalCharacterAppearance",
  { "foreign.fictional_character" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-01-16 19:08:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tuJMH1jzzURlsLcJ66G+ug



# You can replace this text with custom content, and it will be preserved on regeneration

sub display_name {
  my $self = shift;
  return $self->name || '';
}

1;



# You can replace this text with custom content, and it will be preserved on regeneration
1;