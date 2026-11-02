# Memoria de la práctica 2 de IA (CLIPS)

El documento final es `output/Practica2_PabloPardoCotos.pdf`. Sus fuentes son `main.tex`, `Preamble.tex`, `sections/` y las imágenes de `img/`. `output/Practica2_PabloPardoCotos.zip` es el paquete de fuentes para Overleaf (pdfLaTeX, archivo principal `main.tex`).

## Compilar

Desde esta carpeta, dos veces para que el índice quede bien. En el Mac, MiKTeX deja `pdflatex` en `~/.local/bin`:

```bash
export PATH="$HOME/.local/bin:$PATH"
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output -jobname=Practica2_PabloPardoCotos main.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output -jobname=Practica2_PabloPardoCotos main.tex
```

## Entrega

El aula virtual pide un único comprimido `Apellido1_Apellido2_Nombre` con el PDF de las respuestas y los `.clp` y `.bat` del ejercicio 2.4. Está en `../entrega/Pardo_Cotos_Pablo.zip`. Si se cambia la memoria, hay que copiar el PDF nuevo a `../entrega/Pardo_Cotos_Pablo/` y rehacer el zip.

## Antes de entregar

- Leer la memoria entera.
- Comprobar la fecha límite en el aula virtual.
