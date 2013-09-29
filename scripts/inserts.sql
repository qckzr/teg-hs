/* USUARIOS */

INSERT INTO USUARIOS (ID,NOMBRE,APELLIDO,CORREO,CONTRASENA)
VALUES (S_USUARIOS.NEXTVAL,'Hector','Sam','hfsam88@gmail.com','holamund0');

/* USUARIOS */

/* NODOS */

INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.0.191','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.0.192','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.0.193','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.0.194','pi','raspberry');
INSERT INTO NODOS (ID,IP,NOMBRE_USUARIO,CONTRASENA)
VALUES (S_NODOS.NEXTVAL,'192.168.0.201','hector','asdasd');

/* NODOS */

/* TOPICOS */


INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Sockets','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un concepto abstracto por el cual dos programas (posiblemente situados en computadoras
distintas) pueden intercambiarse cualquier flujo de datos, generalmente de manera fiable y ordenada.
Un socket queda definido por una direccion IP, un protocolo y un numero de puerto.',1,'images/topicos/socket.png');/* 1 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Caracteristicas de los Sistemas Distribuidos','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Las caracteristicas principales responsables de la utilidad de los sistemas distribuidos:
1. Comparticion de Recursos: Los recursos en un sistema distribuido estan fisicamente encapsulados en una de las computadoras y solo pueden ser accedidos por otras computadoras mediante las comunicaciones (la red).
Los usuarios de los recursos se comunican con los gestores de los recursos para acceder a los recursos compartidos del sistema. Esta perspectiva nos lleva a dos modelos de sistemas distribuidos: el modelo CLIENTE-SERVIDOR y el modelo BASADO EN OBJETOS
2. Apertura (opennesss): Se determina primariamente por el grado hacia el que nuevos servicios de comparticion de recursos se pueden anadir sin perjudicar ni duplicar a los ya existentes.
3. Concurrencia: En los sistemas distribuidos hay muchas maquinas, cada una con uno o mas procesadores. Es decir, si hay M ordenadores en un sistema distribuido con un procesador cada una entonces hasta M procesos pueden estar ejecutandose en paralelo..
Casos en que se puede presentar una ejecucion en paralelo: 
Muchos usuarios interactuan simultaneamente con programas de aplicacion - Muchos procesos servidores se ejecutan concurrentemente, cada uno respondiendo a diferentes peticiones de los procesos clientes.
4. Escalabilidad: Tanto el software de sistema como el de aplicacion no deberian cambiar cuando la escala del sistema se incrementa. La necesidad de escalabilidad no es solo un problema de prestaciones de red o de hardware, sino que esta intimamente ligada con todos los aspectos del diseño de los sistemas distribuidos. El diseño del sistema debe reconocer explicitamente la necesidad de escalabilidad o de lo contrario apareceran serias limitaciones
5. Tolerancia a fallos: El diseño de sistemas tolerantes a fallos se basa en dos cuestiones, complementarias entre si: 
- Redundancia hardware (uso de componentes redundantes) .
- Recuperacion del software (diseño de programas que sean capaces de recuperarse de los fallos).
6. Transparencia:se define como la ocultacion al usuario y al programador de aplicaciones de la separacion de los componentes de un sistema distribuido, de manera que el sistema se percibe como un todo, en vez de una coleccion de componentes independientes
',1,NULL); /* 2 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Desafios de los Sistemas Distribuidos','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','1. Seguridad: La seguridad de los recursos de informacion tiene tres componentes:
Confidencialidad: proteccion contra el descubrimiento por individuos no autorizados.
Integridad: proteccion contra la alteracion o corrupcion.
Disponibilidad: proteccion contra interferencia con los procedimientos de acceso a los recursos
2. Escalabilidad:Se dice que un sistema es escalable si conserva su efectividad cuando ocurre un incremento significativo en el numero de recursos y el numero de usuarios
3. Tratamiento a fallos: Los fallos en un sistema distribuido son parciales; es decir, algunos componentes fallan mientras otros siguen funcionando.
 Deteccion de fallos: checksum para mensajes.
 Enmascaramiento de fallos: algunos fallos que han sido detectados pueden ocultarse.
 Recuperacion frente a fallos: rollback.
 Redundancia.
4. Concurrencia: Es la posibilidad de que varios clientes intenten acceder a un recurso compartido a la vez.
Para que un objeto sea seguro en un entorno concurrente, sus operaciones deben sincronizarse de forma que sus datos permanezcan consistentes. Esto puede lograrse mediante el
empleo de tecnicas conocidas como los semaforos, que se usan en la mayoria de los sistemas operativos.
5. Transparencia: De acceso, de ubicacion, de concurrencia, replicacion, frente a fallos, movilidad.
',1,NULL); /* 3 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitecturas: Cliente / Servidor','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Cliente: Proceso que solicita un servicio.
Servidor: Proceso que implementa un servicio',1,'images/topicos/arquitectura_cliente_servidor.png'); /* 4 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitecturas: Punto a Punto (P2P)','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Se caracteriza por una distribucion horizontal de los nodos.
Todos los nodos que constituyen la arquitectura son cliente y servidor a la vez (esto tambien se le denomina sirviente).
',1,'images/topicos/p2p.png'); /* 5 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'RMI','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un objeto en un proceso puede invocar un objeto en otro
proceso que puede estar ubicado en otra maquina.
Los objetos que brindan sus metodos a otros objetos de otros procesos, reciben el nombre de Objetos Remotos.
Los procesos que alojan objetos remotos pueden ser referidos como servidores y los procesos que alojan objetos que invocan metodos de objetos remotos
pueden llamarse clientes.
Requisitos basicos:
1. Un objeto remoto debe ser primero instanciado.
2. Un objeto remoto debe tener un identificador unico asociado.
3. Debe existir un modulo en el servidor que se encargue de crear una identificacion unica para un objeto.
4. Los clientes deben poder acceder a la identificacion unica del objeto remoto.
5. Los clientes deben estar enterados de los metodos que pueden ser invocados en el objeto remoto.
6. Debe existir un modulo que se encargue de manejar la comunicacion entre un cliente y un servidor.
7. Debe existir un modulo o varios que pueda(n) realizar la conversion de datos (marshall y unmarshall).

',1,'images/topicos/rmi.png'); /* 6 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Comunicacion en grupo','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un grupo es una coleccion de procesos que actuan juntos en un sistema o alguna forma determinada por el usuario.
La propiedad fundamental de todos los grupos es que cuando un mensaje es enviado a este, todos los miembros de el lo reciben.
Los grupos son dinamicos. Se pueden crear nuevos y destruir grupos anteriores. Un proceso se puede unir a un grupo o dejar otro. Un proceso puede ser miembro de varios grupos a la vez.
Transmision:
Multi-transmision. Cuando  un mensaje enviado a una direccion especial de red llega a ciertas maquinas.
Transmision simple. Cuando los paquetes que tienen ciertas direccion (Ej. 0) se entregan a todas la maquinas.
Uni-transmision. El envio de mensajes de un emisor a un receptor.

',1,NULL); /* 7 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Logicos: Algoritmo de Lamport','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','La sincronizacion de relojes no tiene que ser absoluta. Si dos procesos no interactuan, no es necesario que sus relojes esten sincronizados, puesto que la carencia de sincronizacion no seria observable y por tanto no podria provocar problemas. Lo que realmente
importa es el orden en que ocurren los eventos. Tanenbaum, 1996.
- La expresion a->b se lee: a ocurre antes de b
- Si a->b <=> C(a) < C(b)
- El tiempo del reloj, C, siempre debe ir hacia delante y nunca hacia atras. Se pueden hacer correcciones al tiempo al sumar un valor positivo al reloj.
Condiciones clave:
1. Si a ocurre antes de b en el mismo proceso, C(a) < C(b)
2. Si a y b son el envio y la recepcion de un mensaje, C(a) < C(b)
3. Para todos los eventos a y b, C(a) != C(b)

',1,NULL); /* 8 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Fisicos: Algoritmo de Cristian','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','Adecuado para sistemas donde una de las maquinas es servidor del tiempo y el resto debe sincronizarse.
1. En forma periodica, en un tiempo que no debe ser mayor de o/2p segundos, cada maquina envia un mensaje al servidor para solicitar el tiempo actual. Donde o es la cantidad de alejamiento maxima deseada y p la tasa maxima de alejamiento (especificada por el fabricante).
2. El tiempo de propagacion del mensaje puede ser estimado para conseguir un calculo mas preciso.
3. La correccion por el tiempo del servidor y el tiempo de transmision se hace midiendo en el emisor: El tiempo inicial (envio) T0. El tiempo final (recepcion) T1. Ambos tiempos se miden con el mismo reloj.
4. El tiempo de propagacion del mensaje sera (T1 - T0) / 2. Si el tiempo del servidor para manejar la interrupcion y procesar el mensaje es I: El tiempo de propagacion sera (T1 - T0 - I) / 2.
5. El tiempo de propagacion se suma al tiempo del servidor para sincronizar al emisor cuando este recibe la respuesta
        

',1,NULL); /* 9 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Fisicos: Algoritmo de Berkeley','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1. En este caso, el servidor de tiempo es un demonio para el tiempo que realiza un muestreo periodico del tiempo de todas las maquinas.
2. Con base en las respuestas obtenidas, calcula un tiempo promedio y le indica a todas las demas maquinas que avancen su reloj a la nueva hora o que disminuyan la velocidad del mismo hasta lograr cierta reduccion especifica.
',1,NULL); /* 10 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Fisicos: Algoritmo con promedio (Distribuido)','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1. El i-esimo intervalo inicia en To+iR y va hasta To+(i+1)R, donde To es un momento ya acordado en el pasado y R es un parametro del sistema.
2. Al inicio de cada intervalo, cada maquina transmite el valor actual del tiempo segun su reloj.
3. Luego, cada maquina inicia un cronometro local para reunir las demas transmisiones que lleguen en un cierto intervalo S.
4. En base a los resultados obtenidos, es establecido como tiempo local el promedio de todas las respuestas obtenidas.
',1,NULL); /* 11 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Exclusion Mutua: Algoritmo Centralizado','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1. Se escoge un coordinador.
2. Cada vez que un proceso desea acceder a una seccion critica, envia un mensaje al coordinador pidiendole permiso.
3. En caso de que la region no se encuentre ocupada por otro proceso, el coordinador le envia al proceso solicitante un mensaje de aprobacion.
4. En caso contrario, simplemente no se envia nada o se envia un mensaje de negacion.
',1,NULL); /* 12 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Exclusion Mutua: Algoritmo Distribuido (Ricart y Agrawala)','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1.Requiere de la existencia de un orden total de todos los eventos en el sistema.
2. Cuando un proceso desea acceder a una region critica envia a todos los procesos (incluyendolo a el mismo) un mensaje de solicitud con el nombre de la region, su numero de proceso y la hora actual.
3. Cuando un proceso recibe un mensaje de solicitud de otro proceso puede ocurrir lo siguiente:
Si el receptor no esta en la region critica y no desea entrar a ella, envia de regreso un mensaje de OK al emisor.
Si el receptor esta en la region critica, no responde y forma la solicitud en una fila.
Si el receptor no esta en la region critica pero desea entrar a ella, este compara la marca de tiempo del mensaje recibido con la de su mensaje de solicitud, si la marca del emisor es menor, este envia un mensaje de OK, en caso contrario, forma la solicitud en una fila y no envia nada.
4. Cuando un proceso obtiene tantos mensaje de OK como procesos en el sistema, este puede acceder a la region critica.
5. Cuando el proceso en la region critica termina su trabajo, envia un mensaje de OK al proximo proceso en su cola de solicitudes.
',1,NULL); /* 13 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Algoritmo de Seleccion: Gradulon','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1.Un proceso cualquier P envia un mensaje de ELECCIoN a los demas procesos mayores que el.
2.Si nadie responde, P gana la eleccion y se convierte en coordinador, por lo que envia un mensaje a todos los procesos menores de COORDINADOR.
3.Si uno de los procesos mayores que P responde, el trabajo de P ha terminado.
',1,NULL); /* 14 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Algoritmo de Seleccion: Anillo','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS',
'1. Cada proceso conoce el orden del resto de los procesos en el sistema.
 2. Cuando uno de los procesos ve que el coordinador no funciona, construye un mensaje de ELECCIoN con su numero de proceso y lo envia al proximo sucesor vivo.
 3. Cada uno de los procesos agrega su numero de proceso al mensaje de ELECCIoN y reenvia este al sucesor.
 4. Una vez que el mensaje de ELECCIoN llega de vuelta al emisor inicial, este envia a traves del anillo un mensaje de COORDINADOR con el numero del proceso ganador (podria ser el de mayor identificador de proceso).
',1,NULL); /* 15 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Tipos de Fallas','REPLICACION','Una falla es un desperfecto, causado tal vez por un error de diseño, un error de fabricacion, un error de
programacion, un daño fisico, el deterioro con el curso del tiempo, condiciones ambientales
adversas, entradas inesperadas, un error del operador, roedores comiendo parte del sistema y muchas otras causas¿ ¿ Tanenbaum, 1996
Tipo de Fallas:
Falla de Congelacion: Un servidor se detiene, pero estaba trabajando correctamente hasta que se detuvo.
Falla de Omision: Un servidor no responde a las peticiones entrantes (No recibe mensajes entrantes o no envia mensajes).
Falla de Tiempo: La respuesta de un servidor queda fuera del intervalo de tiempo especificado.
Falla de Respuesta: La respuesta de un servidor es incorrecta (falla de valor o falla de transicion de estado)',1,NULL); /* 16 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Fallas Bizantinas','REPLICACION','Las cosas se complican cuando se demanda que un grupo de 
procesos llegue a un acuerdo, lo cual se requiere en muchos casos. Algunos ejemplos son:
1. La eleccion de un coordinador
2. La decision de realizar o no una transaccion.
3. La division de tareas entre los trabajadores y la sincronizacion.
El acuerdo se puede lograr solo si estan presentes 2K+1 procesos que esten funcionando correctamente. 
Dicho de otra manera mas de dos tercios de los procesos estan funcionando correctamente.
Pasos:
1. Cada proceso i no defectuoso envia Vi a todos los demas procesos mediante unitransmision confiables.
2. Los resultados de los anuncios del paso 1 se reunen en forma de vectores.
3. Cada proceso transfiere su vector (Completo) a todos los demas procesos.
4. Cada proceso examina el elemento i-esimo de cada uno de los vectores recien recibidos.
5. Finalmente si ningun valor tiene mayoria, el elemento correspondiente del vector resultado se marca mediante UNKNOWN

',1,'images/topicos/bizantinas.png'); /* 17 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitectura Cliente / Servidor: Modelo de Acceso Remoto','SISTEMAS DE ARCHIVOS DISTRIBUIDOS',
'Este modelo ofrece a los clientes un acceso transparente a un sistema de archivo gestionado por un servidor remoto.
Los clientes por lo general desconocen la ubicacion de los archivos.
Disponen de una interfaz para que interactuen con el sistema de archivo similar a la interfaz ofrecida por un sistema de archivo convencional.',1,
'images/topicos/acceso_remoto.png'); /* 18 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitectura Cliente / Servidor: Modelo de Carga y Descarga','SISTEMAS DE ARCHIVOS DISTRIBUIDOS',
'Un cliente accede a un archivo localmente despues de haberlo descargado del servidor.
Cuando el cliente termina con el archivo, lo carga otra vez en el servidor para que pueda ser utilizado por otro cliente.
',1,'images/topicos/carga_descarga.png'); /* 19 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Sistemas de Archivos Basados en Cluster','SISTEMAS DE ARCHIVOS DISTRIBUIDOS','Si consideramos
que los grupos de servidores a menudo se utilizan en aplicaciones en paralelo, no sorprende que sus sistema de archivos
asociados se ajusten como corresponde.
Una tecnica muy conocida es desplegar tecnicas de distribucion de archivos.
La idea basica es distribuir un archivo muy grande entre
multiples servidores, es posible buscar sus diferentes partes en paralelo.
Generalmente se requiere que los datos que se guardan en un archivo tengan una estructura muy regular, como por ejemplo una matriz.
Para aplicaciones de proposito general, o para aquellas con tipos irregulares o muchos tipos de estructuras de datos,
la distribucion de archivos puede no ser una herramienta efectiva
',1,'images/topicos/cluster.png'); /* 20 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Domain Name System (DNS)','SERVICIOS DE NOMBRE','Sistema de nomenclatura  jerarquica para 
computadoras, servicios o cualquier recurso conectado  a Internet  o a una red privada. 
Su funcion mas importante es traducir (resolver) nombres inteligibles para los humanos  en identificadores  binarios  
asociados con los equipos conectados  a la red, esto con el proposito de poder localizar y direccionar estos equipos 
mundialmente.
Los usos mas comunes  son la asignacion de nombres  de dominio a direcciones IP y la localizacion de los servidores de 
correo electronico  de cada dominio.
Componentes:
1. Clientes DNS: programa cliente DNS que se ejecuta en la computadora del usuario y que genera peticiones DNS de 
resolucion de nombres  a un servidor DNS (Por ejemplo: ¿Que direccion IP corresponde a nombre.dominio?).
2. Servidores DNS: contestan las peticiones de los clientes. Los servidores recursivos tienen la capacidad de 
reenviar la peticion a otro servidor si no disponen de la direccion solicitada.',1,NULL); /* 21 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Lightweight Directory Access Protocol (LDAP)','SERVICIOS DE NOMBRE','Es un protocolo de servicios
de directorios cliente-servidor. Funciona a nivel de aplicacion el cual permite el acceso a un servicio de directorio 
ordenado y distribuido para buscar diversa informacion en un entorno de red.  Es considerado una base de datos 
(aunque su sistema de almacenamiento puede ser diferente) a la que pueden realizarse consultas.
Un directorio es un conjunto de objetos con atributos organizados en una manera logica y jerarquica. El ejemplo mas comun es el directorio telefonico.
Habitualmente, almacena la informacion de autenticacion (usuario y contraseña) aunque es posible almacenar otra informacion 
(datos de contacto del usuario, ubicacion de diversos recursos de la red, permisos, certificados, etc). 
A manera de sintesis, LDAP es un protocolo de acceso unificado a un conjunto de informacion sobre una red.
Estructura de directorio: 
1. Un directorio es un arbol de entradas de directorio.
2. Una entrada consta de un conjunto de atributos.
3. Un atributo tiene un nombre (un tipo de atributo o descripcion de atributo) y uno o mas valores. Los atributos son definidos en un esquema.
4. Cada entrada tiene un identificador unico: su Nombre distinguido (Distinguished Name, DN). Este consta de su Relative
Distinguished Name (RDN) construido por algunos atributos en la entrada, seguidos del DN de la entrada del padre 
(Pensar en el nombre distinguido como un completo nombre de archivo y el nombre distinguido relativo como el nombre de 
archivo relativo en un folder).

',1,NULL); /* 22 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Remote Method Invocation (RMI)','OBJETOS DISTRIBUIDOS','En java, los objetos distribuidos estan incorporados en el lenguaje.
Un objetivo importante fue conservar la semantica de los objetos no distribuidos tanto como fuera posible.
La clonacion de objetos locales o remotos son manejados de
forma diferente.
1. La clonacion de un objeto de manera local, se resume en la creacion de un nuevo objeto pero con el mismo estado, 
es decir una copia exacta del objeto base a clonar.
2. Realizar la clonacion en objetos distribuidos es mucho mas complejo, tendriamos que copiar el proxy de cada uno de 
los clientes conectados con el servidor. Por ende si deseamos realizar un clonado solo lo podriamos hacer del lado del servidor.
Las diferencias a nivel de lenguaje de un objeto remoto a un objeto local es complicado de observar en java.
Los tipo de datos primitivo u objeto pueden ser pasados como parametros a una RMI, siempre que la organizacion se aplique
solo al tipo, es decir, todos los parametros en una RMI deben ser serializables.

Manejo de parametros dentro de JAVA RMI: En Java normalmente los parametros se manejan solo con referencias, sin embargo 
en invocaciones remotas es necesario usar referencias y copias.
',1,'images/topicos/rmi.png'); /* 23 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Enterprise JavaBeans (EJB)','OBJETOS DISTRIBUIDOS','Un EJB es en esencia un objeto JAVA alojado
en un servidor especial que ofrece diferentes formas para que los clientes remotos lo invoquen.
Los servidores de EJB deben proporcionar las siguientes funcionalidades:
El servidor debe permitir separar la funcionalidad de la aplicacion de la funcionalidad orientada al sistema.
Debe incluir funciones para:
 1. Buscar Objetos
 2. Guardar Objetos
 3. Permitir que los objetos formen parte de una transaccion.
 Tipos:
   Beans de sesion: pueden ser con estado, sin estado o "Singleton" y pueden ser accedidos por una interfaz local (misma JVM) 
   o remota (JVM diferente) o directamente sin una interfaz (aplica la semantica local),Generalmente sirven a los clientes 
   como una fachada de los servicios proporcionados por otros componentes disponibles en el servidor. 
   1. Con estado (stateful): las variables de instancia del bean almacenan datos especificos obtenidos durante la 
   conexion con el cliente, por tanto, almacena el estado conversacional de un cliente. Este estado conversacional se 
   modifica conforme el cliente va realizando llamadas a los metodos de negocio del bean. El estado conversacional no 
   se guarda cuando el cliente termina la sesion.
   2. Sin estado (stateless): Los beans de sesion sin estado son objetos distribuidos que carecen de estado asociado 
   permitiendo por tanto que se los acceda concurrentemente. No se garantiza que los contenidos de las variables de 
   instancia se conserven entre llamadas al metodo
',1,NULL); /* 24 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Simple Object Access Protocol (SOAP)','SERVICIOS WEB','Los mensajes SOAP son documentos XML.
La informacion del pedido y respuesta se almacenan como una parte de XML.
Los elementos que forman los mensajes SOAP son los siguientes:
1. Sobre o Envoltura SOAP: Define el contenido de mensaje.
2. Encabezado SOAP: Es opcional y tiene una informacion de encabezado.
3. Cuerpo SOAP: Tiene informacion de llamada y respuesta.
Caracteristicas:
1. El servicio expone su funcionalidad de manera similar a RMI (cantidad arbitraria de metodos expuestos).
2. El hecho de que los mensajes se manejen con XML permite que su interpretacion sea muy sencilla, aunque esto puede representar una desventaja en el desempeño cuando los mensajes son muy grandes.
3. SOAP incentiva a los desarrolladores a que formen su propio vocabulario de nombres y verbos, por ejemplo getEmpleados().
4. Puede usar tanto stateless requests (con cada peticion se envian todos los datos necesarios) como stateful requests (se mantiene un estado asociado a la conexion).
',1,NULL); /* 25 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Representational State Transfer (REST)','SERVICIOS WEB','Tecnica de arquitectura software para sistemas 
hipermedia distribuidos, se usa en el sentido mas amplio para describir cualquier interfaz web simple que utiliza XML
y HTTP, sin las abstracciones adicionales de los protocolos basados en patrones de intercambio de mensajes.
REST afirma que la web ha disfrutado de escalabilidad como resultado de una serie de diseños fundamentales clave:
1. Un protocolo cliente/servidor sin estado:  cada mensaje HTTP contiene toda la informacion necesaria para comprender la peticion. Como resultado, ni el cliente ni el servidor necesitan recordar ningun estado de las comunicaciones entre mensajes. 
2. Un conjunto de operaciones bien definidas que se aplican a todos los recursos de informacion: POST, GET, PUT y DELETE. Con frecuencia estas operaciones se equiparan a las operaciones CRUD.
3. Una sintaxis universal para identificar los recursos: cada recurso es direccionable unicamente a traves de su URI.
4. El uso de hipermedios: El uso de hipermedios, tanto para la informacion de la aplicacion como para las transiciones de estado de la aplicacion. Como resultado de esto, es posible navegar de un recurso REST a muchos otros, simplemente siguiendo enlaces sin requerir el uso de registros u otra infraestructura adicional.
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
1. Para enviarle un mensaje a un nodo desde otro nodo escribir: "numeroNodo:mensaje". <br/>',5); /* 4 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Sockets',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',1); /* 5 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'RMI',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',6); /* 6 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Comunicacion en Grupo',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',7); /* 7 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Lamport',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',8); /* 8 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Cristian',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',9); /* 9 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Berkeley',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',10); /* 10 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Promedio',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',11); /* 11 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Centralizado',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',12); /* 12 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Distribuido',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',13); /* 13 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Grandulon',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',14); /* 14 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Anillo',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',15); /* 15 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Fallas',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',16); /* 16 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Fallas Bizantinas',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',17); /* 17 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Acceso Remoto',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',18); /* 18 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Carga y Descarga',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',19); /* 19 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Cluster',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',20); /* 20 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'DNS',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',21); /* 21 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'LDAP',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',22); /* 22 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'RMI',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',23); /* 23 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'EJB',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',24); /* 24 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'SOAP',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',25); /* 25 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'REST',TO_DATE('22/09/2013','DD/MM/YYYY'),' ',26); /* 26 */




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
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Servidor1.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',1,1);/* 1 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Servidor2.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',1,2); /* 2 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',1,3); /* 3 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',2,1); /* 4 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Cliente1.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',2,2); /* 5 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Cliente2.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',2,3); /* 6 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',3,1); /* 7 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Cliente1.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',3,2); /* 8 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Cliente2.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',3,3); /* 9 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P1.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,1); /* 10 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P2.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,2); /* 11 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P3.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,3); /* 12 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P4.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,4); /* 13 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket1.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,1); /* 14 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket2.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,2); /* 15 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket3.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,3); /* 16 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket4.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,4); /* 17 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',6,1); /* 18 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',6,2); /* 19 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Emisor.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',7,1); /* 20 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Receptor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',7,2); /* 21 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Receptor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',7,3); /* 22 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grupo_Receptor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',7,4); /* 23 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',8,1); /* 24 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',8,2); /* 25 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',8,3); /* 26 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Lamport.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',8,4); /* 27 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cristian_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',9,1); /* 28 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cristian_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',9,2); /* 29 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',10,1); /* 30 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',10,2); /* 31 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',10,3); /* 32 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Berkeley_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',10,4); /* 33 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',11,1); /* 34 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',11,2); /* 35 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',11,3); /* 36 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Promedio.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',11,4); /* 37 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',12,1); /* 38 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',12,2); /* 39 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',12,3); /* 40 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Centralizado_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',12,4); /* 41 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',13,1); /* 42 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',13,2); /* 43 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',13,3); /* 44 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Distribuido.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',13,4); /* 45 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',14,1); /* 46 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',14,2); /* 47 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',14,3); /* 48 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Grandulon.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',14,4); /* 49 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',15,1); /* 50 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',15,2); /* 51 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',15,3); /* 52 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Anillo.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',15,4); /* 53 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Tipos_De_Fallas_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',16,1); /* 54 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Tipos_De_Fallas_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',16,2); /* 55 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',17,1); /* 56 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',17,2); /* 57 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',17,3); /* 58 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'FallasBizantinas.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',17,4); /* 59 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloAccesoRemoto_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',18,1); /* 60 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloAccesoRemoto_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',18,2); /* 61 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloCargaDescarga_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',19,1); /* 62 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloCargaDescarga_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',19,2); /* 63 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'ModeloCargaDescarga_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',19,3); /* 64 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',20,1); /* 65 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',20,2); /* 66 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',20,3); /* 67 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Cluster_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',20,4); /* 68 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DNS_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',21,1); /* 69 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DNS_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',21,2); /* 70 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'LDAP_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',22,1); /* 71 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO) 
VALUES (S_EJECUTABLES.NEXTVAL,'LDAP_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',22,2); /* 72 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',23,1); /* 73 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'RMI_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',23,2); /* 74 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'EJB.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',24,2); /* 75 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'SOAP_Server.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',25,1); /* 76 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'SOAP_Client.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',25,2); /* 77 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'SOAP_Client.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',25,4); /* 78 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'REST_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',26,2); /* 79 */




/*
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',,);
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
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Segundo Servidor','192.168.0.192',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','CaracteristicasSD_Servidor',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Segundo Servidor','192.168.0.191',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','CaracteristicasSD_Cliente',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 1','192.168.0.191',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 2','192.168.0.192',3);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DesafiosSD_Servidor',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DesafiosSD_Cliente1',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DesafiosSD_Cliente2',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Arquitectura_C_S_Servidor',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Arquitectura_C_S_Cliente',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Arquitectura_C_S_Cliente',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.192',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.193',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.194',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','P2P',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.191',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','2',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.192',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','3',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','4',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','1',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','3',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','4',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','1',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','2',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','4',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Socket',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 1','1',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 2','2',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Id Nodo 3','3',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.193',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI Servidor',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI Cliente',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo Emisor',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo Receptor',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo Receptor',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grupo Receptor',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','192.168.0.192',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','""',24);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','192.168.0.193',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','192.168.0.191',25);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','192.168.0.194',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','192.168.0.192',26);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Lamport',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Siguiente','""',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo Anterior','192.168.0.193',27);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cristian Servidor',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',28);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cristian Cliente',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','5',29);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley Servidor',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','8000',30);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley_Cliente.jar',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',31);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley_Cliente.jar',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',32);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Berkeley_Cliente.jar',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',33);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio.jar',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.192',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',34);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio.jar',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',35);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio.jar',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',36);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Promedio.jar',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Tiempo','10000',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.193',37);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Servidor.jar',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',38);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Cliente.jar',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',39);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Cliente.jar',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',40);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Centralizado_Cliente.jar',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',41);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido.jar',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.192',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',42);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido.jar',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',43);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido.jar',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',44);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Distribuido.jar',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.193',45);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon.jar',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','""',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','192.168.0.192-192.168.0.193-192.168.0.194',46);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon.jar',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','192.168.0.191-',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','192.168.0.193-192.168.0.194',47);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon.jar',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','192.168.0.191-192.168.0.192',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','192.168.0.194-',48);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Grandulon.jar',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Menores','192.168.0.191-192.168.0.192-192.168.0.193',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nodos Mayores','""',49);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo.jar',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.0.192',50);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo.jar',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.0.193',51);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo.jar',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.0.194',52);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Anillo.jar',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Proximo Nodo','192.168.0.191',53);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Tipos_De_Fallas_Servidor.jar',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',54);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Tipos_De_Fallas_Cliente.jar',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',55);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas.jar',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.192',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',56);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas.jar',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.193',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',57);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas.jar',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.194',58);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','FallasBizantinas.jar',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 1','192.168.0.191',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 2','192.168.0.192',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Nodo 3','192.168.0.193',59);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloAccesoRemoto_Servidor',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',60);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloAccesoRemoto_Cliente',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.19',61);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloCargaDescarga_Servidor',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',62);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloCargaDescarga_Cliente',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',63);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','ModeloCargaDescarga_Cliente',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',64);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster.jar',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',65);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster.jar',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',66);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster.jar',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',67);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','Cluster_Cliente',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 1','192.168.0.191',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 2','192.168.0.192',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor 3','192.168.0.193',68);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DNS_Servidor',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',69);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','DNS_Cliente',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',70);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','LDAP_Servidor',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',71);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','LDAP_Cliente',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',72);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI Servidor',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',73);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','RMI Cliente',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',74);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','EJB',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',75);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','SOAP_Server',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',76);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','SOAP_Client',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',77);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','SOAP_Client',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',78);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','REST_Cliente',79);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',79);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',79);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',79);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',79);

/*
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',);


INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicacion','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.19',);
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

/* E_E */

INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,1);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,1);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,2);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,2);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,3);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,3);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,3);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,4);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,4);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,5);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,5);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,5);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,6);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,6);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,6);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,7);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,7);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,8);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,8);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,8);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,9);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,9);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,9);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,10);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,10);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,10);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,11);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,11);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,11);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,12);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,12);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,12);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,13);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,13);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,13);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,14);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,14);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,14);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,15);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,15);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,15);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,16);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,16);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,16);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,17);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,17);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,17);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,18);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,18);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,19);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,19);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,19);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,20);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,20);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,20);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,21);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,21);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,22);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,22);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,23);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,23);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,24);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,24);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,25);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,25);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,26);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,26);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,27);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,27);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,28);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,28);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,29);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,29);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,30);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,30);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,31);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,31);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,31);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,32);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,32);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,32);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,33);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,33);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,33);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,34);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,34);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,34);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,35);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,35);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,35);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,36);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,36);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,36);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,37);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,37);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,37);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,38);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,38);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,39);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,39);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,39);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,40);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,40);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,40);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,41);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,41);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,41);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,42);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,42);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,42);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,43);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,43);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,43);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,44);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,44);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,44);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,45);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,45);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,45);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,46);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,46);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,46);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,47);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,47);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,47);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,48);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,48);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,48);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,49);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,49);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,49);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,50);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,50);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,50);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,51);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,51);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,51);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,52);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,52);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,52);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,53);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,53);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,53);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,54);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,54);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,54);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,55);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,55);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,55);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,56);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,56);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,57);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,57);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,58);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,58);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,59);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,59);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,60);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,60);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,61);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,61);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,61);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,62);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,62);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,63);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,63);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,63);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,64);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,64);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,64);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,65);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,65);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,66);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,66);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,67);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,67);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,68);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,68);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,68);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,69);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,69);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,70);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,70);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,70);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,71);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,71);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,72);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,72);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,72);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,73);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,73);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,74);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,74);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,74);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,75);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,75);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,75);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,76);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,76);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,77);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,77);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,77);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,78);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,78);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,78);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,79);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,79);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,79);

/*
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (1,);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (2,);
INSERT INTO E_E(ID_EVENTO,ID_EJECUTABLE) VALUES (3,);
*/
/* E_E */
