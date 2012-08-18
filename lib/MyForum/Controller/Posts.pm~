package MyForum::Controller::Posts;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use HTML::Entities();

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyForum::Controller::Posts - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub base :Chained('/') :PathPart('posts') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
    my $thread_id = $c->req->params->{thread} 
                 // $c->session->{thread_id};

    my $thread = $c->model("DB::Thread")->find($thread_id);

    unless ($thread) {
        die "Thread not found.";    
    }
	$c->log->debug("*** Posts::base  ***");
	$c->log->debug("*** Posts::base thread_id".$thread->id." IN thread_id $thread_id ***");
    my $rs = $thread->posts;
    $c->stash( rs =>$rs, thread => $thread);
}

# URL: /posts/action/id
# Session: Set post_id
sub item :Chained('base') :PathPart("") :Args(2){
    my ($self, $c, $action, $id) = @_;
    my $item = $c->stash->{rs}->find($id);
    unless ($item) {
        # fatal error ->notify user
        $c->stash(  status => 'error', msg => 'Not found.', id => $id);
        die "Post id $id not found. System die.";
    }
    
    # Store item data to stash
    $c->stash(
        status => 'success',
        msg    => "Found post id: $id",
        id     => $id,
        item   => $item, 
    );
    # Store item_id to session
    $c->session->{post_id} = $id;
	
    $c->log->debug("*** Detach to $action ***");
    $c->detach($action);

}

# URL: /posts
# Args: 0
# Session: thread_id
# Show all posts in a thread
sub list :Chained('base') :PathPart('') :Args(0) {
    my ($self, $c ) = @_;
    my $page = $c->req->params->{p} // 1;
    my $rs = $c->stash->{rs}->search(
    	undef,
    	{   
    		page => $page // 1,
    		rows => 2
    	},
    ); 
    
    $c->stash(
    	rs 		=> $rs->page($page),
    	paper	=> $rs->pager,
    );
    
    $c->stash(template => 'posts/list.tt');

}

sub edit :Chained('item') :PathPart('edit') :Args(0) {
    my ($self, $c) = @_;
    if ( $c->user_exists &&  ( $c->check_user_roles('admin') 
    					     || $c->user->id == $c->stash->{item}->user_id)  ) {
		if ( lc $c->req->method eq 'post') {
		    my $params = $c->req->params;
		    my $post_rsrc = $c->stash->{rs}->result_source;
		    my $post_data = {}; 

		    foreach my $col ($post_rsrc->columns) {
		        if ( defined $params->{$col} ) {
		            $post_data->{ $col } = $params->{ $col };   
		        }    
		    }
		      # Put link for all email add, link url in post content
		     my $email_regex = '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b';
			 my $url_regex   = '\b(?:(?:ht|f)tps?\://)?(?:www.|[a-zA-Z])[a-zA-Z0-9\-\.]+\.[A-Z]{2,4}(?:\:[0-9]+)*(?:/(?:$|[a-zA-Z0-9\.+\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*\b';
			 $post_data->{content} =~ s{(.*?)($email_regex)(.*?)}{$1 <a href="mailto:$2">$2</a> $3}ig;
		     $post_data->{content} =~ s{(.*?)(?:^|\s+)($url_regex)(.*?)}{$1 <a href='$2'>$2</a> $3}ig;
         
			$c->stash->{item}->update($post_data);
			$c->res->redirect($c->uri_for('/posts', $c->req->query_params));
		}else {
		    $c->stash( template => 'posts/edit.tt') ;    
		}
    }else {
    	   $c->stash( template => 'auth/access_denied.tt') ; 
    }
}

# URL: /posts/add
sub add :Chained('base') :PathPart('add') :Args(0) {
    my ($self, $c) = @_;
    # Check permision here
    # Handle form submited
    
    if ( lc $c->req->method eq 'post') {
        my $params = $c->req->params;
        my $post_rsrc = $c->stash->{rs}->result_source;
        my $post_data = {}; 

        # Setup new post data
        foreach my $col ($post_rsrc->columns) {
            if ( defined $params->{$col} ) {
                $post_data->{ $col } = $params->{ $col };   #HTML::Entities::encode($params->{ $col });   
            }    
        }
        $post_data->{ user_id } = $c->user->id if $c->user_exists;
        
         # Put link for all email add, link url in post content
         my $email_regex = '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b';
		 my $url_regex   = '\b(?:(?:ht|f)tps?\://)?(?:www.|[a-zA-Z])[a-zA-Z0-9\-\.]+\.[A-Z]{2,4}(?:\:[0-9]+)*(?:/(?:$|[a-zA-Z0-9\.+\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*\b';
		 $post_data->{content} =~ s{(.*?)($email_regex)(.*?)}{$1 <a href="mailto:$2">$2</a> $3}ig;
         $post_data->{content} =~ s{(.*?)(?:^|\s+)($url_regex)(.*?)}{$1 <a href='$2'>$2</a> $3}ig;

         
         # Update last_update for thread
         $c->stash->{thread}->update({ last_update => undef });
         
         # Create new post
        my $post = $c->stash->{rs}->create($post_data);
        $c->log->debug("*** POST CREATED ".($post->id)." ****");
        $c->res->redirect( $c->uri_for('/posts', $c->req->query_params));
        
    }else {
        # Render edit 
        $c->stash( template => 'posts/add.tt') ;    
    } 	
}




# URL: /posts/delete/id
sub delete :Chained('item') :PathPart('delete') :Args(0) {
    my ($self, $c) = @_;
    
    my $post = $c->stash->{item};
    # Check permission here
    if ( $c->user_exists && ( $c->check_user_roles('admin') 
    						|| $post->user_id == $c->user->id ) ) {
		  # Delete here
    	  $c->stash->{item}->delete;
    	  if ($c->stash->{rs}->count == 0) {
    	  		$c->stash->{thread}->delete;
    	  }
    	  $c->session->{post_id} = undef;
    	  $c->stash(
    	  		json => [ {	 status => 'success',  msg    => "Deleted post id: ".$post->id },
    	  				  { id	   => $post->id }
				],
				template => 'posts/delete_success.tt',
		  );					
    	
    }else {
		  $c->stash(
		  	   json => [ { status => 'error', msg    => "Permission denied",},
			   			 { id	   => $post->id,}
		  	   ],
		       template => 'posts/delete_error.tt',
	  	);
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
