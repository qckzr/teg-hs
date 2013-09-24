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
Un socket queda definido por una dirección IP, un protocolo y un número de puerto.',1,'/Users/hectorsam/Desktop/topicos/socket.png');/* 1 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Características de los Sistemas Distribuidos','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Las características principales responsables de la utilidad de los sistemas distribuidos:
1. Compartición de Recursos: Los recursos en un sistema distribuido están físicamente encapsulados en una de las computadoras y sólo pueden ser accedidos por otras computadoras mediante las comunicaciones (la red).
Los usuarios de los recursos se comunican con los gestores de los recursos para acceder a los recursos compartidos del sistema. Esta perspectiva nos lleva a dos modelos de sistemas distribuidos: el modelo CLIENTE-SERVIDOR y el modelo BASADO EN OBJETOS
2. Apertura (opennesss): Se determina primariamente por el grado hacia el que nuevos servicios de compartición de recursos se pueden añadir sin perjudicar ni duplicar a los ya existentes.
3. Concurrencia: En los sistemas distribuidos hay muchas maquinas, cada una con uno o mas procesadores. Es decir, si hay M ordenadores en un sistema distribuido con un procesador cada una entonces hasta M procesos pueden estar ejecutándose en paralelo..
Casos en que se puede presentar una ejecución en paralelo: 
Muchos usuarios interactúan simultáneamente con programas de aplicación - Muchos procesos servidores se ejecutan concurrentemente, cada uno respondiendo a diferentes peticiones de los procesos clientes.
4. Escalabilidad: Tanto el software de sistema como el de aplicación no deberían cambiar cuando la escala del sistema se incrementa. La necesidad de escalabilidad no es solo un problema de prestaciones de red o de hardware, sino que esta íntimamente ligada con todos los aspectos del diseño de los sistemas distribuidos. El diseño del sistema debe reconocer explícitamente la necesidad de escalabilidad o de lo contrario aparecerán serias limitaciones
5. Tolerancia a fallos: El diseño de sistemas tolerantes a fallos se basa en dos cuestiones, complementarias entre sí: 
- Redundancia hardware (uso de componentes redundantes) .
- Recuperación del software (diseño de programas que sean capaces de recuperarse de los fallos).
6. Transparencia:se define como la ocultación al usuario y al programador de aplicaciones de la separación de los componentes de un sistema distribuido, de manera que el sistema se percibe como un todo, en vez de una colección de componentes independientes
',1,NULL); /* 2 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Desafíos de los Sistemas Distribuidos','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','1. Seguridad: La seguridad de los recursos de información tiene tres componentes:
Confidencialidad: protección contra el descubrimiento por individuos no autorizados.
Integridad: protección contra la alteración o corrupción.
Disponibilidad: protección contra interferencia con los procedimientos de acceso a los recursos
2. Escalabilidad:Se dice que un sistema es escalable si conserva su efectividad cuando ocurre un incremento significativo en el numero de recursos y el numero de usuarios
3. Tratamiento a fallos: Los fallos en un sistema distribuido son parciales; es decir, algunos componentes fallan mientras otros siguen funcionando.
 Detección de fallos: checksum para mensajes.
 Enmascaramiento de fallos: algunos fallos que han sido detectados pueden ocultarse.
 Recuperación frente a fallos: rollback.
 Redundancia.
4. Concurrencia: Es la posibilidad de que varios clientes intenten acceder a un recurso compartido a la vez.
Para que un objeto sea seguro en un entorno concurrente, sus operaciones deben sincronizarse de forma que sus datos permanezcan consistentes. Esto puede lograrse mediante el
empleo de técnicas conocidas como los semáforos, que se usan en la mayoría de los sistemas operativos.
5. Transparencia: De acceso, de ubicación, de concurrencia, replicación, frente a fallos, movilidad.
',1,NULL); /* 3 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitecturas: Cliente / Servidor','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Cliente: Proceso que solicita un servicio.
Servidor: Proceso que implementa un servicio',1,'/Users/hectorsam/Desktop/topicos/arquitectura_cliente_servidor.png'); /* 4 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitecturas: Punto a Punto (P2P)','INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS','Se caracteriza por una distribución horizontal de los nodos.
Todos los nodos que constituyen la arquitectura son cliente y servidor a la vez (esto también se le denomina sirviente).
',1,'/Users/hectorsam/Desktop/topicos/p2p.png'); /* 5 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'RMI','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un objeto en un proceso puede invocar un objeto en otro
proceso que puede estar ubicado en otra máquina.
Los objetos que brindan sus métodos a otros objetos de otros procesos, reciben el nombre de Objetos Remotos.
Los procesos que alojan objetos remotos pueden ser referidos como servidores y los procesos que alojan objetos que invocan métodos de objetos remotos
pueden llamarse clientes.
Requisitos básicos:
1. Un objeto remoto debe ser primero instanciado.
2. Un objeto remoto debe tener un identificador único asociado.
3. Debe existir un módulo en el servidor que se encargue de crear una identificación única para un objeto.
4. Los clientes deben poder acceder a la identificación única del objeto remoto.
5. Los clientes deben estar enterados de los métodos que pueden ser invocados en el objeto remoto.
6. Debe existir un módulo que se encargue de manejar la comunicación entre un cliente y un servidor.
7. Debe existir un módulo o varios que pueda(n) realizar la conversión de datos (marshall y unmarshall).

',1,'/Users/hectorsam/Desktop/topicos/rmi.png'); /* 6 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Comunicación en grupo','COMUNICACION EN SISTEMAS DISTRIBUIDOS','Un grupo es una colección de procesos que actúan juntos en un sistema o alguna forma determinada por el usuario.
La propiedad fundamental de todos los grupos es que cuando un mensaje es enviado a éste, todos los miembros de él lo reciben.
Los grupos son dinámicos. Se pueden crear nuevos y destruir grupos anteriores. Un proceso se puede unir a un grupo o dejar otro. Un proceso puede ser miembro de varios grupos a la vez.
Transmisión:
Multi-transmisión. Cuando  un mensaje enviado a una dirección especial de red llega a ciertas máquinas.
Transmisión simple. Cuando los paquetes que tienen ciertas dirección (Ej. 0) se entregan a todas la máquinas.
Uni-transmisión. El envío de mensajes de un emisor a un receptor.

',1,NULL); /* 7 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Lógicos: Algoritmo de Lamport','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','La sincronización de relojes no tiene que ser absoluta. Si dos procesos no interactúan, no es necesario que sus relojes estén sincronizados, puesto que la carencia de sincronización no sería observable y por tanto no podría provocar problemas. Lo que realmente
importa es el orden en que ocurren los eventos.” Tanenbaum, 1996.
- La expresión a->b se lee: “a ocurre antes de b”
- Si a->b <=> C(a) < C(b)
- El tiempo del reloj, C, siempre debe ir hacia delante y nunca hacia atrás. Se pueden hacer correcciones al tiempo al sumar un valor positivo al reloj.
Condiciones clave:
1. Si a ocurre antes de b en el mismo proceso, C(a) < C(b)
2. Si a y b son el envío y la recepción de un mensaje, C(a) < C(b)
3. Para todos los eventos a y b, C(a) != C(b)

',1,NULL); /* 8 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Físicos: Algoritmo de Cristian','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','Adecuado para sistemas donde una de las máquinas es servidor del tiempo y el resto debe sincronizarse.
1. En forma periódica, en un tiempo que no debe ser mayor de o/2p segundos, cada máquina envía un mensaje al servidor para solicitar el tiempo actual. Donde “o” es la cantidad de alejamiento máxima deseada y “p” la tasa máxima de alejamiento (especificada por el fabricante).
2. El tiempo de propagación del mensaje puede ser estimado para conseguir un cálculo más preciso.
3. La corrección por el tiempo del servidor y el tiempo de transmisión se hace midiendo en el emisor: El tiempo inicial (envío) “T0”. El tiempo final (recepción) “T1”. Ambos tiempos se miden con el mismo reloj.
4. El tiempo de propagación del mensaje será (T1 - T0) / 2. Si el tiempo del servidor para manejar la interrupción y procesar el mensaje es “I”: El tiempo de propagación será (T1 - T0 - I) / 2.
5. El tiempo de propagación se suma al tiempo del servidor para sincronizar al emisor cuando éste recibe la respuesta
	

',1,NULL); /* 9 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Físicos: Algoritmo de Berkeley','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1. En este caso, el servidor de tiempo es un demonio para el tiempo que realiza un muestreo periódico del tiempo de todas las máquinas.
2. Con base en las respuestas obtenidas, calcula un tiempo promedio y le indica a todas las demás máquinas que avancen su reloj a la nueva hora o que disminuyan la velocidad del mismo hasta lograr cierta reducción específica.
',1,NULL); /* 10 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Relojes Físicos: Algoritmo con promedio (Distribuido)','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1. El i-ésimo intervalo inicia en To+iR y va hasta To+(i+1)R, donde To es un momento ya acordado en el pasado y R es un parámetro del sistema.
2. Al inicio de cada intervalo, cada máquina transmite el valor actual del tiempo según su reloj.
3. Luego, cada máquina inicia un cronómetro local para reunir las demás transmisiones que lleguen en un cierto intervalo S.
4. En base a los resultados obtenidos, es establecido como tiempo local el promedio de todas las respuestas obtenidas.
',1,NULL); /* 11 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Exclusión Mutua: Algoritmo Centralizado','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1. Se escoge un coordinador.
2. Cada vez que un proceso desea acceder a una sección crítica, envía un mensaje al coordinador pidiéndole permiso.
3. En caso de que la región no se encuentre ocupada por otro proceso, el coordinador le envía al proceso solicitante un mensaje de aprobación.
4. En caso contrario, simplemente no se envía nada o se envía un mensaje de negación.
',1,NULL); /* 12 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Exclusión Mutua: Algoritmo Distribuido (Ricart y Agrawala)','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1.Requiere de la existencia de un orden total de todos los eventos en el sistema.
2. Cuando un proceso desea acceder a una región crítica envía a todos los procesos (incluyendolo a el mismo) un mensaje de solicitud con el nombre de la región, su número de proceso y la hora actual.
3. Cuando un proceso recibe un mensaje de solicitud de otro proceso puede ocurrir lo siguiente:
Si el receptor no está en la región crítica y no desea entrar a ella, envía de regreso un mensaje de OK al emisor.
Si el receptor está en la región crítica, no responde y forma la solicitud en una fila.
Si el receptor no está en la región crítica pero desea entrar a ella, éste compara la marca de tiempo del mensaje recibido con la de su mensaje de solicitud, si la marca del emisor es menor, éste envía un mensaje de OK, en caso contrario, forma la solicitud en una fila y no envía nada.
4. Cuando un proceso obtiene tantos mensaje de OK como procesos en el sistema, éste puede acceder a la región crítica.
5. Cuando el proceso en la región crítica termina su trabajo, envía un mensaje de OK al próximo proceso en su cola de solicitudes.
',1,NULL); /* 13 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Algoritmo de Selección: Gradulón','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS','1.Un proceso cualquier P envía un mensaje de ELECCIÓN a los demás procesos mayores que él.
2.Si nadie responde, P gana la elección y se convierte en coordinador, por lo que envía un mensaje a todos los procesos menores de COORDINADOR.
3.Si uno de los procesos mayores que P responde, el trabajo de P ha terminado.
',1,NULL); /* 14 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Algoritmo de Selección: Anillo','SINCRONIZACION EN AMBIENTES DISTRIBUIDOS',
'1. Cada proceso conoce el orden del resto de los procesos en el sistema.
 2. Cuando uno de los procesos ve que el coordinador no funciona, construye un mensaje de ELECCIÓN con su número de proceso y lo envía al próximo sucesor vivo.
 3. Cada uno de los procesos agrega su número de proceso al mensaje de ELECCIÓN y reenvía éste al sucesor.
 4. Una vez que el mensaje de ELECCIÓN llega de vuelta al emisor inicial, éste envía a través del anillo un mensaje de COORDINADOR con el número del proceso ganador (podría ser el de mayor identificador de proceso).
',1,NULL); /* 15 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Tipos de Fallas','REPLICACION','Una falla es un desperfecto, causado tal vez por un error de diseño, un error de fabricación, un error de
programación, un daño físico, el deterioro con el curso del tiempo, condiciones ambientales
adversas, entradas inesperadas, un error del operador, roedores comiendo parte del sistema y muchas otras causas¿ ¿ Tanenbaum, 1996
Tipo de Fallas:
Falla de Congelación: Un servidor se detiene, pero estaba trabajando correctamente hasta que se detuvo.
Falla de Omisión: Un servidor no responde a las peticiones entrantes (No recibe mensajes entrantes o no envía mensajes).
Falla de Tiempo: La respuesta de un servidor queda fuera del intervalo de tiempo especificado.
Falla de Respuesta: La respuesta de un servidor es incorrecta (falla de valor o falla de transición de estado)',1,NULL); /* 16 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Fallas Bizantinas','REPLICACION','Las cosas se complican cuando se demanda que un grupo de 
procesos llegue a un acuerdo, lo cual se requiere en muchos casos. Algunos ejemplos son:
1. La elección de un coordinador
2. La decisión de realizar o no una transacción.
3. La división de tareas entre los trabajadores y la sincronización.
El acuerdo se puede lograr sólo si están presentes 2K+1 procesos que estén funcionando correctamente. 
Dicho de otra manera más de dos tercios de los procesos están funcionando correctamente.
Pasos:
1. Cada proceso i no defectuoso envía Vi a todos los demás procesos mediante unitransmisión confiables.
2. Los resultados de los anuncios del paso 1 se reúnen en forma de vectores.
3. Cada proceso transfiere su vector (Completo) a todos los demás procesos.
4. Cada proceso examina el elemento i-ésimo de cada uno de los vectores recién recibidos.
5. Finalmente si ningún valor tiene mayoría, el elemento correspondiente del vector resultado se marca mediante UNKNOWN

',1,'/Users/hectorsam/Desktop/topicos/bizantinas.png'); /* 17 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitectura Cliente / Servidor: Modelo de Acceso Remoto','SISTEMAS DE ARCHIVOS DISTRIBUIDOS',
'Este modelo ofrece a los clientes un acceso transparente a un sistema de archivo gestionado por un servidor remoto.
Los clientes por lo general desconocen la ubicación de los archivos.
Disponen de una interfaz para que interactúen con el sistema de archivo similar a la interfaz ofrecida por un sistema de archivo convencional.',1,
'/Users/hectorsam/Desktop/topicos/acceso_remoto.png'); /* 18 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Arquitectura Cliente / Servidor: Modelo de Carga y Descarga','SISTEMAS DE ARCHIVOS DISTRIBUIDOS',
'Un cliente accede a un archivo localmente después de haberlo descargado del servidor.
Cuando el cliente termina con el archivo, lo carga otra vez en el servidor para que pueda ser utilizado por otro cliente.
',1,'/Users/hectorsam/Desktop/topicos/carga_descarga.png'); /* 19 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Sistemas de Archivos Basados en Cluster','SISTEMAS DE ARCHIVOS DISTRIBUIDOS','Si consideramos
que los grupos de servidores a menudo se utilizan en aplicaciones en paralelo, no sorprende que sus sistema de archivos
asociados se ajusten como corresponde.
Una técnica muy conocida es desplegar técnicas de distribución de archivos.
La idea básica es distribuir un archivo muy grande entre
múltiples servidores, es posible buscar sus diferentes partes en paralelo.
Generalmente se requiere que los datos que se guardan en un archivo tengan una estructura muy regular, como por ejemplo una matriz.
Para aplicaciones de propósito general, o para aquellas con tipos irregulares o muchos tipos de estructuras de datos,
la distribución de archivos puede no ser una herramienta efectiva
',1,'/Users/hectorsam/Desktop/topicos/cluster.png'); /* 20 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Domain Name System (DNS)','SERVICIOS DE NOMBRE','Sistema de nomenclatura  jerárquica para 
computadoras, servicios o cualquier recurso conectado  a Internet  o a una red privada. 
Su función más importante es traducir (resolver) nombres inteligibles para los humanos  en identificadores  binarios  
asociados con los equipos conectados  a la red, esto con el propósito de poder localizar y direccionar estos equipos 
mundialmente.
Los usos más comunes  son la asignación de nombres  de dominio a direcciones IP y la localización de los servidores de 
correo electrónico  de cada dominio.
Componentes:
1. Clientes DNS: programa cliente DNS que se ejecuta en la computadora del usuario y que genera peticiones DNS de 
resolución de nombres  a un servidor DNS (Por ejemplo: ¿Qué dirección IP corresponde a nombre.dominio?).
2. Servidores DNS: contestan las peticiones de los clientes. Los servidores recursivos tienen la capacidad de 
reenviar la petición a otro servidor si no disponen de la dirección solicitada.',1,NULL); /* 21 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Lightweight Directory Access Protocol (LDAP)','SERVICIOS DE NOMBRE','Es un protocolo de servicios
de directorios cliente-servidor. Funciona a nivel de aplicación el cual permite el acceso a un servicio de directorio 
ordenado y distribuido para buscar diversa información en un entorno de red.  Es considerado una base de datos 
(aunque su sistema de almacenamiento puede ser diferente) a la que pueden realizarse consultas.
Un directorio es un conjunto de objetos con atributos organizados en una manera lógica y jerárquica. El ejemplo más común es el directorio telefónico.
Habitualmente, almacena la información de autenticación (usuario y contraseña) aunque es posible almacenar otra información 
(datos de contacto del usuario, ubicación de diversos recursos de la red, permisos, certificados, etc). 
A manera de síntesis, LDAP es un protocolo de acceso unificado a un conjunto de información sobre una red.
Estructura de directorio: 
1. Un directorio es un árbol de entradas de directorio.
2. Una entrada consta de un conjunto de atributos.
3. Un atributo tiene un nombre (un tipo de atributo o descripción de atributo) y uno o más valores. Los atributos son definidos en un esquema.
4. Cada entrada tiene un identificador único: su Nombre distinguido (Distinguished Name, DN). Este consta de su Relative
Distinguished Name (RDN) construido por algunos atributos en la entrada, seguidos del DN de la entrada del padre 
(Pensar en el nombre distinguido como un completo nombre de archivo y el nombre distinguido relativo como el nombre de 
archivo relativo en un folder).

',1,NULL); /* 22 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Remote Method Invocation (RMI)','OBJETOS DISTRIBUIDOS','En java, los objetos distribuidos están incorporados en el lenguaje.
Un objetivo importante fue conservar la semántica de los objetos no distribuidos tanto como fuera posible.
La clonación de objetos locales o remotos son manejados de
forma diferente.
1. La clonación de un objeto de manera local, se resume en la creación de un nuevo objeto pero con el mismo estado, 
es decir una copia exacta del objeto base a clonar.
2. Realizar la clonación en objetos distribuidos es mucho más complejo, tendríamos que copiar el proxy de cada uno de 
los clientes conectados con el servidor. Por ende si deseamos realizar un clonado sólo lo podríamos hacer del lado del servidor.
Las diferencias a nivel de lenguaje de un objeto remoto a un objeto local es complicado de observar en java.
Los tipo de datos primitivo u objeto pueden ser pasados como parámetros a una RMI, siempre que la organización se aplique
sólo al tipo, es decir, todos los parámetros en una RMI deben ser serializables.

Manejo de parámetros dentro de JAVA RMI: En Java normalmente los parámetros se manejan sólo con referencias, sin embargo 
en invocaciones remotas es necesario usar referencias y copias.
',1,'/Users/hectorsam/Desktop/topicos/rmi.png'); /* 23 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Enterprise JavaBeans (EJB)','OBJETOS DISTRIBUIDOS','Un EJB es en esencia un objeto JAVA alojado
en un servidor especial que ofrece diferentes formas para que los clientes remotos lo invoquen.
Los servidores de EJB deben proporcionar las siguientes funcionalidades:
El servidor debe permitir separar la funcionalidad de la aplicación de la funcionalidad orientada al sistema.
Debe incluir funciones para:
 1. Buscar Objetos
 2. Guardar Objetos
 3. Permitir que los objetos formen parte de una transacción.
 Tipos:
   Beans de sesión: pueden ser con estado, sin estado o "Singleton" y pueden ser accedidos por una interfaz local (misma JVM) 
   o remota (JVM diferente) o directamente sin una interfaz (aplica la semántica local),Generalmente sirven a los clientes 
   como una fachada de los servicios proporcionados por otros componentes disponibles en el servidor. 
   1. Con estado (stateful): las variables de instancia del bean almacenan datos específicos obtenidos durante la 
   conexión con el cliente, por tanto, almacena el estado conversacional de un cliente. Este estado conversacional se 
   modifica conforme el cliente va realizando llamadas a los métodos de negocio del bean. El estado conversacional no 
   se guarda cuando el cliente termina la sesión.
   2. Sin estado (stateless): Los beans de sesión sin estado son objetos distribuidos que carecen de estado asociado 
   permitiendo por tanto que se los acceda concurrentemente. No se garantiza que los contenidos de las variables de 
   instancia se conserven entre llamadas al método
',1,NULL); /* 24 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Simple Object Access Protocol (SOAP)','SERVICIOS WEB','Los mensajes SOAP son documentos XML.
La información del pedido y respuesta se almacenan como una parte de XML.
Los elementos que forman los mensajes SOAP son los siguientes:
1. Sobre o Envoltura SOAP: Define el contenido de mensaje.
2. Encabezado SOAP: Es opcional y tiene una información de encabezado.
3. Cuerpo SOAP: Tiene información de llamada y respuesta.
Características:
1. El servicio expone su funcionalidad de manera similar a RMI (cantidad arbitraria de métodos expuestos).
2. El hecho de que los mensajes se manejen con XML permite que su interpretación sea muy sencilla, aunque esto puede representar una desventaja en el desempeño cuando los mensajes son muy grandes.
3. SOAP incentiva a los desarrolladores a que formen su propio vocabulario de nombres y verbos, por ejemplo getEmpleados().
4. Puede usar tanto stateless requests (con cada petición se envían todos los datos necesarios) como stateful requests (se mantiene un estado asociado a la conexión).
',1,NULL); /* 25 */
INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN)
VALUES (S_TOPICOS.NEXTVAL,'Representational State Transfer (REST)','SERVICIOS WEB','Técnica de arquitectura software para sistemas 
hipermedia distribuidos, se usa en el sentido más amplio para describir cualquier interfaz web simple que utiliza XML
y HTTP, sin las abstracciones adicionales de los protocolos basados en patrones de intercambio de mensajes.
REST afirma que la web ha disfrutado de escalabilidad como resultado de una serie de diseños fundamentales clave:
1. Un protocolo cliente/servidor sin estado:  cada mensaje HTTP contiene toda la información necesaria para comprender la petición. Como resultado, ni el cliente ni el servidor necesitan recordar ningún estado de las comunicaciones entre mensajes. 
2. Un conjunto de operaciones bien definidas que se aplican a todos los recursos de información: POST, GET, PUT y DELETE. Con frecuencia estas operaciones se equiparan a las operaciones CRUD.
3. Una sintaxis universal para identificar los recursos: cada recurso es direccionable únicamente a través de su URI.
4. El uso de hipermedios: El uso de hipermedios, tanto para la información de la aplicación como para las transiciones de estado de la aplicación. Como resultado de esto, es posible navegar de un recurso REST a muchos otros, simplemente siguiendo enlaces sin requerir el uso de registros u otra infraestructura adicional.
',1,NULL); /* 26 */
/* TOPICOS */

/* APLICACIONES */

/*INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Aplicacion1',TO_DATE('23/07/2013','DD/MM/YYYY'),'Instrucciones para la aplicacion1',1); */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Características SD',TO_DATE('22/09/2013','DD/MM/YYYY'),'',2); /* 1 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Desafíos_SD',TO_DATE('22/09/2013','DD/MM/YYYY'),'',3); /* 2 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Arquitectura_Cliente_Servidor',TO_DATE('22/09/2013','DD/MM/YYYY'),'',4); /* 3 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'P2P',TO_DATE('22/09/2013','DD/MM/YYYY'),'',5); /* 4 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Sockets',TO_DATE('22/09/2013','DD/MM/YYYY'),'',1); /* 5 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'RMI',TO_DATE('22/09/2013','DD/MM/YYYY'),'',6); /* 6 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Comunicación en Grupo',TO_DATE('22/09/2013','DD/MM/YYYY'),'',7); /* 7 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Lamport',TO_DATE('22/09/2013','DD/MM/YYYY'),'',8); /* 8 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Cristian',TO_DATE('22/09/2013','DD/MM/YYYY'),'',9); /* 9 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Berkeley',TO_DATE('22/09/2013','DD/MM/YYYY'),'',10); /* 10 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Promedio',TO_DATE('22/09/2013','DD/MM/YYYY'),'',11); /* 11 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Centralizado',TO_DATE('22/09/2013','DD/MM/YYYY'),'',12); /* 12 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Distribuido',TO_DATE('22/09/2013','DD/MM/YYYY'),'',13); /* 13 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Grandulón',TO_DATE('22/09/2013','DD/MM/YYYY'),'',14); /* 14 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Anillo',TO_DATE('22/09/2013','DD/MM/YYYY'),'',15); /* 15 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Fallas',TO_DATE('22/09/2013','DD/MM/YYYY'),'',16); /* 16 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Fallas Bizantinas',TO_DATE('22/09/2013','DD/MM/YYYY'),'',17); /* 17 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Acceso Remoto',TO_DATE('22/09/2013','DD/MM/YYYY'),'',18); /* 18 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Carga y Descarga',TO_DATE('22/09/2013','DD/MM/YYYY'),'',19); /* 19 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'Cluster',TO_DATE('22/09/2013','DD/MM/YYYY'),'',20); /* 20 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'DNS',TO_DATE('22/09/2013','DD/MM/YYYY'),'',21); /* 21 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'LDAP',TO_DATE('22/09/2013','DD/MM/YYYY'),'',22); /* 22 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'RMI',TO_DATE('22/09/2013','DD/MM/YYYY'),'',23); /* 23 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'EJB',TO_DATE('22/09/2013','DD/MM/YYYY'),'',24); /* 24 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'SOAP',TO_DATE('22/09/2013','DD/MM/YYYY'),'',25); /* 25 */
INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)
VALUES (S_APLICACIONES.NEXTVAL,'REST',TO_DATE('22/09/2013','DD/MM/YYYY'),'',26); /* 26 */




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
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',1,1);/* 1 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',1,2); /* 2 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'CaracteristicasSD_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',1,3); /* 3 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',2,1); /* 4 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',2,2); /* 5 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'DesafiosSD_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',2,3); /* 6 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Servidor.jar','SERVIDOR','/Users/hectorsam/Desktop/ejecutables/',3,1); /* 7 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',3,2); /* 8 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Arquitectura_C_S_Cliente.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',3,3); /* 9 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,1); /* 10 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,2); /* 11 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,3); /* 12 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'P2P.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',4,4); /* 13 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,1); /* 14 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,2); /* 15 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,3); /* 16 */
INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)
VALUES (S_EJECUTABLES.NEXTVAL,'Socket.jar','CLIENTE','/Users/hectorsam/Desktop/ejecutables/',5,4); /* 17 */
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
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','CaracteristicasSD Servidor',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',1);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','CaracteristicasSD Servidor',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',2);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','CaracteristicasSD Cliente',3);
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
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','DesafíosSD Servidor',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',4);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','DesafíosSD Cliente',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',5);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','DesafíosSD Cliente',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',6);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Arquitectura Cliente-Servidor Servidor',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',7);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Arquitectura Cliente-Servidor Cliente',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',8);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Arquitectura Cliente-Servidor  Cliente',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',9);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','P2P',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.192',10);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','P2P',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.193',11);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','P2P',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.194',12);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','P2P',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Siguiente Nodo','192.168.0.191',13);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Sockets',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',14);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Sockets',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',15);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Sockets',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',16);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Sockets',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',17);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','RMI Servidor',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',18);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','RMI Cliente',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',19);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Grupo Emisor',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','1',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',20);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Grupo Receptor',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','2',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',21);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Grupo Receptor',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','3',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',22);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','Grupo Receptor',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','4',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',23);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor','192.168.0.191',23);







INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Nombre Aplicación','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Numero Nodo','',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Ip Servidor Central','192.168.0.199',);
INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'Puerto Agente','2000',);



INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)
VALUES (S_PARAMETROS.NEXTVAL,'','',);

/* PARAMETROS */

/* ESCENARIOS */

insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario1 aplicacion1','descripcion escenario1',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.37 PM.png');
insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario2 aplicacion1','descripcion escenario2',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.31 PM.png');
insert into escenarios (id,nombre,descripcion,id_aplicacion,imagen)
values (s_escenarios.nextval,'escenario3 aplicacion1','descripcion escenario3',1,'Users/hectorsam/Desktop/escenarios/Screen Shot 2013-08-10 at 10.40.23 PM.png');

/* ESCENARIOS */

/* EVENTOS */
insert into eventos(id,nombre,PATHSCRIPT) values (s_eventos.nextval,'INICIAR','1');
insert into eventos(id,nombre,PATHSCRIPT) values (s_eventos.nextval,'DETENER','2');
insert into eventos(id,nombre,PATHSCRIPT) values (s_eventos.nextval,'MENSAJE','3');

/* EVENTOS*/

/* E_E */

insert into e_e(id_ejecutable,id_evento) values (1,1);
insert into e_e(id_ejecutable,id_evento) values (1,2);

/* E_E */
