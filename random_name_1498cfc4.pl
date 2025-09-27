#!/usr/bin/perl
use strict;
use warnings;

my $log_file = 'sample.log';
my $error_count = 0;

open(my $fh, '<', $log_file) or die "Could not open log file '$log_file': $!";

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /ERROR/) {
        $error_count++;
    }
}

close($fh);

print "Total ERROR entries found in $log_file: $error_count\n";