use utf8;
package Literature::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-10-01 20:37:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LLfKaZZTfOORlQkSPO9kIg

sub get_schema {
  my $class = shift;

  unless ($ENV{LIT_USER} and $ENV{LIT_PASS}) {
    die "You must set LIT_USER and LIT_PASS\n";
  }

  return $class->connect(
    "dbi:mysql:database=literature",
    $ENV{LIT_USER}, $ENV{LIT_PASS},
    { mysql_enable_utf8 => 1 },
  ) || die;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
