;; Ejercicio 2.3: relaciones de consanguinidad
;; Cada relacion deducida es (relacion <tipo> X Y) = "X es <tipo> de Y"
;; con <tipo> en {hermano, tio, sobrino, primo, abuelo}

; misma madre y mismo padre
(defrule hermanos
   (progenitor ?padre ?x)
   (hombre ?padre)
   (progenitor ?madre ?x)
   (mujer ?madre)
   (progenitor ?padre ?y&~?x)
   (progenitor ?madre ?y)
   =>
   (assert (relacion hermano ?x ?y)))

; hermano de un progenitor
(defrule tios
   (relacion hermano ?t ?p)
   (progenitor ?p ?s)
   =>
   (assert (relacion tio ?t ?s)))

; inversa de tio
(defrule sobrinos
   (relacion tio ?t ?s)
   =>
   (assert (relacion sobrino ?s ?t)))

; sus progenitores son hermanos
(defrule primos
   (progenitor ?a ?x)
   (progenitor ?b ?y)
   (relacion hermano ?a ?b)
   =>
   (assert (relacion primo ?x ?y)))

; progenitor de un progenitor
(defrule abuelos
   (progenitor ?a ?p)
   (progenitor ?p ?n)
   =>
   (assert (relacion abuelo ?a ?n)))
