#!/usr/bin/env perl

use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
eval "use Catalyst::Helper;";

if ($@) {
  die <<END;
To use the Catalyst development tools including catalyst.pl and the
generated script/myapp_create.pl you need Catalyst::Helper, which is
part of the Catalyst-Devel distribution. Please install this via a
vendor package or by running one of -

  perl -MCPAN -e 'install Catalyst::Devel'
  perl -MCPANPLUS -e 'install Catalyst::Devel'
END
}

my $force = 0;
my $mech  = 0;
my $help  = 0;

GetOptions(
    'nonew|force'    => \$force,
    'mech|mechanize' => \$mech,
    'help|?'         => \$help
 );

pod2usage(1) if ( $help || !$ARGV[0] );

my $helper = Catalyst::Helper->new( { '.newfiles' => !$force, mech => $mech } );

pod2usage(1) unless $helper->mk_component( 'Literature', @ARGV );

1;

=head1 NAME

literature_create.pl - Create a new Catalyst Component

=head1 SYNOPSIS

literature_create.pl [options] model|view|controller name [helper] [options]

 Options:
   -force        don't create a .new file where a file to be created exists
   -mechanize    use Test::WWW::Mechanize::Catalyst for tests if available
   -help         display this help and exits

 Examples:
   literature_create.pl controller My::Controller
   literature_create.pl -mechanize controller My::Controller
   literature_create.pl view My::View
   literature_create.pl view MyView TT
   literature_create.pl view TT TT
   literature_create.pl model My::Model
   literature_create.pl model SomeDB DBIC::Schema MyApp::Schema create=dynamic\
   dbi:SQLite:/tmp/my.db
   literature_create.pl model AnotherDB DBIC::Schema MyApp::Schema create=static\
   dbi:Pg:dbname=foo root 4321

 See also:
   perldoc Catalyst::Manual
   perldoc Catalyst::Manual::Intro

=head1 DESCRIPTION

Create a new Catalyst Component.

Existing component files are not overwritten.  If any of the component files
to be created already exist the file will be written with a '.new' suffix.
This behavior can be suppressed with the C<-force> option.

=head1 AUTHORS

Catalyst Contributors, see Catalyst.pm

=head1 COPYRIGHT

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
