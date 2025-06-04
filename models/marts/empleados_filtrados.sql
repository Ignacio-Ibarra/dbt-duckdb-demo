-- Filtra los empleados con salario mayor a 100000
SELECT *
FROM {{ ref('empleados_base') }}
WHERE salario > 100000
