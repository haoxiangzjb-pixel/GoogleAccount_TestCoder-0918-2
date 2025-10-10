#!/usr/bin/perl
use strict;
use warnings;

# Check for input file argument
if (@ARGV != 1) {
    print "Usage: $0 <input_file>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Hash to store word frequencies
my %word_count;

# Open and read the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

while (my $line = <$fh>) {
    chomp $line;
    # Split line into words (considering spaces, tabs, and punctuation)
    my @words = split(/\W+/, $line);
    foreach my $word (@words) {
        next if $word eq ''; # Skip empty strings from split
        $word = lc($word); # Convert to lowercase for case-insensitive counting
        $word_count{$word}++;
    }
}

close($fh);

# Print the word frequencies
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}