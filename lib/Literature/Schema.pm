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

use DBD::SQLite::Constants ':dbd_sqlite_string_mode';

sub get_schema {
  my $class = shift;

  my @env_vars = qw[LIT_DB_FILE];

  my @errs = grep { ! defined $ENV{$_} } @env_vars;

  if (@errs) {
    die "You must set ", join(', ', @errs), "\n";
  }

  my $dsn = "dbi:SQLite:dbname=$ENV{LIT_DB_FILE}";

  return $class->connect(
    $dsn, '', '',
    {
      sqlite_string_mode => DBD_SQLITE_STRING_MODE_UNICODE_STRICT,
    },
  ) || die;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
