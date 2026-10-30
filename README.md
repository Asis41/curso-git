# Curso de Git y GitHub

Material práctico para aprender control de versiones con Git y colaboración con GitHub, desde cero hasta
trabajar en equipo con Pull Requests.

## Módulos

| # | Módulo | Práctica |
|---|---|---|
| 1 | [Introducción al control de versiones](modulos/01-introduccion/README.md) | Instalar y configurar Git |
| 2 | [Fundamentos de Git](modulos/02-fundamentos/README.md) | Crear un repo local y hacer los primeros commits |
| 3 | [Trabajar con GitHub](modulos/03-github/README.md) | Subir el repo local a GitHub |
| 4 | [Ramas: el concepto central](modulos/04-ramas/README.md) | Desarrollar una *feature* en su propia rama |
| 5 | [Fusión de ramas y conflictos](modulos/05-merge-y-conflictos/README.md) | Provocar y resolver un conflicto a propósito |
| 6 | [Colaboración con Pull Requests](modulos/06-pull-requests/README.md) | En parejas: abrir un PR y revisar el del otro |
| 7 | [Estrategias de ramificación y buenas prácticas](modulos/07-estrategias/README.md) | Aplicar GitHub Flow con buenas convenciones |

📄 **[Resumen de comandos (cheatsheet)](CHEATSHEET.md)** · 🖥️ **[Presentación del curso](https://claude.ai/artifact/6k3oGxqDVwUqjYT1JzU2Mv)**

## Requisitos

- Una computadora con Windows, macOS o Linux.
- [Git](https://git-scm.com/downloads) instalado (en el módulo 1 se explica cómo).
- Una cuenta gratuita en [GitHub](https://github.com).
- Un editor de código, por ejemplo [Visual Studio Code](https://code.visualstudio.com/).
- Un navegador para ver la página de práctica.

> **Windows:** todos los comandos del curso se ejecutan en **Git Bash**, que se instala junto con Git.

## Cómo usar este repositorio

Todo el curso se practica sobre **tu copia de este repositorio**, al mismo tiempo que se proyectan las slides:

1. **Módulo 1:** botón verde **Code → Download ZIP**, descomprímelo y renombra la carpeta `curso-git-main`
   a `curso-git`. El ZIP no trae historial de Git.
2. **Módulo 2:** conviertes esa carpeta en repositorio con `git init`, personalizas
   [`proyecto/index.html`](proyecto/) y creas tu propio `me-gusta.txt`.
3. **Módulo 3:** la subes a un repo `curso-git` en **tu** cuenta de GitHub.
4. **Módulos 4 a 7:** ramas, conflictos y Pull Requests sobre ese mismo repo.

Cada guía indica en qué slide va su práctica (📽️) y termina con **✅ Comprueba que lo lograste**.

## Contenido

```
├── modulos/                     guía de cada módulo
├── proyecto/                    página web de ejemplo para las prácticas
│   ├── index.html
│   └── styles.css
├── scripts/
│   ├── verificar-config.sh      módulo 1: comprueba tu instalación y configuración
│   └── escenario-merge.sh       módulo 5: crea un repo con merges y un conflicto listos
├── .github/
│   └── pull_request_template.md módulo 6: plantilla de Pull Request
├── .gitignore                   ejemplo comentado (módulo 2)
└── CHEATSHEET.md                resumen de comandos
```

Los scripts se ejecutan desde la carpeta del curso con `bash scripts/<nombre>.sh`.
