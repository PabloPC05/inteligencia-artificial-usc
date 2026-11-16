# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

University AI assignment (Práctica 3.2, "Clustering", Intelixencia Artificial G4012328, USC, 2026/27; teacher Nicolás Vila Blanco). It is a guided Jupyter notebook on k-means (own implementation, multiple random initialisation, elbow method, scikit-learn `KMeans`), followed by a free clustering exercise on a heart disease dataset. It is finished and submitted.

This folder is `Practica3.2/` inside the course repo, whose git root is the parent `IA/` folder. It is tracked in git and pushed to GitHub, with its own section in `../README.md`; `.venv/` is ignored, the teacher's slides are at the repo root as `Agrupamento.pdf`, and `requirements.txt` pins the packages. Earlier assignments are only in git (`git show HEAD:Practica3.1/CLAUDE.md`); several of their folders are deleted from the local disk, so never stage those deletions (`git add` only the paths you mean to commit).

## Files

- `Practica3.2_Clustering.ipynb`: the statement notebook, in **Galician**, with the answers in Spanish. This is the one that was submitted.
- `Practica3.2_Clustering_ES.ipynb`: a working copy in **Spanish**, made for the user to read. Markdown, code comments and plot labels are translated; every identifier (`vivendas`, `custo`, `k_medias`, `agrupamento_1`, `mellores_centroides`…) and all code logic are identical to the Galician one.
- `vivendas.csv` (73 rows: `superficie`, `prezo`) and `heart_disease_patients.csv` (303 rows: `id` plus 11 variables, no diagnosis column).
- `resumen/`: a LaTeX summary of the theory (`Resumen_Clustering.tex`, compiled with `tectonic` because the local TeX has no Spanish hyphenation patterns).
- `entrega/`: what was uploaded to the Campus Virtual.
- `../Agrupamento.pdf`: the teacher's slides (`pdftotext ../Agrupamento.pdf -` reads them). They define the cost as the sum of **squared** Euclidean distances, although the notebook's `j()` takes the square root (mean of plain distances).

## Workflow agreed with the user

1. Answers live in the "Respostas ao cuestionario" / "Respuestas al cuestionario" section at the end (cells `**Pregunta 1**` … `**Pregunta 7**`), not under each question, and are identical (in Spanish) in both notebooks. Only the statement text of the submitted notebook stays in Galician.
2. The free exercise goes under "Modelado dun problema real → Resposta (6 puntos)", in Spanish and identical in both notebooks.
3. The user is new to the topic and wants short, simple answers and code that uses **only** functions, methods and plotting styles that already appear in the guided part (`pd.read_csv`, `.values`, `np.sum(..., axis=0)/...shape[0]`, `np.sqrt`, `np.random.seed`, `KMeans`/`.fit`/`.inertia_`/`.labels_`/`.cluster_centers_`, `plt.figure`/`add_subplot`/`scatter`, `plt.plot(..., '--', color="green")`). No `describe`, `groupby`, `hist`, seaborn, legends or custom colours. Approximate values are written in words ("unos", "alrededor de"), not with "≈".
4. The free exercise uses `age`, `trestbps`, `chol`, `thalach` and `oldpeak`, standardised by hand, `KMeans(n_clusters=k, n_init=10, random_state=SEED_VALUE)` with `SEED_VALUE = 42`, and k = 3 from the elbow (`inertia_ / len(pacientes)`). Clusters: 0 effort-intolerant/higher risk (86), 1 young and fit (147), 2 high blood pressure and cholesterol (70).

## Environment and commands

The work was done between 9 and 16 November 2026 on a Mac with Apple Silicon (arm64), macOS 26.6 (25G72), with CPython 3.13.18 installed by uv and a uv 0.13.6 venv at `.venv/`: pandas 3.1.1, numpy 2.5.4, scikit-learn 1.9.1, matplotlib 3.10.9, scipy 1.18.1, Jupyter 1.1.1 (notebook 7.6.5, jupyterlab 4.6.6, ipykernel 7.4.0, nbconvert 7.17.2); exact pins in `requirements.txt`. There is no seaborn. Kernel: the venv's `python3`, shown as ".venv (3.13)" (the teacher's notebook named a kernel `ia` / Python 3.10.14). `.vscode/settings.json` points VS Code at the venv and runs notebooks from this folder. `resumen/` was compiled with Tectonic 0.17.0.

`.venv/` is not in git, and the whole local `Practica3.2/` folder was deleted from the user's disk on 16 November 2026 after verifying the push (moved to the macOS Trash as "Practica3.2 (IA)"). To work on it again, check out the folder from git and recreate the venv:

```bash
uv python install 3.13.18
uv venv --python 3.13.18
uv pip install -r requirements.txt
```

All random steps use fixed seeds, so with these versions the results are reproducible (free exercise: clusters of 86, 147 and 70 patients).

The provided `KMeans(..., algorithm='full')` fails with scikit-learn ≥ 1.3; both notebooks use `algorithm='lloyd'` (same algorithm), with a comment. That is the only change to the provided code.

Run a notebook headless from this folder (it reads the CSVs by relative path):

```bash
.venv/bin/jupyter nbconvert --to notebook --execute --inplace Practica3.2_Clustering.ipynb
```

Both notebooks execute end to end with no errors.

## Deliverable

`entrega/PARDO_COTOS_PABLO_Clustering.zip` with, at its root: `PARDO_COTOS_PABLO_Clustering.ipynb` (the Galician notebook executed with `nbconvert --execute`), its `.html` export and `heart_disease_patients.csv`. After any change to the notebook, rebuild all of it.
