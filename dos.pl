#!/usr/bin/perl -w

use strict;
use WWW::Mechanize;

my $url = "http://testserver";
my $param1 = "150330";
my $param2 = "DOS";
my $param3 = "3030150";
my $param4 = "xyzk";
my $mech = WWW::Mechanize->new(autocheck => 0);

my $data = { x => $param1, y => $param2,
	    z => $param3, k => $param4};
foreach(1..1000000000) {
        $mech->post($url, $data);
}
