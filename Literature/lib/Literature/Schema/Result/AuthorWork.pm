package Literature::Schema::Result::AuthorWork;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Literature::Schema::Result::AuthorWork

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


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-12 14:05:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Z4xTsMLpA8Ydy9sQpG5QhA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
