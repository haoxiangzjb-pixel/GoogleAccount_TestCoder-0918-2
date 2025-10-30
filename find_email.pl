#!/usr/bin/perl
use strict;
use warnings;

# This script searches for email addresses in a given text using a regular expression.

my $text = "Contact us at support@example.com or sales@company.org for more information.";
my @emails = $text =~ /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "$email\n";
}