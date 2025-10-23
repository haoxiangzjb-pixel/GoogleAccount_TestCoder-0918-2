#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach admin\@test.net";

# Regular expression to find email addresses
my @emails = $text =~ /[\w\.\-]+@[\w\-]+\.[\w\-]+/g;

print "Found emails: @emails\n";

# More comprehensive example with a loop to extract emails
my @all_emails;
while ($text =~ /([\w\.\-]+@[\w\-]+(\.[\w\-]+))/g) {
    push @all_emails, $1;
}

print "All found emails: @all_emails\n";