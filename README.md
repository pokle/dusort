Sorts the output of du -h
----

My typical usage is:

	du -sh * | dusort.pl

If you have a new enough set of GNU Coreutils, you can usually do without dusort like so:

	du -sh * | gsort --sort=human-numeric

But if like me you're stuck somewhere in between versions, I hope you'll find dusort useful.
