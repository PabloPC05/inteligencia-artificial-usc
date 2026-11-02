;; Ejercicio 2.4: hechos del arbol familiar ampliado
;; (progenitor X Y) = X es padre o madre de Y, (pareja X Y) = X es la pareja actual de Y
;; Ademas (hombre X) / (mujer X). Los nombres van sin tildes (Andres)

(deffacts personas
   (mujer Isabel)    (hombre Felipe)
   (hombre Carlos)   (mujer Ana)      (hombre Andres)   (hombre Eduardo)
   (hombre Guillermo) (hombre Enrique)
   (hombre Jorge)    (mujer Carlota)  (hombre Luis)
   (hombre Archie)   (mujer Lillibet))

(deffacts progenitores
   ; hijos de Isabel y Felipe
   (progenitor Isabel Carlos)  (progenitor Felipe Carlos)
   (progenitor Isabel Ana)     (progenitor Felipe Ana)
   (progenitor Isabel Andres)  (progenitor Felipe Andres)
   (progenitor Isabel Eduardo) (progenitor Felipe Eduardo)
   ; hijos de Carlos
   (progenitor Carlos Guillermo)
   (progenitor Carlos Enrique)
   ; hijos de Guillermo
   (progenitor Guillermo Jorge)
   (progenitor Guillermo Carlota)
   (progenitor Guillermo Luis)
   ; hijos de Enrique
   (progenitor Enrique Archie)
   (progenitor Enrique Lillibet))

;; Hechos nuevos del 2.4
(deffacts nuevas-personas
   (mujer Camilla) (mujer Diana) (hombre Timothy) (mujer Sofia))

(deffacts nuevos-progenitores
   ; Diana es la madre de los hijos de Carlos
   (progenitor Diana Guillermo)
   (progenitor Diana Enrique))

(deffacts parejas
   ; parejas actuales; la regla pareja-simetrica anade la direccion contraria
   (pareja Carlos Camilla)
   (pareja Ana Timothy)
   (pareja Eduardo Sofia))
