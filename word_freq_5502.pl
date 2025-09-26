#!/usr/bin/perl
use strict;
use warnings;

die "Usage: $0 <filename>\n" unless @ARGV == 1;
my $file = shift @ARGV;

open my $fh_read, "<", $file or die "Could not open file : $!";

my %word_count;
while (my $line = <$fh_read>) {
    chomp $line;
    # Split line into words based on non-word characters
    my @words = split /\W+/, $line;
    foreach my $word (@words) {
        next if $word eq ""; # Skip empty strings
        $word = lc $word; # Convert to lowercase for case-insensitive counting
        $word_count{$word}++;
    }
}

close $fh_read;

# Print the word counts
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}