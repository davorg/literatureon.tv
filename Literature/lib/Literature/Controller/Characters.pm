package Literature::Controller::Characters;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Literature::Controller::Characters - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(characters => [$c->model('DB::FictionalCharacter')->all]);
    $c->stash(template => 'characters/index.tt');
}

sub show :Chained('/') :PathPart('characters') :Args(1) {
    my ($self, $c, $id) = @_;

    my $character = $c->model('DB::FictionalCharacter')->find($id);

    $c->stash(
        character => $character,
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
