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
	
	
	 # Handle form submited
    if ( lc $c->req->method eq 'post') {
        my $user_rs = $c->model('DB::User');
        my $params = $c->req->params;
        my $user_rsrc = $user_rs->result_source;
        my $user_data = {}; 

        # Setup new user data
        foreach my $col ($user_rsrc->columns) {
            if ( defined $params->{$col} ) {
                $user_data->{ $col } = $params->{ $col };   
             }    
        }
		$user_data->{user_to_roles} = [ { role_id => 2, },]; 
		$user_rs->create($user_data);
        $c->stash(template => 'users/add_success.tt', json => [ {status =>"success", msg => $c->socal('msg_register_success')} ]);
       
    }
}

sub validate: Local: Args(0) {
	my ($self, $c) = @_;
	if (lc $c->req->method eq 'get') {
		my $user_rs = $c->model('DB::User');
        my $params = $c->req->params;

        
        if (defined $params->{username}){
		    
		    $user_rs = $user_rs->search( {username => $params->{username}}) ;
		    if ( $user_rs->count ) {
		         $c->stash->{json} = \0;
		    }else {
		    	  $c->stash->{json} = \1;
		    }
		}
		
		if (defined $params->{email}){
		    $user_rs = $user_rs->search( { email => $params->{email}});
		    if ($user_rs->count) {
		  		  $c->stash->{json} = \0;
		    }else {
		    	  $c->stash->{json} = \1;
		    }
        }
	}
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
