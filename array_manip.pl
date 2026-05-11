#!/usr/bin/perl
use strict;
use warnings;

# Crear un array inicial
my @array = (1, 2, 3, 4, 5);
print "Array original: @array\n";

# Manipular el array: agregar elementos
push @array, 6, 7, 8;
print "Después de push: @array\n";

# Eliminar el primer elemento
shift @array;
print "Después de shift: @array\n";

# Ordenar el array en orden descendente
@array = sort { $b <=> $a } @array;
print "Ordenado descendente: @array\n";

# Generar nombre de archivo aleatorio
my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
my $nombre_aleatorio = '';
for (1..8) {
    $nombre_aleatorio .= $chars[rand @chars];
}
my $archivo = "${nombre_aleatorio}.txt";

# Guardar el array en el archivo
open(my $fh, '>', $archivo) or die "No se pudo abrir el archivo $archivo: $!";
foreach my $elemento (@array) {
    print $fh "$elemento\n";
}
close($fh);

print "Array guardado en el archivo: $archivo\n";
