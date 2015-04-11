#!/usr/bin/env perl
use strict;
use warnings;
use Literature;

use Plack::Builder;

my $app = Literature->psgi_app(@_);

builder {
  enable 'Debug';
  $app;
}
