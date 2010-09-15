package Literature::Schema::Result::Work;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Literature::Schema::Result::Work

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

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "published",
  { data_type => "date", is_nullable => 1 },
);
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


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-12 14:15:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DkfNCwXaYQHKh9g6kwvzwA



# You can replace this text with custom content, and it will be preserved on regeneration

sub display_name {
  my $self = shift;
  return $self->title || '';
}

1;



# You can replace this text with custom content, and it will be preserved on regeneration

__PACKAGE__->many_to_many(authors => 'author_works', 'author');

1;
