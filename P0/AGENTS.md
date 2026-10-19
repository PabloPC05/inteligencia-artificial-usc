# Repository Guidelines

## Project Structure & Module Organization

This repository contains introductory artificial-intelligence coursework delivered as Jupyter notebooks. The root holds the numbered lessons `1.Python basics.ipynb` and `2.POO con Python.ipynb`; keep that numeric prefix when adding lessons so notebooks sort in teaching order. The local Python environment is stored in `.venv`, and `.vscode/settings.json` points VS Code to its interpreter. Do not edit generated files inside `.venv`. There are no separate source, test, or asset directories; create them only when a new exercise genuinely needs them.

## Development Commands

- Open the repository folder in VS Code with the Python and Jupyter extensions enabled.
- Select `Python 3.11 (IA P0)` from the notebook kernel picker before running cells.
- `Ctrl+Shift+P` followed by `Developer: Reload Window` reloads workspace interpreter settings.
- `.\.venv\Scripts\python.exe -c "import numpy; print(numpy.__version__)"` checks that the configured environment is working.

No build step or standalone Jupyter server is required; notebooks run directly in VS Code.

## Coding Style & Naming Conventions

Use four spaces for Python indentation and follow PEP 8: `snake_case` for variables and functions, `PascalCase` for classes, and descriptive names for teaching examples. Keep code cells focused and place explanations in Markdown cells immediately before the code they describe. Preserve the language and terminology of the surrounding lesson. Avoid machine-specific paths, credentials, and unnecessary notebook metadata churn.

## Testing Guidelines

No automated test framework or coverage target is configured. Before submitting, restart the notebook kernel and run all cells from top to bottom. Confirm that execution completes without exceptions, outputs are reproducible, plots render, and later cells do not rely on hidden interactive state. Add small `assert` statements for exercise logic where practical.

## Commit & Pull Request Guidelines

Git history is unavailable in this checkout, so no repository-specific commit convention can be inferred. Use concise, imperative subjects such as `Clarify inheritance example`. Keep each commit focused. Pull requests should summarize the lesson changed and validation performed; mention environment or dependency changes explicitly and include screenshots only when plots or rendered notebook layout changed materially.
