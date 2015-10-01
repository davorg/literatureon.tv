package Literature;
use Dancer2;
use Dancer2::Plugin::DBIC;

our $VERSION = '0.1';

my $cfg = dancer_app->config;
$cfg->{plugins}{DBIC}{default}{user} = $ENV{LIT_USER};
$cfg->{plugins}{DBIC}{default}{pass} = $ENV{LIT_PASS};

my %resources = qw[
  actors Actor
  authors Author
  productions Production
  works Work
  fictional_characters FictionalCharacter
];

my $route_re = '/(' . join('|', keys %resources) . ')/';
my $id_re    = $route_re . '(\d+)';

get '/' => sub {
    template 'index';
};

get qr{^$route_re$} => sub {
  my ($resource) = splat;
  template $resource,
    { $resource => resultset($resources{$resource}) };
};

get qr{$id_re} => sub {
  my ($resource, $id) = splat;
  template substr($resource, 0, -1),
    { lc $resources{$resource} => resultset($resources{$resource})->find($id) };
};

true;
