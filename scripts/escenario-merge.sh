#!/usr/bin/env bash
# Módulo 5: crea un repo de práctica con tres escenarios de merge:
# fast-forward, merge con commit y conflicto.
# Uso: bash scripts/escenario-merge.sh [carpeta]   (por defecto ../practica-merge)
set -e

raiz=$(cd "$(dirname "$0")/.." && pwd)
destino=${1:-"$raiz/../practica-merge"}

if [ -e "$destino" ]; then
  echo "La carpeta '$destino' ya existe. Bórrala o indica otra: bash scripts/escenario-merge.sh otra-carpeta" >&2
  exit 1
fi
if [ -z "$(git config user.email)" ]; then
  echo "Primero configura user.name y user.email (módulo 1)." >&2
  exit 1
fi

# Reemplaza en un archivo; sed sin -i para que funcione igual en Linux, macOS y Git Bash.
reemplazar() { sed "s|$2|$3|" "$1" > "$1.tmp" && mv "$1.tmp" "$1"; }

mkdir -p "$destino"
cp "$raiz"/proyecto/* "$destino"/
cd "$destino"

git init -q -b main
git config core.autocrlf false  # evita avisos "LF will be replaced by CRLF" en Windows
git add .
git commit -q -m "Versión inicial de la página"

# Escenario 2 (merge con commit): rama que sale del primer commit y toca otro archivo.
git switch -q -c feature/estilos
reemplazar styles.css "background: #ffffff;" "background: #f6f8fa;"
git commit -q -am "Cambia el color de fondo"

# main avanza por su cuenta, así feature/estilos queda divergente.
git switch -q main
reemplazar index.html "Aprendiendo Git, un commit" "Aprendiendo Git y GitHub, un commit"
git commit -q -am "Actualiza el lema"

# Escenario 1 (fast-forward): rama que sale de la punta de main.
git switch -q -c feature/footer
reemplazar index.html "Hecho durante el curso de Git." "Hecho durante el curso de Git. ¡Gracias por visitar!"
git commit -q -am "Agrega agradecimiento al footer"

# Escenario 3 (conflicto): dos ramas cambian la misma línea.
git switch -q main
git switch -q -c feature/titulo-azul
reemplazar index.html "<h1>.*</h1>" "<h1>Equipo Azul</h1>"
git commit -q -am "Renombra el título a Equipo Azul"

git switch -q main
git switch -q -c feature/titulo-rojo
reemplazar index.html "<h1>.*</h1>" "<h1>Equipo Rojo</h1>"
git commit -q -am "Renombra el título a Equipo Rojo"

git switch -q main

cat <<EOF

Escenario listo en: $destino

  cd "$destino"
  git log --oneline --graph --all

Haz los merges en este orden, revisando el log después de cada uno:

  1) git merge feature/footer        -> fast-forward
  2) git merge feature/estilos       -> merge con commit
  3) git merge feature/titulo-azul   -> merge sin conflicto
  4) git merge feature/titulo-rojo   -> ¡CONFLICTO! Resuélvelo (módulo 5)
EOF
