/* USUARIOS */

INSERT INTO USUARIOS (ID,NOMBRE,APELLIDO,CORREO,CONTRASENA)
VALUES (S_USUARIOS.NEXTVAL,'Hector','Sam','hfsam88@gmail.com','holamund0');
INSERT INTO USUARIOS (ID,NOMBRE,APELLIDO,CORREO,CONTRASENA)
VALUES (S_USUARIOS.NEXTVAL,'admin','admin','admin','admin');

/* USUARIOS */

/* NODOS */

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

/* NODOS */

/* TOPICOS */


INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Sockets','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un concepto abstracto por el cual dos programas (posiblemente situados en computadoras
distintas) pueden intercambiarse cualquier flujo de datos, generalmente de manera fiable y ordenada. <br/>
Un socket queda definido por una direccion IP, un protocolo y un numero de puerto.',1,'images/topicos/socket.png');/* 1 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Caracteristicas de los Sistemas Distribuidos','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Las caracteristicas principales responsables de la utilidad de los sistemas distribuidos:<br/><br/>
1. Comparticion de Recursos: Los recursos en un sistema distribuido estan fisicamente encapsulados en una de las computadoras y solo pueden ser accedidos por otras computadoras mediante las comunicaciones (la red).
Los usuarios de los recursos se comunican con los gestores de los recursos para acceder a los recursos compartidos del sistema. Esta perspectiva nos lleva a dos modelos de sistemas distribuidos: el modelo CLIENTE-SERVIDOR y el modelo BASADO EN OBJETOS <br/>
2. Apertura (opennesss): Se determina primariamente por el grado hacia el que nuevos servicios de comparticion de recursos se pueden anadir sin perjudicar ni duplicar a los ya existentes. <br/>
3. Concurrencia: En los sistemas distribuidos hay muchas maquinas, cada una con uno o mas procesadores. Es decir, si hay M ordenadores en un sistema distribuido con un procesador cada una entonces hasta M procesos pueden estar ejecutandose en paralelo..
Casos en que se puede presentar una ejecucion en paralelo:  <br/>
 <ul><li>Muchos usuarios interactuan simultaneamente con programas de aplicacion</li><li>Muchos procesos servidores se ejecutan concurrentemente, cada uno respondiendo a diferentes peticiones de los procesos clientes.</li></ul>
4. Escalabilidad: Tanto el software de sistema como el de aplicacion no deberian cambiar cuando la escala del sistema se incrementa. La necesidad de escalabilidad no es solo un problema de prestaciones de red o de hardware, sino que esta intimamente ligada con todos los aspectos del diseno de los sistemas distribuidos. El diseno del sistema debe reconocer explicitamente la necesidad de escalabilidad o de lo contrario apareceran serias limitaciones <br/>
5. Tolerancia a fallos: El diseno de sistemas tolerantes a fallos se basa en dos cuestiones, complementarias entre si: <br/> 
<ul><li>Redundancia hardware (uso de componentes redundantes).</li>
<li>Recuperacion del software (diseno de programas que sean capaces de recuperarse de los fallos).</li></ul>
6. Transparencia:se define como la ocultacion al usuario y al programador de aplicaciones de la separacion de los componentes de un sistema distribuido, de manera que el sistema se percibe como un todo, en vez de una coleccion de componentes independientes. <br/>
',1,NULL); /* 2 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Desafios de los Sistemas Distribuidos','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','1. Seguridad: La seguridad de los recursos de informacion tiene tres componentes: <br/>
<ul><li>Confidencialidad: proteccion contra el descubrimiento por individuos no autorizados.</li>
<li>Integridad: proteccion contra la alteracion o corrupcion.</li>
<li>Disponibilidad: proteccion contra interferencia con los procedimientos de acceso a los recursos</li></ul>
2. Escalabilidad:Se dice que un sistema es escalable si conserva su efectividad cuando ocurre un incremento significativo en el numero de recursos y el numero de usuarios. <br/>
3. Tratamiento a fallos: Los fallos en un sistema distribuido son parciales; es decir, algunos componentes fallan mientras otros siguen funcionando.
 <ul><li>Deteccion de fallos: checksum para mensajes.</li>
 <li>Enmascaramiento de fallos: algunos fallos que han sido detectados pueden ocultarse.</li>
 <li>Recuperacion frente a fallos: rollback.</li>
 <li>Redundancia.</li></ul>
4. Concurrencia: Es la posibilidad de que varios clientes intenten acceder a un recurso compartido a la vez. Para que un objeto sea seguro en un entorno concurrente, sus operaciones deben sincronizarse de forma que sus datos permanezcan consistentes. Esto puede lograrse mediante el
empleo de tecnicas conocidas como los semaforos, que se usan en la mayoria de los sistemas operativos.<br/>
5. Transparencia: De acceso, de ubicacion, de concurrencia, replicacion, frente a fallos, movilidad.<br/>
',1,NULL); /* 3 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitecturas: Cliente / Servidor','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Cliente: Proceso que solicita un servicio. <br/>
Servidor: Proceso que implementa un servicio <br/>',1,'images/topicos/arquitectura_cliente_servidor.png'); /* 4 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitecturas: Punto a Punto (P2P)','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','<ul><li>Se caracteriza por una distribucion horizontal de los nodos.</li>
<li>Todos los nodos que constituyen la arquitectura son cliente y servidor a la vez (esto tambien se le denomina sirviente).</li></ul>
',1,'images/topicos/p2p.png'); /* 5 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'RMI','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un objeto en un proceso puede invocar un objeto en otro
proceso que puede estar ubicado en otra maquina. <br/>
Los objetos que brindan sus metodos a otros objetos de otros procesos, reciben el nombre de Objetos Remotos. <br/>
Los procesos que alojan objetos remotos pueden ser referidos como servidores y los procesos que alojan objetos que invocan metodos de objetos remotos
pueden llamarse clientes. <br/>
Requisitos basicos: <br/> <br/>
1. Un objeto remoto debe ser primero instanciado. <br/>
2. Un objeto remoto debe tener un identificador unico asociado. <br/>
3. Debe existir un modulo en el servidor que se encargue de crear una identificacion unica para un objeto.<br/>
4. Los clientes deben poder acceder a la identificacion unica del objeto remoto.<br/>
5. Los clientes deben estar enterados de los metodos que pueden ser invocados en el objeto remoto. <br/>
6. Debe existir un modulo que se encargue de manejar la comunicacion entre un cliente y un servidor. <br/>
7. Debe existir un modulo o varios que pueda(n) realizar la conversion de datos (marshall y unmarshall). <br/>

',1,'images/topicos/rmi.png'); /* 6 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Comunicacion en grupo','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un grupo es una coleccion de procesos que actuan juntos en un sistema o alguna forma determinada por el usuario.
La propiedad fundamental de todos los grupos es que cuando un mensaje es enviado a este, todos los miembros de el lo reciben. <br/>
Los grupos son dinamicos. Se pueden crear nuevos y destruir grupos anteriores. Un proceso se puede unir a un grupo o dejar otro. Un proceso puede ser miembro de varios grupos a la vez. <br/>
Transmision:
<ul> <li>Multi-transmision. Cuando  un mensaje enviado a una direccion especial de red llega a ciertas maquinas.</li>
<li>Transmision simple. Cuando los paquetes que tienen ciertas direccion (Ej. 0) se entregan a todas la maquinas.</li>
<li>Uni-transmision. El envio de mensajes de un emisor a un receptor.</li></ul>

',1,NULL); /* 7 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Logicos: Algoritmo de Lamport','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','La sincronizacion de relojes no tiene que ser absoluta. Si dos procesos no interactuan, no es necesario que sus relojes esten sincronizados, puesto que la carencia de sincronizacion no seria observable y por tanto no podria provocar problemas. Lo que realmente
importa es el orden en que ocurren los eventos. Tanenbaum, 1996.<br/>
- La expresion a->b se lee: a ocurre antes de b <br/>
- Si a->b <=> C(a) < C(b) <br/>
- El tiempo del reloj, C, siempre debe ir hacia delante y nunca hacia atras. Se pueden hacer correcciones al tiempo al sumar un valor positivo al reloj. <br/>
Condiciones clave:
<ul><li>Si a ocurre antes de b en el mismo proceso, C(a) < C(b)</li>
<ul><li>Si a y b son el envio y la recepcion de un mensaje, C(a) < C(b)</li>
<li>Para todos los eventos a y b, C(a) != C(b)</li></ul>

',1,NULL); /* 8 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Fisicos: Algoritmo de Cristian','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','Adecuado para sistemas donde una de las maquinas es servidor del tiempo y el resto debe sincronizarse.<br/>
<ol><li>En forma periodica, en un tiempo que no debe ser mayor de o/2p segundos, cada maquina envia un mensaje al servidor para solicitar el tiempo actual. Donde o es la cantidad de alejamiento maxima deseada y p la tasa maxima de alejamiento (especificada por el fabricante). </li>
<li>El tiempo de propagacion del mensaje puede ser estimado para conseguir un calculo mas preciso. </li>
<li>La correccion por el tiempo del servidor y el tiempo de transmision se hace midiendo en el emisor: El tiempo inicial (envio) T0. El tiempo final (recepcion) T1. Ambos tiempos se miden con el mismo reloj.</li>
<li>El tiempo de propagacion del mensaje sera (T1 - T0) / 2. Si el tiempo del servidor para manejar la interrupcion y procesar el mensaje es I: El tiempo de propagacion sera (T1 - T0 - I) / 2.</li>
<li>El tiempo de propagacion se suma al tiempo del servidor para sincronizar al emisor cuando este recibe la respuesta</li></ol>
        

',1,NULL); /* 9 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Fisicos: Algoritmo de Berkeley','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','<ol><li>En este caso, el servidor de tiempo es un demonio para el tiempo que realiza un muestreo periodico del tiempo de todas las maquinas.</li></ol>
</li>Con base en las respuestas obtenidas, calcula un tiempo promedio y le indica a todas las demas maquinas que avancen su reloj a la nueva hora o que disminuyan la velocidad del mismo hasta lograr cierta reduccion especifica.</li></ol>
',1,NULL); /* 10 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Fisicos: Algoritmo con promedio (Distribuido)','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','<ol><li>El i-esimo intervalo inicia en To+iR y va hasta To+(i+1)R, donde To es un momento ya acordado en el pasado y R es un parametro del sistema.</li>
<li>Al inicio de cada intervalo, cada maquina transmite el valor actual del tiempo segun su reloj.</li>
<li>Luego, cada maquina inicia un cronometro local para reunir las demas transmisiones que lleguen en un cierto intervalo S.</li>
<li>En base a los resultados obtenidos, es establecido como tiempo local el promedio de todas las respuestas obtenidas.</li></ol>
',1,NULL); /* 11 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Exclusion Mutua: Algoritmo Centralizado','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','<ol><li>Se escoge un coordinador.</li>
<li>Cada vez que un proceso desea acceder a una seccion critica, envia un mensaje al coordinador pidiendole permiso.</li>
<li>En caso de que la region no se encuentre ocupada por otro proceso, el coordinador le envia al proceso solicitante un mensaje de aprobacion.</li>
<li>En caso contrario, simplemente no se envia nada o se envia un mensaje de negacion.</li></ol>
',1,NULL); /* 12 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Exclusion Mutua: Algoritmo Distribuido (Ricart y Agrawala)','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','<ol><li>Requiere de la existencia de un orden total de todos los eventos en el sistema.</li>
<li>Cuando un proceso desea acceder a una region critica envia a todos los procesos (incluyendolo a el mismo) un mensaje de solicitud con el nombre de la region, su numero de proceso y la hora actual.</li>
<li>Cuando un proceso recibe un mensaje de solicitud de otro proceso puede ocurrir lo siguiente:</li>
<ul><li>Si el receptor no esta en la region critica y no desea entrar a ella, envia de regreso un mensaje de OK al emisor.</li>
<li>Si el receptor esta en la region critica, no responde y forma la solicitud en una fila.</li>
<li>Si el receptor no esta en la region critica pero desea entrar a ella, este compara la marca de tiempo del mensaje recibido con la de su mensaje de solicitud, si la marca del emisor es menor, este envia un mensaje de OK, en caso contrario, forma la solicitud en una fila y no envia nada.</li></ul>
<li>Cuando un proceso obtiene tantos mensaje de OK como procesos en el sistema, este puede acceder a la region critica.</li>
<li>Cuando el proceso en la region critica termina su trabajo, envia un mensaje de OK al proximo proceso en su cola de solicitudes.</li></ol>
',1,NULL); /* 13 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Algoritmo de Seleccion: Gradulon','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','<ol><li>Un proceso cualquier P envia un mensaje de ELECCION a los demas procesos mayores que el.</li>
<li>Si nadie responde, P gana la eleccion y se convierte en coordinador, por lo que envia un mensaje a todos los procesos menores de COORDINADOR.</li>
<li>Si uno de los procesos mayores que P responde, el trabajo de P ha terminado.</li></ol>
',1,NULL); /* 14 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Algoritmo de Seleccion: Anillo','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS',
'<ol><li>Cada proceso conoce el orden del resto de los procesos en el sistema.</li>
 <li>Cuando uno de los procesos ve que el coordinador no funciona, construye un mensaje de ELECCION con su numero de proceso y lo envia al proximo sucesor vivo.</li>
 <li>Cada uno de los procesos agrega su numero de proceso al mensaje de ELECCION y reenvia este al sucesor.</li>
 <li>Una vez que el mensaje de ELECCION llega de vuelta al emisor inicial, este envia a traves del anillo un mensaje de COORDINADOR con el numero del proceso ganador (podria ser el de mayor identificador de proceso).</li></ol>
',1,NULL); /* 15 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Tipos de Fallas','REPLICACION','Una falla es un desperfecto, causado tal vez por un error de diseno, un error de fabricacion, un error de
programacion, un dano fisico, el deterioro con el curso del tiempo, condiciones ambientales
adversas, entradas inesperadas, un error del operador, roedores comiendo parte del sistema y muchas otras causas. Tanenbaum, 1996 <br/>
Tipo de Fallas:<br/>
<ul><li>Falla de Congelacion: Un servidor se detiene, pero estaba trabajando correctamente hasta que se detuvo.</li>
<li>Falla de Omision: Un servidor no responde a las peticiones entrantes (No recibe mensajes entrantes o no envia mensajes).</li>
<li>Falla de Tiempo: La respuesta de un servidor queda fuera del intervalo de tiempo especificado.</li>
<li>Falla de Respuesta: La respuesta de un servidor es incorrecta (falla de valor o falla de transicion de estado)</li></ul>',1,NULL); /* 16 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Fallas Bizantinas','REPLICACION','Las cosas se complican cuando se demanda que un grupo de 
procesos llegue a un acuerdo, lo cual se requiere en muchos casos. Algunos ejemplos son: <br/>
<ol><li>La eleccion de un coordinador</li>
<li>La decision de realizar o no una transaccion.</li>
<li>La division de tareas entre los trabajadores y la sincronizacion.</li></ol>
El acuerdo se puede lograr solo si estan presentes 2K+1 procesos que esten funcionando correctamente. 
Dicho de otra manera mas de dos tercios de los procesos estan funcionando correctamente.<br/>
Pasos:<br/>
<ol><li>Cada proceso i no defectuoso envia Vi a todos los demas procesos mediante unitransmision confiables.</li>
<li>Los resultados de los anuncios del paso 1 se reunen en forma de vectores.</li>
<li>Cada proceso transfiere su vector (Completo) a todos los demas procesos.</li>
<li>Cada proceso examina el elemento i-esimo de cada uno de los vectores recien recibidos.</li>
<li>Finalmente si ningun valor tiene mayoria, el elemento correspondiente del vector resultado se marca mediante UNKNOWN</li></ol>

',1,'images/topicos/bizantinas.png'); /* 17 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitectura Cliente / Servidor: Modelo de Acceso Remoto','SISTEMAS DE ARCHIVOS DISTRIBUIDOS',
'Este modelo ofrece a los clientes un acceso transparente a un sistema de archivo gestionado por un servidor remoto.<br/>
Los clientes por lo general desconocen la ubicacion de los archivos.<br/>
Disponen de una interfaz para que interactuen con el sistema de archivo similar a la interfaz ofrecida por un sistema de archivo convencional.',1,
'images/topicos/acceso_remoto.png'); /* 18 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitectura Cliente / Servidor: Modelo de Carga y Descarga','SISTEMAS DE ARCHIVOS DISTRIBUIDOS',
'Un cliente accede a un archivo localmente despues de haberlo descargado del servidor.<br/>
Cuando el cliente termina con el archivo, lo carga otra vez en el servidor para que pueda ser utilizado por otro cliente.
',1,'images/topicos/carga_descarga.png'); /* 19 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Sistemas de Archivos Basados en Cluster','SISTEMAS DE ARCHIVOS DISTRIBUIDOS','Si consideramos
que los grupos de servidores a menudo se utilizan en aplicaciones en paralelo, no sorprende que sus sistema de archivos
asociados se ajusten como corresponde.<br/>
Una tecnica muy conocida es desplegar tecnicas de distribucion de archivos.<br/>
La idea basica es distribuir un archivo muy grande entre
multiples servidores, es posible buscar sus diferentes partes en paralelo. <br/>
Generalmente se requiere que los datos que se guardan en un archivo tengan una estructura muy regular, como por ejemplo una matriz. <br/>
Para aplicaciones de proposito general, o para aquellas con tipos irregulares o muchos tipos de estructuras de datos,
la distribucion de archivos puede no ser una herramienta efectiva.
',1,'images/topicos/cluster.png'); /* 20 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Domain Name System (DNS)','SERVICIOS DE NOMBRE','Sistema de nomenclatura  jerarquica para 
computadoras, servicios o cualquier recurso conectado  a Internet  o a una red privada.<br/>
Su funcion mas importante es traducir (resolver) nombres inteligibles para los humanos  en identificadores  binarios  
asociados con los equipos conectados  a la red, esto con el proposito de poder localizar y direccionar estos equipos 
mundialmente. <br/>
Los usos mas comunes  son la asignacion de nombres  de dominio a direcciones IP y la localizacion de los servidores de 
correo electronico  de cada dominio. <br/>
Componentes:
<ol><li>Clientes DNS: programa cliente DNS que se ejecuta en la computadora del usuario y que genera peticiones DNS de 
resolucion de nombres  a un servidor DNS (Por ejemplo: ¿Que direccion IP corresponde a nombre.dominio?).</li>
<li>Servidores DNS: Contestan las peticiones de los clientes. Los servidores recursivos tienen la capacidad de 
reenviar la peticion a otro servidor si no disponen de la direccion solicitada.</li></ol>',1,NULL); /* 21 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Lightweight Directory Access Protocol (LDAP)','SERVICIOS DE NOMBRE','Es un protocolo de servicios
de directorios cliente-servidor. Funciona a nivel de aplicacion el cual permite el acceso a un servicio de directorio 
ordenado y distribuido para buscar diversa informacion en un entorno de red.  Es considerado una base de datos 
(aunque su sistema de almacenamiento puede ser diferente) a la que pueden realizarse consultas. <br/>
Un directorio es un conjunto de objetos con atributos organizados en una manera logica y jerarquica. El ejemplo mas comun es el directorio telefonico.
Habitualmente, almacena la informacion de autenticacion (usuario y contrasena) aunque es posible almacenar otra informacion 
(datos de contacto del usuario, ubicacion de diversos recursos de la red, permisos, certificados, etc). <br/> 
A manera de sintesis, LDAP es un protocolo de acceso unificado a un conjunto de informacion sobre una red.<br/>
Estructura de directorio: 
<ol><li>Un directorio es un arbol de entradas de directorio.</li>
<li>Una entrada consta de un conjunto de atributos.</li>
<li>Un atributo tiene un nombre (un tipo de atributo o descripcion de atributo) y uno o mas valores. Los atributos son definidos en un esquema.</li>
<li>Cada entrada tiene un identificador unico: su Nombre distinguido (Distinguished Name, DN). Este consta de su Relative
Distinguished Name (RDN) construido por algunos atributos en la entrada, seguidos del DN de la entrada del padre 
(Pensar en el nombre distinguido como un completo nombre de archivo y el nombre distinguido relativo como el nombre de 
archivo relativo en un folder).</li></ol>

',1,NULL); /* 22 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Remote Method Invocation (RMI)','OBJETOS DISTRIBUIDOS','En java, los objetos distribuidos estan incorporados en el lenguaje.
Un objetivo importante fue conservar la semantica de los objetos no distribuidos tanto como fuera posible.<br/>
La clonacion de objetos locales o remotos son manejados de
forma diferente.
<ol></i>La clonacion de un objeto de manera local, se resume en la creacion de un nuevo objeto pero con el mismo estado, 
es decir una copia exacta del objeto base a clonar.</li>
<li>Realizar la clonacion en objetos distribuidos es mucho mas complejo, tendriamos que copiar el proxy de cada uno de 
los clientes conectados con el servidor. Por ende si deseamos realizar un clonado solo lo podriamos hacer del lado del servidor.
Las diferencias a nivel de lenguaje de un objeto remoto a un objeto local es complicado de observar en java.
Los tipo de datos primitivo u objeto pueden ser pasados como parametros a una RMI, siempre que la organizacion se aplique
solo al tipo, es decir, todos los parametros en una RMI deben ser serializables.</li></ol>

Manejo de parametros dentro de JAVA RMI: En Java normalmente los parametros se manejan solo con referencias, sin embargo 
en invocaciones remotas es necesario usar referencias y copias.<br/>
',1,'images/topicos/rmi.png'); /* 23 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Enterprise JavaBeans (EJB)','OBJETOS DISTRIBUIDOS','Un EJB es en esencia un objeto JAVA alojado
en un servidor especial que ofrece diferentes formas para que los clientes remotos lo invoquen.<br/>
El servidor debe permitir separar la funcionalidad de la aplicacion de la funcionalidad orientada al sistema.<br/>
Debe incluir funciones para:
 <ol><li>Buscar Objetos</li>
 <li>Guardar Objetos</li>
 <li>Permitir que los objetos formen parte de una transaccion.</li></ol>
 Tipos:
   <ul><li>Beans de sesion: pueden ser con estado, sin estado o "Singleton" y pueden ser accedidos por una interfaz local (misma JVM) 
   o remota (JVM diferente) o directamente sin una interfaz (aplica la semantica local),Generalmente sirven a los clientes 
   como una fachada de los servicios proporcionados por otros componentes disponibles en el servidor.</li> 
   <ul><li>1. Con estado (stateful): las variables de instancia del bean almacenan datos especificos obtenidos durante la 
   conexion con el cliente, por tanto, almacena el estado conversacional de un cliente. Este estado conversacional se 
   modifica conforme el cliente va realizando llamadas a los metodos de negocio del bean. El estado conversacional no 
   se guarda cuando el cliente termina la sesion.</li>
   <li>2. Sin estado (stateless): Los beans de sesion sin estado son objetos distribuidos que carecen de estado asociado 
   permitiendo por tanto que se los acceda concurrentemente. No se garantiza que los contenidos de las variables de 
   instancia se conserven entre llamadas al metodo.</li></ul></ul>
',1,NULL); /* 24 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Simple Object Access Protocol (SOAP)','SERVICIOS WEB','Los mensajes SOAP son documentos XML.<br/>
La informacion del pedido y respuesta se almacenan como una parte de XML.<br/>
Los elementos que forman los mensajes SOAP son los siguientes:
<ol><li>Sobre o Envoltura SOAP: Define el contenido de mensaje.</li>
<li>Encabezado SOAP: Es opcional y tiene una informacion de encabezado.</li>
<li>Cuerpo SOAP: Tiene informacion de llamada y respuesta.</li></ol>
Caracteristicas:
<ol><li>El servicio expone su funcionalidad de manera similar a RMI (cantidad arbitraria de metodos expuestos).</li>
<li>El hecho de que los mensajes se manejen con XML permite que su interpretacion sea muy sencilla, aunque esto puede representar una desventaja en el desempeno cuando los mensajes son muy grandes.</li>
<li>SOAP incentiva a los desarrolladores a que formen su propio vocabulario de nombres y verbos, por ejemplo getEmpleados().</li>
<li>Puede usar tanto stateless requests (con cada peticion se envian todos los datos necesarios) como stateful requests (se mantiene un estado asociado a la conexion).</li></ol>
',1,NULL); /* 25 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Representational State Transfer (REST)','SERVICIOS WEB','Tecnica de arquitectura software para sistemas 
hipermedia distribuidos, se usa en el sentido mas amplio para describir cualquier interfaz web simple que utiliza XML
y HTTP, sin las abstracciones adicionales de los protocolos basados en patrones de intercambio de mensajes.<br/>
REST afirma que la web ha disfrutado de escalabilidad como resultado de una serie de disenos fundamentales clave:
<ol><li>Un protocolo cliente/servidor sin estado:  cada mensaje HTTP contiene toda la informacion necesaria para comprender la peticion. Como resultado, ni el cliente ni el servidor necesitan recordar ningun estado de las comunicaciones entre mensajes.</li> 
<li>Un conjunto de operaciones bien definidas que se aplican a todos los recursos de informacion: POST, GET, PUT y DELETE. Con frecuencia estas operaciones se equiparan a las operaciones CRUD.</li>
<li>Una sintaxis universal para identificar los recursos: cada recurso es direccionable unicamente a traves de su URI.</li>
<li>El uso de hipermedios: El uso de hipermedios, tanto para la informacion de la aplicacion como para las transiciones de estado de la aplicacion. Como resultado de esto, es posible navegar de un recurso REST a muchos otros, simplemente siguiendo enlaces sin requerir el uso de registros u otra infraestructura adicional.</li></ol>
',1,NULL); /* 26 */

/* APLICACIONES */

/*INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Aplicacion1',TO_DATE('23/07/2013','DD/MM/YYYY'),'Instrucciones para la aplicacion1',1); */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Caracteristicas SD',TO_DATE('22/09/2013','DD/MM/YYYY'),' 
Se obtienen dos aplicaciones servidor que poseen un archivo txt y un servidor web con una pagina de prueba. <br/>
1. La aplicacion cliente accede al archivo de los servidores enviando el mensaje "leer:". <br/> 
2  Para iniciar el servidor web se envia el mensaje: "iniciar_servidor:". <br/>
3. Para detener el servidor web se envia el mensaje: "detener_servidor:" <br/>
4. Para consultar la pagina web de prueba enviar el mensaje: "pagina:".<br/>
5. Si se cae uno de los servidores, se puede seguir enviando informacion al servidor restante. <br/>',2); /* 1 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Desafios_SD',TO_DATE('22/09/2013','DD/MM/YYYY'),'1.
Se tiene una aplicacion servidor que contiene  tres (3) archivos txt que pueden ser descargado por el usuario.<br/>
2. Para acceder a un archivo se envia el mensaje: "archivo:numero_de_archivo" siendo las opciones 1,2 o 3 para el archivo especifico. <br/> 
 ',3); /* 2 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Arquitectura_Cliente_Servidor',TO_DATE('22/09/2013','DD/MM/YYYY'),'
- Se tiene una aplicacion servidor que espera mensajes de la aplicacion cliente. <br/>
- Para enviar mensajes al servidor se escribe cualquier mensaje en el campo enviar. <br/> ',4); /* 3 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'P2P',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen cuatro (4) aplicaciones clientes que pueden enviar y recibir mensajes. <br/>
1. Para enviarle un mensaje a un nodo desde otro escribir: "numeroNodo:mensaje". <br/>',5); /* 4 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Sockets',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen cuatro (4) aplicaciones clientes que pueden enviar y recibir mensajes. <br/>
1. Para enviarle un mensaje a un nodo desde otro escribir: "numeroNodo:mensaje" <br/> ',1); /* 5 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'RMI',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene dos (2) aplicaciones cliente y servidor. <br/>
1. El servidor posee los metodos de hora,fecha y saludo <br/>
2. Para enviar mensajes al servidor se escribe uno de los siguientes mensajes desde el cliente: hora, fecha o saludo. <br/> ',6); /* 6 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Comunicacion en Grupo',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene una aplicacion cliente que se encarga de ser el grupo emisor y tres (3) aplicaciones servidor que pertenecen al mismo grupo (receptor). <br/>
1. Para enviar un mensaje al grupo se escribe el mensaje desde el nodo emisor. <br/> ',7); /* 7 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Lamport',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene cuatro (4) ejecutables cliente que se encargan de enviar las marcas de reloj de un nodo a otro. <br/>
1. Cada ejecutable se inicia con una marca de reloj aleatoria <br/>
2. Enviar al nodo numero uno (1) el mensaje "iniciar" para empezar a enviar las marcas de reloj <br/>
3. Al transcurir cuatro (4) segundos se actualiza el reloj a la nueva marca. <br/>  ',8); /* 8 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Cristian',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen un ejecutable cliente y otro servidor  <br/>
1. Al iniciarse el cliente envia el mensaje al servidor para conocer el tiempo entre el envio y el retorno del mensaje <br/>
2. La sincronizacion ocurre cada 5 segundos. <br/> ',9); /* 9 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Berkeley',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable servidor y tres (3) clientes <br/>
- No es necesario controlar las aplicaciones <br/>',10); /* 10 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Promedio',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene cuatro (4) ejecutables cliente <br/>
1. Para obtener el tiempo promedio de todos los nodos enviar el mensaje "iniciar" desde un nodo particular <br/>
   ',11); /* 11 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Centralizado',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable servidor y tres (3) ejecutables clientes <br/>
1. Para acceder a una region critica enviar el mensaje "numeroNodo:acceder" <br/>
2. Para salir de una region critica enviar el mensaje "numeroNodo:salir" <br/>',12); /* 12 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Distribuido',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen cuatro (4) ejecutables clientes <br/>
1. Para acceder a una region critica enviar el mensaje "numeroNodo:acceder" <br/>
2. Para salir de una region critica enviar el mensaje "numeroNodo:salir" <br/>',13); /* 13 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Grandulon',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen cuatro (4) ejecutables clientes <br/>
- Cuando se desee escoger un coordinador desde cualquier nodo se envia el mensaje "iniciar" <br/> ',14); /* 14 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Anillo',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen cuatro (4) ejecutables clientes <br/>
- Cuando se desee escoger un coordinador se envia desde cualquier nodo el mensaje "iniciar" <br/> ',15); /* 15 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Fallas',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen un ejecutable cliente y otro servidor. <br/>
1. El servidor se inicia con un tipo de falla aleatorio (congelacion,omision,tiempo,respuesta) con los valores (1,2,3,4) respectivamente <br/>
2. El cliente puede enviar cualquier mensaje al servidor de manera de comprobar el tipo de falla <br/>
3. Si se quiere probar otra falla detener el nodo servidor y volver a iniciarlo. <br/> ',16); /* 16 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Fallas Bizantinas',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen cuatro (4) ejecutables cliente <br/>
- Al iniciar cada aplicacion hay 1/5 de posibilidad de que el nodo se encuentre "corrupto" lo que permite que envie mensajes erroneos <br/> ',17); /* 17 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Acceso Remoto',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen una ejecutable servidor con un archivo de texto almacenado y un ejecutable cliente. <br/>
1. Para escribir en el archivo txt enviar el mensaje "escribir:mensajeAescribir". <br/>
2. Para visualizar el contenido del archivo escribir "ver:". <br/> ',18); /* 18 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Carga y Descarga',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable servidor con un archivo de texto almacenado y dos (2) ejecutables clientes <br/>
1. Para acceder al archivo enviar el mensaje "archivo:" desde uno de los clientes <br/>
2. Para leer el archivo recibido enviar el mensaje "ver:" desde el cliente que posea el archivo <br/>
3. Para escribir en el archivo recibido enviar el mensaje "escribir:mensajeAescribir" desde el cliente que posea el archivo <br/>
4. Para enviar el archivo recibido enviar el mensaje "enviar:" desde el cliente que posea el archivo. <br/>  ',19); /* 19 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Cluster',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tienen tres (3) ejecutables servidor con archivos de texto almacenados y un ejecutable cliente para acceder <br/>
1. Para descargar el archivo completo ubicado en el servidor 1 enviar el mensaje "archivo_completo" desde el cliente <br/>
2. Para descargar el archivo dividido entre los tres (3) servidores envir el mensaje "archivo_partes" desde el cliente <br/> ',20); /* 20 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'DNS',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable servidor que posee dominios almacenados y un ejecutable cliente que puede consultar dichos dominios <br/>
1. Para consultar el ip de un dominio enviar la direccion url ej: "www.ucab.edu.ve" <br/>
2. Para agregar un sitio enviar la direccion url junto a su ip asociado, ej: "www.apple.com:200.100.50.0" <br/>
3. Los sitios por defectos cargados en el servidor son: www.ucab.edu.ve, www.google.com, www.ibm.com <br/> ',21); /* 21 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'LDAP',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable servidor que posee dominios y usuarios asociados y un ejecutable cliente que puede agregar, eliminar o consultar dichos usuarios <br/>
1. Para agregar un usuario a un dominio especifico enviar el mensaje: "add,nombreUsuario,apellidoUsuario,telefonoUsuario,emailUsuario,nombreGerenteUsuario apellidoGerenteUsuario,dominio1,dominio2" <br/>
2. Para consultar un usuario enviar el mensaje: "search,nombreUsuario apellidoUsuario" <br/>
3. Para eliminar un usuario enviar el mensaje: "delete,nombreUsuario apellidoUsuario" <br/>
4. Los dominios por defectos son: ucab.edu con los usuarios: Hector Sam, Aileen Posadas, Daniel Sam <br/>
ibm.com con los usuarios: Juan Rodriguez, Jessica Motta, Cristobal Gimon y Dany Esteves <br/>',22); /* 22 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'RMI',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene dos (2) aplicaciones cliente y servidor. <br/>
1. El servidor posee los metodos: listar mensajes,agregar mensaje y eliminar lista <br/>
2. Para enviar mensajes al servidor se escribe uno de los siguientes mensajes desde el cliente: listar: , agregar:mensaje_a_agregar o eliminar: <br/>  ',23); /* 23 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'EJB',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable cliente que permite enviar mensajes a un servlet que contiene los beans de sesion con y sin estado <br/>
1. Parar comprobar los enterprise java beans enviar el mensaje de la siguiente forma: mensaje1-mensaje2-mensaje3- <br/> ',24); /* 24 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'SOAP',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable servidor que posee el archivo WSDL con los metodos que pueden ser consumidos y un ejecutable cliente que puede consumir el servicio <br/>
1. Los servicios disponibles para consumir son: hora,fecha y mensaje <br/>
2. Para consumir un servicio enviar el mensaje: "hora:", "fecha:" o "mensaje:mensajeAenviar" <br/>
3. El archivo WSDL se encuentra en la direccion http://192.168.1.191:9999/ws/mensajes?wsdl <br/> ',25); /* 25 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'REST',TO_DATE('22/09/2013','DD/MM/YYYY'),'
Se tiene un ejecutable servidor que posee los metodos de saludo, fecha y hora  alojado en el servidor glassfish y un ejecutable cliente que puede consumirlos <br/>
1. Los servicios disponibles para consumir son: hora,fecha y mensaje. <br/>
2. Para consumir un servicio enviar el mensaje: "hora:", "fecha:" o "mensaje:mensajeAenviar" <br/>
3. Los metodos a consumir se encuentran en la direccion: http://192.168.1.191:8080/REST_Servidor/resources/hora <br/>
http://192.168.1.191:8080/REST_Servidor/resources/fecha y http://192.168.1.191:8080/REST_Servidor/resources/saludo <br/>  ',26); /* 26 */




/*
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'',TO_DATE('22/09/2013','DD/MM/YYYY'),'',1);
*/

/* APLICACIONES */


/* EJECUTABLES */

/*
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'AgenteConfiguracion.jar','CLIENTE','ejecutables/',1,1);
*/


INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Servidor1.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',1,1);/* 1 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Servidor2.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',1,2); /* 2 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',1,3); /* 3 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',2,1); /* 4 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Cliente1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',2,2); /* 5 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Cliente2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',2,3); /* 6 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',3,1); /* 7 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Cliente1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',3,2); /* 8 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Cliente2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',3,3); /* 9 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',4,1); /* 10 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',4,2); /* 11 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',4,3); /* 12 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',4,4); /* 13 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',5,1); /* 14 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',5,2); /* 15 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',5,3); /* 16 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',5,4); /* 17 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Servidor1.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',6,1); /* 18 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Cliente1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',6,2); /* 19 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Emisor.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',7,1); /* 20 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Receptor1.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',7,2); /* 21 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Receptor2.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',7,3); /* 22 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Receptor3.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',7,4); /* 23 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',8,1); /* 24 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',8,2); /* 25 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',8,3); /* 26 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',8,4); /* 27 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cristian_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',9,1); /* 28 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cristian_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',9,2); /* 29 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',10,1); /* 30 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Cliente1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',10,2); /* 31 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Cliente2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',10,3); /* 32 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Cliente3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',10,4); /* 33 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',11,1); /* 34 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',11,2); /* 35 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',11,3); /* 36 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',11,4); /* 37 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',12,1); /* 38 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Cliente1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',12,2); /* 39 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Cliente2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',12,3); /* 40 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Cliente3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',12,4); /* 41 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',13,1); /* 42 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',13,2); /* 43 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',13,3); /* 44 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',13,4); /* 45 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',14,1); /* 46 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',14,2); /* 47 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',14,3); /* 48 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',14,4); /* 49 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',15,1); /* 50 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',15,2); /* 51 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',15,3); /* 52 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',15,4); /* 53 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Tipos_De_Fallas_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',16,1); /* 54 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Tipos_De_Fallas_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',16,2); /* 55 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',17,1); /* 56 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',17,2); /* 57 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas3.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',17,3); /* 58 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas4.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',17,4); /* 59 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloAccesoRemoto_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',18,1); /* 60 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloAccesoRemoto_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',18,2); /* 61 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloCargaDescarga_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',19,1); /* 62 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloCargaDescarga_Cliente1.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',19,2); /* 63 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloCargaDescarga_Cliente2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',19,3); /* 64 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster1.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',20,1); /* 65 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster2.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',20,2); /* 66 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster3.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',20,3); /* 67 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',20,4); /* 68 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DNS_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',21,1); /* 69 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DNS_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',21,2); /* 70 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'LDAP_Servidor.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',22,1); /* 71 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO) 
VALUES (S_EJECUTABLES.NEXTVAL,'LDAP_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',22,2); /* 72 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Servidor2.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',23,1); /* 73 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Cliente2.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',23,2); /* 74 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'EJB.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',24,2); /* 75 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'SOAP_Server.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',25,1); /* 76 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'SOAP_Client.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',25,2); /* 77 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'REST_Cliente.jar','CLIENTE','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',26,2); /* 78 */





/*
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'.jar','SERVIDOR','/Users/hectorsam/teg-hs/ServidorCentral/ejecutables/',,);
*/
/* EJECUTABLES */

/* PARAMETROS */
/*
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE) 
VALUES (S_PARAMETROS.NEXTVAL,'puerto_escucha','2000',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'ip_servidor_central','192.168.1.105',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'intefaz_red','eth0',1);
*/
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','CaracteristicasSD_Servidor',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Segundo Servidor','192.168.1.192',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','CaracteristicasSD_Servidor',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Segundo Servidor','192.168.1.191',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','CaracteristicasSD_Cliente',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 1','192.168.1.191',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 2','192.168.1.192',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DesafiosSD_Servidor',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DesafiosSD_Cliente1',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DesafiosSD_Cliente2',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Arquitectura_C_S_Servidor',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Arquitectura_C_S_Cliente',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Arquitectura_C_S_Cliente',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.1.192',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.1.193',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.1.194',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.1.191',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','2',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.192',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','3',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','4',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','1',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','3',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','4',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','1',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','2',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','4',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','1',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','2',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','3',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.193',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI_Servidor1',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI_Cliente1',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo_Emisor',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo_Receptor',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo_Receptor',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo_Receptor',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','192.168.1.192',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','""',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','192.168.1.193',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','192.168.1.191',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','192.168.1.194',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','192.168.1.192',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','""',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','192.168.1.193',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cristian_Servidor',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cristian_Cliente',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','5',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley_Servidor',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','8000',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley_Cliente',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley_Cliente',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley_Cliente',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.192',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.193',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Servidor',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Cliente',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Cliente',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Cliente',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.192',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.193',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','""',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','192.168.1.192-192.168.1.193-192.168.1.194',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','192.168.1.191-',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','192.168.1.193-192.168.1.194',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','192.168.1.191-192.168.1.192',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','192.168.1.194-',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','192.168.1.191-192.168.1.192-192.168.1.193',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','""',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.1.192',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.1.193',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.1.194',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.1.191',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Tipos_De_Fallas_Servidor.jar',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Tipos_De_Fallas_Cliente.jar',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas1',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.192',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas2',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.193',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','7000',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas3',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.194',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','4000',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas4',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.1.191',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.1.192',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.1.193',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','1000',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloAccesoRemoto_Servidor',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloAccesoRemoto_Cliente',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloCargaDescarga_Servidor',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloCargaDescarga_Cliente',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloCargaDescarga_Cliente',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster_Cliente',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 1','192.168.1.191',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 2','192.168.1.192',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 3','192.168.1.193',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DNS_Servidor',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DNS_Cliente',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','LDAP_Servidor',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','LDAP_Cliente',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI_Servidor2',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI_Cliente2',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','EJB',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','SOAP_Server',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','SOAP_Client',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','REST_Cliente',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.191',78);


/*
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',);


INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.1.199',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.1.19',);
*/

/*
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'','',);
*/
/* PARAMETROS */

/* ESCENARIOS */
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Leer Archivo','Cuando se envie el mensaje "leer:" el servidor mostrara el contenido del archivo. Logrando comprobar la comparticion de recursos',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Iniciar Servidor Web','Cuando se envie el mensaje "iniciar_servidor:" la aplicacion servidor iniciara el servidor web. Logrando comprobar la apertura (openness).',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Pagina de Prueba','Cuando se envie el mensaje "pagina:" el servidor mostrara la pagina de prueba. ',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Detener Servidor Web','Cuando se envie el mensaje "detener_servidor:" el servidor dentendra el servidor web del sistema.',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Escalabilidad','Al tener dos servidores corriendo, se comprueba la escalabilidad de los sistemas distribuidos',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Tolerancia a Fallos','Al detenerse una aplicacion servidor el sistema puede seguir funcionando con el servidor activo.',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Transparencia','La aplicacion cliente no percibe cuantas aplicaciones servidores existen, solo envia el mensaje del usuario.',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Seguridad','La aplicacion cliente se conecta al servidor a traves de sockets seguros por lo que la data enviada se encuentra encriptada',2,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Tolerancia a Fallos','Cuando el cliente accede a un archivo, el servidor le envia el archivo junto a su checksum de manera que se pueda comprobar que no hayan existido errores al momento de transferir el archivo',2,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Concurrencia','Cuando dos clientes quieren acceder a un archivo el servidor maneja semaforos de manera que pueda controlar las peticiones de los clientes de manera ordenada',2,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Comunicacion','Al enviarse un mensaje al servidor el servidor responde inmediatamente con un mensaje de respuesta',3,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Comunicacion en anillo','Al enviarse un mensaje a un nodo particular, este debe pasar por cada uno de los nodos del sistema en el orden indicado',4,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Comunicacion directa','Al enviarse un mensaje a un nodo particular, el nodo remitente recibe una respuesta del nodo destinatario',5,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Comunicacion RMI','Al enviarse un mensaje al servidor desde el cliente, se invoca el metodo remoto mediante la interfaz',6,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Comunicacion en Grupo','Al enviarse un mensaje desde el nodo emisor este es recibido por todos los nodos que pertenecen al grupo',7,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Reduccion del Grupo','Si un nodo del grupo emisor se cae, el grupo no desaparece sino que se reduce en cantidad',7,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Marca de Reloj','Si la marca de reloj recibida por el nodo es mayor que la marca de reloj actual entonces se aplica el algoritmo de LAMPORT',8,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Tiempo Inicial','El nodo cliente al enviar el mensaje al servidor guarda la hora en la que envio el mensaje',9,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Sincronizacion de Reloj','Al recibir la respuesta del servidor, el nodo calcula la hora actual mediante la formula: (horaRecepcion- horaEnvio) /2',9,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Tiempo de Sincronizacion','El servidor pregunta cada ocho (8) segundos la hora actual de los nodos.',10,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Envio de hora','El servidor al recibir los tiempos de cada nodo, calcula el promedio de todos y se lo envia a cada nodo',10,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Ajuste de reloj','Cada nodo al recibir la hora promedio del servidor compara con su hora actual indicando si hay que adelantar o retrasar el reloj',10,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Tiempo de recepcion','El nodo al enviar informacion a los demas nodos del sistema espera un tiempo de "10" segundos ',11,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Horas recibidas','Al recibir la hora proveniente de otro nodo, el nodo actual almacena el valor para calcular el promedio',11,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Sincronizar Horas','Al transcurrir el tiempo de 10 segundos el nodo calcular en base a las horas recibidas el tiempo promedio y lo imprime por pantalla',11,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Acceso a region critica','Cuando un nodo quiere acceder a una region critica este le envia al coordinador la informacion',12,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Chequeo de la region critica','El servidor al recibir el mensaje de acceso a una region critica compara en una lista de regiones ocupadas si el nodo al que se quiere acceder se encuentra ocupado',12,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Rechazo o Aprobacion de region critica','Si la region solicitada se encuentra ocupada se le notifica al nodo solicitante el rechazo de la misma, en caso contrario se le permite acceder y ningun otro nodo puede acceder a ella',12,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Terminar region critica','Al enviar el mensaje de salir desde el nodo que se encuentra en la region critica de otro se le permite que cualquier nodo pueda acceder a su region',12,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Acceso region critica','Al enviar un mensaje de solicitud a una region critica, cada nodo chequea si se encuentra ocupando la region solicitada, si es positivo no responde y guarda dicha solicitud en una lista, caso contrario envia "OK"',13,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Comparacion de Hora','Si un nodo recibe una solicitud de acceso a otra region critica y este quiere tambien acceder entonces se comparan ambos tiempos. Si el tiempo recibido es menor entonces envia "OK", caso contrario almacena en una lista el mensaje',13,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Espera de OK','Al enviar el mensaje de solicitud de region critica si se reciben tantos OK como nodos en el sistema, entonces se procede a entrar a la region critica',13,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Eleccion Coordinador','Al enviarse el mensaje iniciar desde un nodo, este buscara en los nodos mayores a el (denotado por el numero de nodo) para encontrar el nodo coordinador',14,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Coordinador','El nodo mayor escribira coordinador y enviara un mensaje a los demas nodos indicando que es el coodinador',14,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Solicitud Coordinador','Al enviarse el mensaje de solicitud de coordinador a un nodo particular, se envia al siguiente nodo del anillo el mensaje de eleccion y este al siguiente nodo anillo con su id de proceso y numero de nodo',15,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Eleccion Coordinador','Al llegar el mensaje nuevamente al nodo solicitante se comparan los id de procesos de todos los nodos, se elige el de mayor numero de proceso',15,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Aviso Coordinador','Al elegirse el coodinador se envia al anillo el mensaje del nodo coordinador con su id de proceso',15,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Falla Congelacion','Al aparecer esta falla en el servidor el cliente no puede enviar mensajes hacia el servidor',16,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Falla de Omision','El servidor recibe el mensaje pero no devuelve una respuesta al cliente',16,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Falla de Tiempo','El servidor responde al cliente luego de haber transcurrido un tiempo de 10 segundos',16,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Falla de Respuesta','El servidor responde al cliente con una respuesta incorrecta',16,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Nodo Corrupto','Si el nodo al iniciarse envia el mensaje "corrupto" entonces enviara mensajes de numeros aleatorios a los demas nodos del sistema',17,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Envio de vectores','Al iniciarse la aplicacion envia automaticamente a sus vecinos su numero de nodo',17,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Espera por vectores de nodos','Luego de enviar el vector, cada nodo espera por los demas vectores para comparar cada casilla',17,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Vector Final','Al obtener los vectores de cada nodo, la aplicacion compara cada casilla del vector y coloca el valor de mayor repeticion, caso contrario coloca UNKNOWN',17,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Acceso al archivo','El archivo se encuentra ubicado en el servidor, el cliente solo puede acceder al archivo a traves de los mensajes leer y/o escribir',18,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Acceso al archivo','El archivo se encuentra ubicado en el servidor, el cliente debe descargarlo para poder acceder localmente y manipularlo',19,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Escritura del archivo','El archivo solo puede ser escrito a traves del nodo que contenga el archivo',19,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Lectura del archivo','El archivo solo puede ser visualizado a traves del nodo que contenga el archivo',19,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Restriccion del archivo','Si el archivo fue descargado por un cliente, entonces es eliminado del servidor por lo que otro nodo no puede acceder para su descarga hasta que sea cargado nuevamente en el servidor.',19,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Archivos almacenados','Los servidores poseen un archivo dividido en tres partes, cada una almacenado en un servidor, adicionalmente el servidor #1 posee el archivo completo',20,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Archivo Completo','Al enviar el mensaje para acceder al archivo completo el cliente solicita el archivo al servidor #1 quien posee lo almacenado localmente, el tiempo de transferencia se inicia al enviarse la solicitud al servidor. ',20,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Archivo por Partes','Al enviar el mensaje para acceder al archivo por partes, el cliente solicita simultaneamente el archivo en cada servidor y espera por su transferencia calculando el tiempo transcurrido entre la solicitud y la entrega del archivo',20,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Comparacion Archivos','La transferencia del archivo en partes siempre sera mucho mas rapida que el archivo completo, debido a que simultaneamente se realiza la peticion y esto se puede comparar con maquinas de un procesador vs maquinas de varios procesadores',20,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'IP Asociado','Al enviar la direccion URL de un sitio particular, el servidor envia el ip asociado a esa URL',21,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Agregar Sitio','Se pueden agregar nuevos sitios al servidor de manera que pueda ser consultado por el cliente',21,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Agregar','Si se envia el mensaje add seguido de la informacion adecuada, entonces el servidor almacenara el usuario en el dominio correspondiente ',22,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Consultar','Al enviar el mensaje search y el nombre del usuario se podrá visualizar la informacion perteneciente al usuario (datos personales)',22,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Eliminar','Al enviar el mensaje delete y el nombre del usuario, entonces el servidor localiza al usuario y lo elimina del dominio',22,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Listar Mensajes','Si se envia el mensaje "listar:" se muestra el contenido de la lista remota',23,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Agregar Mensajes','Si se envia el mensaje "agregar:MensajeAagregar" agregar una cadena de caracteres a la lista remota. ',23,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Eliminar','Si se envia el mensaje "eliminar:" se vacia la lista de mensajes remota ',23,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Bean con estado (stateful)','Al enviar el mensaje2 (apellido) vacio el servlet responde con la frase: Se borro lo que escribi, indicando que fue null el campo del apellido',24,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Bean sin estado (stateless)','Al enviar el mensaje1 (nombre) o el mensaje3 (cedula) vacio, el servlet responde con el ultimo valor que fue agregado al bean en el campo indicado',24,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Consumir Servicio','El cliente realiza una llamada de tipo RPC para solicitar los servicios ubicados en el servidor.',25,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Interfaz comun','Tanto el cliente como el servidor poseen para conocer los metodos disponibles para el consumo.',25,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Consumir Servicio','El cliente consume los servicios del servidor mediante la URL indicadas y una peticion GET',26,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Servidor','El servidor al ser una aplicacion web se encuentra alojado en un contenedor web, en este caso se encuentra alojado en el servidor glassfish',26,NULL);


/*
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'','',,NULL);
*/
/*
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'ESCENARIO1 APLICACION1','DESCRIPCION ESCENARIO1',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.37 PM.png');
insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario2 aplicacion1','descripcion escenario2',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.31 PM.png');
insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario3 aplicacion1','descripcion escenario3',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.23 PM.png');
*/
/* ESCENARIOS */

/* EVENTOS */
INSERT INTO EVENTOS(ID,NOMBRE,PATHSCRIPT) VALUES (S_EVENTOS.NEXTVAL,'INICIAR','1');
INSERT INTO EVENTOS(ID,NOMBRE,PATHSCRIPT) VALUES (S_EVENTOS.NEXTVAL,'DETENER','2');
INSERT INTO EVENTOS(ID,NOMBRE,PATHSCRIPT) VALUES (S_EVENTOS.NEXTVAL,'MENSAJE','3');

/* EVENTOS*/

/* EJECUTABLE_EVENTO */

INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,1);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,1);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,2);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,2);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,3);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,3);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,3);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,4);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,4);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,5);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,5);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,5);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,6);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,6);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,6);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,7);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,7);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,8);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,8);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,8);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,9);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,9);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,9);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,10);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,10);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,10);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,11);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,11);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,11);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,12);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,12);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,12);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,13);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,13);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,13);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,14);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,14);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,14);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,15);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,15);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,15);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,16);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,16);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,16);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,17);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,17);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,17);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,18);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,18);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,19);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,19);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,19);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,20);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,20);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,20);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,21);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,21);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,22);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,22);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,23);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,23);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,24);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,24);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,24);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,25);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,25);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,26);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,26);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,27);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,27);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,28);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,28);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,29);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,29);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,30);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,30);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,31);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,31);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,32);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,32);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,33);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,33);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,34);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,34);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,34);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,35);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,35);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,35);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,36);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,36);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,36);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,37);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,37);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,37);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,38);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,38);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,39);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,39);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,39);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,40);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,40);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,40);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,41);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,41);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,41);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,42);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,42);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,42);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,43);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,43);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,43);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,44);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,44);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,44);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,45);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,45);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,45);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,46);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,46);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,46);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,47);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,47);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,47);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,48);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,48);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,48);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,49);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,49);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,49);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,50);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,50);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,50);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,51);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,51);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,51);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,52);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,52);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,52);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,53);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,53);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,53);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,54);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,54);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,55);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,55);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,55);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,56);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,56);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,57);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,57);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,58);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,58);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,59);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,59);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,60);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,60);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,61);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,61);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,61);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,62);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,62);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,63);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,63);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,63);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,64);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,64);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,64);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,65);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,65);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,66);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,66);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,67);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,67);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,68);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,68);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,68);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,69);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,69);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,70);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,70);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,70);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,71);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,71);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,72);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,72);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,72);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,73);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,73);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,74);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,74);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,74);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,75);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,75);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,75);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,76);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,76);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,77);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,77);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,77);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,78);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,78);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,78);


/*
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (1,);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (2,);
INSERT INTO EJECUTABLE_EVENTO(ID_EVENTO,ID_EJECUTABLE) VALUES (3,);
*/

/* EJECUTABLE_EVENTO */


/* PREGUNTAS 
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado1',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado2',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado3',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado4',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado5',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado6',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado7',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado8',1);
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'enunciado9',1);

*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿En que casos se puede aplicar la apertura (openess) en los sistemas distribuidos?',2); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'De las siguientes opciones, ¿Cual es la más importante para la comparticion de recursos?',2);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La concurrencia es:',2);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si el sistema es escalable entonces permite:',2);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Como se podria obtener tolerancia a fallos a nivel de software?',2);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si en un sistema distribuido un nodo se cae, El usuario deberia:',2);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Se puede compartir recursos entre dos clientes?',2);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se agrega un nuevo disco duro a un servidor esto podria generar: ',2);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si la red entre un sistema distribuido y los clientes falla entonces:',2);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un servidor no admite usuarios concurrentes, el cliente debe: ',2);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se usan sockets SSL se puede: ',3); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un sistema escalable no permite: ',3);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Como se podria enmascarar un fallo del sistema?',3);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En que casos la concurrencia no aplica: ',3);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'A nivel de aplicacion, ¿Como se puede simular concurrencia?',3);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿La transparencia beneficia al cliente?',3);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Hash md5 es una tecnica para: ',3);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los semaforos son una tecnica util para: ',3);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuando se habla de seguridad se refiere a:',3);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si un nodo se reinicia se le debe notificar al usuario:',3);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La comunicacion en el modelo cliente - servidor es:',4); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae el servidor que ocurre: ',4);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si la comunicacion entre el cliente y el servidor es interrumpida entonces: ',4);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Un nodo puede ser cliente y servidor al mismo tiempo?',4);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿El servidor puede solicitar algun recurso del cliente?',4);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El modelo cliente - servidor posee el protocolo: ',4);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿El servidor puede atender a un unico cliente en un tiempo determinado?',4);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual de estas no es una caracteristica del cliente?',4);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual de estas no es una caracteristica del servidor?',4);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si en una peticion cliente - servidor se pierda conexion, ¿Que puede ocurrir?',4);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En arquitectura P2P los nodos se comportan como: ',5); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La topologia de los nodos para la aplicacion P2P es:',5);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Como son llamados los nodos en P2P?',5);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si un nodo se cae en P2P que ocurre: ',5);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El modelo de arquitectura P2P es de tipo:',5);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual de estos no requiere de una red P2P?',5);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae un nodo mientras estaba enviando informacion. ¿Que ocurre cuando se levanta?',5);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En una aplicacion P2P el metodo de comunicacion debe ser: ',5);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Los nodos en P2P son dedicados?',5);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Administrar una red P2P en comparacion con el modelo cliente / servidor es:',5);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En java, ¿que se requiere para crear un socket?',1); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿El puerto al que se conecta el cliente es el mismo de respuesta del servidor?',1);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Que se requiere para que un servidor pueda abrir un socket de escucha?',1);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Se puede compartir puertos en un mismo host?',1);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Que cantidad de procesos pueden enviar mensajes a un puerto?',1);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual de estos no es un protocolo para sockets?',1);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cuantos puertos se encuentran disponibles en una maquina',1);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cierra el socket de escucha del servidor entonces:',1);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si en medio de una transferencia el socket se cierra, ¿Que pasa con el recurso?',1);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se puede abrir un puerto varias veces en un mismo host?',1);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Como se llaman los objetos que brindan sus metodos a otros objetos?',6); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿El objeto remoto debe ser instanciado antes de ser invocado?',6);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Aparte de una interfaz, ¿Con que otra estructura se pueden invocar metodos remotos?',6);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿La invocacion de metodos puede realizarse localmente?',6);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual de estos no es un identificador de los objetos remotos?',6);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Se pueden tener objetos dentro de los objetos remotos?',6);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Como pueden ser llamados a los procesos que alojan objetos remotos?',6);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Que significan las siglas JVRMI?',6);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Que se debe declarar antes de empezar a invocar metodos remotamente?',6);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Como se llama el protocolo utilizado por JRMI?',6);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual es la propiedad fundamental de todo grupo?',7); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Un proceso puede ser miembro de varios grupos a la vez?',7);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual de estos no es un tipo de transmision?',7);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cual de estos no es un tipo de grupo?',7);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En Uni-transmision, ¿Que elementos no existen?',7);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En un grupo de companeros, ¿Que ocurre si un proceso falla?',7);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Los grupos jerarquicos poseen coordinador?',7);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si el emisor del grupo se cae, ¿Que sucede?',7);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En los grupos de companeros, ¿Quien toma las deciciones?',7);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si un proceso trabajador se cae, ¿El grupo puede seguir funcionando?',7);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿La sincronizacion de relojes debe ser absoluta segun Lamport?',8); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿El orden en que ocurren los eventos es importante?',8);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Que significa la expresion a -> b?',8);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si A ocurre antes que B entonces el tiempo de A debe ser:',8);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El tiempo de los relojes siempre tiene que ir:',8);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿Cuanto se debe sumar al hacer correciones al reloj?',8);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Una marca de reloj es:',8);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae el nodo que posee el mensaje con la marca actual ocurre:',8);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Las marcas de reloj se sincronizan solo si: ',8);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'¿La hora exacta en la que fueron creados los procesos importa?',8);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',9);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',10);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',11);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',12);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',13);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',14);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',15);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',16);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',17);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',18);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',19);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',20);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',21);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',22);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',23);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',24);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',25);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',26);/*10*/





INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Dos máquinas se encienden al mismo tiempo',1,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En el servidor se habilita el servicio de FTP',1,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se cae un nodo',1,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Falla la conexión de red',1,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La red entre el servidor y los clientes',2,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cantidad de disco duro en el servidor',2,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Memoria RAM disponible en el servidor',2,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nombre del recurso',2,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cantidad de nodos en el sistema',3,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cantidad de procesos en una máquina',3,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cantidad de usuarios accediendo al mismo recurso',3,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Velocidad de la red',3,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que no se caiga un nodo',4,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que existan menos interferencia en la red',4,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que pueda reducirse el sistema y eliminar a los clientes',4,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que existan mas nodos sin perjudicar a los ya existentes',4,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Utilizando HASH MD5 en los recursos enviados',5,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Enviando dos veces el recurso',5,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No enviar ningun recurso',5,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Enviando un mensaje de confirmacion al cliente',5,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Notificar que un nodo se ha caido',6,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Seguir intentando',6,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El usuario no debe darse cuenta debido a la transparencia en los sistemas distribuidos',6,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Desconectar la red',6,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',7,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',7,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si aunque no haya conexion entre ellos',7,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si existe una conexion entre ellos si',7,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Perdida de informacion',8,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Congestionamiento en la red',8,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No generaria ningun error',8,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Problemas en los clientes',8,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El sistema debe detenerse',9,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente debe reiniciarse',9,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El sistema debe mantenerse en funcionamiento',9,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El sistema debe desconectarse de la red',9,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Consultar el servidor aunque se encuentre ocupado',10,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No hacer nada',10,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Desconectarse de la red',10,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Esperar que el servidor se encuentre disponible para acceder a el',10,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Conectar mas clientes ',11,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cifrar la conexion',11,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Aumentar la velocidad',11,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Conseguir acceso rapido',11,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mayor velocidad de procesamiento',12,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mayor disponibilidad',12,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mayor tolerancia a fallos',12,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mayor latencia',12,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Enviando un mensaje al usuario de que hubo un problema',13,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ocultando la falla',13,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Desconectando el sistema de la red',13,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No hacer nada',13,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En la red',14,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En un archivo',14,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En un disco',14,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En una aplicacion',14,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Muchas aplicaciones',15,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Uso exagerado de procesador',15,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mediante hilos (threads)',15,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mayor carga de trabajo',15,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No porque el cliente debe conocer cuantos nodos existen en el sistema',16,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si porque lo importante es acceder al recurso solicitado',16,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si porque lo que se debe conocer es la red',16,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No debe existir transparencia',16,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Seguridad',17,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Escalabilidad',17,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Concurrencia',17,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tolerancia a fallos',17,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Detener la ejecucion de un proceso',18,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Eliminar un nodo',18,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Controlar la concurrencia',18,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Aumentar la escalabilidad',18,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Proteger la informacion o recursos del sistema',19,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Proteger el sistema ante fallas',19,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Proteger la velocidad de la red',19,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Proteger el sistema ante errores del usuario',19,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nodo se encuentra reiniciando',20,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se deberia notificar nada',20,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Hubo un error en el sistema',20,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Interrumpir la conexion',20,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Sincrona',21,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Asincrona',21,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Pueden ser sincrona o asincrona',21,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguna de las anteriores',21,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',22,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No puede haber comunicacion',22,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente solicita otro servidor',22,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor no puede caerse',22,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente no puede conectarse con el servidor',23,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor puede enviar respuesta al cliente',23,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente solicita otro servidor',23,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor se reinicia',23,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',24,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, es imposible',24,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',24,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',24,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',25,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',25,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',25,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',25,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Orientado a conexion',26,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No orientado a conexion',26,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',26,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',26,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',27,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',27,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',27,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',27,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Solicita recursos al servidor',28,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Establece conexion con el servidor',28,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Espera respuesta del servidor',28,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Deshabilita la conexion entre el y el servidor',28,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Espera por el cliente para rechazar la solicitud',29,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Espera por clientes',29,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Envio de recursos',29,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Atender a multiples clientes',29,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente no puede comunicarse con el servidor',30,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor bloquea al cliente',30,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente vuelve a solicitar el recurso',30,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La red deja de funcionar',30,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cliente',31,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Servidor',31,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cliente y Servidor',31,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',31,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Estrella',32,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Arbol',32,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Anillo',32,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mixta',32,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nodos',33,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Peers',33,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Clientes',33,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Servidor',33,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se caen los demas nodos',34,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La red se pierde entre los nodos',34,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada debido a que los demas nodos se siguen comunicando',34,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es imposible que un nodo se caiga',34,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Centralizado',35,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distribuido',35,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',35,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',35,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Salas de chat y mensajeria instatanea',36,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Comparticion de archivos',36,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Streaming media',36,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Servidor de correo',36,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La informacion se tiene que volver a enviar',37,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se pierde toda la informacion',37,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se continua con la transferencia desde donde fallo',37,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',37,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Igual para que exista equilibrio',38,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Diferente para cada nodo',38,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No debe existir ningun metodo',38,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',38,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',39,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',39,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',39,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',39,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas facil',40,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Igual',40,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas dificil',40,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',40,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una direccion ip',41,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Puerto',41,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Direccion Ip y Puerto',41,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',41,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',42,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',42,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',42,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',42,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un puerto',43,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una direccion IP',43,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nada',43,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',43,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',44,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',44,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A veces',44,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',44,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Gran cantidad',45,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Solo uno a la vez',45,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',45,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',45,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'TCP',46,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'UDP',46,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'HTTP',46,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',46,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'65536',47,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'65534',47,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'65535',47,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'65533',47,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los clientes no pueden comunicarse',48,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',48,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor se conecta al cliente por otra via',48,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',48,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se pierde y se debe enviar nuevamente',49,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se mantiene igual',49,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',49,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es imposible que se cierre el socket',49,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',50,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'NO',50,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',50,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',50,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Objetos Compartidos',51,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Objetos Remotos',51,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Objetos Distribuidos',51,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Objetos Estaticos',51,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, se puede invocar al instante',52,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, se debe crear el objeto',52,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Solo se necesita la interfaz',52,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',52,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Clase',53,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Clase Abstracta',53,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Interfaz Web',53,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguna',53,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, es imposible',54,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, siempre y cuando se tenga la interfaz',54,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',54,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',54,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Direccion Ip de la maquina destino',55,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Numero del objeto local',55,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nombre del usuario que creo el objeto',55,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Fecha y hora de creacion del objeto',55,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',56,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',56,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',56,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',56,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Procesadores',57,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ordenadores',57,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Clientes',57,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Servidores',57,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Remote Method Instance',58,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Ready Method Invocation',58,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Remote Micro Invocation',58,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Remote Method Invocation',58,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Las clases que interactuaran en la invocacion',59,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La interfaz de comunicacion',59,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente que invocara los metodos',59,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La via de comunicacion entre el cliente y el servidor',59,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Remote Method Poll',60,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Remote Micro Protocol',60,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Rest Micro Protocol',60,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Java Remote Method Protocol',60,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si un grupo se cae no ocurre nada',61,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si un mensaje llega a un grupo este es eliminado',61,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si un mensaje es enviado al grupo, todos los miembros lo reciben',61,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',61,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',62,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',62,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',62,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',62,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Uni-transmision',63,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Multi-transmision',63,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Dual-transmision',63,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Transmision simple',63,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Grupo Cerrado',64,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Grupo Abierto',64,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Grupo Jerarquico',64,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Grupo Colaborativo',64,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Emisor',65,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Coordinador',65,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Receptor',65,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',65,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El grupo deja de comunicarse',66,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se colapa el grupo',66,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se vuelve mas pequeno',66,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se caen los demas procesos',66,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',67,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',67,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',67,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',67,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El grupo sigue funcionando',68,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los receptores se vuelven emisores',68,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',68,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El grupo queda incomunicado',68,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nadie',69,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Algunos procesos',69,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Todos',69,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',69,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, el grupo se detiene',70,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, el grupo se hace mas pequeno',70,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los procesos trabajadores no se pueden caer',70,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',70,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',71,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',71,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',71,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',71,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',72,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',72,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',72,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',72,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A ocurre despues que B',73,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A es mayor que B',73,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A se encuentra adelante que B',73,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A ocurre antes que B',73,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mayor que el de B',74,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Menor que el de B',74,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No importa el tiempo de A',74,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',74,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Hacia atras',75,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Hacia adelante',75,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Hacia abajo',75,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Hacia arriba',75,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',76,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',76,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-1',76,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0.5',76,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un numero aleatorio',77,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un contador que aumenta cada cierto tiempo',77,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una constante',77,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',77,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se pueden las marcas de reloj',78,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',78,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se vuelve a enviar la marca de reloj',78,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se termina el algoritmo',78,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Dos procesos no interactuan',79,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Dos procesos interactuan',79,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',79,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',79,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',80,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',80,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',80,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',80,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',81,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',81,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',81,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',81,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',82,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',82,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',82,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',82,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',83,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',83,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',83,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',83,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',84,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',84,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',84,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',84,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',85,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',85,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',85,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',85,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',86,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',86,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',86,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',86,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',87,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',87,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',87,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',87,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',88,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',88,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',88,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',88,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',89,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',89,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',89,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',89,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',90,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',90,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',90,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',90,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',91,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',91,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',91,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',91,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',92,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',92,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',92,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',92,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',93,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',93,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',93,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',93,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',94,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',94,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',94,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',94,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',95,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',95,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',95,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',95,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',96,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',96,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',96,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',96,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',97,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',97,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',97,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',97,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',98,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',98,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',98,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',98,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',99,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',99,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',99,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',99,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',100,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',100,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',100,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',100,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',101,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',101,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',101,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',101,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',102,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',102,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',102,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',102,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',103,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',103,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',103,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',103,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',104,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',104,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',104,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',104,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',105,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',105,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',105,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',105,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',106,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',106,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',106,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',106,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',107,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',107,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',107,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',107,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',108,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',108,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',108,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',108,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',109,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',109,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',109,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',109,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',110,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',110,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',110,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',110,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',111,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',111,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',111,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',111,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',112,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',112,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',112,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',112,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',113,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',113,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',113,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',113,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',114,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',114,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',114,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',114,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',115,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',115,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',115,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',115,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',116,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',116,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',116,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',116,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',117,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',117,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',117,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',117,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',118,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',118,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',118,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',118,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',119,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',119,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',119,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',119,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',120,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',120,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',120,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',120,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',121,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',121,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',121,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',121,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',122,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',122,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',122,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',122,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',123,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',123,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',123,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',123,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',124,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',124,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',124,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',124,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',125,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',125,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',125,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',125,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',126,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',126,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',126,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',126,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',127,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',127,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',127,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',127,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',128,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',128,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',128,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',128,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',129,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',129,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',129,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',129,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',130,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',130,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',130,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',130,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',131,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',131,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',131,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',131,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',132,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',132,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',132,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',132,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',133,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',133,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',133,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',133,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',134,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',134,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',134,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',134,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',135,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',135,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',135,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',135,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',136,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',136,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',136,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',136,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',137,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',137,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',137,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',137,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',130,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',138,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',138,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',138,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',139,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',139,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',139,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',139,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',140,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',140,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',140,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',140,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',141,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',141,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',141,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',141,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',142,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',142,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',142,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',142,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',143,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',143,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',143,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',143,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',144,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',144,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',144,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',144,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',145,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',145,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',145,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',145,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',146,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',146,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',146,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',146,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',147,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',147,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',147,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',147,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',148,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',148,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',148,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',148,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',149,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',149,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',149,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',149,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',150,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',150,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',150,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',150,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',151,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',151,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',151,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',151,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',152,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',152,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',152,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',152,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',153,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',153,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',153,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',153,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',154,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',154,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',154,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',154,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',155,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',155,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',155,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',155,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',156,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',156,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',156,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',156,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',157,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',157,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',157,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',157,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',158,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',158,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',158,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',158,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',159,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',159,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',159,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',159,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',160,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',160,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',160,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',160,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',161,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',161,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',161,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',161,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',162,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',162,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',162,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',162,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',163,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',163,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',163,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',163,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',164,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',164,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',164,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',164,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',165,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',165,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',165,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',165,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',166,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',166,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',166,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',166,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',167,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',167,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',167,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',167,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',168,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',168,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',168,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',168,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',169,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',169,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',169,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',169,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',170,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',170,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',170,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',170,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',171,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',171,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',171,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',171,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',172,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',172,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',172,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',172,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',173,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',173,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',173,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',173,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',174,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',174,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',174,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',174,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',175,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',175,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',175,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',175,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',176,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',176,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',176,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',176,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',177,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',177,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',177,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',177,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',178,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',178,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',178,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',178,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',179,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',179,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',179,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',179,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',180,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',180,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',180,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',180,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',181,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',181,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',181,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',181,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',182,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',182,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',182,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',182,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',183,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',183,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',183,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',183,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',184,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',184,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',184,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',184,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',185,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',185,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',185,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',185,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',186,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',186,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',186,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',186,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',187,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',187,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',187,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',187,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',188,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',188,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',188,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',188,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',189,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',189,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',189,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',189,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',190,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',190,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',190,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',190,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',191,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',191,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',191,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',191,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',192,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',192,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',192,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',192,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',193,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',193,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',193,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',193,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',194,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',194,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',194,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',194,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',195,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',195,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',195,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',195,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',196,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',196,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',196,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',196,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',197,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',197,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',197,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',197,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',198,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',198,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',198,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',198,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',199,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',199,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',199,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',199,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',200,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',200,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',200,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',200,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',201,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',201,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',201,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',201,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',202,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',202,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',202,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',202,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',203,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',203,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',203,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',203,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',204,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',204,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',204,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',204,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',205,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',205,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',205,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',205,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',206,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',206,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',206,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',206,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',207,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',207,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',207,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',207,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',208,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',208,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',208,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',208,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',209,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',209,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',209,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',209,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',210,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',210,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',210,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',210,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',211,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',211,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',211,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',211,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',212,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',212,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',212,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',212,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',213,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',213,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',213,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',213,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',214,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',214,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',214,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',214,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',215,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',215,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',215,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',215,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',216,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',216,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',216,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',216,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',217,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',217,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',217,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',217,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',218,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',218,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',218,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',218,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',219,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',219,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',219,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',219,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',220,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',220,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',220,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',220,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',221,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',221,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',221,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',221,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',222,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',222,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',222,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',222,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',223,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',223,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',223,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',223,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',224,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',224,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',224,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',224,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',225,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',225,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',225,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',225,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',226,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',226,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',226,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',226,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',227,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',227,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',227,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',227,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',228,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',228,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',228,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',228,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',229,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',229,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',229,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',229,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',230,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',230,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',230,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',230,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',231,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',231,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',231,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',231,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',232,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',232,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',232,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',232,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',233,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',233,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',233,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',233,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',234,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',234,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',234,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',234,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',235,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',235,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',235,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',235,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',236,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',236,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',236,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',236,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',237,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',237,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',237,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',237,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',238,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',238,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',238,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',238,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',239,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',239,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',239,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',239,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',240,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',240,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',240,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',240,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',241,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',241,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',241,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',241,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',242,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',242,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',242,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',242,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',243,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',243,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',243,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',243,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',244,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',244,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',244,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',244,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',245,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',245,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',245,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',245,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',246,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',246,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',246,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',246,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',247,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',247,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',247,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',247,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',248,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',248,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',248,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',248,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',249,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',249,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',249,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',249,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',250,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',250,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',250,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',250,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',251,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',251,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',251,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',251,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',252,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',252,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',252,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',252,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',253,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',253,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',253,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',253,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',254,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',254,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',254,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',254,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',255,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',255,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',255,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',255,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',256,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',256,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',256,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',256,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',257,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',257,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',257,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',257,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',258,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',258,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',258,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',258,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',259,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',259,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',259,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',259,);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',260,); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',260,);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',260,);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',260,);/*4*/


















































































































/*
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'',);


INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',1,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',1,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',1,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',1,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',2,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',2,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',2,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',2,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',3,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',3,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',3,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',3,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',4,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',4,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',4,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',4,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',5,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',5,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',5,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',5,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',6,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',6,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',6,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',6,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',7,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',7,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',7,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',7,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',8,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',8,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',8,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',8,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion1',9,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion2',9,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion3',9,NULL);
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'opcion4',9,NULL);
*/








/*
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'',,);
/*
