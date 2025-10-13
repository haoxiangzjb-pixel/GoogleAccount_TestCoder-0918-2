#!/usr/bin/perl
use strict;
use warnings;

# Текст для поиска
my $text = 'Please contact us at support@example.com or sales@shop.org for more information. Also reachable at admin@test-domain.co.uk.';

# Регулярное выражение для поиска email
my @emails = $text =~ /[\w\.\-]+\@[\w\-]+(?:\.[\w\-]+)+/g;

# Вывод найденных email
print "Found emails: @emails\n";