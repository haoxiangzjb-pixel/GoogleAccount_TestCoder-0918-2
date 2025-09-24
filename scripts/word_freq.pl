#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
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

open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

my %word_count;

while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split into words (non-word characters as delimiters)
    for my $word (split /\W+/, lc $line) {
        next if $word eq ''; # Skip empty strings resulting from split
        $word_count{$word}++;
    }
}

close($fh);

# Sort the results by frequency (descending) and then alphabetically
for my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    print "$word: $word_count{$word}\n";
}