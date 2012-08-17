use strict;
use warnings;

use MyForum;

my $app = MyForum->apply_default_middlewares(MyForum->psgi_app);
$app;

