#!/usr/bin/env bash
# Módulo 1: comprueba que Git está instalado y configurado.
# Uso: bash scripts/verificar-config.sh

fallos=0

ok()  { printf '  ✔ %s\n' "$1"; }
mal() { printf '  ✘ %s\n    Arréglalo con: %s\n' "$1" "$2"; fallos=$((fallos + 1)); }

echo "Verificando tu instalación de Git..."

if ! command -v git >/dev/null 2>&1; then
  mal "Git no está instalado" "descárgalo de https://git-scm.com/downloads"
  exit 1
fi
ok "$(git --version)"

nombre=$(git config --global user.name)
if [ -n "$nombre" ]; then ok "user.name = $nombre"
else mal "Falta user.name" 'git config --global user.name "Tu Nombre"'; fi

correo=$(git config --global user.email)
if [ -n "$correo" ]; then ok "user.email = $correo"
else mal "Falta user.email" 'git config --global user.email "tu@correo.com"'; fi

rama=$(git config --global init.defaultBranch)
if [ "$rama" = "main" ]; then ok "init.defaultBranch = main"
else mal "La rama por defecto no es main" 'git config --global init.defaultBranch main'; fi

echo
if [ "$fallos" -eq 0 ]; then
  echo "Todo listo. ¡Puedes continuar con el módulo 2!"
else
  echo "Hay $fallos cosa(s) por arreglar. Ejecuta los comandos indicados y vuelve a correr este script."
  exit 1
fi
