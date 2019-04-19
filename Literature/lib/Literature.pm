package Literature;
use Dancer2;
use Dancer2::Plugin::DBIC;
use Lingua::EN::Inflexion;

our $VERSION = '0.1';

my $cfg = dancer_app->config;
$cfg->{plugins}{DBIC}{default}{user} = $ENV{LIT_USER};
$cfg->{plugins}{DBIC}{default}{password} = $ENV{LIT_PASS};

my %resources = qw[
  actors Actor
  authors Author
  productions Production
  works Work
  fictional_characters FictionalCharacter
];

my $route_re = '/(' . join('|', keys %resources) . ')/(\d+)?';

get '/' => sub {
    template 'index';
};

get qr{^$route_re$} => sub {
  my ($resource, $id) = splat;

  if (defined $id) {
    template noun($resource)->singular, {
      lc $resources{$resource} =>
        resultset($resources{$resource})->find($id)
    };
  } else {
    template $resource, {
      $resource => resultset($resources{$resource})
    };
  }
};

true;
