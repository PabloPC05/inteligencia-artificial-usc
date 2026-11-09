# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

University AI assignment (Práctica 3.1, "Regresión lineal", Intelixencia Artificial G4012328, USC, 2026/27; teacher Nicolás Vila Blanco). It is a guided Jupyter notebook on linear regression with pandas, matplotlib and scikit-learn, followed by a free modelling exercise.

This folder is `Practica3.1/` inside the course repo, whose git root is the parent `IA/` folder. It is tracked in git and pushed to GitHub, with its own section in `../README.md`; `.venv/` and the teacher's slides are ignored, and `requirements.txt` pins the packages. Earlier assignments (P0–P2) are only in git now (`git show HEAD:P2/CLAUDE.md`), and `../README.md` describes each one.

## Files

- `Practica3.1_RegresionLineal.ipynb`: the statement notebook, in **Galician** (answers in Spanish, see below). This is the one that gets submitted.
- `Practica3.1_RegresionLineal_ES.ipynb`: a working copy in **Spanish**, made for the user to read. Markdown, code comments and printed strings are translated; every identifier (`vivendas`, `prezo`, `ecm`, `desc_grad`, `predicions`…) and all code logic are identical to the Galician one, so code can be moved between them unchanged.
- `vivendas.csv` (73 rows: `superficie`, `prezo` in thousands of euros) and `cereal.csv` (80 Cereals from Kaggle, 77 rows × 16 columns, target `rating`).
- `presentacion_regresion_lineal.pdf`: the teacher's slides (`pdftotext presentacion_regresion_lineal.pdf -` reads them). Justify answers with these and with the notebook's own outputs.

## Workflow agreed with the user

1. Questions are worked out in the Spanish copy first, in a cell right under each question.
2. Each answer, once agreed, is copied **in Spanish, exactly as in the Spanish copy** (never translated to Galician) into the submitted notebook, in its cell under "Respostas ao cuestionario" (cells `**Pregunta 1**` … `**Pregunta 8**`). Only the statement text of that notebook stays in Galician. The Spanish copy is never submitted.
3. The multivariate exercise (cereal dataset) goes under "Modelado dun problema de regresión multivariante → Resposta", in Spanish and identical in both notebooks. Its one hard requirement: **exactly two predictor variables** for `rating`. It uses `sugars` and `fiber`.
4. The user wants answers short and simple, and code limited to the functions the notebook itself already uses.
5. The second cell holds the name `Pablo Pardo Cotos` (done).

The statement says not to modify the provided code except where asked; extra experiments (e.g. Pregunta 5's alpha/iterations runs) go in new cells in the answers section.

## Environment and commands

`.venv/` is a uv venv with Python 3.13 (pandas 3.0, numpy 2.4, scikit-learn 1.8, matplotlib 3.10, Jupyter). `.vscode/settings.json` points VS Code at it. There is no seaborn. The notebook metadata still names a kernel `ia` / Python 3.10 from the teacher; the `python3` kernel of the venv is what runs it.

Run the whole notebook headless (from this folder, since it reads the CSVs by relative path), writing the result outside the project:

```bash
.venv/bin/jupyter nbconvert --to notebook --execute Practica3.1_RegresionLineal.ipynb --output-dir <scratch dir> --output run.ipynb
```

Both notebooks execute end to end with no errors. The only warning is a `MatplotlibDeprecationWarning` for `plt.boxplot(..., labels=...)` (renamed `tick_labels`); it is provided code, so leave it.

## Things to know for the answers

- `SEED_VALUE = 123` and `np.random.seed(SEED_VALUE)` before `train_test_split`, `fit` and `predict` are required by the statement; reuse them in the cereal exercise.
- `ecm` divides by `2*m` (the cost J from the slides), so it is half the usual MSE; `np.sqrt(ecm)` in the notebook is therefore not exactly the RMSE.
- In `cereal.csv`, missing values are coded as `-1` (`carbo` 1 row, `sugars` 1, `potass` 2). `name`, `mfr` and `type` are text columns.

## Deliverable

A single `APELIDOS_NOME_RegresionLineal.zip` (i.e. `PARDO_COTOS_PABLO_RegresionLineal.zip`) with:
- `PARDO_COTOS_PABLO_RegresionLineal.html`: the exported Galician notebook, with the answers at the end.
- `PARDO_COTOS_PABLO_RegresionLineal.ipynb`: the Galician notebook.
- The data file for the free-choice problem (`cereal.csv`).

It is built in `entrega/`: the submitted notebook executed with `nbconvert --execute` into `entrega/PARDO_COTOS_PABLO_RegresionLineal.ipynb`, exported to `.html`, plus a copy of `cereal.csv`, all three zipped at the root of `PARDO_COTOS_PABLO_RegresionLineal.zip`. After any change to the notebook, rebuild all of it.
