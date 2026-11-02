;; Ejercicio 1.5: agente (vehiculo o peaton) que decide como pasar un semaforo

; Regla 1: pregunta el tipo de agente
(defrule regla-tipo-agente
   =>
   (printout t "Que tipo de agente es (vehiculo/peaton)? ")
   (assert (tipo-agente (read))))

; Regla 2: color del semaforo de los coches, solo si el agente es un vehiculo
(defrule regla-semaforo-vehiculo
   (tipo-agente vehiculo)
   =>
   (printout t "Como esta el semaforo para los coches (verde/rojo/ambar/intermitente)? ")
   (assert (semaforo (read))))

; Regla 3: color del semaforo de los peatones, solo si el agente es un peaton
(defrule regla-semaforo-peaton
   (tipo-agente peaton)
   =>
   (printout t "Como esta el semaforo para los peatones (verde/rojo/ambar/intermitente)? ")
   (assert (semaforo (read))))

; Regla 4: ?tipo vale para cualquier agente y se usa en el consecuente
(defrule agente-puede-pasar
   (tipo-agente ?tipo)
   (semaforo verde)
   =>
   (printout t "El agente " ?tipo " puede pasar" crlf))

; Regla 5
(defrule debe-esperar
   (tipo-agente ?tipo)
   (semaforo rojo)
   =>
   (printout t "El agente " ?tipo " debe esperar" crlf))

; Regla 6: la disyuncion | admite ambar o intermitente en el mismo antecedente
(defrule con-cuidado
   (tipo-agente ?tipo)
   (semaforo ambar | intermitente)
   =>
   (printout t "El agente " ?tipo " debe pasar con cuidado" crlf))
