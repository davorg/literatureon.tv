use strict;
use warnings;

use experimental 'class';

class Literature;

use feature 'say';

use Template;
use File::Copy::Recursive 'dircopy';
use Time::Piece;
use Literature::Schema;

field %resources = (
  actors      => 'Actor',
  authors     => 'Author',
  characters  => 'Character',
  productions => 'Production',
  works       => 'Work',
);

field $tt = Template->new({
              INCLUDE_PATH => [ qw( in tt_lib ) ],
              OUTPUT_PATH  => 'docs',
            });

field $urls = {
  url => 'https://literatureon.tv',
  date => localtime->strftime('%Y-%m-%d'),
};

field $schema = Literature::Schema->get_schema;

method run {

  $tt->process('index.tt', {}, 'index.html')
    or die $tt->error;

  for (keys %resources) {
    say "Processing $_";

    my $rs = $schema->resultset($resources{$_});

    $tt->process("$_.tt", { $_ => $rs }, "$_/index.html")
      or die $tt->error;

    foreach my $obj ($rs->all) {
      my $singular = s/s$//r;

      $tt->process("$singular.tt", { $singular => $obj },
                   "$_/" . $obj->slug . '/index.html')
        or die $tt->error;

      push @{$urls->{$_}}, $obj;
    }
  }

  $tt->process('sitemap.tt', $urls, 'sitemap.xml')
    or die $tt->error;

  dircopy('static', 'docs');
}

1;