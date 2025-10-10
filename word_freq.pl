#!/usr/bin/perl
use strict;
use warnings;

# Check for correct number of arguments
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open the file for reading
open my $fh, '<', $filename or die "Could not open '$filename': $!";

my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (alphanumeric characters)
    for my $word (split /\W+/, lc $line) {
        # Skip empty strings that might result from the split
        next if $word eq '';
        $word_count{$word}++;
    }
}

# Close the file handle
close $fh;

# Print the word frequencies
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}