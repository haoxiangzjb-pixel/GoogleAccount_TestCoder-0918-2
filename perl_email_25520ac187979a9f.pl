#!/usr/bin/perl
use strict;
use warnings;

# Текст с email-адресами для поиска
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach admin\@test-site.net or info\@my-domain.co.uk";

# Регулярное выражение для поиска email-адресов
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)+/g;

# Вывод найденных email-адресов
print "Found emails: " . join(", ", @emails) . "\n";