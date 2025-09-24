#!/usr/bin/perl
use strict;
use warnings;

# Sample text to search within
my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach john.doe+newsletter\@sub.domain.co.uk.";

# Regular expression to find email addresses
# Explanation:
# [\w\.\-]+ : Matches one or more word characters (letters, digits, underscore), dots, or hyphens for the local part.
# @         : Matches the literal '@' symbol.
# [\w\.\-]+ : Matches one or more word characters, dots, or hyphens for the domain name.
# \.        : Matches the literal dot before the top-level domain.
# [a-zA-Z]{2,} : Matches two or more letters for the top-level domain (e.g., com, org, info, co.uk partially).
my @emails = $text =~ /[\w\.\-]+@[\w\.\-]+\.[a-zA-Z]{2,}/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print " - $email\n";
}
