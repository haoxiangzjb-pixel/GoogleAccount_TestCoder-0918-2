#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided
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
my %word_count = ();

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words (sequences of letters and numbers)
    while ($line =~ /\b([a-zA-Z0-9]+)\b/g) {
        my $word = lc($1);  # Convert to lowercase for case-insensitive counting
        $word_count{$word}++;
    }
}

close($fh);

# Print the word frequencies in descending order of frequency
print "Word frequencies in '$filename':\n";
print "-------------------------------\n";

# Sort by frequency (descending) and then alphabetically for ties
for my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    print "$word: $word_count{$word}\n";
}
