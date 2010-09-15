package Literature::Controller::Productions;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Literature::Controller::Productions - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(productions => [$c->model('DB::Production')->all]);
    $c->stash(template => 'productions/index.tt');
}

sub show :Chained('/') :PathPart('productions') :Args(1) {
    my ($self, $c, $id) = @_;

    my $production = $c->model('DB::Production')->find($id);

    $c->stash(
        production => $production,
    );
}

=head1 AUTHOR

Dave Cross

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
