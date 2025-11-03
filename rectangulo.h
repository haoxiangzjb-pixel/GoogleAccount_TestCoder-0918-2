#ifndef RECTANGULO_H
#define RECTANGULO_H

class Rectangulo {
private:
    double ancho;
    double alto;

public:
    // Constructor
    Rectangulo(double a = 0.0, double b = 0.0);

    // Métodos para calcular área y perímetro
    double area() const;
    double perimetro() const;

    // Métodos para establecer y obtener dimensiones
    void setAncho(double a);
    void setAlto(double b);
    double getAncho() const;
    double getAlto() const;
};

#endif // RECTANGULO_H