#!/usr/bin/env perl
use strict;
use warnings;
use Literature;

Literature->setup_engine('PSGI');
my $app = sub { Literature->run(@_) };

