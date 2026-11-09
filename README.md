# Inteligencia Artificial (USC) — Prácticas

Prácticas de la asignatura **Inteligencia Artificial** (*Intelixencia Artificial*, G4012328) del **Grado en Ingeniería Informática de la Universidade de Santiago de Compostela (USC)**, curso 2026/2027. Autor: Pablo Pardo Cotos.

Contiene las prácticas P0, P1, P2 y 3.1, cada una en su carpeta, con el enunciado y el material que venía con él, mi solución, lo entregado y el entorno de Python que usé. Los apuntes y las diapositivas de teoría no están incluidos.

En la raíz:
- `organizacion_practicas_cv.pdf`: organización de las prácticas en el Campus Virtual.
- `tests.txt`: vacío.

Los ficheros `AGENTS.md` (P0) y `CLAUDE.md` (P1, P2 y 3.1) son instrucciones para asistentes de código, y `P0/.vscode/` y `Practica3.1/.vscode/` son la configuración de VS Code.

## P0 — Introducción a Python

Cuadernos de introducción a Python de las primeras sesiones:

- `1.Python basics.ipynb`: sintaxis básica de Python.
- `2.POO con Python.ipynb`: programación orientada a objetos en Python.

## P1 — Búsqueda en espacios de estados

Resolución del 8-puzzle y del problema del viajante de comercio con las estrategias de búsqueda de AIMA-Python (Russell y Norvig, cap. 3): anchura, profundidad limitada, coste uniforme, voraz, A* y A* ponderado, con varias heurísticas.

**Material del enunciado:**
- `P1.pdf`: enunciado de la práctica.
- `search_mod.py` y `helpers_mod.py`: módulos proporcionados, basados en AIMA-Python.
- `data/`: grafos de ciudades para el viajante. Contiene `grafo8cidades.txt` (8 ciudades gallegas), `grafo4cidades.txt` e instancias aleatorias de 10, 11 y 12 ciudades.
- Las imágenes `.png` que se incrustan en el cuaderno.

**Mi trabajo:**
- `P1_Busqueda.ipynb`: el cuaderno con la implementación y las respuestas al cuestionario, en el mismo estado en que se entregó.
- `entrega/`: lo entregado en el Campus Virtual el 5 de octubre de 2026 (`PARDO_COTOS_PABLO_Busqueda.ipynb`, su exportación `.html` y el `.zip`).
- `Pregunta1_codigo.txt`: el código de `search_mod.py` con números de línea, que usé como apoyo para responder la Pregunta 1.
- `P1_Busqueda.html`: una exportación HTML anterior a la definitiva, que es la de `entrega/`.

Lo que implementé:
- La clase `ProblemaViajanteComercio`. El estado es la tupla de ciudades visitadas, empezando en `(0,)`, y la meta es un ciclo cerrado que vuelve a la ciudad 0.
- Tres heurísticas para A*: vecino no visitado más próximo, vecino no visitado más lejano y distancia media a las ciudades pendientes.
- La comparación de estrategias y heurísticas, tanto en el 8-puzzle como en el viajante.

**El test de evaluación:**
- `test/Test_P1_resultado.png`: captura de la revisión del *Test P1: Búsqueda en espacios de estados*. Lo hice en la sesión de prácticas del lunes 19 de octubre de 2026, de 15:41 a 16:35.
- `test/P1_Busqueda_durante_test.ipynb`: el cuaderno tal como quedó tras el test, con las instancias del test sustituidas en las celdas.
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

## P2 — CLIPS y sistemas basados en conocimiento

Introducción a CLIPS 6.4.2 y construcción de varios sistemas basados en conocimiento, siguiendo el guión de prácticas. Los programas se cargan en el IDE de CLIPS con `(load)` o con los ficheros de órdenes `X_inicio.bat` ("Load batch"), que hay que lanzar desde dentro de su carpeta.

**Material del enunciado:**
- `enunciado`: el guión de la práctica, un PDF sin extensión.
- `auto.clp`: el ejemplo de diagnóstico de averías que viene con CLIPS, que se analiza en la sección 3.

**Mi trabajo:**
- `1_4_hechos_y_reglas.clp`: los hechos con `deffacts` y las reglas de los ejercicios 1.1 a 1.4.
- `1_5_semaforo.clp`: el agente vehículo o peatón que decide si pasar un cruce con semáforo, con preguntas por teclado mediante `(read)`.
- `ejercicio2_1/`, `ejercicio2_3/` y `ejercicio2_4/`: los ejercicios de la sección 2, cada uno con sus reglas en `N_*.clp`, sus hechos en `N_*.facts.clp` y su `N_inicio.bat`. El 2.3 deduce relaciones de parentesco (hermanos, tíos, sobrinos, primos y abuelos) a partir de `progenitor`, `hombre` y `mujer`, y el 2.4 añade las parejas y el parentesco político.
- `memoria/`: la memoria en LaTeX, con las cuestiones y sus respuestas. El PDF final es `memoria/output/Practica2_PabloPardoCotos.pdf` y en `memoria/LEEME.md` está cómo compilarla.
- `entrega/`: lo entregado en el Campus Virtual, el PDF de las respuestas y los ficheros del ejercicio 2.4, con el `.zip` tal como se subió.
- `capturas/`: las capturas de las ventanas Dialog, Facts y Agenda del IDE de CLIPS que ilustran la sección 1.
- `transcripciones/`: las salidas de las sesiones de CLIPS en línea de órdenes.
- `diagramas/`: el árbol de encadenamiento de las QUERY RULES de `auto.clp`, en Graphviz.

## Práctica 3.1 — Regresión lineal

Regresión lineal con pandas, matplotlib y scikit-learn, en un cuaderno guiado: análisis del dataset de viviendas (superficie y precio), descenso del gradiente programado a mano, modelo con `LinearRegression`, evaluación con train/test y efecto de un outlier. Al final hay un ejercicio libre de regresión multivariante.

**Material del enunciado:**
- `Practica3.1_RegresionLineal.ipynb` traía el enunciado, en gallego, con el código proporcionado.
- `vivendas.csv`: 73 viviendas con `superficie` (m²) y `prezo` (miles de euros).
- Las diapositivas de teoría (`presentacion_regresion_lineal.pdf`) no están incluidas.

**Mi trabajo:**
- `Practica3.1_RegresionLineal.ipynb`: el cuaderno entregado. El enunciado sigue en gallego y las respuestas a las preguntas 1 a 8 están en español, en la sección "Respostas ao cuestionario".
- `Practica3.1_RegresionLineal_ES.ipynb`: una copia de trabajo traducida al español, con cada respuesta debajo de su pregunta. Los identificadores y el código son los mismos que en el original. No se entregó.
- `cereal.csv`: el dataset elegido para el ejercicio libre (*80 Cereals*, de Kaggle, 77 cereales y 16 variables).
- El ejercicio libre predice el `rating` de los cereales con dos variables, `sugars` y `fiber`. Antes quita las 3 filas con `-1`, que marcan datos que faltan. El modelo queda como rating = 50,13 - 2,00 · sugars + 2,93 · fiber, con una correlación de 0,91 en test.
- `entrega/`: lo entregado en el Campus Virtual (`PARDO_COTOS_PABLO_RegresionLineal.ipynb` ejecutado, su exportación `.html`, `cereal.csv` y el `.zip` tal como se subió).

### Cómo ejecutarlo

Requiere Python 3 con Jupyter, pandas, matplotlib y scikit-learn. Las versiones exactas que usé (Python 3.13 en macOS) están en `Practica3.1/requirements.txt`. Ejecuta el cuaderno desde la carpeta `Practica3.1/`, porque lee los `.csv` por ruta relativa:

```
cd Practica3.1
uv venv --python 3.13
uv pip install -r requirements.txt
.venv/bin/jupyter notebook Practica3.1_RegresionLineal.ipynb
```

## El entorno de Python

`P0/.venv/` es el entorno virtual tal como lo usé, creado con uv en Windows con Python 3.11 (sin las cachés `__pycache__`). Solo funciona en Windows y con Python 3.11 instalado por uv en la misma ruta; en otro equipo, mejor recrearlo. VS Code lo usa como intérprete (`P0/.vscode/settings.json`).

El de P1 no se conserva. Las versiones exactas de los paquetes de las dos prácticas están en `P0/requirements.txt` y `P1/requirements.txt`. Para recrear un entorno, desde la carpeta de la práctica:

```
uv venv --python 3.11
uv pip install -r requirements.txt
```

Sin uv: `py -3.11 -m venv .venv` y después `.venv\Scripts\pip install -r requirements.txt` (en macOS o Linux, `python3.11 -m venv .venv` y `.venv/bin/pip install -r requirements.txt`).
