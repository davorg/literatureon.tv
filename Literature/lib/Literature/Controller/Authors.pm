package Literature::Controller::Authors;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Literature::Controller::Author - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(authors => [$c->model('DB::Author')->all]);
    $c->stash(template => 'authors/index.tt');
}

sub show :Chained('/') :PathPart('authors') :Args(1) {
    my ($self, $c, $id) = @_;

    my $author = $c->model('DB::Author')->find($id);

    $c->stash(
        author => $author,
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
