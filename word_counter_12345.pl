use strict;
use warnings;

die "Usage: $0 <input_file>\n" unless @ARGV == 1;
my $file = $ARGV[0];
open my $fh, "<", $file or die "Cannot open $file: $!\n";

my %word_count;
while (my $line = <$fh>) {
    chomp $line;
    $line = lc($line);
    $line =~ s/[^\w\s]//g;
    my @words = split /\s+/, $line;
    for my $word (@words) {
        $word_count{$word}++;
    }
}
close $fh;

for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}