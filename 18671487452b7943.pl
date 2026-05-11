#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided as argument
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Open the file for reading
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!\n";

# Hash to store word frequencies
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words (alphanumeric sequences)
    my @words = ($line =~ /[a-zA-Z0-9]+/g);
    
    # Count each word
    foreach my $word (@words) {
        $word_count{lc($word)}++;
    }
}

close($fh);

# Print word frequencies sorted by count (descending)
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    print "$word: $word_count{$word}\n";
}
