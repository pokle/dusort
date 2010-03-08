#!/bin/bash
#
# This is meant to be run from the project root directory

die() {
	echo Test failed - $*
	exit 1
}

for sample in test/sample-*.txt; do
	suffix=${sample#test/sample-}
	expected=test/expected-$suffix
	got=build/got-$suffix
	perl dusort.pl $sample > $got
	diff -u $expected $got || die "There are differences. $sample failed"
done