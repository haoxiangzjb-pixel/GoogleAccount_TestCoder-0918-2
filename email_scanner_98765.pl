#!/usr/bin/perl
use strict;
use warnings;

# Regular expression to match email addresses
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Sample text containing email addresses
my $text = 'Contact us at support@example.com or sales@company.org for more information. You can also reach john.doe+test@gmail.com';

# Find all email addresses in the text
my @emails = $text =~ /($email_regex)/g;

print "Found " . scalar(@emails) . " email addresses:\n";
foreach my $email (@emails) {
    print "- $email\n";
}

# Example of reading from a file and finding emails
print "\nSearching for emails in a file:\n";
if (@ARGV) {
    my $filename = $ARGV[0];
    if (open(my $fh, '<', $filename)) {
        while (my $line = <$fh>) {
            chomp $line;
            my @line_emails = $line =~ /($email_regex)/g;
            if (@line_emails) {
                print "Line: $line\n";
                foreach my $email (@line_emails) {
                    print "  Email: $email\n";
                }
            }
        }
        close($fh);
    } else {
        print "Could not open file '$filename': $!\n";
    }
}