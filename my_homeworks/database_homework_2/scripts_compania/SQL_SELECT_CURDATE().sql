SELECT nombre, apellido, fecha_n,
    YEAR(CURDATE()) - YEAR(fecha_n) AS edad
FROM empleado;