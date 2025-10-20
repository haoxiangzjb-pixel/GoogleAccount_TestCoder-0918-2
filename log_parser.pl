#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_filename {
    my $length = 10;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_string = '';
    for (1..$length) {
        $random_string .= $chars[rand @chars];
    }
    return $random_string . ".pl";
}

# Function to count errors in log file
sub count_errors {
    my ($log_file) = @_;
    open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";
    
    my %error_count = ();
    my $total_errors = 0;
    
    while (my $line = <$fh>) {
        chomp $line;
        # Look for lines containing ERROR
        if ($line =~ /ERROR/) {
            # Extract the error message part after "ERROR"
            if ($line =~ /ERROR\s+(.+)/) {
                my $error_msg = $1;
                $error_count{$error_msg}++;
                $total_errors++;
            } else {
                # If there's no specific message after ERROR, count it as a general error
                $error_count{"General ERROR"}++;
                $total_errors++;
            }
        }
    }
    
    close($fh);
    
    return (\%error_count, $total_errors);
}

# Main script
my $log_file = $ARGV[0] || "sample.log"; # Use provided log file or default to sample.log

if (!-e $log_file) {
    die "Log file '$log_file' does not exist!";
}

my ($error_count_ref, $total_errors) = count_errors($log_file);
my %error_count = %$error_count_ref;

# Generate random filename
my $random_filename = generate_random_filename();

# Write results to the random-named Perl file
open(my $output_fh, '>', $random_filename) or die "Could not create file '$random_filename': $!";

print $output_fh "#!/usr/bin/perl\n";
print $output_fh "# Error statistics generated from log file: $log_file\n\n";
print $output_fh "# Total errors found: $total_errors\n\n";
print $output_fh "# Error breakdown:\n";

foreach my $error_msg (sort keys %error_count) {
    print $output_fh "# $error_msg: $error_count{$error_msg} occurrences\n";
}

close($output_fh);

print "Error statistics have been saved to: $random_filename\n";
print "Total errors found: $total_errors\n";
print "Error breakdown:\n";
foreach my $error_msg (sort keys %error_count) {
    print "  $error_msg: $error_count{$error_msg} occurrences\n";
}