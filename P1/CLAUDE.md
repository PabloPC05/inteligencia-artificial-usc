# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

University AI assignment (Práctica 1, "Búsqueda en espacios de estados"). The deliverable is the Jupyter notebook `P1_Busqueda.ipynb`, written in Spanish, plus an HTML export of it. The final archive is `APELIDOS_NOME_Busqueda.zip`, containing `APELIDOS_NOME_Busqueda.html` and `APELIDOS_NOME_Busqueda.ipynb`. `P1.pdf` is the assignment statement.

There is no build, lint or test setup. The work is done by running notebook cells: `jupyter notebook P1_Busqueda.ipynb` (kernel name `python3`, display name "ia"). Dependencies are matplotlib, IPython and, optionally, pygments, which `psource` uses for highlighting. Students export the HTML themselves. If you need to do it from the CLI, `jupyter nbconvert --to html P1_Busqueda.ipynb` produces the same file.

- A local `.venv/` has Jupyter and nbconvert (`.venv/Scripts/jupyter`). Its `python3` kernelspec resolves to the user-level Python 3.13 install, not to the venv.
- To check the whole notebook headless: `.venv/Scripts/jupyter nbconvert --to notebook --execute --inplace P1_Busqueda.ipynb`. The TSP cells on 11–12 cities are slow.

## Files around the notebook

- `entrega/` holds the packaged deliverable: `PARDO_COTOS_PABLO_Busqueda.{ipynb,html,zip}`. These are copies, so after editing `P1_Busqueda.ipynb` they are stale until re-exported and re-zipped.
- `Pregunta1_codigo.txt` is a student aid: code copied from `search_mod.py`, with line numbers, to answer Pregunta 1.
- `Busca en espazos de estados.pdf` holds the course slides (in Galician). The `.png` files are images embedded in the notebook's markdown.

## Rules from the notebook

- **Do not modify the provided code cells** ("no modifiques ninguna linea de código"). Student work goes only in these places:
  - Cells marked `# Celda asociada a la Pregunta N`.
  - The `# ToDo` stubs in `ProblemaViajanteComercio`.
  - The answer cells under "Respuestas al cuestionario" at the end. Each `**Pregunta X.Y**` markdown cell gets its answer. More cells can be added for readability.
- The student's name goes in the second cell (`Nombre Apellidos` placeholder).
- Answers are written in Spanish.

## Architecture

The notebook runs `from search_mod import *` and `from helpers_mod import *`, so everything in both modules is a global.

- **`search_mod.py`** is a trimmed copy of AIMA-Python search (Russell & Norvig, ch. 3).
  - Domains subclass `Problem` and override `actions`, `result`, `is_goal`, `action_cost` and `h(node)`. Note that `h` takes a `Node`, not a state.
  - `Node` holds `state`, `parent`, `action` and `path_cost`. `len(node)` gives the depth.
  - Use `path_actions` and `path_states` to rebuild a solution.
  - Every informed or uniform strategy goes through `best_first_search(problem, f)`, a priority queue with a `reached` dict:
    - `astar_search(problem, h=None)` uses `problem.h` by default.
    - `greedy_bfs`, `uniform_cost_search` and `weighted_astar_search` also go through it.
  - `breadth_first_search` uses a FIFO queue and tests for the goal when a node is generated. `depth_limited_search` uses a LIFO queue and `is_cycle`.
  - The bidirectional functions are broken:
    - `copy` is never imported.
    - `bidirectional_astar_search` references an undefined `problem_b`.
    - `proceed` prints debug output.
- **`helpers_mod.py`** has three groups of helpers:
  - Display: `psource(fn)`.
  - Benchmarking:
    - `report(searchers, problems)` wraps each problem in `CountCalls`, which counts method calls through `__getattr__`.
    - It prints `nodes` (the number of `result` calls), `goal` (the number of `is_goal` calls) and `cost`.
    - It calls `len(soln)`, so a searcher must return a `Node`, not `None`.
    - To compare different heuristics with `report`, wrap each one as a one-argument searcher, for example `def astar_misplaced_tiles(p): return astar_search(p, h=p.h1)`.
  - Random 8-puzzle instances: `generate_8puzzle_problems(n)` returns a list of board **tuples**, not `Problem`s, so wrap each one in `EightPuzzle(...)`. `generate_random_board` scrambles from `(0,1,...,8)` with 100 random moves, but its LEFT branch tests `irnd == 1` again, so LEFT never happens. It is provided code, so leave it alone.
  - `Localizaciones(filename)` loads a city graph and precomputes `matriz`, an N×N matrix of haversine (semiverseno) distances in km. Read a distance with `.distancia(i, j)` and the city count with `.nciudades`.
- **Notebook-defined code**: `EightPuzzle`, `inversions`, `hamming_distance` and `board8` exist only in notebook cells, so those cells must run first.
  - `EightPuzzle` is defined **twice**. The second definition, cell "Redefinimos la clase EightPuzzle", changes the default goal to `(0,1,...,8)` and adds `h_gaschnig_distance` and `astar_gaschnig`.
  - Any `e1..e6` instances created earlier must be re-created after the redefinition.

## TSP block (Preguntas 5–6)

- `ProblemaViajanteComercio` is the main student implementation. Its spec:
  - A state is a tuple of city indices in visit order. It starts as `(0,)` and grows with each step.
  - The goal is a closed tour that visits every city and returns to 0, for example `(0, 1, 2, 3, 0)`.
  - Actions are the unvisited cities, plus the return to 0 once every city has been visited.
  - `action_cost` is the `Localizaciones` distance between the last city and the new one.
  - Pass the graph through `**kwds`, for example `ProblemaViajanteComercio(initial=(0,), grafo=Localizaciones(...))`.
- With `h = 0`, A* must behave like uniform-cost search.
- Pregunta 6 asks for three heuristics:
  - Nearest unvisited neighbour.
  - Farthest unvisited neighbour.
  - Mean distance to unvisited cities.
  - They are compared across several graphs, since one instance is not enough for valid conclusions.
- Data files in `data/` have a first line `N` and then N lines of `lat lon` in degrees. City 0 in `grafo8cidades.txt` is Santiago de Compostela.
  - `grafo4cidades.txt` holds the first 4 cities. It is a small sanity check whose optimal tour is `(0, 1, 2, 3, 0)`.
  - `grafos{N}_{K}/grafo_i.txt` are random instances with N cities, numbered from 0 to K-1. `grafos10_10` starts at `grafo_1` and also has a `grafo_10`.
  - Search cost explodes beyond about 10–12 cities.
