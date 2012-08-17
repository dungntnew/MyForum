use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyForum';
use MyForum::Controller::Threads;

ok( request('/threads')->is_success, 'Request should succeed' );
done_testing();
