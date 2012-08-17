use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyForum';
use MyForum::Controller::Topics;

ok( request('/topics')->is_success, 'Request should succeed' );
done_testing();
