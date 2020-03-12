
## Transferencia de información a y desde el servidor {#transferencia_de_informacion_a_y_desde_el_servidor}

Hay diversos métodos para transferir información entre el servidor y otros 
computadores.  

Puede descargar información típicamente con los protocolos **http** y 
**ftp** que transmiten la información sin cifrar, esto puede lograrlo con
```ftp```, ```curl``` o ```wget```.
  
Para descargar información cifrada emplee el protocolo **https** con
los mismos ```ftp```, ```curl``` o ```wget```.

Para enviar y recibir información cifrada utilice el protocolo 
**ssh** (o su protocolo asociado **sftp**).  Para emplear este método 
desde un sistema adJ/OpenBSD (o otro sistema tipo Unix que cuente con 
OpenSSH) se puede usar bien ```scp``` desde la línea de ordenes o el 
programa ```filezilla```.

También puede mantener sincronía entre directorios de un par de servidores
con el programa `rsync`.


### ftp {#ftp}

Si tiene una URL para los protocolos http, https o ftp basta que
la escriba como parámetro de la orden ```ftp``` en una terminal 
y este descargará el enlace.  

Por ejemplo las fuentes de este manual están en
```http://pasosdejesus.github.io/basico_adJ/basico_adJ-&VER-OPENBSD;_html.tar.gz``` (que usa protocolo http como indica el comienzo del URL)
podrá descargarlas al directorio de trabajo con:

```
	ftp http://pasosdejesus.github.io/basico_adJ/basico_adJ-&VER-OPENBSD;_html.tar.gz
``` 
Para descargar con protocolo https (soportado por github.io):
```
	ftp https://pasosdejesus.github.io/basico_adJ/basico_adJ-&VER-OPENBSD;_html.tar.gz
```
Y a manera de ejemplo para descargar un documento de respuestas frecuentes 
sobre OpenBSD mediante el protocolo ftp:
```
	ftp ftp://ftp3.usa.openbsd.org/pub/OpenBSD/doc/obsd-faq.txt
```


### curl {#curl}

Los mismos ejemplos de la sección anterior con ```curl``` serían:
```
	curl -O http://pasosdejesus.github.io/basico_adJ/basico_adJ-&VER-OPENBSD;_html.tar.gz
	curl -O https://pasosdejesus.github.io/basico_adJ/basico_adJ-&VER-OPENBSD;_html.tar.gz
	curl -O ftp://ftp3.usa.openbsd.org/pub/OpenBSD/doc/obsd-faq.txt
``` 


### wget {#wget}

Los mismos ejemplos de la sección anterior con ```wget``` serían:
```
	wget http://pasosdejesus.github.io/basico_adJ/basico_adJ-&VER-OPENBSD;_html.tar.gz
	wget https://pasosdejesus.github.io/basico_adJ/basico_adJ-&VER-OPENBSD;_html.tar.gz
	wget ftp://ftp3.usa.openbsd.org/pub/OpenBSD/doc/obsd-faq.txt
``` 

### Filezilla {#filezilla}

**filezilla** le permite transmitir archivos a un servidor.

Puede usarse sobre sistemas operativos OpenBSD, Linux, Mac OS X y Windows. 
Soporta los protocolo FTP, SFTP y FTP sobre SSL.

Una vez instalado ejecútelo y configure la primera vez la conexión a su 
servidor desde el menú Archivo->Gestor de Sitios. Del siguiente ejemplo 
adapte el nombre del servidor y de usuario.

![Configuración de una conexión con filezilla](img/filezillaconexion.png)
              
Una vez configurada la encontrará al abrir FileZilla e ingresar a 
Archivos->Sitios. Cuando elija Conectar se iniciará una conexión cifrada, 
con un intercambio inicial de llaves que debe aceptar, después aparecerán 
paneles como los siguientes:

![Paneles de Filezilla](img/filezilla.png)
              
Note que al lado izquierdo están las carpetas y archivos de su computador 
local, mientras que al lado derecho están las carpetas y archivos del servidor. 
Para transmitir un archivo de uno a otro basta que lo arrastre.

### Uso básico de scp {#uso_basico_de_scp}

Si por ejemplo desea transferir el archivo ```ideas.txt``` del servidor 
OpenBSD ```practica.pasosdeJesus.org``` a otro servidor tipo Unix que tenga 
instalado y configurado ssh (digamos ```comp.trabajo.net```), a la cuenta de 
un usuario ```mateo```, en el directorio ```personal```:

```
$ scp ideas.txt mateo@comp.trabajo.net:personal
```
		
Si desea transmitir el archivo metodo.txt del directorio personal del 
servidor ```comp.trabajo.net``` al directorio en el que está ubicado en 
`practica.pasosdeJesus.org`:
```
$ scp juan2@comp.trabajo.net:personal/metodo.txt .
```

Note que **scp** es similar a **cp** (pues permite copiar un archivo fuente en 
uno destino[^transferencia.1]) sólo que el archivo fuente o el archivo destino 
pueden estar en otra máquina.

[^transferencia.1]: Incluso scp implementa la funcionalidad de cp al permitir 
	copiar localmente un archivo.

Dado que Windows no tiene un servidor **ssh** por omisión, es posible 
transmitir archivos a y desde sistemas Windows sólo desde el computador con 
Windows usando un programa como **winscp** (disponible en <http://winscp.sf.net> 
o **pscp** que se distribuye junto con **putty** ([xref](#conceptos_basicos)).


### Uso básico de `rsync` {#rsync}

rsync busca sincronizar un par de directorios en servidores diferente
transmitiendo sólo la información que sea diferente.

Aunque es posible emplearlo con un protocolo propio (también llamado `rsync`),
este sólo es recomendable para datos públicos porque no es cifrado.  Por
lo mismo la operación típica de rsync es sobre el protocolo ssh.

Por ejemplo si en el servidor con ip 10.11.12.13 tiene una
carpeta /var/micopia/  que necesita traer a un servidor en el que está
operando (digamos a la carpeta local /home/juan/micopia/):

```
cd /home/juan/micopia/
rsync -rvz 10.11.12.13:/var/micopia/* .
```

La orden anterior realizará una conexión ssh (por lo que debe 
operar ssh en el servidor `10.11.12.13`) para copiar todo el contenido
de `/var/micoopia/` del servidor remoto al directorio actual, y lo que hará 
cada una de las opciones `-rvz` es:

`r`

: Modo recursivo, es decir transmitirá subdirectorios y su contenido.

`v`

: Modo verboso, es decir presentará una línea por cada archivo que transmita

`z`

: Modo comprimido, es decir antes de transmitir cada archivo, lo comprimirá
  para disminuir el tiempo de transferencia


El método anterior no transmitirá archivos de configuración (los que empiezan 
con .) y requiere ubicarse primero en el directorio destino.  Podría 
desde cualquier directorio con:

```
rsync -rvz 10.11.12.13:/var/micopia/ /home/juan/micopia/ 
```

Note que es importante terminar las rutas fuente y destino con barra `/`,
no hacerlo transmitiría el directorio.  Por ejemplo si ejecuta:
```
rsync -rvz 10.11.12.13:/var/micopia /home/juan/micopia/ 
```
Terminará con los datos que esperaba en la ruta `/home/juan/micopia/micopia/`

Si tiene permiso de superusuario en el servidor destino y además del modo 
recursivo necesita mantener enlaces (opción -l), archivos especiales (-D), 
fecha (-t), dueño (opciones -o para dueño y -g para grupo) y permisos (-p) 
será  más útil la opción archivo (-a) que abrevia todos esos:

```
rsync -avz 10.11.12.13:/var/micopia/ /home/juan/micopia/ 
```


### Lecturas recomendadas sobre transferencia de archivos {#lecturas_recomendadas_transferencia}

* Página del manual de `curl`
* Página del manual de `wget`
* Página del manual de `scp` 
* Página del manual de `rsync`
