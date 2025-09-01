SELECT departamento.id_numero,id_nombre
FROM departamento, localizacion
WHERE departamento.id_numero = localizacion.id_numero
  AND dep_loca = 'Cuenca';

