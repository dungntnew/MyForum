package MyForum::Controller::Posts;
use Moose;
use namespace::autoclean;
use Data::Dumper;

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
    my $thread = $c->model("DB::Thread")->find($c->session->{thread_id});
    unless ($thread) {
        die "Thread not found.";    
    }
	$c->log->debug("*** Posts::base  ***");
	$c->log->debug("*** Posts::base thread_id".$thread->id." ***");
    my $rs = $thread->posts;
    $c->stash( rs =>$rs, thread => $thread);
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
                $post_data->{ $col } = $params->{ $col };   
            }    
        }
        $post_data->{ user_id } = $c->user->id if $c->user_exists;
        
         # Create new post
        my $post = $c->stash->{rs}->create($post_data);
        $c->log->debug("*** POST CREATED ".($post->id)." ****");
        $c->res->redirect('/posts');
        
    }else {
        # Render edit 
        $c->stash( template => 'posts/add.tt') ;    
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
