##12. Correo electrónico {#correo_electronico}

El correo que reciba en un servidor OpenBSD puede consultarlo por lo menos de tres formas:

  - Empleando un agente de usuario para leer correo (o cliente de correo o MUA) que soporte alguno de los protocolos soportados (podrían ser POP3, IMAP, IMAP-SSL y POP3S) y configurándolo para extraer/examinar correo del servidor.

  - Ingresando con **ssh** al servidor al cual llega el correo y consultándolo localmente con un cliente de correo o MUA. Dos programas típicos para esto que operan en modo texto en sistemas tipo Unix como OpenBSD son **mail** y **mutt**.

  - Empleando un webmail desde un navegador.

Otra posibilidad que tiene es reenviar el correo a otro servidor, lo cual puede lograr fácilmente creando un archivo ```~/.forward``` en el cual basta que ponga la dirección a la cual quiere reenviar el correo que reciba.

Con respecto a protocolos para extraer/examinar correos, algunas diferencias entre los mencionados son:

**Tabla 1. Escritorio gráfico**
```
Protocolo	 Encripción SSL	Carpetas	Saca correo del servidor
POP3		  No		 	   No			Si
POP3S	 	Si				No			Si
IMAP		  No			    Si			No
IMAP-SSL 	 Si	 		   Si		    No
```
En resumen si desea sacar su correo del servidor prefiera POP3S, pero si prefiere dejar su correo en el servidor (para accederlo desde varias localizaciones) prefiera IMAP-SSL.

Fuera de esos protocolos para extraer/examinar correo en servidores, el protocolo SMTP permite enviar correo a través de un servidor.

En cuanto a clientes de correos para el web (webmails), hay varios (e.g squirrelmail, horde), prefiera emplearlos desde computadores sin virus ni spyware y sobre el protocolo HTTPS (```i.e``` la dirección a la que se conecta desde su navegador de comenzar con ```https://```).

En el resto de esta guía se presenta la forma de configuración de algunos MUA usando el protocolo IMAP-SSL y el uso básico del MUA **mutt** (tomado de [AALinux](http://socrates.io/#UqCo8Cb)).

###12.1. Uso de agentes de usuario para leer correo gráfico

Hay diversos agentes de usuario para leer correo gráficos, tanto de fuentes abiertas (Mozilla Thunderbird, Evolution) como de fuentes cerradas (Outlook). Típicamente soportan extracción de correo de la cola local o extracción/consulta desde un servidor remoto con POP3, POP3S, IMAP o IMAP-SSL.

Cada uno tiene diálogos propios para configurar el protocolo, los servidores y otros detalles.

###12.1.1. Mozilla Thunderbird {#mozilla_thunderbird}

Por ejemplo, en el caso de Thunderbird configure una nueva cuenta de correo (Archivo/Nuevo/Cuenta) empleando los datos del servidor que usa. Para el dominio practica.pasosdeJesus.org puede usar como servidor de correo: ```correo2.practica.pasosdeJesus.org``` e IMAP-SSL.

![Configuración de IMAP en Thunderbird](http://structio.sourceforge.net/guias/basico_OpenBSD/imaps-1-thunderbird.png)
Después de la configuración básica de IMAP, ingrese a la configuración de la cuenta y del servidor para activar IMAP-SSL:

![Configuración de IMAP-SSL en Thunderbird](http://structio.sourceforge.net/guias/basico_OpenBSD/imaps-2-thunderbird.png)
Finalmente configure el servidor de salida de correo (protocolo SMTP).

![Configuración de servidor SMTP en Thunderbird](http://structio.sourceforge.net/guias/basico_OpenBSD/imaps-3-thunderbird.png)

###12.1.2. Evolution {#evolution}

Otro cliente de correo que se puede configurar para extraer correo con POP3 seguro es evolution. A continuación se presenta una de las pantallas de configuración del mismo:

![Configuración de POP3S en Evolution](http://structio.sourceforge.net/guias/basico_OpenBSD/evolution.png)

#Arreglar la Tabla 1. Escritorio gráfico quedó ordenada pero sin cuadros y la letra#
