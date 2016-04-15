## Soporte {#soporte}

### Documentación {#documentación}

Por favor adopte la política LBM (Leer el Bendito Manual). La documentación de adJ es:
[http://socrates.io/#Xgal1o2](http://socrates.io/#Xgal1o2)
 utilización básica local y remota.
http://structio.sf.net/guias/usuario_OpenBSD	instalación y uso más avanzado como 
plataforma de escritorio y desarrollo.
http://structio.sf.net/guias/servidor_OpenBSD	configuración como cortafuegos y servidor.
Como adJ es una distribución de OpenBSD los documentos para ese sistema operativo también aplican. 
Sin embargo buena parte de la documentación se encuentra solo en inglés, recomendamos:
  - El manual oficial de cada comando, controlador y archivo de configuración puede leerse con el comando **man**. 
  Tal manual consta de varias secciones: 1 comandos generales, 2 llamadas al sistema y 
  números de error, 3 librerías de C, 4 archivos especiales y soporte de hardware, 5 formatos de archivos, 
  6 juegos, 7 miscelanea, 8 operación y mantenimiento del sistema, 9 kernel. Puede ver por 
  ejemplo la introducción a la sección 6 con man 6 intro. En Internet también consultarse este 
  manual en http://www.openbsd.org/cgi-bin/man.cgi
  - [Documentation and Frequently Asked Questions](http://www.openbsd.org/faq/index.html)
Entre los sitios donde se documentan configuraciones o se evalúan algunas herramientas: http://dhobsd.pasosdeJesus.org, http://www.openbsdcolombia.org, https://calomel.org/
Para realizar preguntas por correo electrónico recomendamos la lista de distribución OpenBSD-Colombia http://groups.google.com/group/OpenBSD-Colombia?hl=es.

### Canal SILC {#canal_silc}

Para dar soporte en el uso de Aprendiendo de Jesús empleamos el canal ```soporte-adJ```, en el servidor 
SILC de ```www.nocheyniebla.org```

#### El protocolo SILC {#el_protocolo_silc}

SILC es un protocolo de teleconferencia inspirado en IRC, pero que transmite los mensajes cifrados a un 
servidor que replica los mensajes a los clientes conectados. Un usuario que se conecte a un servidor, 
decide a que canales de los disponibles unirse o puede crear uno nuevo al que otros usuarios podrían unirse. 
Todo lo que alguno de los miembros de un canal escriba en el canal, será transmitido a todos los que se 
hayan unido a ese canal. SILC también soporta canales privados, canales con clave, el envío de mensajes de 
texto cifrados a individuos así como transmisión de información multimedia (por ejemplo un tablero gráfico 
colaborativo). Puede verse más en [silcnet.org](http://silcnet.org/)

Para emplear el servicio debe utilizarse un cliente de silc, en caso de que cuente con un escritorio gráfico 
recomendamos **pidgin**, o de contar con un interprete de comandos el programa **silc** incluido en 

#### Configuración y uso de Pidgin {#configuración_y_uso_de_pidgin}
**Pidgin** es un programa de mensajería instantánea que permite iniciar sesiones sobre varias redes de 
mensajería al mismo tiempo.
Corre sobre sistemas operativos OpenBSD, Linux, Mac OS X y Windows. Es compatible con las siguientes redes 
de mensajería: AIM, ICQ, Google Talk, Jabber/XMPP, MSN Messenger, Yahoo!, Bonjour, Gadu-Gadu, IRC, Novell 
GroupWise Messenger, QQ, Lotus Sametime, SILC, SIMPLE, MySpaceIM y Zephyr.
Soporta transferencia de archivos, mensajes de ausencia, iconos, emoticones personalizados y notificaciones de 
escribir.
  - Puede iniciar con el botón derecho sobre el escritorio en el menú Internet->Pidgin o desde una terminal 
  escribiendo ```pidgin```.
![Al ejecutar pidgin](http://structio.sourceforge.net/guias/basico_OpenBSD/pidgin2.png)
  - Presionamos botón del ratón sobre **Add** para adicionar una cuenta. En **Protocol** elegimos el 
  protocolo **SILC**.
![Elegimos el protocolo silc](http://structio.sourceforge.net/guias/basico_OpenBSD/pidgin2.png)
  - En **Screen name** colocamos el nombre con el que se vamos a identificarnos(En el ejemplo, hernan). 
  En **Network** digitamos ```www.nocheyniebla.org```.
![Configuración básica](http://structio.sourceforge.net/guias/basico_OpenBSD/pidgin3.png) 
  - En la parte superior izquierda, presionamos botón del ratón sobre **Advanced**.
  - En **Connect server** digitamos nuevamente ```www.nocheyniebla.org```. Además señalamos las dos primeras 
  opciones y la última opción. Presionamos sobre **Save**.
 ![Configuración avanzada](http://structio.sourceforge.net/guias/basico_OpenBSD/pidgin4.png)
  - Al presionar botón del ratón sobre **Buddies** nos muestra el menú y presionamos sobre **Join a chat**.
![](http://structio.sourceforge.net/guias/basico_OpenBSD/pidgin5.png)
  - Al presionar el botón del ratón sobre **Join a Chat** nos muestra un menú. En **Channel** digitamos 
  ```soporte-adJ```.
![Entrando al canal soporte-adJ](http://structio.sourceforge.net/guias/basico_OpenBSD/pidgin6.png)
  - Finalmente, en la parte inferior derecha presionamos el botón del ratón sobre **join**. Y ya podemos empezar 
  a comunicarnos.
 ![Conectados a través de Pidgin y el protocolo SILC](http://structio.sourceforge.net/guias/basico_
 OpenBSD/pidgin7.png)
 
### Cliente SILC tipo texto {#cliente_silc_tipo_texto}

Si prefiere emplear un cliente de silc tipo texto, inicie una sesión con:
```silc -c www.nocheyniebla.org```
![Al ejecutar pidgin](http://structio.sourceforge.net/guias/basico_OpenBSD/silc.png)
Una vez conectado puede dar comandos iniciados con el símbolo '/', por ejemplo:
**/help**:
- presenta ayuda sobre comandos disponibles.
**/quit**
- Para salir del cliente.
**/join soporte-adJ**
- Para unirse al canal **soporte-adJ**
**/list**
- Lista de canales disponibles
**/users soporte-adJ**
- Lista usuarios conectados al canal **soporte-adJ**
**/smgs pablo Me ayudas?**
- Envía "Me ayudas?" como mensaje privado y firmado para el usuario pablo.
