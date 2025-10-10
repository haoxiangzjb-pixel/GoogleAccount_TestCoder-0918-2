#!/usr/bin/perl
use strict;
use warnings;

# This script generates another Perl script to analyze a log file for ERROR entries.

my $log_file = 'access.log';
my $output_script_name = 'log_analyzer_' . int(rand(10000)) . '.pl';

open my $fh, '>', $output_script_name or die "Cannot open file '$output_script_name' for writing: $!";

print $fh <<'EOF';
#!/usr/bin/perl
use strict;
use warnings;

my $log_file = 'access.log';
my $error_count = 0;

open my $fh, '<', $log_file or die "Cannot open file '$log_file' for reading: $!";

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /ERROR/) {
        $error_count++;
    }
}

close $fh;

print "Total ERROR entries found in $log_file: $error_count\n";

EOF

close $fh;

print "Generated script: $output_script_name\n";