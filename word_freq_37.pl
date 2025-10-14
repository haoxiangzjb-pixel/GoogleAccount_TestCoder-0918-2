#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Open the file for reading
open my $fh, '<', $filename or die "Cannot open file '$filename': $!\n";

# Hash to store word frequencies
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (alphanumeric characters only)
    for my $word (split /\W+/, lc $line) {
        next if $word eq ''; # Skip empty strings
        $word_count{$word}++;
    }
}

# Close the file handle
close $fh;

# Print the results, sorted alphabetically by word
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}
