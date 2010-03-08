#!/usr/bin/perl
#
# Sorts the output of du -h
#
# Typical usage is du -sh * | dusort.pl

use strict;
 
my $multiplier = {
 'G' => 1024*1024*1024,
 'M' => 1024*1024,
 'K' => 1024,
 'B' => 1	
};

my $data = [];

while(<>) {
	my $line = $_;

	if ($line =~ m/^\W*([\d\.]+)([GMKB])\W+(.*)$/) {
		my $bytes = $1 * $$multiplier{$2};
		push @$data, [$bytes, $line];
	} else {
		print "? $line";
	}
}

foreach my $item (sort { $$a[0] <=> $$b[0] } @$data) {
	print $$item[1];
}