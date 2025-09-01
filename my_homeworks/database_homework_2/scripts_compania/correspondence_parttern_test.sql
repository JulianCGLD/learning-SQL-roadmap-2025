SELECT nombre, apellido
FROM empleado
WHERE nombre LIKE '______'  -- 6 caracteres exactos
  AND apellido LIKE '%a%';  -- 'a' en cualquier parte
