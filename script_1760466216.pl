#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Contact us at support\@example.com or sales\@another-domain.org for more information. You can also reach john.doe+newsletter\@sub.domain.co.uk.";

# Regular expression to find email addresses
# This regex looks for:
# - One or more word characters, dots, or hyphens
# - Followed by an @ symbol
# - Followed by one or more word characters, dots, or hyphens
# - Followed by a literal dot and one or more word characters
my @emails = $text =~ /[\w\.\-]+@[\w\.\-]+\.\w+/g;

# Print the found email addresses
if (@emails) {
    print "Found emails: @emails\n";
} else {
    print "No emails found.\n";
}
