package MyForum;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    StackTrace
    Authentication
    Authorization::Roles
    Session
    Session::Store::File
    Session::State::Cookie
    StatusMessage
    Localize::Simple
    
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in myforum.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'MyForum',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
);

# Config Upload DIR

__PACKAGE__->config(
    upload_abs => __PACKAGE__->path_to('root', 'upload'),
    upload_dir => '/upload'
);

# Config images, css, js DIR
__PACKAGE__->config(
    img_dir  => '/static/images',
    css_dir  => '/static/css',
    js_dir   => '/static/js',
);

# Config Localize
__PACKAGE__->config(
	'Localize::Simple'	=> {
		_sessionkey		=> 'lang',
		en				=> 'root/localize/en.yaml',
		vi				=> 'root/localize/vi.yaml',
	}
);
# Config View
__PACKAGE__->config(
    'View::HomeView' => {
        INCLUDE_PATH => [
            __PACKAGE__->path_to('root', 'src'),
        ],
        TEMPLATE_EXTENSION => '.tt',
        ENCODING    => 'utf-8',
    },
    'View::Service'  => {
        expose_stash    => [ qw( status msg id data )],    
    },
);

# Configure SimpleDB Authentication
__PACKAGE__->config(
    'Plugin::Authentication' => {
        default => {
            class       => 'SimpleDB',
            user_model  => 'DB::User',
        },    
    },
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

MyForum - Catalyst based application

=head1 SYNOPSIS

    script/myforum_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<MyForum::Controller::Root>, L<Catalyst>

=head1 AUTHOR

NTD

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
