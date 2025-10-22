#!/usr/bin/perl
use strict;
use warnings;
use File::Temp qw(tempfile);

# Текст для поиска email-адресов
my $text = "Contact us at admin\@example.com or support\@domain.org for assistance. Also reachable at info\@test-site.co.uk";

# Регулярное выражение для поиска email-адресов
my @emails = $text =~ /[\w\.\-]+@[\w\.\-]+\.\w+/g;

# Генерация случайного имени файла и сохранение результатов
my ($fh, $filename) = tempfile(SUFFIX => '.txt', UNLINK => 0);
print $fh "Found emails: " . join(", ", @emails) . "\n";
close($fh);

print "Results saved to: $filename\n";
print "Found emails: " . join(", ", @emails) . "\n";