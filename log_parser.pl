#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Generate a random filename for the output script
my $random_name = "log_parser_" . int(rand(10000)) . ".pl";

# The content of the log parsing script
my $script_content = <<'EOF';
#!/usr/bin/perl
use strict;
use warnings;

# Check if log file is provided as argument
if (@ARGV != 1) {
    print "Usage: $0 <log_file_path>\n";
    exit 1;
}

my $log_file = $ARGV[0];

# Check if file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist.\n";
    exit 1;
}

# Open the log file
open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

my $error_count = 0;
my @error_lines = ();

# Process each line in the log file
while (my $line = <$fh>) {
    chomp $line;
    
    # Check for common error patterns (case insensitive)
    if ($line =~ /error|exception|critical|fatal|warning/i) {
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# Print results
print "Log file: $log_file\n";
print "Total errors found: $error_count\n";
print "\nError lines:\n";
print "-" x 50 . "\n";
foreach my $error_line (@error_lines) {
    print "$error_line\n";
}

# Optionally save results to an output file
my $output_file = $log_file . "_errors_summary.txt";
open(my $out_fh, '>', $output_file) or die "Could not create output file '$output_file': $!";
print $out_fh "Log file: $log_file\n";
print $out_fh "Total errors found: $error_count\n";
print $out_fh "\nError lines:\n";
print $out_fh "-" x 50 . "\n";
foreach my $error_line (@error_lines) {
    print $out_fh "$error_line\n";
}
close($out_fh);

print "\nResults also saved to: $output_file\n";
EOF

# Write the script to the randomly named file
open(my $out_fh, '>', $random_name) or die "Could not create file '$random_name': $!";
print $out_fh $script_content;
close($out_fh);

# Make the script executable
chmod 0755, $random_name;

print "Log parsing script has been created: $random_name\n";
print "To use this script: perl $random_name <path_to_log_file>\n";