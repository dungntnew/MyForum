package MyForum::View::HomeView;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
    ENCODING     => 'utf-8',
    WRAPPER     => 'wrapper.tt'
);

=head1 NAME

MyForum::View::HomeView - TT View for MyForum

=head1 DESCRIPTION

TT View for MyForum.

=head1 SEE ALSO

L<MyForum>

=head1 AUTHOR

NTD

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
