package MyForum::Controller::Threads;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyForum::Controller::Threads - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut


sub base :Chained('/') :PathPart('threads') :CaptureArgs(0) {
    my ($self, $c) = @_;
    
    # Get current topic 
    my $topic = $c->model("DB::Topic")->find($c->session->{topic_id});
    
    unless ( $topic) {
        die "Topic not found.";    
    }
	$c->log->debug("*** Thread::base  ***");
	$c->log->debug("*** Thread::base topic_id".$topic->id." ***");
    my $rs = $topic->threads;
    $c->stash( rs => $rs);
}

# URL: /threads/action/id
sub item :Chained('base') :PathPart("") :Args(2) {
    my ($self, $c, $action, $id) = @_;
    my $item = $c->stash->{rs}->find($id);
    unless ($item) {
        # fatal error ->notify user
        $c->stash ( status => 'error', msg => 'Not found.', id =>$id);
        die "Thread id $id not found. System die.";
    }

    $c->stash(
        status  => 'success',
        msg     => "Found thread id: $id",
        id      => $id,
        item    => $item,

    );
    $c->session->{thread_id} = $id;
    
    # If action is view => redirect to Thread controller
	if (lc $action eq 'view') {
		$c->log->debug("*** Redirect to Post::list ***");
		$c->res->redirect('/posts');
		return;
	}
	
    $c->log->debug("*** Detach to $action ***");
    $c->detach($action);
}
# Display all threads in an topic
# Url: 
#   - /threads
# Agrs(0)
sub list :Chained('base') :PathPart('') :Args(0){
    my ($selft, $c) = @_;
    my $page = $c->req->params->{p} // 1;
    my $rs = $c->stash->{rs}->search(
    	undef,
    	{   
    		page => $page // 1,
    		rows => 10
    	},
    ); 
    
    $c->stash(
    	rs 		=> $rs->page($page),
    	paper	=> $rs->pager,
    );
    $c->stash(template => 'threads/list.tt');
}


# URL: /threads/add
sub add :Chained('base') :PathPart('add') :Args(0) {
    my ($self, $c) = @_;
    # Check permision here
    # Handle form submited
    
    if ( lc $c->req->method eq 'post') {
        my $params = $c->req->params;
        my $thread_rsrc = $c->stash->{rs}->result_source;
        my $thread_data = {}; 

        # Setup new thread data
        foreach my $col ($thread_rsrc->columns) {
            if ( defined $params->{$col} ) {
                $thread_data->{ $col } = $params->{ $col };   
            }    
        }
        $thread_data->{ user_id } = $c->user->id if $c->user_exists;
        
         # Create new thread
        my $thread = $c->stash->{rs}->create($thread_data);
        
        # Also create new post belongs to new thread 
  		my $post_data = {}; 
  		my $post_rsrc = $c->model("DB::Post");
        # Setup new post data
        foreach my $col ($post_rsrc->result_source->columns) {
            if ( defined $params->{$col} ) {
                $post_data->{ $col } = $params->{ $col };   
            }    
        }
        $post_data->{ user_id }  = $c->user->id if $c->user_exists;
        $post_data->{ thread_id } = $thread->id;
        
         # Create new post
        my $post = $post_rsrc ->create($post_data);
		$c->res->redirect('/threads');
        
    }else {
        # Render edit 
        $c->stash( template => 'threads/add.tt') ;    
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
