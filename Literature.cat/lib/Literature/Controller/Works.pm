package Literature::Controller::Works;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Literature::Controller::Works - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(works => [$c->model('DB::Work')->all]);
    $c->stash(template => 'works/index.tt');
}

sub show :Chained('/') :PathPart('works') :Args(1) {
    my ($self, $c, $id) = @_;

    my $work = $c->model('DB::Work')->find($id);

    $c->stash(
        work => $work,
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
