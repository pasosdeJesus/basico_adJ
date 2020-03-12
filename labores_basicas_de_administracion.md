## Labores básicas de administración {#labores_basicas_de_administracion}

Un sistema adJ se administra desde la cuenta ```root``` o bien con ayuda del 
programa ```doas```.

Desde las diversas cuentas del sistema que estén en el grupo ```wheel``` es 
posible pasar a la cuenta root con la orden:

```sh
$ su -
```
	  
Típicamente al pasar a la cuenta root el prompt cambiará a ```#```.

Si **doas** se configura para permitir su utilización por parte de usuarios 
que estén en el grupo ```wheel``` sin clave, podrán ejecutarse ordenes como 
si se tratara de la cuenta ```root``` precediéndolos con **doas**. 
Por ejemplo para listar el directorio del usuario ```root```:

```
$ doas ls /root
```
	  
![Aviso](img/warning.png) Aviso:  Toda acción que realice con el programa 
	**doas**, así como cambios de un usuario a otro, quedarán registradas 
	en la bitácora ```/var/log/secure```

### Manejo de usuarios {#manejo_de_usuarios}

Entre las labores del administrador está agregar, eliminar y modificar 
información de usuarios del sistema.

El administrador puede agregar usuarios con la orden ```adduser```. 
Su uso típico se esboza a continuación[^admin.1]

[^admin.1]: Tenga en cuenta que la primera vez que ejecute ```adduser``` tras 
	instalar un sistema adJ, este programa preguntará valores por 
	omisión por emplear durante la creación de cuentas.

```
doas adduser
...
Enter username []: juan
Enter full name []: Juan Valdez
Enter shell csh ksh nologin sh [ksh]: 
Uid [1003]: 
Login group juan [juan]: 
Login group is ``juan''. Invite juan into other groups: guest no 
[no]: wheel
Login class auth-defaults auth-ftp-defaults daemon default staff 
[default]: staff
Enter password []: 
Enter password again []: 

Name:        juan
Password:    ****
Fullname:    Juan Valdez
Uid:         1003
Gid:         1003 (juan)
Groups:      juan wheel
Login Class: staff
HOME:        /home/juan
Shell:       /bin/ksh
OK? (y/n) [y]: 
```
		  
Note que todo usuario del sistema tiene:

Una identificación
: juan en el ejemplo recién presentado

Un UID
: Se trata de un número que lo identifica (1003 en el ejemplo)

Un GID
: O número que identifica al grupo principal al que pertenece el usuario 
	(1003 en el ejemplo).

Un intérprete de ordenes 
: Que será el que tendrá el usuario al iniciar nuevas sesiones 
	(en el ejemplo es /bin/ksh).

Una clase de login
: Que establecerá parámetros para la sesión, por ejemplo límite en el uso 
	de memoria y recursos. En el ejemplo es ```staff```, pero para 
	usuarios que no vayan a administrar el sistema se sugiere ```default```

Eventualmente uno o más grupos secundarios
: Cada usuario fuera de su grupo principal puede pertenecer a otros grupos. 
	En este ejemplo, el usuario pertenecerá además al grupo ```wheel```, 
	lo cual indica que hará labores administrativas.

Un directorio personal
: Cuyo propietario será el usuario y quedará como directorio de trabajo cada 
	vez que inicie una sesión. En el ejemplo es ```/home/juan``` 
	(note que por omisión todos los directorios de usuarios son 
	subdirectorios de ```/home```).

Para eliminar un usuario y su directorio personal:

```
doas userdel -r juan
```
		  
Es posible modificar información de los usuarios de diversas formas:

- Con la orden ```vipw``` que le permitirá modificar directamente el archivo 
  de claves y usuarios

- Con la orden ```chfn usuario``` podrá modificar algunos datos del perfil 
  del usuario.


### Bitácoras {#bitacoras}

Una de las labores típicas de un administrador de un sistema adJ es revisar 
bitácoras del sistema en búsqueda de vulneraciones de seguridad. 
En la mayoría de las veces se trata de ataques a través de internet, 
ataques que buscan entre otras cosas: acceder a servidores para sacar 
información y modificarla, o usar servidores para que realicen trabajos 
que el atacante quiere hacer, generalmente maliciosos.

adJ/OpenBSD deja un registro muy completo en archivos de ```/var/log``` 
conocidos como bitácoras. Algunos son:

- ```authlog```: Muestra los accesos de los usuarios permitidos y rechazados

- ```secure```: Muestra las ordenes ejecutadas por administradores 

- ```servicio```: Los programas que están corriendo en la máquina

Como el sistema hace rotación de bitácoras periódicamente, en el mismo 
directorio también se encuentra archivadas algunas bitácoras recientes, 
comprimidas (terminan con nombres como .```0.gz```).

#### Análisis simple con la herramienta `auditabitacoras` y reportar una IP {#auditabitacoras}

adJ incluye un sencillo analizador de bitácoras que se inicia con:

```
	doas auditabitacoras
```

Que creará un directorio con copia de las bitácoras y el
informe del análisis. El nombre del directorio será la fecha
de ejecución y se ubicará en `/var/adJ/auditabiracoras`

Por ejemplo si la fecha es 2017-06-27 el reporte quedará en 
`/var/adJ/auditabitacoras/20170627/auditabitacoras.txt`

Se trata de un análisis a los archivos con prefijo `/var/log/auth` 
(que junto con otras bitácoras quedarán copiadas en el directorio creado).  
Debe prestar especial atención a posibles ataques dirigidos a un usuario real 
del cortafuegos (o de la red) para reportar y bloquear.

La IP que esté haciendo más ataques a cuentas genéricas (e.g root) 
reportarla por ejemplo en <https://www.abuseipdb.com> en las categorías
ssh y ataque de fuerza bruta.

Tal IP se puede bloquear agregando en el archivo `/etc/pf.conf` al final 
unas líneas del estilo:

```
	# IP de China reportada el 28 de Junio en https://www.abuseipdb.com/check/58.218.198.142
	block quick on egress from 58.218.198.142
```

#### Ejemplo de análisis usando herramientas UNIX {#ejemplo_bitacoras}

Estos archivos pueden analizarse con algunas herramientas básicas como:

```less```
: Examinar una archivo. En ```less``` la tecla ```G``` (mayúscula) lo lleva al 
	final del archivo.

```grep```
: Muestra cadenas en un archivo

```find```
: Busca una cadena en un archivo o directorio

```wc```
: Cuenta palabras/líneas/caracteres en una archivo

```dig```
: Muestra información de un dominio

```geoiplookup```
: Muestra localización de una IP. No es muy precisa

```gzip```
: Descomprime archivos

A continuación un ejemplo de auditoría de la bitácora ```auth```:

  1. Como usuario root hacer una copia de las bitácoras de ```/var/log``` 
	en un directorio personal y descomprimir bitácoras comprimidas.
```
cd
mkdir audita          # Crea un directorio para copiar
cd audita             # Pasa al directorio creado
mkdir 30sep2006       # Crear un directorio con la fecha
cd 30sep2006	      # Pasa al directorio creado
cp -rf /var/log/* .   # Copia todas las bitácoras (debe ser root)
gzip -d *.gz          # Descomprime bitácoras comprimidas
```
			
  2. Revisar la bitácora a fin de determinar puntos críticos:
```
less authlog
```
	buscando líneas como
```
invalid user test from 211.157.113.89
```
	que revelan intento desde una IP por ingresar como usuario ```test```
	(que no existe en el sistema).

  3. Para ver las líneas en las que aparece una cadena en especial, una 
	IP por ejemplo puede usarse:
```
grep "211.157.113.89" authlog
```
	De forma que podemos ver datos importantes relacionados con la IP 
	como fecha y hora. En el caso de auth la IP corresponde a direcciones 
	desde donde se hacen intentos de ingreso).

  4. Para mostrar cuántas veces está esa IP en ese archivo:
```
grep "211.157.113.89" authlog | wc -l
```
			
  5. Para determinar en qué archivos de la bitácora hay información de esta 
	IP
```
find . -exec grep -l "211.157.113.89" {} ';'
```
			
  6. Para determinar ubicación geográfica de una IP y datos sobre el dominio 
	asociado:
```
geoiplookup  211.157.113.89
dig -x 211.157.113.89
```
			
	El primero indica China, el segundo mail.chinacomm.com.cn. Con el 
	segundo ya podemos buscar información sobre el registro DNS de 
	chinacomm.com.cn:
```
whois chinacomm.com.cn
```
	donde encontramos una dirección de correo: ```wjy@chncomm.com```

  7. Si se ubica el dominio de la IP de donde proviene un ataque, así como una 
	dirección de correo, se recomienda enviar un mensaje en inglés a tal 
	dirección y/o por ejemplo a las cuentas webmaster y root informando 
	sobre el incidente con un tema como:
```
Attempt to login at practica.pasosdeJesus.org from your IP on 16.Aug.2006 at 7:10:41
```
			
### Lecturas recomendadas {#lecturas_recomendadas_admin}

- Documentación del sistema **man adduser, man userdel**

- Para instalar y comenzar a administrar un sistema adJ 
  sugerimos [usuario_adJ](#bibliografia).

- Para administrar un servidor adJ conectado a Internet recomendamos 
  [servidor_adJ](#bibliografia)

Todas las herramientas mencionadas **less**, **find**, **grep**, **wc** tienen 
sus respectivos manuales, los cuales se pueden consultar con **man**, 
por ejemplo

```
man grep
```

