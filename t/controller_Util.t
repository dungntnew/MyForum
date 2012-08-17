use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyForum';
use MyForum::Controller::Util;

ok( request('/util')->is_success, 'Request should succeed' );
done_testing();
