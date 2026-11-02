;; Ejercicio 2.1: primera version de la regla, sin variable
(defrule Regla1
   (EsPadre Pedro)
   =>
   (assert (QuiereASusHijos Pedro)))
