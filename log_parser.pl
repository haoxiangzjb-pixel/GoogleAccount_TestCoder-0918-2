#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_string = '';
    for (1..$length) {
        $random_string .= $chars[rand @chars];
    }
    return $random_string . ".pl";
}

# Function to count errors in a log file
sub count_errors {
    my ($log_file) = @_;
    my $error_count = 0;
    my $warning_count = 0;
    my $critical_count = 0;
    
    open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";
    
    while (my $line = <$fh>) {
        chomp $line;
        if ($line =~ /error/i) {
            $error_count++;
        }
        if ($line =~ /warning/i) {
            $warning_count++;
        }
        if ($line =~ /critical/i) {
            $critical_count++;
        }
    }
    
    close($fh);
    
    return ($error_count, $warning_count, $critical_count);
}

# Main script
print "Log File Parser\n";
print "==============\n";

# Check if a log file was provided as argument
if (@ARGV == 0) {
    print "Usage: $0 <log_file>\n";
    print "Example: $0 application.log\n";
    exit 1;
}

my $log_file = $ARGV[0];

# Check if the log file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist!\n";
    exit 1;
}

# Count errors in the log file
my ($errors, $warnings, $criticals) = count_errors($log_file);

# Generate a random filename for the output
my $output_file = generate_random_filename();

# Write the results to the output file
open(my $out_fh, '>', $output_file) or die "Could not create output file '$output_file': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Generated log analysis results\n";
print $out_fh "# Analyzed log file: $log_file\n\n";
print $out_fh "my \$log_file = '$log_file';\n";
print $out_fh "my \$error_count = $errors;\n";
print $out_fh "my \$warning_count = $warnings;\n";
print $out_fh "my \$critical_count = $criticals;\n\n";
print $out_fh "# Print the results\n";
print $out_fh "print \"Log Analysis Results for: \$log_file\\n\";\n";
print $out_fh "print \"Errors found: \$error_count\\n\";\n";
print $out_fh "print \"Warnings found: \$warning_count\\n\";\n";
print $out_fh "print \"Critical issues found: \$critical_count\\n\";\n";

close($out_fh);

print "Analysis complete!\n";
print "Log file: $log_file\n";
print "Errors: $errors\n";
print "Warnings: $warnings\n";
print "Critical issues: $criticals\n";
print "Results saved to: $output_file\n";