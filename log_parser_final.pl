#!/usr/bin/perl
use strict;
use warnings;

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

# Check if log file is provided as argument
if (@ARGV < 1) {
    print "Usage: $0 <log_file_path> [search_pattern]\n";
    print "Example: $0 /path/to/logfile.log\n";
    print "Default pattern 'ERROR' will be used if no pattern is provided\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $pattern = $ARGV[1] || 'ERROR';  # Default pattern is 'ERROR'

# Check if the log file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist!\n";
    exit 1;
}

# Open and read the log file
open(my $fh, '<', $log_file) or die "Cannot open file '$log_file': $!";

my $error_count = 0;
my @error_lines = ();

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /$pattern/i) {  # Case-insensitive match
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# Generate random filename
my $random_filename = generate_random_filename();

# Create the output script that contains the statistics
open(my $out_fh, '>', $random_filename) or die "Cannot create file '$random_filename': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n\n";

print $out_fh "# Generated script containing log analysis results\n";
print $out_fh "# Log file analyzed: $log_file\n";
print $out_fh "# Search pattern: $pattern\n";
print $out_fh "# Total errors found: $error_count\n\n";

# Print the array definition with proper escaping
print $out_fh "my \\\@errors = (\n";
foreach my $error_line (@error_lines) {
    # Escape special characters for Perl string
    $error_line =~ s/\\/\\\\/g;  # Escape backslashes
    $error_line =~ s/"/\\"/g;    # Escape double quotes
    print $out_fh "    \"$error_line\",\n";
}
print $out_fh ");\n\n";

print $out_fh "# Print the statistics\n";
print $out_fh "print \"Log Analysis Results:\\n\";\n";
print $out_fh "print \"Log file: $log_file\\n\";\n";
print $out_fh "print \"Pattern searched: $pattern\\n\";\n";
print $out_fh "print \"Total errors found: $error_count\\n\\n\";\n";
print $out_fh "print \"Error lines:\\n\";\n";
print $out_fh "foreach my \\\$error (\\\@errors) {\n";
print $out_fh "    print \"  \\\$error\\n\";\n";
print $out_fh "}\n";

close($out_fh);

print "Log analysis completed!\n";
print "Found $error_count occurrences of '$pattern' in '$log_file'\n";
print "Results saved to: $random_filename\n";

# Make the generated file executable
chmod 0755, $random_filename;