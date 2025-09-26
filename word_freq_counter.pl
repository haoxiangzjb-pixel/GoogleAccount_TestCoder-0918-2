#!/usr/bin/perl
use strict;
use warnings;

# Check for filename argument
die "Usage: $0 <filename>\n" unless @ARGV;

my $filename = shift @ARGV;

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!\n";

# Hash to store word frequencies
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (handles punctuation)
    foreach my $word (split /\W+/, lc $line) {
        # Skip empty strings resulting from split
        if ($word) {
            $word_count{$word}++;
        }
    }
}

close($fh);

# Print the results
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}