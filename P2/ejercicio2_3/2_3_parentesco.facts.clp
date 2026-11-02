;; Ejercicio 2.3: hechos del arbol familiar
;; (progenitor X Y) = X es padre o madre de Y, mas (hombre X) / (mujer X)
;; Los nombres van sin tildes (Andres)

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
