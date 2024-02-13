## Correo electrónico {#correo_electronico}

El correo que reciba en un servidor OpenBSD puede consultarlo por lo menos de 
tres formas:

- Empleando un agente de usuario para leer correo (o cliente de correo o MUA) 
	que soporte alguno de los protocolos soportados (podrían ser POP3, 
	IMAP, IMAP-SSL y POP3S) y configurándolo para extraer/examinar 
	correo del servidor.

- Ingresando con **ssh** al servidor al cual llega el correo y consultándolo 
	localmente con un cliente de correo o MUA. Dos programas típicos 
	para esto que operan en modo texto en sistemas tipo Unix como OpenBSD 
	son **mail** y **mutt**.

- Empleando un webmail desde un navegador.

Otra posibilidad que tiene es reenviar el correo a otro servidor, lo cual puede 
lograr fácilmente creando un archivo ```~/.forward``` en el cual basta que 
ponga la dirección a la cual quiere reenviar el correo que reciba.

Con respecto a protocolos para extraer/examinar correos, algunas diferencias 
entre los mencionados son:

| Protocolo | Cifrado SSL | Carpetas |Saca correo del servidor |
|:---------:|:-----------:|:--------:|:-----------------------:|
| POP3      | No          | No       | Si                      |
| POP3S     | Si          | No       | Si                      |
| IMAP      | No          | Si       | No                      |
| IMAP-SSL  | Si          | Si       | No                      |

En resumen si desea sacar su correo del servidor prefiera POP3S, pero si 
prefiere dejar su correo en el servidor (para accederlo desde varias 
localizaciones) prefiera IMAP-SSL.

Fuera de esos protocolos para extraer/examinar correo en servidores, el 
protocolo SMTP permite enviar correo a través de un servidor.

En cuanto a clientes de correos para el web (webmails), hay varios 
(e.g roundcubemail), prefiera emplearlos desde computadores sin virus 
ni spyware y sobre el protocolo HTTPS (```i.e``` la dirección a la que se 
conecta desde su navegador de comenzar con ```https://```).

En el resto de esta guía se presenta la forma de configuración de algunos 
MUA usando el protocolo IMAP-SSL y el uso básico del MUA **mutt** (tomado de 
[AALinux](#bibliografia)).

### Uso de agentes de usuario para leer correo gráfico {#correo_grafico}

Hay diversos agentes de usuario para leer correo gráficos, tanto de fuentes 
abiertas (Mozilla Thunderbird, Evolution) como de fuentes cerradas (Outlook). 
Típicamente soportan extracción de correo de la cola local o 
extracción/consulta desde un servidor remoto con POP3, POP3S, IMAP o IMAP-SSL.

Cada uno tiene diálogos propios para configurar el protocolo, los servidores 
y otros detalles.

#### Mozilla Thunderbird {#mozilla_thunderbird}

Por ejemplo, en el caso de Thunderbird configure una nueva cuenta de correo 
(Archivo/Nuevo/Cuenta) empleando los datos del servidor que usa. Para el 
dominio ```practica.pasosdeJesus.org``` puede usar como servidor de correo: 
 ```correo2.practica.pasosdeJesus.org``` e IMAP-SSL.

![Configuración de IMAP en Thunderbird](img/imaps-1-thunderbird.png)

Después de la configuración básica de IMAP, ingrese a la configuración de la 
cuenta y del servidor para activar IMAP-SSL:

![Configuración de IMAP-SSL en Thunderbird](img/imaps-2-thunderbird.png)

Finalmente configure el servidor de salida de correo (protocolo SMTP).

![Configuración de servidor SMTP en Thunderbird](img/imaps-3-thunderbird.png)

#### Evolution {#evolution}

Otro cliente de correo que se puede configurar para extraer correo con POP3 
seguro es evolution. A continuación se presenta una de las pantallas de 
configuración del mismo:

![Configuración de POP3S en Evolution](img/evolution.png)

### mutt y procmail {#mutt_y_procmail}

![Cliente de correo mutt](img/mutt.png)

```mutt``` es un MUA que opera en modo texto, fácil de manejar y altamente 
configurable. Opcionalmente, si en el servidor donde ejecute ```mutt``` también 
está ```procmail```, podrá automatizar bastante la organización de su correo 
electrónico.

Al iniciar ```mutt``` presenta los correos que estén en su casilla, le permite 
desplazarse de uno a otro con flechas o con las letras ```j``` y ```k``` 
(cómo en vi), podrá consultar uno con ```Retorno```, salir con ```q```, 
ver ayuda sobre órdenes con ```?```, 
eliminar uno con ```d```, iniciar un correo (o continuar editando algún correo 
pospuesto) con ```m```. 
Una vez esté viendo un correo puede responder con ```r```, 
reenviarlo con ```f``` o pasarlo como entrada a una orden con ```|```. 
Cuando componga un mensaje puede posponer, puede poner adjuntos (con ```a```) 
o emplear programas como PGP o GPG para firmar o cifrar sus mensajes 
(con ```p```).

Para organizar los correos que reciba, puede emplear carpetas, para pasar de 
una carpeta a otra emplee ```c```, para organizar una carpeta (por fecha, 
emisor, destinatario, tamaño, tema o hilos) emplee `o`. 
Si ordena una carpeta por hilos, podrá emplear otras órdenes como ```Ctrl-D``` 
para borrar un hilo completo, ```Ctrl-P``` para pasar al anterior, ```Ctrl-N``` 
para pasar al siguiente.

`mutt` puede configurarse en el archivo ```~/.muttrc```. Un ejemplo se 
presenta a continuación (las líneas iniciadas con # son comentarios):

```
# Para establecer una dirección en la que se prefieren respuestas
my_hdr Reply-To: Juan Valdez
set reply_to=yes
unset reply_self

# Para emplear vim como editor de mensajes y editar el encabezado también
set edit_headers=yes
set editor=vim

# Para establecer algunas carpetas
mailboxes =/var/mail/juan
mailboxes =/home/juan/Mail/tareas
mailboxes =/home/juan/Mail/familia
mailboxes =/home/juan/Mail/paz
```

#### Localización

Es posible localizar mutt al español, lo recomendable es emplear en el sistema 
operativo el locale apropiado para su país con codificación UTF-8 y una 
terminal que soporte UTF-8. En tal caso mutt podrá enviar correos con esta 
codificación y presentar correos con tal codificación, agregando las siguientes 
líneas a su archivo ```~/.muttrc``` (que se espera codificado en UTF-8, ver 
Sección 7.3, “Editor vi”):

```
set config_charset=utf-8
set locale=es_CO.UTF-8
my_hdr Content-Type: text/plain\; charset=UTF-8\; format=flowed
my_hdr Content-Transfer-Encoding: 8bit
```

#### Procmail

Si desea que su correo sea automáticamente organizado en carpetas, cuando 
llegue puede emplear procmail y sincronizarlo con su configuración de mutt. 
procmail puede manejar automáticamente todo correo que reciba en una cuenta y 
realizar con este las acciones que usted describa. Para que separe 
automáticamente los correos en las carpetas del ejemplo anterior, debe 
configurar y crear varios archivos. Cree la carpeta ```~/.procmail```, en ella 
el archivo `rc.maillists` con la configuración de los patrones por 
buscar en los correos y la carpeta en la que deben quedar:

```
:0:
* ^FROM.*fip@ideaspaz.org.*
paz

:0:
* ^TO.*colombia-paz@colnodo.apc.org.*
paz

:0:
* ^TO.*colombia@derechos.net.*
paz

:0:
* ^TOstructio.*
tareas
```

La última línea indica que deben dejarse correos enviados a direcciones 
que incluyan la palabra `structio` en la carpeta `tareas`; mientras que las 
que van a las otras direcciones mostradas, irán a la carpeta `paz`.

El archivo ```~/.procmailrc``` debe contener algo como:

```
LINEBUF=4096
VERBOSE=off
MAILDIR=$HOME/Mail/
FORMAIL=/usr/local/bin/formail
SENDMAIL=/usr/sbin/sendmail
PMDIR=$HOME/.procmail
LOGFILE=$PMDIR/log
INCLUDERC=$PMDIR/rc.maillists
```

La línea ```LOGFILE=$PMDIR/log``` indica que debe registrarse toda acción de 
procmail en ```~/.procmail/log```. Después de configurar este servicio 
puede ser mejor quitarla.

Si en su sistema procmail fue configurado para ser llamado por el MTA, no 
tendrá que hacer más (e.g en la configuración predeterminada de `exim` así 
ocurre). 
Si su MTA no fue configurado para ejecutar procmail puede ejecutarlo, desde
un archivo ```~/.forward``` con:

```
"|IFS=' ' && exec /usr/bin/procmail -f- || exit 75 "
```

#### fetchmail

Este programa, para sistemas tipo UNIX, le permite descargar el correo de uno 
o más servidores empleando protocolos POP3, POP3S, IMAP o IMAP-SSL y dejarlos 
en la cola de correos local de su computador para examinarlos posteriormente 
con mutt o con algún MUA gráfico, configurado para leer correo local.

A continuación se presenta un ejemplo del archivo de configuración 
 ```~/.fetchmailrc``` para extraer correo del servidor 
 ```correo2.practica.pasosdeJesus.org``` con el protocolo IMAP-SSL, suponiendo 
que tanto en el computador que recibe como en el servidor el usuario es 
 ```juan```:

```
set postmaster "postmaster"
set bouncemail
set properties ""

poll correo2.practica.pasosdeJesus.org port 993 with proto IMAP 
no dns
user juan there is juan here 
ssl
```
			  
Con esta configuración puede iniciarse la extracción de correo ejecutando:

```
fetchmail -a
```
			  
### Lecturas recomendadas {#lecturas_recomendadas_correo}

Puede consultar más sobre ```mutt``` con ```man mutt```, y en el manual HTML 
disponible en ```/usr/local/share/doc/mutt/html```.

Puede ver más sobre el archivo ```.forward``` (que puede usar también para 
ejecutar un programa cada vez que llega un correo) con ```man forward```


