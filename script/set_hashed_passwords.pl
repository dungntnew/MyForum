#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: set_hashed_passwords.pl
#
#        USAGE: ./set_hashed_passwords.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: ゲンーチーヅン (www.wildflower.info), dungntnew@gmail.com
# ORGANIZATION: kayac Inc
#      VERSION: 1.0
#      CREATED: 07/30/2012 08:40:20 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use MyForum::Schema;

my $schema = MyForum::Schema->connect('dbi:mysql:mydb', 'root', 'abc123');
my @users = $schema->resultset('User')->all;

foreach (@users) {
    
    $_->password('abc123');
    $_->update;
}
