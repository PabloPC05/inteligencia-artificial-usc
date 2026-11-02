# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

University AI assignment (Práctica 2, "Guión de prácticas CLIPS", Intelixencia Artificial, USC, 2026/27). It introduces CLIPS, a rule-based production system, and uses it to build small knowledge-based systems (Sistemas Basados en Conocimiento). The file `enunciado` is the assignment statement: a 9-page PDF with no extension (`pdftotext -layout enunciado -` reads it). It is written in Spanish, and so are all answers.

This folder is `P2/` inside the course repo, whose git root is the parent `IA/` folder. It is tracked by git and published in `../README.md`, together with P0 and P1. Those two folders are no longer on disk: their files, including the previous assignment's `P1/CLAUDE.md`, live only in git (`git show HEAD:P1/CLAUDE.md`).

The assignment is complete. Layout:

- `1_4_hechos_y_reglas.clp` and `1_5_semaforo.clp` are the section 1 programs.
- `ejercicio2_1/`, `ejercicio2_3/` and `ejercicio2_4/` hold the section 2 files, one folder per exercise. Each has its `X_inicio.bat`, which must be loaded from inside that folder.
- `ejercicio2_1/` is named after the tutorial exercise, not the section: its files are `1_inicio.bat` and `1_personas*.clp`. `1_personas_v1.clp` is the first version of `Regla1`, kept because the answer compares the two; the batch file does not load it.
- `auto.clp` is the bundled CLIPS example that section 3 analyses, copied from `clips_examples_642`.
- `diagramas/3_arbol_query_rules.dot` (and `.png`) is the tree drawing for Cuestión 3.1, made with Graphviz: `dot -Tpng -Gdpi=150`.
- `transcripciones/` holds the CLIPS session outputs. Those for 2.3 and 2.4 were recorded with the removed `parientes`/`listar` functions, so they no longer reproduce; the report does not quote them.
- `memoria/img/` holds just the screenshots the report uses, a subset of `capturas/`.
- `entrega/Pardo_Cotos_Pablo.zip` is the packaged deliverable.
- Exercises 2.2.x, the UGR tutorial ones, are not done. They have no Cuestiones and are not part of the deliverable, and the tutorial is only on the Campus Virtual.

## Tooling

- CLIPS 6.4.2 is installed in two forms, both from http://clipsrules.sourceforge.net/:
  - `/Applications/CLIPS IDE.app`: the official GUI, which the user runs the exercises in.
  - `/opt/homebrew/bin/clips`: the command-line build, compiled from `clips_core_source_642`. It is there for headless checks.
- The user edits `.clp` files in CotEditor (`cot file.clp` opens one), not in VS Code.
- To test headless, pipe commands and answers into `clips`, for example `printf '(load "auto.clp")\n(reset)\n(run)\nno\nyes\nno\n(exit)\n' | clips`. Always end with `(exit)`: when stdin runs out without it, `clips` loops forever. `timeout` is not available on macOS. `clips -f X_inicio.bat` runs a batch file.
- Piped input is not echoed. For a transcript that shows the user's answers to `(read)`, drive `clips` through `expect` (`/usr/bin/expect`): send each line after a `CLIPS> ` or `? ` prompt.
- The CLIPS IDE GUI has hung once, with its main thread deadlocked and a spinning cursor. It had to be force-quit, which loses the session. Pasting several commands at once into the Dialog window can also drop all but the first, so paste one at a time.
- There is no build, lint or test setup. A program is "run" by loading it in CLIPS and using `(reset)` and `(run)`, or `(run N)` to step through it. The windows that matter are Dialog, Facts and Agenda.
- **Batch-file convention** (required): each exercise in section 2 has a macro `X_inicio.bat`, where X is the exercise number. It contains:
  ```
  (clear)
  (load <file>.clp) (load <other file>.clp) ...
  (reset)
  ```
  It is run with "Load batch" in the IDE. Rules and facts always go in separate files, loaded from that macro: `N_name.clp` for the rules and `N_name.facts.clp` for the `deffacts`, as in `1_personas.clp` with `1_personas.facts.clp`. The statement names `2_alarma.clp` and `2_alarma.facts.clp` for 2.2.1, which is not done.
- **Comment style** in the user's own `.clp` files (not `auto.clp`, which stays as CLIPS ships it): no `;;;===` or `;;;---` banner bars. A `;;` line for the file header and short `;` one-liners above each rule, saying only what the code does not already say. The rule name carries its own meaning, so `; misma madre y mismo padre` over `defrule hermanos` is enough.

## Answers and screenshots

- **The report is the LaTeX document in `memoria/`**, which follows the layout of the user's other course reports (e.g. `../../IPO/Practica3/memoria`): `main.tex`, `Preamble.tex`, `sections/0N_*.tex`, `img/`, `output/` and `LEEME.md`, which has the compile command.
  - Compile it with pdfLaTeX from MiKTeX (`~/.local/bin/pdflatex`), twice, using `-output-directory=output -jobname=Practica2_PabloPardoCotos`.
  - `output/Practica2_PabloPardoCotos.zip` is the source package for Overleaf.
  - The PDF goes in `entrega/Pardo_Cotos_Pablo/`, together with copies of the three 2.4 files. Both the PDF and those copies have to be re-synced from their originals after any change, and then `entrega/Pardo_Cotos_Pablo.zip` rebuilt from the folder (the zip keeps the `Pardo_Cotos_Pablo/` folder inside). `memoria/output/Practica2_PabloPardoCotos.zip` has to be rebuilt too when the `.tex` change.
  - CLIPS code is shown with `listings`, using a small `CLIPS` language defined in the preamble.
- Section 1 has GUI screenshots. The `*_dialog_rec.png` files are the Dialog captures cropped to their content. The later sections use text transcripts from the CLI.
- `capturas/` holds the screenshots, named by exercise, e.g. `1_2_agenda.png`. Claude takes them itself, because images pasted into the chat are not saved to disk.
  - Find the CLIPS IDE window IDs with a small Swift program that calls `CGWindowListCopyWindowInfo` and filters on owner "CLIPS". The windows are named Dialog, Facts and Agenda.
  - Then capture one window with `screencapture -x -o -l <id> capturas/X.png`.

## How to write the answers

- Keep each answer short and direct. The PDF holds only the Cuestiones and their answers, plus the code or output that backs them.
- Justify answers only with:
  - the teacher's theory, in `../Sistemas baseados en coñecemento.pdf`, or
  - the output of the commands the statement asks to run.
- Do not add outside facts, such as CLIPS version history (`initial-fact`), strategy names (*depth*) or documentation details.
- No comments inside the `lstlisting` blocks, not even a short one at the end of a `(defrule ...)` line. What a rule does goes in a sentence of prose after the listing.
- Do not chain explanatory sentences with a colon, which does not read like a student's report. Use `porque`, `ya que`, `por ejemplo` or a full stop. A colon is fine only to introduce a listing, a table or an enumeration.

## Structure of the assignment

1. **Fundamentos (1.1–1.5)**: facts, rules, `(run 1)`, `(clear)`, `deffacts` and `(reset)`. Then the traffic-light agent in 1.5, an interactive program that uses `(read)`:
   - Rules 1–3 ask for the agent type and the light colour. The light rule fires according to `(tipo-agente vehiculo|peaton)`.
   - Rules 4–6 decide the action. Rule 6 must use the disjunction `(semaforo ambar | intermitente)`.
   - Section 1.5 also asks for errors to be caused on purpose, and for the resulting messages to be noted.
   - Rules 1 and 2 in 1.2 use the student's own name: Pablo Pardo Cotos.
2. **Ejercicios básicos (2.1–2.4)**: exercises 1–5 of the UGR CLIPS tutorial.
   - 2.1 is the `EsPadre` rules. 2.2.x are the alarm example (tutorial p. 17 / slide 27, which fixes an erratum) and tutorial exercises 3 and 5. Tutorial exercise 4 (2.2.5) is optional.
   - 2.3 is a family-relations KBS with base facts parent-of and man/woman. It derives brother/sister (same mother **and** same father), uncle/aunt, nephew/niece, cousin and grandparent.
   - The family: Isabel and Felipe → Carlos, Ana, Andrés, Eduardo. Carlos → Guillermo and Enrique. Guillermo → Jorge, Carlota, Luis. Enrique → Archie and Lillibet.
   - 2.4 adds partners: Camilla is Carlos's current partner and Diana is the mother of his sons. Timothy is Ana's partner and Sofía is Eduardo's.
   - The implementation stores derived relations as `(relacion <tipo> X Y)`, read "X es <tipo> de Y". The rule files hold only `defrule`s: the statement never asks for `deffunction`s, so the earlier `parientes`/`listar` query functions were removed, and the facts are inspected with the Facts window or `(facts)` after `(run)`.
   - Because siblings need the same mother and the same father, 2.3 finds very few relations: no mothers are given below Isabel. Adding Diana in 2.4 makes Guillermo and Enrique siblings, which brings in the uncles and cousins. 2.4 adds the rules `pareja-simetrica`, `tios-politicos` and `sobrinos-politicos`. `tios-politicos` has no `(not (relacion tio ?p ?s))` guard: the statement says nothing about endogamy, and with these facts the output is identical either way.
3. **Diagnóstico (3)**: analyse CLIPS's bundled example `auto.clp`. The questions are:
   - The firing order of the QUERY RULES, drawn as a tree.
   - Why every query rule has `(not (repair ?))`.
   - Which rules use `salience`, and why.

## Deliverable

"Entrega de la práctica", on page 9 of `enunciado`, asks for a single archive named `Apellido1_Apellido2_Nombre` (that is, `Pardo_Cotos_Pablo`) containing:
- A PDF with **only** the questions and their answers, not the whole statement.
- All the `.clp` and `.bat` files for exercise 2.4.

Both are in place and were checked against the statement. The line that heads that list ("todos los ficheros con la resolución de los ejercicios indicados en el guion") could be read more broadly, and under that reading the missing 2.2.1 alarm files would count; the two bullets are what the statement actually enumerates.

To re-check the PDF against the statement, flatten the newlines first, because LaTeX wraps a sentence anywhere and a plain `grep` then misses it:

```bash
F=$(pdftotext -layout entrega/Pardo_Cotos_Pablo/Practica2_PabloPardoCotos.pdf - | tr '\n' ' ' | tr -s ' ')
case "$F" in *"¿Quiénes son abuelos y de quién?"*) echo OK;; *) echo FALTA;; esac
```

The statement has 17 question items in all: 2 in 1.1, 1 in 1.2, 2 in 1.3, 3 in 1.4, 1 in 1.5 plus the provoked errors, 1 in 2.1, 3 in 2.3, the same 3 again in 2.4 and 3 in section 3.
