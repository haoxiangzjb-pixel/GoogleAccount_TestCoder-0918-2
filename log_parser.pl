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

# Check if log file is provided as argument
if (@ARGV < 1) {
    print "Usage: $0 <log_file> [output_file]\n";
    print "If output file is not specified, a random name will be generated.\n";
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

my $error_count = 0;
my $warning_count = 0;
my $info_count = 0;
my @error_lines = ();

while (my $line = <$fh>) {
    chomp $line;
    
    # Count different types of log entries
    if ($line =~ /(?i)(error|exception|fatal)/) {
        $error_count++;
        push @error_lines, $line;
    } elsif ($line =~ /(?i)(warning|warn)/) {
        $warning_count++;
    } elsif ($line =~ /(?i)(info|information)/) {
        $info_count++;
    }
}

close($fh);

# Determine output filename
my $output_file;
if ($ARGV[1]) {
    $output_file = $ARGV[1];
} else {
    $output_file = generate_random_filename();
    # Make sure we don't overwrite an existing file
    while (-e $output_file) {
        $output_file = generate_random_filename();
    }
}

# Prepare the content to be written to the output file
my $output_content = <<EOF;
#!/usr/bin/perl
# Log Analysis Results
# Generated from log file: $log_file

# Statistics:
# Total Errors: $error_count
# Total Warnings: $warning_count
# Total Info: $info_count

# Error Lines Found:
EOF

foreach my $error_line (@error_lines) {
    $output_content .= "# - $error_line\n";
}

# Write the results to the output file
open(my $out_fh, '>', $output_file) or die "Could not create output file '$output_file': $!";
print $out_fh $output_content;
close($out_fh);

print "Log analysis completed!\n";
print "Errors found: $error_count\n";
print "Warnings found: $warning_count\n";
print "Info messages found: $info_count\n";
print "Results saved to: $output_file\n";

# If you want to also create a more detailed analysis script in the output file
# that can be executed independently, uncomment the following:

# open($out_fh, '>', $output_file) or die "Could not create output file '$output_file': $!";
# 
# print $out_fh <<EOF;
# #!/usr/bin/perl
# # Detailed Error Analysis Script
# # Generated from log file: $log_file
# use strict;
# use warnings;
# 
# my \$error_count = $error_count;
# my \$warning_count = $warning_count;
# my \$info_count = $info_count;
# 
# print "Detailed Analysis of $log_file:\\n";
# print "Total Errors: \$error_count\\n";
# print "Total Warnings: \$warning_count\\n";
# print "Total Info: \$info_count\\n";
# 
# print "\\nError Lines:\\n";
# EOF
# 
# foreach my $error_line (@error_lines) {
#     print $out_fh 'print "' . $error_line . '\\n";' . "\n";
# }
# 
# print $out_fh "\n";
# close($out_fh);