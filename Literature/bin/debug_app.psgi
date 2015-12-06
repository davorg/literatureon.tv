#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Plack::Builder;

use Literature;
my $app = Literature->to_app;

builder {
  enable 'Debug', panels =>
      [ qw(Environment Response Timer Memory),
        [ 'DBITrace', level => 2 ]
      ];
  $app;
}
