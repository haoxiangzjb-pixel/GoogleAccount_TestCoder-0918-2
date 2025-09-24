#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given text using a regular expression.

my $text = "Contact us at admin@example.com or support@help.org for assistance. You can also reach john.doe+newsletter@company.co.uk.";

# Regular expression to match emails
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(\.[\w\-]+)/g;

print "Found emails: @emails\n";

# Print each email on a new line
foreach my $email (@emails) {
    print "Email found: $email\n";
}