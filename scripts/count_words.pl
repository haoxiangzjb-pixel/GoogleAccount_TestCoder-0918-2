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

open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my %word_count;

while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split into words (alphanumeric characters)
    my @words = split(/\W+/, lc $line);
    foreach my $word (@words) {
        # Skip empty strings resulting from split
        if ($word) {
            $word_count{$word}++;
        }
    }
}

close($fh);

# Print the word counts
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}