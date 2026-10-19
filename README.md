# Inteligencia Artificial (USC) — Prácticas

Prácticas de la asignatura **Intelixencia Artificial** (G4012328) del Grado en Ingeniería Informática de la Universidade de Santiago de Compostela, curso 2026/2027. Autor: Pablo Pardo Cotos.

Cada práctica está en su carpeta, con el material que venía con el enunciado, mi solución y lo entregado.

## P0 — Introducción a Python

Cuadernos de introducción a Python de las primeras sesiones:

- `1.Python basics.ipynb`: sintaxis básica de Python.
- `2.POO con Python.ipynb`: programación orientada a objetos en Python.

## P1 — Búsqueda en espacios de estados

Resolución del 8-puzzle y del problema del viajante de comercio con las estrategias de búsqueda de AIMA-Python (Russell y Norvig, cap. 3): anchura, profundidad limitada, coste uniforme, voraz, A* y A* ponderado, con varias heurísticas.

**Material del enunciado:**
- `P1.pdf`: enunciado de la práctica.
- `Busca en espazos de estados.pdf`: diapositivas de teoría (en gallego).
- `search_mod.py` y `helpers_mod.py`: módulos proporcionados, basados en AIMA-Python.
- `data/`: grafos de ciudades para el viajante. Contiene `grafo8cidades.txt` (8 ciudades gallegas), `grafo4cidades.txt` e instancias aleatorias de 10, 11 y 12 ciudades.
- Las imágenes `.png` que se incrustan en el cuaderno.

**Mi trabajo:**
- `P1_Busqueda.ipynb`: el cuaderno con la implementación y las respuestas al cuestionario, en el mismo estado en que se entregó.
- `entrega/`: lo entregado en el Campus Virtual el 5 de octubre de 2026 (`PARDO_COTOS_PABLO_Busqueda.ipynb`, su exportación `.html` y el `.zip`).
- `Pregunta1_codigo.txt`: el código de `search_mod.py` con números de línea, que usé como apoyo para responder la Pregunta 1.

Lo que implementé:
- La clase `ProblemaViajanteComercio`. El estado es la tupla de ciudades visitadas, empezando en `(0,)`, y la meta es un ciclo cerrado que vuelve a la ciudad 0.
- Tres heurísticas para A*: vecino no visitado más próximo, vecino no visitado más lejano y distancia media a las ciudades pendientes.
- La comparación de estrategias y heurísticas, tanto en el 8-puzzle como en el viajante.

**El test de evaluación:**
- `Test_P1_resultado.png`: captura de la revisión del *Test P1: Búsqueda en espacios de estados*. Lo hice en la sesión de prácticas del lunes 19 de octubre de 2026, de 15:41 a 16:35.
- El test comprobaba la comprensión de la entrega. Tenía preguntas teóricas de opción múltiple y otras en las que había que ejecutar el código de la práctica con instancias nuevas.
- Para responder lo resolví ejecutando mi propio cuaderno.
- Una vez terminado, comprobé las respuestas volviendo a ejecutar el mismo código y coincidieron en las 8 preguntas. La única duda es de formato: en la pregunta 8 escribí un coste con punto decimal y se pedía coma.
- Después del test devolví el cuaderno al estado de la entrega.

### Cómo ejecutarlo

Requiere Python 3 con Jupyter, matplotlib e IPython; pygments es opcional. Ejecuta las celdas desde la carpeta `P1/`, porque el cuaderno importa `search_mod` y `helpers_mod` y lee `./data/`:

```
cd P1
jupyter notebook P1_Busqueda.ipynb
```

El cuaderno completo tarda alrededor de un minuto. Casi todo ese tiempo es la comparación de heurísticas en los grafos de 10 ciudades.
