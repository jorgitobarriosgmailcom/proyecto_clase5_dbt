# Proyecto dbt - Clase 5

Este repositorio contiene el desarrollo de la Tarea Clase 5 de la materia Introducción a la Ingeniería de Datos, utilizando dbt sobre datos previamente cargados con Airbyte en MotherDuck.

## Objetivo

Construir un proyecto dbt completo con modelos en las tres capas de transformación:

- staging
- intermediate
- marts

## Sources utilizados

Los datos crudos fueron cargados previamente con Airbyte en la base `airbyte_curso`, esquema `main`, en MotherDuck.

Se utilizaron los siguientes sources:

- `pokemon`
- `issues`

## Estructura del proyecto

### Staging
- `stg_pokeapi__pokemon.sql`
- `stg_github__issues.sql`

### Intermediate
- `int_pokemon_issue_summary.sql`

### Mart
- `obt_pokemon_issue_analysis.sql`

## Archivo de sources

El proyecto incluye el archivo:

- `_sources.yml`

con la definición de las tablas externas utilizadas por dbt.

## DAG

Se generó el DAG del proyecto con:

- `dbt docs generate`
- `dbt docs serve`

La captura del grafo se encuentra en el archivo:

- `dag_dbt_clase5.png`

## Repositorio

El proyecto fue versionado con Git y publicado en GitHub como parte del entregable de la tarea.