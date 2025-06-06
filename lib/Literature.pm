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

field $url = 'https://literatureon.tv';

field $tt = Template->new({
              INCLUDE_PATH => [ qw( in tt_lib ) ],
              OUTPUT_PATH  => 'docs',
              WRAPPER      => 'page.tt',
            });

field $vars = {
  url => $url,
  date => localtime->strftime('%Y-%m-%d'),
};

field $schema = Literature::Schema->get_schema;

method run {

  $self->make_index;

  for (keys %resources) {
    $self->process_resource($_);
  }

  $self->make_sitemap;

  dircopy('static', 'docs');
}

method make_index {
  $tt->process('index.tt', {}, 'index.html')
    or die $tt->error;
}

method process_resource {
    say "Processing $_";
    my $singular = s/s$//r;

    my $rs = $schema->resultset($resources{$_});

    $tt->process("$_.tt", { $_ => $rs }, "$_/index.html")
      or die $tt->error;

    foreach my $obj ($rs->all) {
      my $tt_vars = {
        $singular => $obj,
      };

      if ($obj->can('products')) {
        $tt_vars->{products} = $obj->products(3);
      }

      if ($singular eq  'author') {
        $tt_vars->{image} = $obj->image;
      }

      $tt->process("$singular.tt", $tt_vars,
                   "$_/" . $obj->slug . '/index.html')
        or die $tt->error;

      push @{$vars->{$_}}, $obj;
    }
}

method make_sitemap {
  # Hacky McHackface
  $tt->{SERVICE}{WRAPPER} = [];

  $tt->process('sitemap.tt', $vars, 'sitemap.xml')
    or die $tt->error;
}

1;