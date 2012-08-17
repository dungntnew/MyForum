package MyForum::Controller::Users;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyForum::Controller::Users - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub base :Chained('/') :PathPart('users') :CaptureArgs(0) {
    my ($self, $c) = @_;

    # Store the Resultset userdata into the stash
    $c->stash(resultset =>$c->model("DB::User"));

    # Print Message in the Debug
    $c->log->debug("*** INSIDE User::base method ***");
}


sub item :Chained('base') :PathPart('') :Args(2) {
    my ($self, $c, $action, $id) = @_;
    my $item = $c->stash->{rs}->find($id);
    unless ($item) {
        # fatal error ->notify user
        $c->stash(  status => 'error', msg => 'Not found.', id => $id);
        die "User id $id not found. System die.";
    }
    $c->stash(
        status => 'success',
        msg    => "Found user id: $id",
        id     => $id,
        item   => $item, 
    );
    $c->log->debug("*** Detach to $action ***");
    $c->detach($action);
}


sub delete :Chained('base') :PathPart('delete') :Args(0) {
    my ($self, $c) = @_;
   
    $c->stash->{item}->delete;
    $c->stash(  status => "success", 
                msg => "User deleted." );
    $c->stash->{template} =>'users/delete';
}   


sub add :Chained('base'): PathPart('add') :Args() {
    my ($self, $c ) = @_;

    # Handle form submited
    if ( lc $c->req->method eq 'post') {
        my $params = $c->req->params;
        my $user_rsrc = $c->stash->{rs}->result_source;
        my $user_data = {}; 

        # Setup new user data
        foreach my $col ($user_rsrc->columns) {
            if ( defined $params->{$col} ) {
                $user_data->{ $col } = $params->{ $col };   
             }    
        }

        # Validate user
        my $user_rs = $c->stash->{rs}->search( {username => $user_data->{username}}) ;
        if ( $user_rs->count ) {
            $c->stash( status => 'error', 'msg' => 'username: '.$user_data->{username} . ' really exist');
        }

        # Validate email
        $user_rs = $c->stash->{rs}->search( { email => $user_data->{email} });
        if ($user_rs->count) {
            $c->stash( status=> 'error', 'msg' => 'email: '.$user_data->{email}. ' really exist');    
        }

        # Unless have any error ? 
        if ( $c->stash->{status} ne 'error') {
            $c->stash->{rs}->create($user_data);
            $c->stash(template => 'users/add.tt', status =>"success");
        }else {
            $c->stash(template => 'users/add.tt', status => 'error');
        }
    }else {
        # Render edit 
        $c->stash( roles => [$c->model('DB::Role')->all]);
        $c->stash( template => 'users/add.tt') ;    
    }
}


sub edit :Chained('base') :PathPart('edit') :Args(0) {
    my ($self, $c)  = @_;
    # handle update action
    if (lc $c->req->method eq 'post') {
        my $params = $c->req->params;
        my $user_rsrc = $c->stash->{item}->result_source;
        my $user_data = {}; 

        # Setup new user data
        foreach my $col ($user_rsrc->columns) {
            if ( defined $params->{$col} ) {
                $user_data->{ $col } = $params->{ $col };   
             }    
        }

        $c->stash->{item}->update($user_data);
        $c->stash(template => 'users/edit.tt', status => 'success');

    }else {
        $c->stash( levels => [$c->model('DB::Level')->all]);
        $c->stash( template => 'users/edit.tt') ;    
    }
}


sub list :Chained('base') :PathPart('') :Args(0) {
    my ($self, $c) = @_;

    $c->stash( count => $c->stash->{rs}->count, 
               template => 'users/list.tt');

}

=head1 AUTHOR

NTD

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
