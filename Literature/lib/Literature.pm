package Literature;
use Dancer2;
use Dancer2::Plugin::DBIC;

our $VERSION = '0.1';

my $cfg = dancer_app->config;
$cfg->{plugins}{DBIC}{default}{user} = $ENV{LIT_USER};
$cfg->{plugins}{DBIC}{default}{pass} = $ENV{LIT_PASS};

get '/' => sub {
    template 'index';
};

get '/authors/' => sub {
    template 'authors', { authors => resultset('Author') };
};

get '/authors/:id' => sub {
    template 'author', { author => resultset('Author')->find(param('id')) };
};

true;
