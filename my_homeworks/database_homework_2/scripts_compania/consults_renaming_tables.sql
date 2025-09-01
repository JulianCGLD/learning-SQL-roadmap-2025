SELECT e.ci, e.nombre, e.apellido, s.ci, s.nombre, s.apellido 
FROM empleado e, empleado s
WHERE e.superci=s.ci;