#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use open qw(:std :utf8);

# Check for filename argument
my $filename = $ARGV[0] or die "Usage: $0 <filename>\n";

# Open the file for reading
open my $fh, '<', $filename or die "Cannot open file '$filename': $!\n";

# Hash to store word counts
my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and remove punctuation
    $line =~ s/[^\w\s]//g;
    $line = lc($line);

    # Split the line into words based on whitespace
    my @words = split /\s+/, $line;

    # Count each word
    foreach my $word (@words) {
        # Skip empty strings that might result from splitting
        next if $word eq '';
        $word_count{$word}++;
    }
}

# Close the file handle
close $fh;

# Print the results
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}
