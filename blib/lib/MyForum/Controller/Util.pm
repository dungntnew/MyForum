package MyForum::Controller::Util;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyForum::Controller::Util - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MyForum::Controller::Util in Util.');
}

sub upload :Local {
    my ($self, $c) = @_;

    if (lc $c->req->method eq 'post' ) {
         if (my $file = $c->req->upload('file') ) {
            
             my $filename = $file->filename;
             my $target   = $c->config->{upload_abs}."/$filename";
             my $file_uri = $c->config->{upload_dir}."/$filename";

             # Make file to local disk
             unless ($file->link_to( $target) || $file->copy_to($target)) {
                 die ("Failed to copy '$filename' to '$target': $!");    
             }
	     # Get user
	     my $user_id = $c->user_exists() ? $c->user()->id : 1; 
             # Insert to table
             my $img = $c->model("DB::Multimedia")->create({
                    user_id  => $user_id ,
                    type     => "image",
                    file_uri => $file_uri,
             });

            # Response
            my $data = {
                file_id     => $img->id,
                file_url    => $c->uri_for($file_uri)->as_string,
            };
            $c->stash(status => "success", data => $data);
            $c->forward("View::Service");

         } 
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
