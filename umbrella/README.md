# Módulos usados
- network-repo
- compute-repo
- storage-repo

# Control de versiones
Estructura base: 
> `Version: v-x.x`\
`Fecha: (dd-mm-aa)`\
`Autor: <(Apellido_autor)-(user_github)>`\
`Detalle: <Descripción de la versión>`\
`Arbol actual: <imagen_del_directorio_actual>`

---
## V-0.0
> **Fecha**: 07-06-2025\
**Autor**: Luna-Chriss5-2\
**Detalle**:\
Creación de módulos `compute_repo`, `network_repo` y `storage-repo` con archivos `main.tf`, `variables.tf`, `outputs.tf` y `CHANGELOG.md`además de que cada módulo se inicializó como repositorio\
Creación del repositorio `umbrella-repo`, agregar las carpetas `compute_repo`, `network_repo` y `storage-repo` como submodulos\
Creación de la carpeta `scripts` con el archivo `update_all.sh` el cuál tiene como script base la actualización de submódulos según su último commit\
Creación del archivo `umbrella/README.md` que contendrá información de las versiones y los changelogs\
**Arbol actual**
```bash
multirepo
    ├───compute-repo
    |   ├───CHANGELOG.md
    |   ├───main.tf
    |   ├───outputs.tf
    |   └───variables.tf
    ├───network-repo
    |   ├───CHANGELOG.md
    |   ├───main.tf
    |   ├───outputs.tf
    |   └───variables.tf
    ├───storage-repo
    |   ├───CHANGELOG.md
    |   ├───main.tf
    |   ├───outputs.tf
    |   └───variables.tf
    └───umbrella-repo
        ├───compute-repo    ← submódulo
        ├───network-repo    ← submódulo
        ├───scripts
        |   └───update_all.sh
        ├───storage-repo    ← submódulo
        └───umbrella
            └───README.md
```
---
---
## V-0.1