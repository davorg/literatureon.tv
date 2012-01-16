#!/usr/bin/env perl
use strict;
use warnings;
use Literature;

my $app = Literature->psgi_app(@_);

