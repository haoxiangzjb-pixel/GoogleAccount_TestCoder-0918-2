#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_name {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . '.pl';
}

# Function to count errors in log file
sub count_errors {
    my ($log_file) = @_;
    open(my $fh, '<', $log_file) or die "Could not open log file '$log_file': $!";
    
    my $error_count = 0;
    my $warning_count = 0;
    my $critical_count = 0;
    
    while (my $line = <$fh>) {
        chomp $line;
        
        # Count different types of errors
        if ($line =~ /error/i) {
            $error_count++;
        }
        if ($line =~ /warning/i) {
            $warning_count++;
        }
        if ($line =~ /critical|fatal/i) {
            $critical_count++;
        }
    }
    
    close($fh);
    
    return ($error_count, $warning_count, $critical_count);
}

# Main script
print "Log File Parser\n";
print "==============\n";

# Get log file from command line argument or use default
my $log_file = $ARGV[0] || '/workspace/sample.log';

# Check if log file exists, create a sample if it doesn't exist
unless (-e $log_file) {
    print "Log file '$log_file' not found. Creating a sample log file...\n";
    
    # Create a sample log file for demonstration
    open(my $sample_fh, '>', $log_file) or die "Could not create sample log file: $!";
    print $sample_fh "2023-01-01 10:00:00 INFO Application started\n";
    print $sample_fh "2023-01-01 10:01:00 ERROR Database connection failed\n";
    print $sample_fh "2023-01-01 10:02:00 WARNING Memory usage high\n";
    print $sample_fh "2023-01-01 10:03:00 ERROR File not found\n";
    print $sample_fh "2023-01-01 10:04:00 INFO User login\n";
    print $sample_fh "2023-01-01 10:05:00 CRITICAL Server overload\n";
    print $sample_fh "2023-01-01 10:06:00 ERROR Invalid input\n";
    print $sample_fh "2023-01-01 10:07:00 WARNING Disk space low\n";
    close($sample_fh);
}

# Count errors in the log file
my ($errors, $warnings, $criticals) = count_errors($log_file);

# Print results
print "Results for log file: $log_file\n";
print "Errors found: $errors\n";
print "Warnings found: $warnings\n";
print "Criticals found: $criticals\n";
print "\n";

# Generate random filename for the output script
my $output_file = generate_random_name();
print "Saving results to random file: $output_file\n";

# Write a new Perl script with the results
open(my $out_fh, '>', $output_file) or die "Could not create output file '$output_file': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Generated script with log parsing results\n";
print $out_fh "# Log file: $log_file\n";
print $out_fh "# Generated on: " . localtime() . "\n\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n\n";
print $out_fh "# Log parsing results\n";
print $out_fh "my \$log_file = '$log_file';\n";
print $out_fh "my \$error_count = $errors;\n";
print $out_fh "my \$warning_count = $warnings;\n";
print $out_fh "my \$critical_count = $criticals;\n";
print $out_fh "my \$total_errors = " . ($errors+$warnings+$criticals) . ";\n\n";
print $out_fh "print \"Log Analysis Results\\n\";\n";
print $out_fh "print \"==================\\n\";\n";
print $out_fh "print \"Log file: \$log_file\\n\";\n";
print $out_fh "print \"Errors: \$error_count\\n\";\n";
print $out_fh "print \"Warnings: \$warning_count\\n\";\n";
print $out_fh "print \"Critical issues: \$critical_count\\n\";\n";
print $out_fh "print \"Total issues: \$total_errors\\n\";\n";

close($out_fh);

print "Results saved to $output_file\n";
print "To run the generated script: perl $output_file\n";