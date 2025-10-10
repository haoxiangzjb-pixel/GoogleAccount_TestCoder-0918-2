#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing emails
my $text = "Contact us at support\@example.com or sales\@test.org for more info. You can also reach john.doe+newsletter\@sub.domain.co.uk.";

# Regular expression to find emails
my @emails = $text =~ /[\w\.\-]+\@[\w\.\-]+\.\w+/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print " - $email\n";
}
