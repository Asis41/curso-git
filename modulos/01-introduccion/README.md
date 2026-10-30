# Módulo 1 · Introducción al control de versiones

## Objetivos

- Entender qué problema resuelve un sistema de control de versiones.
- Distinguir entre **Git** y **GitHub**.
- Instalar Git y dejarlo configurado con tu nombre y correo.

## 1. ¿Qué problema resuelve Git?

Seguro has visto (o creado) una carpeta así:

```
proyecto/
├── pagina.html
├── pagina_v2.html
├── pagina_v2_corregida.html
├── pagina_final.html
└── pagina_final_v2_ahora_si.html
```

Problemas de este "sistema":

- No sabes **qué cambió** entre una versión y otra, ni **por qué**.
- Si dos personas editan el mismo archivo, alguien pisa el trabajo del otro.
- Volver a una versión anterior es adivinar cuál archivo era el bueno.
- No puedes probar una idea sin arriesgar lo que ya funciona.

Un **sistema de control de versiones** guarda un historial de "fotos" (commits) de tu proyecto. Cada foto
registra qué cambió, quién lo cambió, cuándo y con qué mensaje. Puedes volver a cualquier foto, comparar
dos de ellas y trabajar en paralelo con otras personas.

**Git** es el sistema de control de versiones más usado. Es **distribuido**: cada persona tiene una copia
completa del historial en su computadora, así que puedes trabajar sin internet.

## 2. Git vs. GitHub

| Git | GitHub |
|---|---|
| Programa que instalas en tu computadora | Servicio web (sitio en internet) |
| Guarda el historial de tu proyecto | Aloja repositorios de Git en la nube |
| Funciona sin internet | Necesita internet |
| Comandos: `git commit`, `git log`... | Pull Requests, revisión de código, issues... |
| Creado por Linus Torvalds (2005) | Empresa propiedad de Microsoft |

> Analogía: Git es como el procesador de texto; GitHub es como una nube donde guardas y compartes
> esos documentos. Existen alternativas a GitHub (GitLab, Bitbucket), pero todas usan Git por debajo.

## 3. Instalación

| Sistema | Cómo instalar |
|---|---|
| **Windows** | Descarga **Git for Windows** de <https://git-scm.com/downloads>. Acepta las opciones por defecto. Incluye **Git Bash**, la terminal que usaremos en el curso. |
| **macOS** | Abre la Terminal y escribe `git --version`. Si no está instalado, el sistema ofrecerá instalar las *Command Line Tools*. O bien: `brew install git`. |
| **Linux** | Debian/Ubuntu: `sudo apt install git` · Fedora: `sudo dnf install git` |

Comprueba la instalación:

```bash
git --version
# git version 2.4x.x
```

> **Windows:** a partir de aquí, todos los comandos del curso se escriben en **Git Bash**
> (clic derecho en una carpeta → "Open Git Bash here", o búscalo en el menú Inicio).

## 4. Configuración inicial

Git guarda tu nombre y correo en cada commit. Configúralos **una sola vez** por computadora:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@correo.com"
```

> Usa el **mismo correo** de tu cuenta de GitHub para que tus commits aparezcan asociados a tu perfil.

Configuraciones recomendadas:

```bash
# La rama principal de los repos nuevos se llamará "main" (como en GitHub)
git config --global init.defaultBranch main

# Al hacer git pull con historias distintas, fusionar (merge) en lugar de dar error
git config --global pull.rebase false

# Editor para los mensajes de commit (elige uno)
git config --global core.editor "code --wait"   # Visual Studio Code
git config --global core.editor "nano"          # nano (sencillo, en la terminal)
```

Ver tu configuración:

```bash
git config --global --list
git config user.name        # consultar un valor concreto
```

`--global` aplica a todos tus repositorios. Sin `--global`, la configuración aplica solo al repo actual
(útil, por ejemplo, para usar el correo del trabajo en un proyecto concreto).

## 🛠️ Práctica

> 📽️ **Slide 6.**

1. Instala Git según tu sistema operativo.
2. Abre la terminal (Git Bash en Windows) y comprueba `git --version`.
3. Configura nombre, correo, rama por defecto y `pull.rebase false`.
4. Revisa tu configuración:

   ```bash
   git config --global --list
   ```

5. Crea una cuenta en <https://github.com> con el mismo correo que configuraste (si aún no tienes) y
   **envía tu usuario de GitHub al instructor**: te invitará como colaborador del repo del curso para que
   puedas abrir Pull Requests desde el módulo 3.

### ✅ Comprueba que lo lograste

La lista incluye tus datos:

```
user.name=Tu Nombre
user.email=tu@correo.com
init.defaultBranch=main
pull.rebase=false
```

En el módulo 2, al clonar el repo del curso, lo confirmarás con `scripts/verificar-config.sh`.

---

[Inicio](../../README.md) · Siguiente: [Módulo 2 · Fundamentos de Git →](../02-fundamentos/README.md)
