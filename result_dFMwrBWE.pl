#!/usr/bin/perl
# Error analysis results for log file: /workspace/sample.log
# Generated on: Tue Oct 28 16:28:07 2025
# Total lines in log: 15
# Total errors found: 10

# Error breakdown:
# critical: 1
# error: 5
# fatal: 1
# warning: 3

# Data structure with error counts
my %error_counts = (
    'critical' => 1,
    'error' => 5,
    'fatal' => 1,
    'warning' => 3,
);

# Summary variables
my $total_errors = 10;
my $total_lines = 15;
my $error_percentage = 66.67%;

print "Error Analysis Summary:\n";
print "Total lines: $total_lines\n";
print "Total errors: $total_errors\n";
print "Error percentage: $error_percentage\n";
print "Detailed error counts: \n";
for my $type (sort keys %error_counts) {
    print "  $type: $error_counts{$type}\n";
}
