INSERT INTO USUARIOS (ID,NOMBRE,APELLIDO,CORREO,CONTRASENA)
VALUES (S_USUARIOS.NEXTVAL,'Hector','Sam','hfsam88@gmail.com','holamund0');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.1.191','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.1.192','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.1.193','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.1.194','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.1.201','hector','asdasd');
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Sockets','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un socket es un canal de comunicación que permite comunicar dos hosts',1,NULL);
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Aplicacion1',TO_DATE('23/07/2013','DD/MM/YYYY'),'Instrucciones para la aplicacion1',1);
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'AgenteConfiguracion.jar','CLIENTE','ejecutables/',1,1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'puerto_escucha','2000',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'ip_servidor_central','192.168.1.105',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'intefaz_red','eth0',1);
insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario1 aplicacion1','descripcion escenario1',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.37 PM.png');
insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario2 aplicacion1','descripcion escenario2',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.31 PM.png');
insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario3 aplicacion1','descripcion escenario3',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.23 PM.png');
insert into eventos(id,nombre,PATHSCRIPT) values (s_eventos.nextval,'INICIAR','1');
insert into eventos(id,nombre,PATHSCRIPT) values (s_eventos.nextval,'DETENER','2');
insert into eventos(id,nombre,PATHSCRIPT) values (s_eventos.nextval,'MENSAJE','3');
insert into e_e(id_ejecutable,id_evento) values (1,1);
insert into e_e(id_ejecutable,id_evento) values (1,2);