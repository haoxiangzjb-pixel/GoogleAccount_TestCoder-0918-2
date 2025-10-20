#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open and read the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words (alphanumeric characters and apostrophes within words)
    $line = lc($line);
    my @words = $line =~ /\b[\w']+\b/g;
    
    # Count each word
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

close($fh);

# Sort words by frequency (descending) and then alphabetically
my @sorted_words = sort {
    $word_count{$b} <=> $word_count{$a} || $a cmp $b
} keys %word_count;

# Print the results
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";
foreach my $word (@sorted_words) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}

print "\nTotal unique words: " . scalar(keys %word_count) . "\n";
print "Total words: " . sum(values %word_count) . "\n";

# Helper function to calculate sum
sub sum {
    my $sum = 0;
    $sum += $_ for @_;
    return $sum;
}