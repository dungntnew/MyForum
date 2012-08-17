package MyForum::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }
#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

MyForum::Controller::Root - Root Controller for MyForum

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->redirect("/topics");
}

# Using begin as global method to set
# defaut wrapper template

sub begin :Private {
    my ($self, $c) = @_;
    
    $c->log->debug("*** INSIDE Root::begin method ***");    
    my $req_path = $c->request->path;
	my $lang = $c->request->params->{lang};
	
	# Hanle lang request
	if (defined $lang) {
		if ( $lang ne $c->session->{lang}) {
			$c->session->{nlang} = $c->session->{lang};
			$c->session->{lang} = $lang;
			$c->stash->{nlang} = $c->session->{nlang};
			$c->stash->{lang} = $c->session->{lang};
		}
		
	}
	
	# Set lang to stash
	unless ( defined $c->session->{lang}) {
		$c->session->{lang} = 'en';	
		$c->session->{nlang} = 'vi';
	} 
	$c->stash->{nlang} = $c->session->{nlang};
	$c->stash->{lang} = $c->session->{lang} ;	
	
	# Set default thread_id/topic_id
	unless ( defined $c->session->{topic_id}){
		$c->session->{topic_id} = 1;
		$c->session->{thread_id} = 1;
	}
	
    if ($req_path =~ /^admin\/?/i) {

        # Handle when user request admin page
        if ( $c->user_exists() && $c->check_user_roles( qw/ admin /)){ 
             $c->stash->{wrapper} = 'layouts/admin.tt';

        }else {
             $c->stash->{wrapper} = 'layouts/empty.tt';
             $c->res->redirect("/auth/login");    
        }
    }else {
        $c->stash->{wrapper} = 'layouts/home.tt';
    }
}

# Using auto action to handle security
sub auto :Private {
    my ($self, $c) = @_;

    return 1;
}


=head2 default

Standard 404 error page

=cut



sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->status(404);
    $c->stash(template => 'not_found.tt');
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView'){
    my ($self, $c) = @_;

    if ( $c->req->header('Accept') =~ m{application/json}) {
        
        $c->log->debug("*** OUTPUT JSON in Root::end method ***");
        $c->forward('View::Service');    
    }
}

=head1 AUTHOR

NTD

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
