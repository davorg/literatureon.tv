package Literature::Role::HasSlug;

use Moose::Role;

requires qw[slug slug_cols];

sub make_slug {
  my $self = shift;

  my $slug = lc join '_', map { $self->$_ } $self->slug_cols;

  $slug =~ s/\s+/-/g;
  $slug =~ s/[^-\w]+//g;

  return $slug;
}

1;
