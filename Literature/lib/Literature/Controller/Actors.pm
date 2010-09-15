package Literature::Controller::Actors;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Literature::Controller::Actors - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(actors => [$c->model('DB::Actor')->all]);
    $c->stash(template => 'actors/index.tt');
}

sub show :Chained('/') :PathPart('actors') :Args(1) {
    my ($self, $c, $id) = @_;

    my $actor = $c->model('DB::Actor')->find($id);

    $c->stash(
        actor => $actor,
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
