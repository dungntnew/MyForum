package MyForum::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'MyForum::Schema',
    
    connect_info => {
        dsn => 'dbi:mysql:mydb',
        user => 'root',
        password => 'abc123',
        quote_names => q{1},
    }
);

=head1 NAME

MyForum::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<MyForum>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<MyForum::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.4

=head1 AUTHOR

NTD

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;