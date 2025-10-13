#!/usr/bin/perl
use strict;
use warnings;

# Пример строки с электронной почтой
my $text = 'Please contact us at support@example.com or sales@company.org for more information.';

# Регулярное выражение для поиска email
# \b - граница слова
# [a-zA-Z0-9._%+-]+ - имя пользователя (один или более символов)
# @ - символ @
# [a-zA-Z0-9.-]+ - домен (один или более символов)
# \. - точка
# [a-zA-Z]{2,} - домен верхнего уровня (минимум 2 буквы)
my @emails = $text =~ /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b/g;

# Вывод найденных email
print "Found emails: @emails\n";