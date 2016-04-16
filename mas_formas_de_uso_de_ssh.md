## Más formas de uso de ssh {#mas_formas_de_uso_de_ssh}

El protocolo **ssh** además de permitirle conectarse a servidores en modo texto (ver [Sección 2.3, “Conexión con ssh”](http://socrates.io/#FVtw1ub)) le permite iniciar aplicaciones gráficas que se ejecuten en el servidor, hacer redireccionamiento de puertos y conectarse sin necesidad de dar clave (dando una clave sólo una vez en su computador).

### Abrir programas con interfaz gráfica {#abrir_programas_con_interfaz_grafica}

Es posible ejecutar aplicaciones gráficas en el servidor y ver las ventanas gráficas en otro computador. Para esto es necesario:

  1. Que en el archivo de configuración ```/etc/ssh/sshd_config``` del servidor esté habilitada la opción:
```
X11Forwarding yes```
		
  2. Que en el computador donde se desea ver la información esté instalado un servidor de X-Window.

En el caso de sistemas tipo Unix basta con tener X-Window instalado (si ve el modo gráfico es porque ya está instalado). Para otros sistemas operativos puede ser posible encontrar un servidor de X-Window, por ejemplo para Windows, puede emplear Cygwin-X (http://x.cygwin.com) o Xming (http://www.straightrunning.com/XmingNotes/).

Una vez esté ejecutándo el servidor de X-Window en su computador entre al servidor usando **ssh** con opción para hacer reenvío de X11. De esta manera toda la información gráfica enviada por el servidor viajará por el canal seguro que ssh establece cuando se conecta al servidor. En el caso de OpenSSH esto se indica con la opción ```-X```, i.e se debe conectar con:
```
ssh -X juan@practica.pasosdeJesus.org```
		
En el caso de **putty** en el dialogo de configuración que aparece antes de iniciar la conexión, en el menú Connection->SSH->X11 marque 'Enable X11 forwarding'.

![Reenvío de X11 en putty](http://structio.sourceforge.net/guias/basico_OpenBSD/putty-x11.png)

Una vez haga esto, las aplicaciones gráficas que inicie en la sesión ssh que inició, se verán en su computador. Pruebe por ejemplo con:

```xeyes```

### Tunel reenviando un puerto {#tunel_reenviando_un_puerto}

Puede usar **ssh** también para crear un túnel entre un puerto local y un puerto accequible desde el servidor al cual se conecta. Por ejemplo si en una organización tienen un cortafuegos conectado a Internet (digamos que es practica.pasosdeJesus.org) y en la red interna cuentan con un servidor web SSL (por ejemplo ```base```), podría establecerse un túnel desde un computador fuera de la organización y el servidor privado, ingresando al cortafuegos con:
```
			ssh -L10443:base:443 juan@practica.pasosdeJesus.org```
		
donde ```base``` es el nombre del servidor al interior de la organización y 443 es el número de puerto de HTTPS (protocolo HTTP sobre SSL, es decir conexiones web encriptadas).

Si emplea **putty** debe especificar esta información en el diálogo de configuración Connection->SSH->Tunnels como se presenta a continuación presionando el botón Add para adicionar el túnel a la región `Forwarded ports'.

![Configuración de túnel en putty](http://structio.sourceforge.net/guias/basico_OpenBSD/putty-tunnel.png)

Una vez inicie la conexión debe digitar la clave del usuario en el cortafuegos. Con lo cual quedará establecido un túnel entre el puerto 10443 del computador local y el puerto 443 del servidor ```base```. Este túnel puede usarse ingresando en un navegador la dirección:

```https://127.0.0.1:10443```
		
### Tunel con protocolo SOCKS {#tunel_con_protocolo_sock}

Otra forma de realizar un tunel, pero sin limitarlo a un puerto es empleando un servidor SOCKS incluido con el programa ssh y configurando su navegador para emplearlo.

Primero debe establecer la conexión indicando el puerto que usará para el servidor socks con la opción -D, por ejemplo:
```
			ssh -D8080 juan@practica.pasosdeJesus.org```
		
donde 8080 es el número de puerto donde correrá el servidor SOCKS en su computador.

Si emplea **putty** debe especificar esta información en el diálogo de configuración Connection->SSH->Tunnels, marcando Dynamic y escribiendo un puerto como 8080 en "Local Port," y proceder a conectarse al servidor.

A continuación debe configurar su navegador para que utilice ese servidor SOCKs en su propio computador en el puerto que específico (8080 en este ejemplo). En el caso de Firefox puede hacerlo desde Editar->Preferencias->Avanzado->Red->Configurar especificar en servidor Socks 127.0.0.1 y en puerto 8080. Una vez acepte toda navegación que intente realizar se hará por el servidor al cual se conectó. Si por ejemplo ese servidor tiene acceso en una red interna a un servidor con IP 192.168.1.2 puede emplear esa URL en su navegador y llegará a ese computador en la red interna donde está el servidor.

### Lecturas recomendadas {#lecturas_recomendadas}

Puede aprender sobre **ssh** examinado la especificación del protocolo en uno de los borradores de la especificación temporal "SSH Protocol Architecture" (https://tools.ietf.org/html/draft-ietf-secsh-architecture-22).

Hay información sobre la implementación OpenSSH en http://www.openssh.org.
