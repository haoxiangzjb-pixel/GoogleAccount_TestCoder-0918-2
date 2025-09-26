#!/usr/bin/perl
use strict;
use warnings;

# Check for command line argument
die "Usage: $0 <filename>\n" unless @ARGV == 1;

my $filename = $ARGV[0];

# Check if file exists
die "File '$filename' does not exist.\n" unless -e $filename;

# Hash to store word frequencies
my %word_count;

# Open and read the file
open my $fh, '<', $filename or die "Cannot open '$filename': $!\n";
while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split into words (removing punctuation)
    for my $word (split /\W+/, lc $line) {
        next if $word eq ''; # Skip empty strings
        $word_count{$word}++;
    }
}
close $fh;

# Print the results
print "Word frequencies in '$filename':\n";
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}