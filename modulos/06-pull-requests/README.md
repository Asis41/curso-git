# Módulo 6 · Colaboración con Pull Requests

## Objetivos

- Seguir el flujo completo: rama → push → Pull Request → revisión → merge.
- Revisar código: comentarios, sugerencias de cambio, aprobar o pedir cambios.
- Proteger la rama `main`.

## 1. ¿Qué es un Pull Request?

Un **Pull Request** (PR) es una **propuesta** en GitHub para fusionar una rama en otra (normalmente en
`main`). Antes de fusionar, el equipo puede ver los cambios, comentarlos y pedir ajustes.

El PR no es un comando de Git: es una función de GitHub (en GitLab se llama *Merge Request*).

```mermaid
flowchart LR
    A["git switch -c<br/>feature/x"] --> B["commits"] --> C["git push -u<br/>origin feature/x"] --> D["Abrir PR<br/>en GitHub"] --> E["Revisión<br/>(comentarios)"]
    E -- "piden cambios" --> B
    E -- "aprobado" --> F["Merge<br/>a main"] --> G["git switch main<br/>git pull"]
```

## 2. El flujo paso a paso

1. **Actualiza `main`** y crea tu rama:

   ```bash
   git switch main
   git pull
   git switch -c feature/seccion-contacto
   ```

2. **Haz commits** pequeños y con buenos mensajes.
3. **Sube la rama:** `git push -u origin feature/seccion-contacto`
4. **Abre el PR:** GitHub muestra un aviso amarillo *"feature/seccion-contacto had recent pushes"* →
   **Compare & pull request**. (O bien: pestaña **Pull requests** → **New pull request**.)
   - **base:** `main` (dónde quieres fusionar) ← **compare:** tu rama.
   - **Título** claro y **descripción**: qué cambia, por qué, cómo probarlo. Este repo incluye una
     plantilla en [`.github/pull_request_template.md`](../../.github/pull_request_template.md). Tu
     `curso-git` ya la incluye, así que GitHub la usa al abrir cada PR.
   - **Reviewers** (panel derecho): elige a quién le pides la revisión.
5. **Revisión** (sección 3). Si te piden cambios: haz commits nuevos **en la misma rama** y `git push`;
   el PR se actualiza solo.
6. **Merge:** cuando esté aprobado, botón **Merge pull request** → **Delete branch**.
7. **Actualiza tu copia local:**

   ```bash
   git switch main
   git pull
   git branch -d feature/seccion-contacto
   git fetch --prune
   ```

## 3. Revisar un Pull Request

En el PR, pestaña **Files changed**:

- **Comentar una línea:** pasa el ratón sobre la línea y pulsa el **+** azul.
- **Sugerir un cambio:** al comentar, pulsa el ícono de **sugerencia** (±) o escribe:

  ````markdown
  ```suggestion
      <h2>Contáctame</h2>
  ```
  ````

  El autor del PR puede aplicarla con un clic (**Commit suggestion**) y se crea un commit en su rama.

- **Terminar la revisión:** botón **Review changes** (arriba a la derecha) y elige:

  | Opción | Cuándo |
  |---|---|
  | **Comment** | Comentarios generales, sin aprobar ni bloquear |
  | **Approve** | Todo bien, se puede fusionar |
  | **Request changes** | Hay que corregir algo antes de fusionar |

**Buenas prácticas al revisar:** comenta el código, no a la persona; explica el *porqué*; distingue lo
obligatorio de lo opcional (p. ej. prefijo "nit:" para detalles menores); reconoce lo que está bien.

## 4. Formas de fusionar un PR

El botón **Merge pull request** tiene un desplegable con tres opciones:

| Opción | Resultado en `main` |
|---|---|
| **Create a merge commit** | Todos los commits de la rama + un commit de merge |
| **Squash and merge** | Todos los commits de la rama se combinan en **uno solo** |
| **Rebase and merge** | Los commits de la rama se copian encima de `main`, sin commit de merge |

*Squash and merge* es muy popular: deja en `main` un commit por PR, con historial limpio.

## 5. Proteger la rama `main`

Para que **nadie pueda subir directamente a `main`** y todo pase por un PR revisado:

1. Repo → **Settings** → **Rules** → **Rulesets** → **New ruleset** → **New branch ruleset**.
2. **Ruleset name:** `proteger-main`. **Enforcement status:** **Active**.
3. **Target branches** → **Add target** → **Include default branch**.
4. Marca:
   - ✅ **Restrict deletions**
   - ✅ **Require a pull request before merging** → *Required approvals*: **1**
   - ✅ **Block force pushes**
5. **Create**.

Ahora `git push` directo a `main` es rechazado:

```
remote: error: GH013: Repository rule violations found for refs/heads/main.
remote: - Changes must be made through a pull request.
```

> En la interfaz antigua esto está en **Settings → Branches → Add branch protection rule**, con opciones
> equivalentes. Las reglas en repos **privados** requieren un plan de pago; en repos **públicos** son gratis.

## 🛠️ Práctica en parejas

> 📽️ **Slide 30.** En parejas (A y B), sobre el repo del curso. Al empezar, el instructor cambia la
> protección de `main` a **1 aprobación requerida** (sección 5): desde ahora ningún PR se fusiona sin que
> otra persona lo apruebe.

### Cada quien abre un PR

Cada persona le **recomienda algo a su compañero/a** escribiendo en el archivo de gustos del otro.
Como A edita el archivo de B y B el de A, no hay conflictos.

1. Crea tu rama **desde `origin/main`** (tu `main` local tiene tu estilo y tus pruebas del módulo 5, que no
   deben ir en el PR):

   ```bash
   cd ~/curso-git
   git fetch
   git switch -c recomienda/tu-usuario origin/main
   ```

2. Añade una recomendación al final del archivo de tu compañero/a y súbela:

   ```bash
   echo "Recomendación de tu-usuario: la serie Dark" >> gustos/usuario-del-companero.txt
   git commit -am "Recomienda una serie a usuario-del-companero"
   git push -u origin recomienda/tu-usuario
   ```

3. Abre el PR hacia `main` y asigna a tu compañero/a como *reviewer*. La descripción ya viene con la
   plantilla de `.github/pull_request_template.md`.

### Cada quien revisa el PR del otro

En el PR de tu compañero/a:

1. Deja **al menos un comentario** en una línea concreta.
2. Deja **al menos una sugerencia** con el botón de sugerencia (±).
3. Termina con **Request changes**.

Luego, en tu propio PR:

4. Aplica la sugerencia que te hicieron (**Commit suggestion**) y responde a los comentarios.
5. Pide de nuevo la revisión (ícono 🔄 junto al nombre del reviewer).
6. El revisor aprueba con **Approve**.
7. Fusiona tu PR con **Squash and merge** y borra la rama.
8. Mira el resultado en tu computadora:

   ```bash
   git fetch
   git log --oneline origin/main -5     # un commit por PR fusionado (por el squash)
   git show origin/main:gustos/tu-usuario.txt   # la recomendación que te dejaron
   ```

> Si el PR dice *"This branch is out-of-date with the base branch"*, pulsa **Update branch**.
> Si hay conflictos, GitHub te deja resolverlos en el navegador (**Resolve conflicts**) o hazlo en local:
> `git switch tu-rama`, `git merge origin/main`, resuelve (módulo 5) y `git push`.

### ✅ Comprueba que lo lograste

- Tu PR aparece en **Pull requests → Closed** como *Merged*, con un comentario, una sugerencia aplicada
  y una aprobación de tu compañero/a.
- Tu archivo de gustos en GitHub tiene la recomendación que te dejaron.
- Sin la aprobación, el botón **Merge pull request** estaba bloqueado.

### 🚀 Reto extra

- Recomiéndale algo a otro compañero más y repitan el ciclo con otra pareja.
- Que los dos de la pareja editen **la misma línea** del mismo archivo y resuelvan el conflicto en GitHub.

---

[← Módulo 5](../05-merge-y-conflictos/README.md) · [Inicio](../../README.md) · Siguiente: [Módulo 7 · Estrategias y buenas prácticas →](../07-estrategias/README.md)
