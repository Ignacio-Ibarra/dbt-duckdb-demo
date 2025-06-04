# Demo dbt con DuckDB

Este repositorio es una demo básica de un proyecto dbt utilizando DuckDB como motor de base de datos. El objetivo es ilustrar cómo estructurar un proyecto dbt, usar seeds, modelos, tests, y cómo generar y visualizar el grafo de dependencias.

---

## Estructura del proyecto

```
.
├── README.md
├── dbt_project.yml # Configuración principal del proyecto dbt
├── dev.duckdb # Archivo de base de datos DuckDB
├── logs # Logs generados por dbt
├── models # Carpeta con los modelos SQL de dbt
│ ├── marts # Modelos de negocio finales
│ │ └── empleados_filtrados.sql
│ └── staging # Modelos intermedios de staging
│ └── empleados_base.sql
├── pyproject.toml # Archivo de configuración para instalación con uv
├── seed # Datos estáticos cargados con dbt seed
│ └── empleados.csv
└── target # Archivos generados tras correr dbt (compilados, logs, resultados)
```

## Requisitos

- Python 3.8+
- [uv](https://github.com/astral-sh/uv) o `pip`
- dbt-duckdb

## Instalación con `uv`

```bash
uv venv
source .venv/bin/activate
uv pip install --no-build-isolation -r pyproject.toml
```

## Inicialización de perfil

Crear el archivo `~/.dbt/profiles.yml` con:

```yaml
dbt_duckdb_demo:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: dbt.duckdb
      threads: 4
```
## Inicialización de proyecto

```bash
dbt init .
```

## Verificación de si está todo ok

```bash
dbt debug .
```

## Ejecución

```bash
dbt run
```
Esto crea una carpeta `target/` donde se guarda el grafo de cómputo en un archivo `graph.pickle`

## Resultado

- Se crea un archivo `dbt.duckdb` con dos vistas:
  - `empleados_base`
  - `empleados_filtrados` (solo quienes ganan más de 100000)

## Test sobre tablas. 

- Con `dbt test` puedo correr test sobre tablas. Es necesario crear un archivo yml. 
