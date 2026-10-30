# Resumen de comandos de Git

## Configuración (una vez por computadora)

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@correo.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "code --wait"
git config --global --list
```

## Crear u obtener un repo

```bash
git init                         # convierte la carpeta actual en repo
git clone <URL>                  # copia un repo remoto
git clone <URL> otra-carpeta     # ...en una carpeta con otro nombre
```

## Ciclo básico

```bash
git status                       # ¿qué cambió?
git diff                         # cambios sin staging
git diff --staged                # cambios en staging
git add <archivo>                # a staging
git add .                        # todo a staging
git commit -m "Mensaje"          # guardar commit
git commit -am "Mensaje"         # add + commit de archivos ya rastreados
```

## Historial

```bash
git log
git log --oneline
git log --oneline --graph --all  # ver todas las ramas
git log -p <archivo>             # cambios de un archivo
git show <commit>                # detalle de un commit
```

## Deshacer

```bash
git restore <archivo>            # descarta cambios sin staging (¡se pierden!)
git restore --staged <archivo>   # saca de staging (conserva cambios)
git commit --amend               # corrige el último commit (solo si NO se subió)
git revert <commit>              # crea un commit que deshace otro (seguro)
git stash                        # guarda cambios temporalmente
git stash pop                    # los recupera
```

## Ramas

```bash
git branch                       # listar locales
git branch -a                    # listar locales y remotas
git switch <rama>                # cambiar        (antes: git checkout <rama>)
git switch -c <rama>             # crear y cambiar (antes: git checkout -b <rama>)
git switch -                     # volver a la anterior
git branch -m <nuevo-nombre>     # renombrar la actual
git branch -d <rama>             # borrar (fusionada)
git branch -D <rama>             # forzar borrado
```

## Fusionar

```bash
git merge <rama>                 # trae <rama> a la rama actual
git merge --no-ff <rama>         # siempre con commit de merge
git merge --abort                # cancelar un merge con conflictos
git rebase main                  # reaplicar mi rama sobre main (solo ramas NO compartidas)
git rebase --abort
```

**Resolver un conflicto:** editar el archivo → quitar `<<<<<<<` `=======` `>>>>>>>` → `git add <archivo>` → `git commit`

## Remotos

```bash
git remote -v                         # ver remotos
git remote add origin <URL>           # conectar con un remoto
git push -u origin <rama>             # primer push de una rama
git push                              # pushes siguientes
git fetch                             # descargar sin integrar
git pull                              # descargar e integrar
git push origin --delete <rama>       # borrar rama remota
git fetch --prune                     # limpiar ramas remotas borradas
```

## Flujo diario (GitHub Flow)

```bash
git switch main
git pull
git switch -c feature/mi-cambio
# ... editar ...
git add .
git commit -m "Agrega mi cambio"
git push -u origin feature/mi-cambio
# → abrir Pull Request en GitHub → revisión → merge
git switch main
git pull
git branch -d feature/mi-cambio
```

## Convenciones

- Ramas: `feature/`, `fix/`, `hotfix/`, `docs/`, `refactor/`, `chore/` + `descripcion-con-guiones`
- Commits: imperativo, ≤50 caracteres, sin punto final → `Agrega sección de contacto`
- Conventional Commits: `feat: ...`, `fix: ...`, `docs: ...`
