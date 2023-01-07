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

  my @env_vars = qw[LIT_DB_HOST LIT_DB_PORT LIT_DB_NAME LIT_DB_USER LIT_DB_PASS];

  $ENV{LIT_DB_PORT} //= 3306;

  my @errs = grep { ! defined $ENV{$_} } @env_vars;

  if (@errs) {
    die "You must set ", join(', ', @errs), "\n";
  }

  my $dsn = 'dbi:mysql:' .
    "database=$ENV{LIT_DB_NAME};" .
    "host=$ENV{LIT_DB_HOST};" .
    "port=$ENV{LIT_DB_PORT}";

  return $class->connect(
    $dsn, $ENV{LIT_DB_USER}, $ENV{LIT_DB_PASS},
    {
      mysql_enable_utf8 => 1,
      quote_char => '`',
      name_sep   => '.'
    },
  ) || die;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
