(* Tipo algebraico para representar formas geométricas *)

type forma =
  | Circulo of float        (* radio *)
  | Rectangulo of float * float  (* ancho, alto *)
  | Triangulo of float * float * float  (* lados a, b, c *)
  | Poligono of (float * float) list  (* lista de vértices (x, y) *)
