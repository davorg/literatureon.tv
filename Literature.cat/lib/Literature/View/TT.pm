package Literature::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
  TEMPLATE_EXTENSION => '.tt',
  INCLUDE_PATH => [
    Literature->path_to('root', 'src'),
  ],
  WRAPPER => 'wrapper.tt',
);

=head1 NAME

Literature::View::TT - TT View for Literature

=head1 DESCRIPTION

TT View for Literature.

=head1 SEE ALSO

L<Literature>

=head1 AUTHOR

Dave Cross

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
