#!/usr/bin/perl
use strict;
use warnings;

my $log_file = 'access.log';
my $error_count = 0;

open my $fh, '<', $log_file or die "Cannot open file '$log_file' for reading: $!";

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /ERROR/) {
        $error_count++;
    }
}

close $fh;

print "Total ERROR entries found in $log_file: $error_count\n";

