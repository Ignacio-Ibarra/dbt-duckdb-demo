-- Si tengo dbt seed me levanta el archivo en un duck db y lo llama desde ahi
select * from {{ ref('empleados') }}
