SELECT nombre, apellido, jefe_fi
FROM empleado, departamento
WHERE jefeci=ci AND
    YEAR (jefe_fi) BETWEEN 1979 and 1983
    