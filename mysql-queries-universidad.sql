-- Base de dades Universidad

-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament 
-- de menor a major pel primer cognom, segon cognom i nom.
    SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 2. Escriuel nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
    SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' && telefono is NULL ORDER BY nombre ASC;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999.
   SELECT nombre, apellido1, apellido2 FROM persona WHERE YEAR(fecha_nacimiento) = '1999';

-- 4. Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
    SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' && telefono is NULL && nif LIKE '%K';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
    SELECT nombre FROM asignatura WHERE curso = 3 && cuatrimestre = 1;

-- 6. Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, 
-- primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
    SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona AS p, departamento AS d, profesor AS f  WHERE d.id = f.id_departamento && p.id = f.id_profesor ORDER BY  p.apellido1 ASC, p.apellido2 ASC, p.nombre DESC; 

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
     SELECT  c.anyo_inicio, c.anyo_fin, s.nombre FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno JOIN asignatura s on a.id_asignatura = s.id JOIN curso_escolar c ON c.id = s.curso WHERE nif LIKE  '26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
 ????  SELECT * FROM departamento d JOIN profesor p ON d.id = p.id_departamento WHERE d.id = 1;

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
    SELECT p.nombre, p.apellido1, p.apellido2, c.anyo_inicio, c.anyo_fin FROM alumno_se_matricula_asignatura a JOIN persona p ON p.id = a.id_alumno JOIN curso_escolar c ON c.id = a.id_curso_escolar WHERE a.id_curso_escolar = 5 GROUP BY a.id_alumno;


-----------------------------------------------
-------- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 10. Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. 
-- El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes,
-- nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

-- 11. Retorna un llistat amb els professors que no estan associats a un departament.
-- 12. Retorna un llistat amb els departaments que no tenen professors associats.
-- 13. Retorna un llistat amb els professors que no imparteixen cap assignatura.
-- 14. Retorna un llistat amb les assignatures que no tenen un professor assignat.
-- 15- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
----------------------------------------------------------
-- Consultes resum:

-- 16. Retorna el nombre total d'alumnes que hi ha.
    SELECT count(id) AS numero_total_alumnos FROM persona WHERE tipo = 'alumno' limit 10;

-- 17. Calcula quants alumnes van néixer en 1999.
    SELECT count(id) AS 'nacidos_en_1999' FROM persona WHERE tipo = 'alumno' && fecha_nacimiento like '%1999%';

-- 18. Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre
-- de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a 
-- menor pel nombre de professors.
   SELECT d.nombre, count(p.id_profesor) AS 'numero_profesores' FROM profesor p JOIN departamento d ON p.id_departamento = d.id GROUP BY p.id_departamento ORDER BY  count(p.id_profesor) DESC;


-- 19. Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen 
-- professors associats. Aquests departaments també han d'aparèixer en el llistat.
    ???  SELECT * FROM departamento d  FULL JOIN profesor p  ON d.id = p.id_departamento;
    ???  SELECT * FROM profesor p  FULL JOIN departamento d  ON p.id_departamento = d.id;

-- 20. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.

-- 21. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
-- 22. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
-- 23. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
-- 24. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
-- 25. Retorna totes les dades de l'alumne més jove.
-- 26. Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.