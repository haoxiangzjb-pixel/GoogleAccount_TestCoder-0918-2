#!/usr/bin/perl
use strict;
use warnings;

# Текст для поиска email-адресов
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe\@test-domain.co.uk";

# Регулярное выражение для поиска email-адресов
my @emails = $text =~ /([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})/g;

print "Found emails: \n";
foreach my $email (@emails) {
    print "$email\n";
}

# Генерация случайного имени файла
my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
my $random_filename = "email_output_";
$random_filename .= $chars[rand @chars] for (1..8);
$random_filename .= ".txt";

# Сохранение найденных email-адресов в файл со случайным именем
open(my $fh, '>', $random_filename) or die "Could not open file '$random_filename' $!";
foreach my $email (@emails) {
    print $fh "$email\n";
}
close($fh);

print "Emails saved to: $random_filename\n";