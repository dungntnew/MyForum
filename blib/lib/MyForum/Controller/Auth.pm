package MyForum::Controller::Auth;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyForum::Controller::Auth - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

# Login
sub login :Local :Args(0) {
    my ($self, $c) = @_;
    
    $c->stash( 
        wrapper => 'layouts/empty.tt',
        template => 'auth/login.tt'
    );

    if ( lc $c->req->method eq 'post' ) {
        my $username = $c->req->params->{username} ;
        my $password = $c->req->params->{password} ;

        if ( $c->authenticate({ username => $username, password => $password })) 
        {
            # User is logged now
            $c->stash(
            	msg 		=> $c->socal('welcome') . " ".$c->user->fullname,
            	status  	=> 'success',
            );
            $c->res->redirect('/');

        }else {
			$c->stash(
            	msg 		=> $c->socal('login_error'),
            	status  	=> 'error',
            );
        }
    }
}

# SignUp
sub signUp : Local : Args(0) {
	my ($self, $c) = @_;
    
	$c->stash( 
		wrapper => 'layouts/empty.tt',
		template => 'auth/register.tt'
	);
	
}
# Logout
sub signOut :Local :Args(0) {
    my ( $self, $c ) = @_;
    $c->logout();
    $c->stash->{'message'} = "You have been logged out.";
    $c->res->redirect('/');
}
=head1 AUTHOR

NTD

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
