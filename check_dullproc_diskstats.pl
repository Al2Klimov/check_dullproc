#!/usr/bin/env perl

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

use warnings;
use strict;
use autodie;

print '|';

local @ARGV = ('/proc/diskstats');

while (<>) {
	next unless /^\s*(?:\d+\s+){2}(\w+)\s+(\d.*\d)/;
	
	my $subject = $1;
	my $i = 0;

	foreach ($2 =~ /\d+/g) {
		++$i;
		print " ${subject}_${i}=$_"
	}
}
