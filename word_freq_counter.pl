#!/usr/bin/perl
use strict;
use warnings;

# Check for correct number of arguments
if (@ARGV != 1) {
    print "Usage: $0 <input_file>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if the file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (handles punctuation)
    foreach my $word (split /\W+/, lc $line) {
        # Only count non-empty strings
        if ($word) {
            $word_count{$word}++;
        }
    }
}

# Close the file handle
close($fh);

# Print the word frequencies, sorted alphabetically
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}