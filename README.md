# Curso de Git y GitHub

Material práctico para aprender control de versiones con Git y colaboración con GitHub, desde cero hasta
trabajar en equipo con Pull Requests.

## Módulos

| # | Módulo | Práctica |
|---|---|---|
| 1 | [Introducción al control de versiones](modulos/01-introduccion/README.md) | Instalar y configurar Git |
| 2 | [Fundamentos de Git](modulos/02-fundamentos/README.md) | Clonar el repo y hacer los primeros commits |
| 3 | [Trabajar con GitHub](modulos/03-github/README.md) | Subir tus commits con un Pull Request a `main` |
| 4 | [Ramas: el concepto central](modulos/04-ramas/README.md) | Darle tu propio estilo a la página, con IA, en tu rama |
| 5 | [Fusión de ramas y conflictos](modulos/05-merge-y-conflictos/README.md) | Provocar y resolver un conflicto a propósito |
| 6 | [Colaboración con Pull Requests](modulos/06-pull-requests/README.md) | En parejas: abrir un PR y revisar el del otro |
| 7 | [Estrategias de ramificación y buenas prácticas](modulos/07-estrategias/README.md) | Aplicar GitHub Flow con buenas convenciones |

📄 **[Resumen de comandos (cheatsheet)](CHEATSHEET.md)** · 🖥️ **[Presentación del curso](https://claude.ai/artifact/6k3oGxqDVwUqjYT1JzU2Mv)**

## Requisitos

- Una computadora con Windows, macOS o Linux.
- Git instalado: descárgalo desde <https://git-scm.com/install/> (en el módulo 1 se explica cómo).
- Una cuenta gratuita en [GitHub](https://github.com).
- Un editor de código, por ejemplo [Visual Studio Code](https://code.visualstudio.com/).
- Un navegador para ver la página de práctica.

> **Windows:** todos los comandos del curso se ejecutan en **Git Bash**, que se instala junto con Git.

## Cómo usar este repositorio

Todo el curso se practica sobre **este mismo repositorio**, al mismo tiempo que se proyectan las slides.
Todos trabajan en el mismo repo, así que cada quien usa **su usuario de GitHub** en sus archivos y ramas.

1. **Módulo 1:** instalas y configuras Git, y le das tu usuario de GitHub al instructor.
2. **Módulo 2:** clonas este repo (`git clone https://github.com/Asis41/curso-git.git`) y creas tu archivo
   `gustos/tu-usuario.txt`.
3. **Módulo 3:** lo subes con un Pull Request a `main`.
4. **Módulo 4:** en tu rama `estilo/tu-usuario`, una IA le da tu estilo a [`proyecto/index.html`](proyecto/index.html).
5. **Módulos 5 a 7:** conflictos, revisión de Pull Requests en parejas y buenas prácticas.

Cada guía indica en qué slide va su práctica (📽️) y termina con **✅ Comprueba que lo lograste**.

## Para el instructor

Antes del módulo 3:

1. **Invita a los alumnos:** Settings → Collaborators → Add people, con el usuario que te dieron en el
   módulo 1. Deben aceptar la invitación.
2. **Protege `main`:** Settings → Rules → Rulesets → New branch ruleset, objetivo *Include default branch*,
   activa *Restrict deletions*, *Block force pushes* y *Require a pull request before merging* con
   **0 aprobaciones** (tú fusionas los PR del módulo 3). En el módulo 6 súbelo a **1 aprobación** en vivo.
3. **Fusiona los PR del módulo 3 con *Create a merge commit***, no con squash: así el `git pull` de cada
   alumno avanza sin divergir.
4. No fusiones ramas `estilo/*`: todas cambian `proyecto/index.html`.

## Contenido

```
├── modulos/                     guía de cada módulo
├── gustos/                      un archivo por alumno (módulos 2 y 3)
├── proyecto/
│   └── index.html               página de práctica: HTML y CSS en un solo archivo
├── scripts/
│   ├── verificar-config.sh      módulo 1: comprueba tu instalación y configuración
│   └── escenario-merge.sh       módulo 5: crea un repo con merges y un conflicto listos
├── .github/
│   └── pull_request_template.md módulo 6: plantilla de Pull Request
├── .gitignore                   ejemplo comentado (módulo 2)
└── CHEATSHEET.md                resumen de comandos
```

Los scripts se ejecutan desde la carpeta del curso con `bash scripts/<nombre>.sh`.
