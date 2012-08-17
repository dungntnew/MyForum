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


# Add new Topic
sub add :Chained('base') :PathPart('add') :Args(0) {
    my ($self, $c) = @_;
    # ========== CHECK Permission HERE ==========
    # -------------------------------------------
    my $user_id = 0; # Get user_id and check permission!.
    # OK
    
    my $title = $c->request->params->{title};
    my $desc  = $c->request->params->{description};


    
}

sub edit :Chained('base') :PathPart('edit') :Args(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'topics/edit.tt'); 
}

sub add :Chained('base') :PathPart('add') :Args(0) {
    my ($self, $c) = @_;
    # Check permision here
    # Handle form submited
    
    if ( lc $c->req->method eq 'post') {
        my $params = $c->req->params;
        my $topic_rsrc = $c->stash->{rs}->result_source;
        my $topic_data = {}; 

        # Setup new topic data
        foreach my $col ($topic_rsrc->columns) {
            if ( defined $params->{$col} ) {
                $topic_data->{ $col } = $params->{ $col };   
            }    
        }
        $topic_data->{ user_id } = $c->user->id if $c->user_exists;
        
         # Create new thread
		$c->stash->{rs}->create($topic_data);
		$c->res->redirect('/topics');
  
    }else {
        # Render edit 
        $c->stash( template => 'topics/add.tt') ;    
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
