package MyForum::Controller::Topics;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyForum::Controller::Topics - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub base :Chained('/') :PathPart('topics') :CaptureArgs(0) {
    my ($self, $c) = @_;
    my $resultset = $c->model("DB::Topic");
    unless ($resultset) {
        # handle fatal error    
    }
    $c->stash(rs => $resultset);
}


# URL: /topics/action/id
# Session: Set topic_id
sub item :Chained('base') :PathPart("") :Args(2){
    my ($self, $c, $action, $id) = @_;
    my $item = $c->stash->{rs}->find($id);
    unless ($item) {
        # fatal error ->notify user
        $c->stash(  status => 'error', msg => 'Not found.', id => $id);
        die "Topic id $id not found. System die.";
    }
    # Store item data to stash
    $c->stash(
        status => 'success',
        msg    => "Found topic id: $id",
        id     => $id,
        item   => $item, 
    );
    # Store item_id to session
    $c->session->{topic_id} = $id;
	
	# If action is view => redirect to Thread controller
	if (lc $action eq 'view') {
		$c->log->debug("*** Redirect to Thread::list ***");
		$c->res->redirect('/threads');
		return;
	}
    $c->log->debug("*** Detach to $action ***");
    $c->detach($action);

}



sub edit :Chained('item') :PathPart('edit') :Args(0) {
    my ($self, $c) = @_;
    if ( $c->user_exists &&  $c->check_user_roles('admin')  ) {
		if ( lc $c->req->method eq 'post') {
		    my $params = $c->req->params;
		    my $topic_rsrc = $c->stash->{rs}->result_source;
		    my $topic_data = {}; 

		    foreach my $col ($topic_rsrc->columns) {
		        if ( defined $params->{$col} ) {
		            $topic_data->{ $col } = $params->{ $col };   
		        }    
		    }
			$c->stash->{item}->update($topic_data);
			$c->res->redirect($c->uri_for('/topics', $c->req->query_params));
		}else {
		    $c->stash( template => 'topics/edit.tt') ;    
		}
    }else {
    	   $c->stash( template => 'auth/access_denied.tt') ; 
    }
}

sub add :Chained('base') :PathPart('add') :Args(0) {
    my ($self, $c) = @_;
    if ( $c->user_exists &&  $c->check_user_roles('admin')  ) {
		if ( lc $c->req->method eq 'post') {
		    my $params = $c->req->params;
		    my $topic_rsrc = $c->stash->{rs}->result_source;
		    my $topic_data = {}; 

		    foreach my $col ($topic_rsrc->columns) {
		        if ( defined $params->{$col} ) {
		            $topic_data->{ $col } = $params->{ $col };   
		        }    
		    }
		    $topic_data->{ user_id } = $c->user->id if $c->user_exists;
		    
			$c->stash->{rs}->create($topic_data);
			$c->res->redirect('/topics');
	  
		}else {
		    $c->stash( template => 'topics/add.tt') ;    
		}
    }else {
    	   $c->stash( template => 'auth/access_denied.tt') ; 
    }	
}

# URL: /posts/delete/id
sub delete :Chained('item') :PathPart('delete') :Args(0) {
    my ($self, $c) = @_;
    
    my $topic = $c->stash->{item};
    if ( $c->user_exists &&  $c->check_user_roles('admin')  ) {
    	  $c->stash->{item}->delete;
    	  $c->session->{topic_id} = undef;
    	  $c->stash(
    	  		json => [ {	 status => 'success',  msg    => "Deleted topic id: $topic->id" },
    	  				  { id	   => $topic->id }
				],
		  );					
    	
    }else {
		  $c->stash(
		  	   json => [ { status => 'error', msg    => "Permission denied",},
			   			 { id	   => $topic->id,}
		  	   ],
	  	);
    }
}

sub list :Chained('base') : PathPart('') :Args(0) {
    my ($self, $c) = @_;
    
    my $p = $c->req->params->{p} // 1;
    my $rs = $c->stash->{rs}->search(
    	undef,
    	{	page => $p,
    		rows => 10,
    	}
    );
    
    $c->stash(
    	rs		=> $rs->page($p),
    	paper	=> $rs->pager,  
    	templete => 'topics/list'
    );
}
=head1 AUTHOR

NTD

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
