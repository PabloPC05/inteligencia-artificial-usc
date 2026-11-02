;; Ejercicio 1.4: los hechos anteriores con deffacts y las reglas del 1.2

(deffacts hechos-iniciales
   (nombre Juanjo)
   (nombre Juan)
   (apellido-1 Cruz)
   (apellido-1 Perez)
   (apellido-2 Lopez)
   (nombre Federico)
   (apellido-1 Perez)
   (apellido-2 Jimenez)
   (nombre Pablo)
   (apellido-1 Pardo)
   (apellido-2 Cotos))

; Regla 1: imprime el nombre de pila
(defrule regla1
   (nombre Pablo)
   =>
   (printout t "Tu nombre de pila es Pablo" crlf))

; Regla 2: imprime el nombre completo
(defrule regla2
   (nombre Pablo)
   (apellido-1 Pardo)
   (apellido-2 Cotos)
   =>
   (printout t "Te llamas Pablo Pardo Cotos" crlf))
