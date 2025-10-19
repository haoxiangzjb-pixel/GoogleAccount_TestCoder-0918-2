#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided as an argument
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
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

# Hash to store word frequencies
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words
    # Using \s+ to match one or more whitespace characters
    # Using \w+ to match word characters (letters, digits, underscore)
    my @words = $line =~ /\b\w+\b/g;
    
    # Count each word
    foreach my $word (@words) {
        $word_count{lc $word}++;  # Convert to lowercase for case-insensitive counting
    }
}

# Close the file handle
close($fh);

# Print the word frequencies in descending order
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";

# Sort by frequency (descending) and then alphabetically for ties
for my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}