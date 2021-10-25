#!/usr/bin/env perl

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

use warnings;
use strict;
use autodie;

print '|';

local @ARGV = ('/proc/meminfo');

while (<>) {
	next unless /^(.+?):\s*(\d+)((?: kB)?)/;
	my $v = $3 eq '' ? $2 : ($2 * 1024) . 'B';
	print ' ' . ($1 =~ s/[()]/_/gr) . "=$v"
}
