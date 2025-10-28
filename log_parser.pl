#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate random filename
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return "result_$random_name.pl";
}

# Check if log file is provided as argument
if (@ARGV != 1) {
    print "Usage: $0 <log_file_path>\n";
    exit 1;
}

my $log_file = $ARGV[0];

# Check if log file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist.\n";
    exit 1;
}

# Open and read the log file
open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

my %error_count;
my $total_lines = 0;

while (my $line = <$fh>) {
    chomp $line;
    $total_lines++;
    
    # Look for common error patterns in the line
    if ($line =~ /error|ERROR|Error|exception|EXCEPTION|Exception|fail|FAIL|Fail|critical|CRITICAL|Critical|warning|WARNING|Warning|fatal|FATAL|Fatal/i) {
        # Extract the specific error type
        if ($line =~ /(error|ERROR|Error|exception|EXCEPTION|Exception|fail|FAIL|Fail|critical|CRITICAL|Critical|warning|WARNING|Warning|fatal|FATAL|Fatal)/i) {
            my $error_type = lc($1);
            $error_count{$error_type}++;
        } else {
            # If we can't extract specific type, count as generic error
            $error_count{"generic_error"}++;
        }
    }
}

close($fh);

# Calculate total errors
my $total_errors = 0;
for my $count (values %error_count) {
    $total_errors += $count;
}

# Generate random filename for the output
my $output_file = generate_random_filename();

# Write results to the random-named Perl file
open(my $out_fh, '>', $output_file) or die "Could not create file '$output_file': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Error analysis results for log file: $log_file\n";
print $out_fh "# Generated on: " . localtime() . "\n";
print $out_fh "# Total lines in log: $total_lines\n";
print $out_fh "# Total errors found: $total_errors\n\n";

print $out_fh "# Error breakdown:\n";
for my $error_type (sort keys %error_count) {
    print $out_fh "# $error_type: $error_count{$error_type}\n";
}

print $out_fh "\n# Data structure with error counts\n";
print $out_fh "my %error_counts = (\n";
for my $error_type (sort keys %error_count) {
    print $out_fh "    '$error_type' => $error_count{$error_type},\n";
}
print $out_fh ");\n\n";

print $out_fh "# Summary variables\n";
print $out_fh "my \$total_errors = $total_errors;\n";
print $out_fh "my \$total_lines = $total_lines;\n";
print $out_fh "my \$error_percentage = " . sprintf("%.2f", ($total_errors / $total_lines) * 100) . ";\n\n";

print $out_fh "print \"Error Analysis Summary:\\n\";\n";
print $out_fh "print \"Total lines: \$total_lines\\n\";\n";
print $out_fh "print \"Total errors: \$total_errors\\n\";\n";
print $out_fh "print \"Error percentage: \$error_percentage\\%\\n\";\n";
print $out_fh "print \"Detailed error counts: \\n\";\n";
print $out_fh "for my \$type (sort keys \%error_counts) {\n";
print $out_fh "    print \"  \$type: \$error_counts{\$type}\\n\";\n";
print $out_fh "}\n";

close($out_fh);

print "Log parsing complete!\n";
print "Found $total_errors errors in $total_lines lines.\n";
print "Results saved to: $output_file\n";

# Print a summary
print "\nError breakdown:\n";
for my $error_type (sort keys %error_count) {
    print "  $error_type: $error_count{$error_type}\n";
}