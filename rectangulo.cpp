#include "rectangulo.h"

// Constructor
Rectangulo::Rectangulo(double a, double b) : ancho(a), alto(b) {}

// Método para calcular el área
double Rectangulo::area() const {
    return ancho * alto;
}

// Método para calcular el perímetro
double Rectangulo::perimetro() const {
    return 2 * (ancho + alto);
}

// Métodos para establecer dimensiones
void Rectangulo::setAncho(double a) {
    ancho = a;
}

void Rectangulo::setAlto(double b) {
    alto = b;
}

// Métodos para obtener dimensiones
double Rectangulo::getAncho() const {
    return ancho;
}

double Rectangulo::getAlto() const {
    return alto;
}