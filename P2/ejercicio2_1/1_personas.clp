;; Ejercicio 2.1: version final de la regla, con variable
(defrule LosPadresQuierenALosHijos
   (EsPadre ?variable)
   =>
   (assert (QuiereASusHijos ?variable)))
