SELECT ci, nombre, apellido
FROM empleado, departamento
WHERE dno=id_numero and
	id_nombre='administrativo'