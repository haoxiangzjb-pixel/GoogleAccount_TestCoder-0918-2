#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing emails
my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach john.doe+newsletter\@sub.domain.co.uk.";

# Regular expression to find emails
# Uses a non-capturing group (?:...) for the TLD part to ensure the full match is returned
my @emails = $text =~ /[\w\.\-]+\@[\w\-]+(?:\.[\w\-]+)+/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "- $email\n";
}
