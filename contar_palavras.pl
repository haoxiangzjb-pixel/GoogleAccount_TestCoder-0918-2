#!/usr/bin/perl
use strict;
use warnings;
use File::Temp qw(tempfile);

# Texto de exemplo - você pode modificar este texto conforme necessário
my $texto = "Este é um exemplo de texto para contar palavras. Este texto contém várias palavras repetidas e outras diferentes. A contagem de palavras é feita usando um hash em Perl.";

# Cria um hash para armazenar a contagem de cada palavra
my %contagem_palavras;

# Remove pontuação e converte para minúsculas, depois divide o texto em palavras
$texto =~ s/[^\w\s]/ /g;  # Substitui pontuação por espaços
my @palavras = split /\s+/, lc($texto);

# Conta cada palavra
foreach my $palavra (@palavras) {
    if ($palavra ne '') {  # Ignora strings vazias
        $contagem_palavras{$palavra}++;
    }
}

# Gera um nome de arquivo aleatório usando File::Temp
my ($fh, $nome_arquivo) = tempfile(SUFFIX => '.txt', UNLINK => 0);
print "Arquivo de saída: $nome_arquivo\n";

# Escreve a contagem de palavras no arquivo
foreach my $palavra (sort keys %contagem_palavras) {
    print $fh "$palavra: $contagem_palavras{$palavra}\n";
}

# Fecha o arquivo
close($fh);

print "Contagem de palavras salva em: $nome_arquivo\n";