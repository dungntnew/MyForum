#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: putlink.pl
#
#        USAGE: ./putlink.pl  
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
#      CREATED: 08/17/2012 10:09:23 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

my $str = 'Trims any leading or trailing whitespace from the input text. Particularly useful with a:dungntnew90@10gmail.com in conjunction with INCLUDE, PROCESS, etc., having the same effect as the TRIM configuration option.';

if ($str =~ s/(.*)(\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b)(.*)/\u$1#$2#\u$3/i){
    print "STR now:".$str."\n";
}else {
    print 'error';    
}

my $newstr = "hello: ftps://google.gmail.com  http://www.nhaccuatui.com/ link Okie now i'm understand how to use noncatupre \nin regular expression https://nhaccuatui.com that link i want to test.";

$newstr =~ s{(.*?)(\b(?:(?:ht|f)tps?\://)?(?:www.|[a-zA-Z])[a-zA-Z0-9\-\.]+\.[A-Z]{2,4}(?:\:[0-9]+)*(?:/(?:$|[a-zA-Z0-9\.+\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*\b)(.*?)}{$1<a href='$2'>$2</a>$3}ig;
print $newstr;
