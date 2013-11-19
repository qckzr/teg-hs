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
resolucion de nombres  a un servidor DNS (Por ejemplo: Que direccion IP corresponde a nombre.dominio?).</li>
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
VALUES (S_ESCENARIOS.NEXTVAL,'Leer Archivo','Cuando se envie el mensaje <leer:> el servidor mostrara el contenido del archivo. Logrando comprobar la comparticion de recursos',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Iniciar Servidor Web','Cuando se envie el mensaje <iniciar_servidor:> la aplicacion servidor iniciara el servidor web. Logrando comprobar la apertura (openness).',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Pagina de Prueba','Cuando se envie el mensaje <pagina:> el servidor mostrara la pagina de prueba. ',1,NULL);
INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)
VALUES (S_ESCENARIOS.NEXTVAL,'Detener Servidor Web','Cuando se envie el mensaje <detener_servidor:> el servidor dentendra el servidor web del sistema.',1,NULL);
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
VALUES (S_ESCENARIOS.NEXTVAL,'Consultar','Al enviar el mensaje search y el nombre del usuario se podra visualizar la informacion perteneciente al usuario (datos personales)',22,NULL);
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
VALUES(S_PREGUNTAS.NEXTVAL,'En que casos se puede aplicar la apertura (openess) en los sistemas distribuidos?',2); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'De las siguientes opciones, Cual es la mas importante para la comparticion de recursos?',2);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La concurrencia es:',2);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si el sistema es escalable entonces permite:',2);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Como se podria obtener tolerancia a fallos a nivel de software?',2);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si en un sistema distribuido un nodo se cae, El usuario deberia:',2);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se puede compartir recursos entre dos clientes?',2);/*7*/
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
VALUES(S_PREGUNTAS.NEXTVAL,'Como se podria enmascarar un fallo del sistema?',3);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En que casos la concurrencia no aplica: ',3);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'A nivel de aplicacion, Como se puede simular concurrencia?',3);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La transparencia beneficia al cliente?',3);/*6*/
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
VALUES(S_PREGUNTAS.NEXTVAL,'Un nodo puede ser cliente y servidor al mismo tiempo?',4);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El servidor puede solicitar algun recurso del cliente?',4);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El modelo cliente - servidor posee el protocolo: ',4);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El servidor puede atender a un unico cliente en un tiempo determinado?',4);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una caracteristica del cliente?',4);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una caracteristica del servidor?',4);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si en una peticion cliente - servidor se pierda conexion, Que puede ocurrir?',4);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En arquitectura P2P los nodos se comportan como: ',5); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La topologia de los nodos para la aplicacion P2P es:',5);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Como son llamados los nodos en P2P?',5);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si un nodo se cae en P2P que ocurre: ',5);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El modelo de arquitectura P2P es de tipo:',5);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no requiere de una red P2P?',5);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae un nodo mientras estaba enviando informacion. Que ocurre cuando se levanta?',5);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En una aplicacion P2P el metodo de comunicacion debe ser: ',5);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los nodos en P2P son dedicados?',5);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Administrar una red P2P en comparacion con el modelo cliente / servidor es:',5);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En java, que se requiere para crear un socket?',1); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El puerto al que se conecta el cliente es el mismo de respuesta del servidor?',1);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que se requiere para que un servidor pueda abrir un socket de escucha?',1);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se puede compartir puertos en un mismo host?',1);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que cantidad de procesos pueden enviar mensajes a un puerto?',1);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un protocolo para sockets?',1);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuantos puertos se encuentran disponibles en una maquina',1);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cierra el socket de escucha del servidor entonces:',1);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si en medio de una transferencia el socket se cierra, Que pasa con el recurso?',1);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se puede abrir un puerto varias veces en un mismo host?',1);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Como se llaman los objetos que brindan sus metodos a otros objetos?',6); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El objeto remoto debe ser instanciado antes de ser invocado?',6);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Aparte de una interfaz, Con que otra estructura se pueden invocar metodos remotos?',6);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La invocacion de metodos puede realizarse localmente?',6);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un identificador de los objetos remotos?',6);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se pueden tener objetos dentro de los objetos remotos?',6);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Como pueden ser llamados a los procesos que alojan objetos remotos?',6);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significan las siglas JVRMI?',6);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que se debe declarar antes de empezar a invocar metodos remotamente?',6);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Como se llama el protocolo utilizado por JRMI?',6);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual es la propiedad fundamental de todo grupo?',7); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un proceso puede ser miembro de varios grupos a la vez?',7);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un tipo de transmision?',7);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un tipo de grupo?',7);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En Uni-transmision, Que elementos no existen?',7);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En un grupo de companeros, Que ocurre si un proceso falla?',7);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los grupos jerarquicos poseen coordinador?',7);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si el emisor del grupo se cae, Que sucede?',7);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En los grupos de companeros, Quien toma las deciciones?',7);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si un proceso trabajador se cae, El grupo puede seguir funcionando?',7);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La sincronizacion de relojes debe ser absoluta segun Lamport?',8); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El orden en que ocurren los eventos es importante?',8);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significa la expresion a -> b?',8);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si A ocurre antes que B entonces el tiempo de A debe ser:',8);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El tiempo de los relojes siempre tiene que ir:',8);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuanto se debe sumar al hacer correciones al reloj?',8);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Una marca de reloj es:',8);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae el nodo que posee el mensaje con la marca actual ocurre:',8);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Las marcas de reloj se sincronizan solo si: ',8);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La hora exacta en la que fueron creados los procesos importa?',8);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En el algoritmo de Cristian, Quienes se quieren sincronizar?',9); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Quienes envian su hora actual?',9);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significa "o" en la formula del algoritmo de Cristian?',9);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significa la "p" en la formula del algoritmo de Cristian?',9);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'T0 tiene el valor de:',9);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'T1 tiene el valor de: ',9);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ocurre si al enviar el tiempo del cliente el servidor se cae?',9);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Es eficiente utilizar el algoritmo de Cristian en redes donde existe mucho retraso?',9);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuantos servidores se necesitan como minimo para la sincronizacion de relojes utilizando el algoritmo de Cristian?',9);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si no existe servidor, Es posible realizar la sincronizacion?',9);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El cliente envia la hora al servidor para sincronizarse?',10); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El servidor debe calcular la hora en base a:',10);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Al calcular la hora el servidor le indica a todos los nodos:',10);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que se requiere en el servidor para realizar el muestreo de las horas de los nodos constantemente?',10);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae el servidor ocurre:',10);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae un nodo cliente, Se pueden sincronizar los nodos restantes?',10);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual es el minimo de servidores necesarios para sincronizar los relojes mediante el algoritmo de Berkeley? ',10);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En el algoritmo de Berkeley el servidor es:',10);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si existe alta latencia entre el envio de la hora y la respuesta entonces:',10);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La cantidad de nodos clientes es relevante para sincronizarse con el servidor?',10);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'De que tipo es el algoritmo con promedio?',11); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los intervalos del algoritmo son de longitud:',11);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El cronometro es iniciado en: ',11);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Para obtener el tiempo en el nodo se calcula:',11);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El nodo al calcular su tiempo debe enviarselo a: ',11);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si el nodo no recibe el mensaje de los demas nodos entonces:',11);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae un nodo del sistema, Los demas nodos pueden sincronizarse? ',11);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Es necesario que exista un servidor central para controlar los relojes de cada nodo?',11);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El intervalo de sincronizacion puede: ',11);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae el nodo luego de enviar su tiempo entonces: ',11);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que se principalmente antes de acceder a una region critica en el algoritmo centralizado?',12); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Para que un proceso le envia mensajes al coordinador?',12);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si la region solicitada no se encuentra ocupada el coordinador envia al solicitante: ',12);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de sistema distribuido: Un proceso puede quedarse indefinidamente en una region critica?',12);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ocurre si el coordinador se cae?',12);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ocurre si se cae un nodo del sistema que no es coodinador?',12);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de sistema distribuido del algoritmo centralizado: Que ocurre si un nodo quiere acceder a una region critica ocupada?',12);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Puede existir mas de un coordinador en el algoritmo centralizado?',12);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que debe hacer el proceso al salirse de una region critica?',12);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se puede acceder a la region critica de un mismo nodo?',12);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Existe nodo coordinador en el algoritmo distribuido?',13); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Al solicitar acceder a una region critica se envia a si mismo la solicitud?',13);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se recibe un mensaje de solicitud de region critica y no se quiere entrar a ella se envia: ',13);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que contesta un nodo ocupando una region critica a los nodos que quieren acceder a ella ?',13);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si un nodo recibe una solicitud de region critica y este quiere acceder a ella entonces: ',13);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuando un proceso puede entrar a una region critica?',13);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ocurre cuando se termina de utilizar una region critica por un nodo?',13);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un nodo puede acceder a su propia region critica?',13);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos atributos no se envian al enviar el mensaje de solicitud de region critica a los demas nodos?',13);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae un nodo entonces:',13);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se requiere de un coordinador en el algoritmo de grandulon?',14); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuando el coordinador no responde que se debe hacer:',14);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se envia un mensaje de coordinador y nadie responde entonces:',14);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ocurre cuando alguien responde al mensaje de coordinador?',14);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En el algoritmo de grandulon: Gana siempre el proceso mayor?',14);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ocurre si se levanta un nodo que estaba inactivo?',14);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Todos los nodos en grandulon deben enviar mensajes de eleccion?',14);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae la red entre los nodos entonces: ',14);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual es el cantidad minima de nodos que deben existir para probar el algoritmo de grandulon?',14);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un nodo puede enviar un mensaje de eleccion a si mismo?',14);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los procesos deben conocer el orden del siguiente nodo?',15); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuando se envia el mensaje de eleccion?',15);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos se envia al enviar un mensaje de eleccion?',15);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se puede enviar el mensaje de eleccion a un nodo particular?',15);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se pierde la conexion entre dos nodos entonces: ',15);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que cantidad minima de nodos se requieren para utilizar el algoritmo de anillo?',15);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Al elegirse el coordinador se envia un mensaje: ',15);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de sistema distribuido del algoritmo de anillo: Que ocurre si se cae un nodo?',15);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuantos coordinador pueden existir en el sistema?',15);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que se requiere para enviar los mensajes de eleccion?',15);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Una falla no puede ser causada por:',16); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La disponibilidad se define por:',16);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significa confiabilidad?',16);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La seguridad ocurre cuando: ',16);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que es el mantenimiento?',16);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una clasificacion de tolerancia a fallas?',16);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Las fallas transitorias pueden ocurrir varias veces?',16);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Una falla permanente significa: ',16);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Las fallas intermitentes ocurren solo una vez?',16);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un tipo de falla?',16);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuantos procesos deben estar fucionando correctamente?',17); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que envian los nodos a los otros nodos en la aplicacion de fallas bizantinas?',17);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Al recibir el resultado de los demas nodos  se almacena en:',17);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El vector de un nodo se transfiere a los demas incompleto?',17);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se reciben los demas vectores entonces: ',17);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Como se marca el elemento que no posee mayoria?',17);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae un nodo en la aplicacion de fallas bizantinas entonces: ',17);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae la red entonces: ',17);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El proceso infectado puede enviar un mismo valor a dos procesos?',17);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de fallas bizantinas: Cuantos nodos pueden estar infectados?',17);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El modelo de acceso remoto ofrece acceso a un sistema de archivo gestionado por un servidor local?',18); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los clientes conocen la ubicacion de los archivos?',18);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'A traves de que mecanismo se interactua con el sistema de archivos? ',18);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de modelo acceso remoto: Se puede escribir en el archivo en cualquier momento?',18);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de modelo acceso remoto: Se puede eliminar el archivo?',18);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae el servidor entonces: ',18);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de modelo acceso remoto: Dos nodos pueden escribir al mismo tiempo en el archivo?',18);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ventaja proporciona el modelo acceso remoto?',18);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El requiere de espacio en el disco para escribir en el archivo?',18);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de modelo acceso remoto: Se puede leer el archivo desde dos nodos al mismo tiempo?',18);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El cliente puede escribir en el archivo?',19); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Al terminar con el archivo que se debe hacer?',19);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Dos clientes pueden acceder al mismo archivo?',19);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El acceso del archivo se realiza en el cliente o en el servidor?',19);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El servidor envia una copia del archivo o envia el archivo original?',19);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Si se cae el servidor entonces: ',19);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El servidor debe poder escribir o leer en el archivo?',19);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El cliente debe poseer espacio suficiente para alojar el archivo descargado?',19);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Supongamos que tenemos un archivo muy grande y que el cliente desea leer su contenido, Que modelo es mas eficiente?',19);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'A nivel del servidor, Cual modelo es mas complicado de implementar?',19);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual es la idea basica en los sistemas de archivo basados en cluster?',20); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que tipo de estructura se requiere para almacenar los archivos?',20);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuando la distribucion de archivos no es una manera efectiva?',20);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es un tipo distribucion de archivos?',20);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de sistemas de archivos basados en cluster: Cual de los dos es mas rapido: Archivo por partes o archivo completo?',20);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de sistemas de archivos basados en cluster: Si se cae uno de los servidores entonces: ',20);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Es necesario dividir un archivo pequeno y distribuirlo en los nodos? ',20);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La transferencia del archivo por partes se ejecuta en paralelo?',20);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que ocurre si la red falla mientras se transfiere los archivos?',20);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual es el minimo de servidores que deben existir para que se pueda dividir un archivo en partes?',20);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significa las siglas DNS?',21); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El DNS posee una estructura de tipo:',21);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La principal funcion de los DNS es:',21);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un servidor DNS posee: ',21);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El uso mas comun de los DNS es:',21);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Para que se usaba el archivo hosts en las maquinas?',21);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un componente de DNS: ',21);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un tipo de servidor DNS: ',21);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la aplicacion de DNS: Que ocurre si se cae el servidor?',21);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Por lo general Cuantos DNS se tienen configurado en las computadoras?',21);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significan las siglas de LDAP?',22); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'LDAP es:',22);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'LDAP permite el acceso a un servicio de directorio ordenado y centralizado para buscar informacion?',22);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'LDAP es considerado una base de datos?',22);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que es un directorio?',22);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un directorio no posee:',22);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El puerto por defecto en LDAP es:',22);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una operacion de LDAP?',22);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Una entrada consta de:',22);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Las entradas poseen un identificador unico?',22);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una caracteristica fundamental de un objeto?',23); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los metodos de un objeto se ponen a traves de: ',23);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que es el proxy en objetos distribuidos?',23);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El skeleton es:',23);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un tipo de invocacion?',23);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En las invocaciones dinamicas se requiere conocer la interfaz del objeto? ',23);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En la invocacion estatica si se cambian las interfaces entonces: ',23);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'La clonacion de un objeto remoto local se traduce en: ',23);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Clonar objetos en objetos distribuidos es:',23);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los parametros en RMI deben ser serializables?',23);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Un objeto EJB es: ',24); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El servidor debe permitir separar la funcionalidad de la aplicacion de la funcionalidad orientada al sistema?',24);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una operacion valida de los servidores de EJB?',24);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un servicio en EJB?',24);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un tipo de EJB?',24);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un tipo de Bean de sesion?',24);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una forma de acceder a un bean con sesion?',24);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'En los beans de sesion sin estado se almacenan datos especificos obtenidos durante la conexion con el cliente?',24);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se pueden acceder concurrentemente a los objetos almacenados en beans sin estado?',24);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los EJB dirigidos por mensajes utilizan _____ para el envio de mensajes',24);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Las siglas WSDL significan?',25); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El  WSDL es una interfaz: ',25);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Para que se utiliza la interfaz WSDL?',25);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cuantas secciones posee el documento WSDL?',25);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significan las siglas SOAP?',25);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estos no es un elemento de los mensajes SOAP?',25);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'El servicio expone su funcionalidad similar a:',25);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los desarrolladores deben formar su propio vocabulario de nombres y verbos?',25);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Se requiere que los clientes posean el WSDL para realizar las peticiones?',25);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no puede ser un tipo de peticion valida en SOAP?',25);/*10*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Que significan las siglas REST?',26); /*1*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'REST es una tecnica de:',26);/*2*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Las peticiones REST se hacen a traves de: ',26);/*3*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'REST es un protocolo:',26);/*4*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Cual de estas no es una operacion definida en REST?',26);/*5*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los recursos en REST se identifican a traves de:',26);/*6*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Como se navega  entre los recursos REST?',26);/*7*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Los recursos poseen su propio identificador?',26);/*8*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Existen operaciones FIND en http?',26);/*9*/
INSERT INTO PREGUNTAS (ID,ENUNCIADO,ID_TOPICO) 
VALUES(S_PREGUNTAS.NEXTVAL,'Una peticion GET en REST solo puede devolver un valor?',26);/*10*/





INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Dos maquinas se encienden al mismo tiempo',1,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En el servidor se habilita el servicio de FTP',1,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se cae un nodo',1,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Falla la conexion de red',1,NULL);/*4*/
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
VALUES (S_RESPUESTAS.NEXTVAL,'Cantidad de procesos en una maquina',3,NULL);/*2*/
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
VALUES (S_RESPUESTAS.NEXTVAL,'Es imposible que se cierre el socket',49,NULL);/*4*/
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
VALUES (S_RESPUESTAS.NEXTVAL,'Servidor',81,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cliente',81,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',81,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',81,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor',82,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente',82,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',82,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',82,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Origen',83,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Orden',83,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distancia maxima',83,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cantidad de alejamiento maxima',83,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Particularidad',84,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tasa de periodo maximo',84,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tasa de alejamiento maximo',84,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tasa de tiempo maximo',84,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tiempo inicial del servidor',85,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tiempo inicial del algoritmo',85,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tiempo inicial del cliente',85,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',85,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tiempo inicial del servidor',86,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tiempo final del servidor',86,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tiempo inicial del cliente',86,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Tiempo final del cliente',86,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente se sincroniza con una hora aleatoria',87,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor antes de caerse envia su hora',87,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente no necesita sincronizarse',87,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente no se sincroniza',87,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, debido a que la sincronizacion no tiene nada que ver con la red',88,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, debido a que a mayor retraso en la red mayor sera la diferencia horaria entre el cliente y el servidor',88,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La red no tiene nada que ver con la sincronizacion',88,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',88,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',89,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',89,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',89,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas de 2',89,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',90,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',90,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',90,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',90,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',91,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',91,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',91,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',91,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El tiempo en que tardo recibir todas las horas',92,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El tiempo de respuesta del ultimo nodo',92,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El promedio de los tiempos recibidos',92,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La primera hora recibida',92,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Avanzar su reloj',93,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Retroceder su reloj',93,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Avanzar o retroceder su reloj, dependiendo del caso',93,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nada',93,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un nodo especial',94,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mucho procesador',94,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Gran cantidad de memoria ram',94,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un demonio',94,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los clientes no pueden sincronizar sus horas',95,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La sincronizacion continua',95,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',95,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La sincronizacion no depende del servidor',95,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si porque la sincronizacion se puede realizar con los nodos activos',96,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, se necesitan todos los nodos para sincronizar los relojes',96,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si porque el nodo ya habra enviado su hora',96,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',96,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',97,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',97,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',97,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas de 2',97,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Activo',98,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Pasivo',98,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',98,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',98,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La sincronizacion es efectiva',99,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La sincronizacion es ineficiente',99,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',99,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La sincronizacion no depende de la red',99,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',100,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',100,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',100,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',100,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Centralizado',101,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Activo',101,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Pasivo',101,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Descentralizado',101,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Fija',102,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Variable',102,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Intermedia',102,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',102,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nodo siguiente',103,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nodo anterior',103,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor',103,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nodo actual',103,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El numero de nodos',104,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El ultimo tiempo obtenido',104,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El promedio obtenido',104,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',104,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A los otros nodos',105,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A un servidor central',105,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A un cliente externo',105,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',105,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No puede sincronizarse',106,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',106,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es indiferente',106,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se sincroniza de igual forma',106,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, se requieren todos los nodos',107,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si porque se saca el promedio con los relojes recibidos',107,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es imposible que se caiga un nodo',107,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',107,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, debido que asi hubiera mejor control en el sistema',108,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No porque cada nodo es independiente',108,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',108,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',108,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Modificarse en cualquier momento',109,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Retrasarse por la red',109,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Enviarse a los demas nodos',109,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',109,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los demas nodos no pueden sincronizarse',110,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada en los demas nodos',110,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los nodos empiezan a enviar peticiones al nodo caido',110,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se caen los demas nodos',110,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que exista un coordinador',111,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que los nodos no se caigan',111,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',111,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',111,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para conocer la hora actual',112,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para solicitar la presencia de un nuevo nodo',112,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para enviar un mensaje de alerta',112,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para solicitar acceso a una region critica de un nodo',112,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Su direccion IP',113,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Su hora actual',113,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un mensaje de negacion',113,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un mensaje de aprobacion',113,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, hasta que se retire',114,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, tiene un limite maximo',114,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',114,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',114,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los procesos no pueden acceder a las regiones criticas',115,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los procesos pueden seguir accediendo a las regiones criticas',115,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El coordinador nunca se cae',115,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',115,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No funciona el coordinador',116,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se puede acceder a la region critica del nodo caido',116,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Colapsa el sistema',116,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se desconectan los demas nodos',116,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor no responde a la solicitud',117,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor reenvia el mensaje a otro nodo',117,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor responde con un mensaje de negacion',117,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se cae la red',117,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',118,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',118,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',118,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',118,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Notificarle a los demas nodos',119,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Notificarle al coordinador',119,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No hacer nada',119,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',119,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',120,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',120,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',120,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',120,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',121,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',121,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Varios coordinadores',121,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',121,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',122,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',122,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se envia al coordinador',122,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',122,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Negado',123,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Aprobado',123,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ok',123,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se envia nada',123,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Region negada',124,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ocupada',124,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Aprobada',124,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se envia nada',124,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se envia negacion',125,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se aprueba la solicitud',125,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se compara la hora del nodo recibido con la actual para decidir quien entra',125,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',125,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuando el coordinador lo indique',126,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuando se reciba aprobacion por otro nodo',126,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuando se reciba la misma cantidad de Ok que nodos en el sistema',126,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Siempre se puede acceder',126,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nodo se cae',127,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se envia Ok al siguiente nodo en el sistema',127,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se envia Ok al siguiente nodo de la lista',127,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se colapsa el sistema',127,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',128,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',128,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',128,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',128,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Hora',129,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Numero de proceso',129,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nombre de la region critica',129,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Direccion IP',129,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los demas procesos no pueden hacer solicitudes de region critica',130,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se envian solicitudes a los nodos restantes',130,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',130,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',130,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',131,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',131,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',131,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',131,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Enviar un mensaje al servidor',132,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Enviar un mensaje  de alerta a los demas nodos',132,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Enviar un mensaje de eleccion',132,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se debe hacer nada',132,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se debe enviar nuevamente el mensaje',133,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',133,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nodo gana y envia a los demas diciendo que es coordinador',133,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',133,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Termina el trabajo del nodo que envio el mensaje',134,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se debe enviar nuevos mensajes de eleccion',134,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se caen los nodos',134,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',134,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, siempre ',135,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No neceesariamente',135,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Puede ganar cualquier proceso',135,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',135,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El nodo se convierte en coordinador',136,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Envia mensaje de coordinador',136,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Envia mensaje de eleccion',136,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',136,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, para conocer quienes son los mayores a ellos',137,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, solo un nodo envia el mensaje y espera por las respuestas',137,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se debe enviar mensajes',137,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',137,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No es posible enviar mensajes de eleccion o coordinador',138,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Solo se puede enviar mensajes de eleccion',138,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Solo se puede enviar mensajes de coordinador',138,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',138,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',139,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',139,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',139,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'3',139,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',140,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',140,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',140,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',140,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',141,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',141,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es indiferente',141,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',141,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Al iniciarse un nodo particular',142,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuando se cae la red',142,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuando lo solicite un nodo especifico',142,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuando no responde el coordinador',142,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Numero de proceso',143,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Direccion IP de la maquina',143,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nombre del usuario',143,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Nombre de aplicacion',143,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',144,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',144,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',144,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',144,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se envia el mensaje de eleccion o coordinador a traves de los nodos restantes',145,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No es posible enviar el mensaje de eleccion o coordinador',145,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',145,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',145,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',146,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',146,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',146,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'3',146,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mensaje de solicitud',147,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mensaje de aviso',147,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mensaje de alerta',147,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mensaje coordinador',147,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se puede seguir eligiendo coordinador ',148,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se puede enviar el mensaje de coordinador',148,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',148,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',148,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',149,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',149,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',149,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas de 2',149,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Saber quien es el siguiente nodo',150,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Conocer el coordinador',150,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Conocer el servidor central',150,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Conocer la cantidad de nodos',150,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un error de fabricacion',151,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un error de programacion',151,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Error del usuario',151,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Error de los astros',151,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Estar siempre conectado a la red',152,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Estar siempre en contacto con un servidor central',152,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Estar listo para ser utilizado al momento',152,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Estar listo para desastres',152,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que el sistema confie en los demas nodos',153,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que exista un unico usuario confiable',153,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que exista una red segura en los nodos',153,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que el sistema funcione sin fallar continuamente',153,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuando se vigilan los nodos',154,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un nodo se cae',154,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada durante largo periodo de tiempo luego de haberse caido un nodo',154,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La red deja de funcionar',154,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que tan facil es de danar el sistema',155,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que tan facil es desconectar un nodo',155,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que tan facil es arreglar un sistema que fallo',155,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',155,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Fallas transitorias',156,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Fallas intermitentes',156,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Fallas centralizadas',156,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Fallas permanentes',156,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',157,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',157,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',157,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',157,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que el sistema no puede operar indefinidamente',158,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que el sistema no puede operar indefinidamente hasta arreglar la falla',158,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Que el sistema puede operar aunque posea la falla',158,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',158,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',159,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',159,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',159,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',159,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Falla de congelacion',160,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Falla de omision',160,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Falla de tiempo',160,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Falla de red',160,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2 + k procesos',161,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'k + 1 procesos',161,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2k procesos',161,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2k + 1',161,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Numero aleatorio',162,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Su numero de nodo',162,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Numero de nodos adyacentes',162,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Numero de nodos defectuosos',162,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En una lista',163,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En disco',163,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En un archivo',163,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'En un vector',163,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',164,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',164,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',164,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',164,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se termina el algoritmo',165,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se envia UNKNOWN',165,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se compara cada casilla y se verifica si el valor tiene mayoria o no',165,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',165,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'NULL',166,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'X',166,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'KNOWN',166,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'UNKNOWN',166,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',167,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se puede comprobar el algoritmo de fallas bizantinas',167,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',167,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',167,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'La red no puede caerse',168,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los nodos quedan incomunicados',168,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',168,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',168,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',169,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',169,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',169,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',169,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',170,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',170,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'3',170,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'4',170,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',171,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',171,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',171,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',171,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',172,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',172,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',172,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',172,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A traves de una lista de archivos',173,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A traves de un proceso especial',173,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A traves de una interfaz',173,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se requiere de un mecanismo',173,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',174,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',174,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',174,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',174,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',175,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',175,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',175,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',175,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El acceso al archivo no se ve afectado',176,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se puede acceder al archivo',176,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',176,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor no se puede caer ',176,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',177,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',177,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',177,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',177,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El archivo no requiere ser enviado al cliente para escribir en el',178,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se requiere de otro servidor',178,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cada cliente puede copiar el archivo',178,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',178,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, debido a que debe recibir el archivo primero',179,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ya que el archivo nunca se envia',179,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No porque el cliente no debe escribir en el archivo',179,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',179,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',180,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',180,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',180,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',180,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, en todo momento',181,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, solo hasta que descargue el archivo',181,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',181,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',181,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se debe eliminar el archivo',182,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se debe subir el archivo',182,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se debe hacer nada',182,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',182,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, en cualquier momento',183,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Solo si el primero subio el archivo al servidor',183,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Solo si ambos clientes se encuentran conectados',183,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, no se puede',183,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cliente',184,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Servidor',184,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',184,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',184,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Envia una copia',185,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Envia el archivo original',185,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',185,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',185,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se continua accediendo al archivo',186,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se puede cargar ni descargar el archivo ',186,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',186,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El servidor nunca se cae',186,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',187,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',187,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',187,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',187,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',188,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',188,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',188,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',188,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Acceso Remoto',189,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Carga y Descarga',189,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',189,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',189,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Acceso Remoto',190,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Carga y Descarga',190,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',190,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',190,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distribuir muchos archivos en cada computador',191,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distribuir un archivo muy grande en un computador',191,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distribuir un archivo muy grande en varios computadores',191,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No existe idea basica',191,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una estructura regular, como una matriz por ejemplo',192,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una estructura irregular',192,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una de tipo arreglo',192,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',192,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para aplicaciones de tipos irregulares o muchos tipos de estructuras',193,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para todas las aplicaciones',193,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para las que son de gran tamano',193,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguna de las anteriores',193,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distribucion de archivos completos',194,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Fragmentacion de archivos para acceso paralelo',194,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distribucion normal de archivos',194,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',194,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Archivo completo',195,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Archivo por partes',195,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',195,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos son rapidos',195,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se puede recuperar los archivos',196,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Los archivos se pueden seguir obteniendo',196,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',196,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',196,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, para acotar tiempo de respuesta',197,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No porque la idea es tener archivos grandes',197,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',197,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',197,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',198,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',198,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',198,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',198,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El archivo no se logra enviar correctamente',199,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El archivo se transfiere aunque no exista red',199,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',199,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',199,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',200,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',200,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'3',200,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas de 3',200,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Domain Non Server',201,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Domain Name Server',201,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Domain Name Service',201,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Domain Named Services',201,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Lineal',202,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Circular',202,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Jerarquica',202,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No posee estructura',202,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Guardar datos',203,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Controlar clientes',203,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Traducir los nombres de paginas',203,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',203,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Muchos usuarios',204,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Gran cantidad de operaciones',204,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una base de datos jerarquica',204,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',204,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Traducir nombres de usuarios',205,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Traducir nombres de servicios',205,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Traducir nombres de dominios ',205,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Traducir nombre de servidores',205,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para guardar informacion del usuario',206,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para guardar informacion acerca de la red',206,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para guardar informacion de la maquina',206,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para guardar informacion acerca de los nombres de los servidores',206,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Clientes DNS',207,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Servidores DNS',207,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Coordinadores DNS',207,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Zonas de autoridad',207,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Preferidos',208,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Alternativos',208,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Locales o cache',208,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Distribuidos',208,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'El cliente puede seguir consultando por el ip de un dominio',209,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No se puede consultar por un dominio',209,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',209,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',209,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',210,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1',210,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2',210,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas de 2',210,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Lightweight Directory Advanced Protocol',211,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Lightweight Directory Access Profile',211,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Lightweight Database Access Protocol',211,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Lightweight Directory Access Protocol',211,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un protocolo de servicios de directorios cliente - servidor ',212,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un protocolo de servicios de directorios cliente - cliente',212,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un protocolo de servicios de directorios servidor - servidor',212,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',212,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',213,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',213,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',213,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',213,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, porque almacena informacion que posteriormente puede ser consultada',214,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No debido a que no es posible realizar las operaciones CRUD en el',214,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No porque no posee tablas ni estructura',214,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',214,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es una estructura fisica que almacena informacion',215,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es una estructura logica que almacena datos de otros servidores',215,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es una estructura logica que almacena datos de usuarios principalmente',215,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es una estructura fisica que almacena informacion de usuarios principalmente',215,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Atributos',216,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Clases',216,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Sufijos',216,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Informacion de red',216,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'TCP 399',217,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'UDP 389',217,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'TCP 389',217,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'UDP 389',217,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Modify',218,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Add',218,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Delete',218,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Create',218,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un conjunto de nodos',219,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un conjunto de directorios',219,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un conjunto de claves',219,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un conjunto de puertos',219,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',220,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',220,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',220,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',220,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Encapsular datos',221,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Operaciones incluidas dentro de ellos',221,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Pueden existir varios iguales',221,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',221,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una interfaz',222,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una clase abstracta',222,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una clase hereditaria',222,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',222,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una capa para bloquear algunos componentes',223,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una especie de cortafuego',223,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una implementacion de la interfaz',223,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',223,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es la plantilla de la interfaz ',224,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Es la plantilla de codigo',224,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No existe skeleton',224,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',224,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Invocacion estatica',225,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Invocacion dinamica',225,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Invocacion automatica',225,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',225,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',226,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',226,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',226,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',226,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se debe cambiar la interfaz del cliente',227,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Se debe cambiar la interfaz del servidor',227,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No ocurre nada',227,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',227,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Crear un nuevo objeto con un estado distinto ',228,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Utilizar el mismo objeto y el mismo estado',228,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Crear un nuevo objeto con el mismo estado',228,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Utilizar el mismo objeto con un estado distinto',228,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas facil',229,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Igual',229,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Mas complejo',229,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',229,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',230,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',230,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',230,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',230,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un objeto JAVA alojado en un cliente especial',231,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un objeto JAVA alojado en un servidor especial',231,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una clase JAVA alojada en un cliente especial',231,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Una clase JAVA alojada en un servidor especial',231,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',232,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',232,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',232,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',232,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Buscar Objetos',233,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Transferir Objetos',233,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Guardar Objetos',233,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Permitir que los objetos formen parte de una transaccion',233,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JMS',234,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JNDI',234,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JDBC',234,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JLOG',234,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Beans de sesion',235,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Beans dirigidos por mensajes',235,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Beans de invocacion',235,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',235,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Con estado (stateful)',236,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Sin estado (stateless)',236,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Singleton',236,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Full Singleton',236,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Interfaz local',237,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Interfaz remota',237,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Interfaz distribuida',237,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Sin interfaz',237,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',238,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',238,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',238,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',238,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',239,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',239,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',239,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',239,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JRMI',240,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JMS',240,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JLOG',240,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'JUNIT',240,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Web Services Description Language ',241,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Web Service Database Language',241,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Web Service Description Limited',241,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Web Service Database Limited',241,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'TXT',242,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'XML',242,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'SH',242,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'EXE',242,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para buscar un usuario',243,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para buscar una direccion ip',243,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para buscar un servicio ',243,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Para buscar un servidor',243,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'0',244,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'1: Interfaz',244,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'2: Interfaz, implementacion',244,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'3: Interfaz, atributos, implementacion',244,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Simple Object Access Profile',245,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Simple Object Advanced Protocol',245,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Simple Objected Access Protocol',245,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Simple Object Access Protocol',245,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Sobre o envoltura SOAP',246,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Encabezado SOAP',246,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Atributos SOAP',246,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Cuerpo SOAP',246,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'LDAP',247,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'RMI',247,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'DNS',247,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Sockets',247,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',248,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',248,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',248,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',248,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, para conocer los metodos',249,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, debido a que el servicio esta en el servidor, solo hay que llamarlo',249,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',249,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',249,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Stateless Request',250,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Http Request',250,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Stateful Request',250,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',250,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Representational State',251,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Representational State Transfered',251,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Rested State Transfer',251,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Representational State Transfer',251,'SI');/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Arquitectura de Software',252,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Programacion Web',252,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Diseno Web',252,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',252,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'XML y TCP',253,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'TXT y HTTP',253,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'XML y HTTP',253,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'TXT y TCP',253,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Con estado',254,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Sin estado',254,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ambos',254,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Ninguno',254,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'POST',255,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'GET',255,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'INSERT',255,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'DELETE',255,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Un nombre comun',256,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Hash MD5',256,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'URI',256,'SI');/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',256,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A traves de archivos',257,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A traves de enlances',257,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'A traves de mensajes',257,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',257,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si',258,'SI'); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No',258,NULL);/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',258,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',258,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, para permitir buscar un recurso particular',259,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, no existe esa operaciones',259,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',259,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',259,NULL);/*4*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'Si, solo el registro asociado a la peticion',260,NULL); /*1*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'No, puede delvolver varios registros dependiendo de la consulta',260,'SI');/*2*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'N/A',260,NULL);/*3*/
INSERT INTO RESPUESTAS (ID,OPCION,ID_PREGUNTA,CORRECTA)
VALUES (S_RESPUESTAS.NEXTVAL,'-',260,NULL);/*4*/



















































































































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
