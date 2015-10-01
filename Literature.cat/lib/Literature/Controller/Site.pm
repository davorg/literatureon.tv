package Literature::Controller::Site;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Literature::Controller::Site - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Literature::Controller::Site in Site.');
}

sub test :Local {
    my ($self, $c) = @_;

    $c->stash(username => 'Dave',
              template => 'site/test.tt');
}

=head1 AUTHOR

Dave Cross

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
