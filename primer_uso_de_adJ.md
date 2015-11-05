##2. Primer uso de adJ## {#primer_uso_de_adJ}

Un servidor adJ puede operarse tanto directamente (sentado frente al computador donde se instaló y configuró), como remotamente por ejemplo con ```ssh```. En esta sección cubrimos ambos escenarios.

###2.1. Arranque###{#arranque}

Al iniciar un computador con adJ el núcleo de OpenBSD detectará el hardware, iniciará los procesos básicos y ejecutará los archivos de arranque. Típicamente la distribución adJ llama claves de imágenes cifradas. (En las imagénes cifradas se almacena los archivos que el usuario quiera cifrar. Para poder guardar y recuperar los archivos se debe dar una clave.) que se montan durante el arranque.
Un computador con adJ siempre arranca con Interfaz de texto y pide clave. 

![Interfaz de texto](http://structio.sourceforge.net/guias/basico_OpenBSD/consola.png)
![Interfaz gráfica](http://s20.postimg.org/5fqvyk749/Captura_de_pantalla_de_2015_10_22_09_31_32.jpg?noCache=1445524364)

[^5]XWindow es un sistema estandarizado para manejo de las aplicaciones gráficas en los sistemas operativos de la familia de los Unix

[^6]XDM  es un gestor de pantalla que presenta al usuario con una pantalla de autenticación (login) que solicita el nombre de usuario y su contraseña

Al dar la clave de cifrado correcta debe ver el mensaje ```File system is clean``` o un chequeo de la imagen. En caso de dar una clave equivocada, continuará la secuencia de arranque pero no podrá acceder a los directorios cifrados[^7].

[^7] Una vez en operación puede volver a dar estas claves ejecutando el archivo /etc/rc.local desde un interprete de comandos, o desde el menú de Fluxbox Dispositivos->Reiniciar Servicios Faltantes

Después se iniciará un escritorio gráfico (X-Window) y un aplicación (```xdm```) que pide su usuario y su clave para iniciar una sesión

![xdm solicitando nombre de cuenta y clave](http://structio.sourceforge.net/guias/basico_OpenBSD/xdm.png)

Si no instaló X-Window verá una consola virtual tipo texto, como la del arranque. Por defecto hay 4 consolas virtuales tipo texto a las cuales pasa con las secuencias de teclas **Ctrl-Alt-F1, Ctrl-Alt-F2, Ctrl-Alt-F3 y Ctrl-Alt-F4**. La secuencia **Ctrl-Alt-F5** lo dejará en el entorno gráfico.

Las instrucciones para operación remota [(Sección 2.3, “Conexión con ssh”)](http://socrates.io/#FVtw1ub) le servirán para operar directamente en una consola virtual, una vez se autentique con su usuario y clave.

En entorno gráfico si se autentica correctamente se iniciará el administrador de ventanas ```fluxbox``` que se presenta brevemente en la siguiente sección.
#arreglar la imagen de interfaz gráfica#

 

###2.2. Operación con fluxbox###{#operación_con_fluxbox}

 

**Fluxbox** es un estético administrador de ventanas, muy liviano y por lo tanto veloz. Administra decoración de ventanas, espacios de trabajo, tiene un menú general (que ve pulsando el botón derecho sobre el escritorio), una barra de herramientas y un lanzador de aplicaciones. A continuación se presenta el escritorio con el menú que aparece al presionar el botón derecho sobre el escritorio.

 

![Menú inicial](http://structio.sourceforge.net/guias/basico_OpenBSD/fluxbox_inicio.png)

 

Observe las distintas posibilidades del menú. Puede navegar en Internet utilizando chrome o midori. En el navegador chrome se abrirá la traducción de los Evangelios incluida (menú Espiritualidad->Evangelios de Dominio Público), así como la documentación (Documentos),

 

![Escritorio fluxbox con navegador Chrome](http://structio.sourceforge.net/guias/basico_OpenBSD/primerflux.png)

 

 

Por el menú Oficina puede elegir LibreOffice que es el paquete de fuentes abiertas con aplicaciones de oficina. La gráfica muestra la interfaz de LibreOffice.org Writer[^8] ---con el que puede abrir y guardar en el formato de MS-Word.

 

[^8] Desde la línea de comandos puede iniciar Writer con ``` /usr/local/bin/swriter``` o puede abrir LibreOffice completo con ```/usr/local/bin/soffice```

 

![LibreOffice Writer](http://structio.sourceforge.net/guias/basico_OpenBSD/openoffice_writer.png)

          

También puede trabajar con la hoja de cálculo Calc[^9], que le permite abrir y guardar en el formato de Excel.

 

[^9] Desde la línea de comandos puede iniciar Calc con ```/usr/local/bin/scalc```

 

![LibreOffice.org Calc](http://structio.sourceforge.net/guias/basico_OpenBSD/openoffice_calc.png)

 

              

Puede elaborar presentaciones y abrir las que se han hecho con PowerPoint con Impress[^10].

 

[^10] Desde la línea de comandos inicia Impress con ```/usr/local/bin/simpress.```

 

![Presentación](http://structio.sourceforge.net/guias/basico_OpenBSD/openoffice_presentacion.png)

 

          

Puede acceder a la documentación para adJ a través del menú de fluxbox. Los tutoriales incluidos son: Uso básico, uso como sistema de escritorio y uso como servidor y cortafuegos.

 

![Documentación](http://structio.sourceforge.net/guias/basico_OpenBSD/documentacion.png)

 

          

Para reproducir CDs de audio puede utilizar xcdplayer cuya interfaz gráfica se presenta a continuación.

 

![ Interfaz gráfica de xcdplayer](http://structio.sourceforge.net/guias/basico_OpenBSD/xcdplayer.png)

 

          

Sin embargo en caso de que su reproductor de CD no esté conectado a una salida de audio, xcdplayer no será útil. Pero en tal caso puede escuchar un CD de audio, abriendo una terminal y tecleando:

 

```sudo cdio cdplay```

        

Desde el menú otros puede acceder a plan y vim. El primero de los cuales es un calendario que permite programar actividades. Mientras que vim es un clásico y ágil editor de texto en ambientes tipo UNIX  

([ver Sección 7.3, “Editor vi](http://socrates.io/#cvHf98X)”)

 

![plan](http://structio.sourceforge.net/guias/basico_OpenBSD/plan.png)

 

          

Por el menú de fluxbox puede configurar Estilos del sistema. La imagen muestra el Estilo de sistema Meta.

 

![Estilos del sistema](http://structio.sourceforge.net/guias/basico_OpenBSD/fluxbox_menu.png)

 

          

Elija el Estilo del sistema que más le guste. Por ejemplo, este Estilo del sistema, llamado Makro.

 

![Ejemplo de Estilo de sistema](http://structio.sourceforge.net/guias/basico_OpenBSD/estilo1.png)

 

          

La figura anterior presenta también un interprete de comandos, que puede iniciar desde el menú eligiendo xterm, aunque también puede emplear uno desde las consolas virtuales después de autenticarse.

 

En sistemas operativos tipos Unix es usual emplear un interprete de comandos para interactuar. Su operación es la misma bien inicie desde el ambiente gráfico o en una consola virtual o remotamente como se explica en la siguiente sección. Aunque ciertamente un interprete de comandos exige más memoria y atención del usuario, también le dará más opciones, más agilidad y la posibilidad de plena operación remota.
##2.3. Conexión con ssh##{#conexión_con_ssh}

 

Dado que la interacción con un interprete de comandos se basa en comandos ingresados por teclado y respuestas tipo texto, estos intérpretes hacen muy efectiva la operación remota. La operación remota puede hacerse de forma segura con el protocolo SSH 2, empleando el servidor OpenSSH del servidor y un cliente de ssh en el computador desde el cual hará la conexión (la ventaja de este protocolo es que además de requerir autenticación, verifica autenticidad del servidor al cual se conecta y sólo transmite información cifrada --lo cual hace muy difícil descifrarla a un tercero que pueda llegar a interceptar la comunicación).

 

Si realiza la conexión desde un sistema tipo Unix, recomendamos que emplee el cliente de OpenSSH, si se conecta desde un sistema tipo Windows puede emplear el programa **putty**

(descarguelo de http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).

 

En el primer caso puede iniciar la conexión con:

 

``` $ ssh juan@www2.pasosdeJesus.org ```

    

reemplazando juan por el login que tenga en el sistema. Note que con el símbolo $, representamos el símbolo del sistema (del inglés prompt) --no debe teclearlo.

 

La conexión con putty se ejemplifica a continuación:

 

![Configuración de putty](http://structio.sourceforge.net/guias/basico_OpenBSD/putty1.png)

 

 

![Aviso](http://structio.sourceforge.net/guias/basico_OpenBSD/warning.png)  Aviso

 

Con Putty asegúrese de emplear el protocolo SSH 2.

 

**ssh** autenticará la máquina a la cual se está conectado, comparando la llave pública de esa máquina con alguna de las que conozca, si es la primera vez que se conecta a ese sitio, **ssh** le pedirá confirmar la nueva llave pública[^11]. Después le pedirá su clave en ese servidor (o si ha configurado autenticación con llaves simétricas pedirá su clave RSA/DSA o incluso nada si ha configurado un age

nte que maneje sus llaves RSA/DSA i.e **ssh-agent** en el caso de OpenSSH) para finalmente dejarlo en una sesión en modo texto.

 

[^11] Si la llave de la máquina a la que se conecta ha cambiado (por ejemplo si se instaló otro sistema operativo o se actualizó sin cuidado), para que el cliente de ssh reconozca la nueva clave debe primero borrar la llave anterior del archivo ~/.ssh/known_hosts

 

![Inicio de una sesión con putty en pasosdeJesus.org](http://structio.sourceforge.net/guias/basico_OpenBSD/putty2.png)

 

Al iniciar la sesión podrá ver el mensaje del día (motd -- message of the day) que el administrador haya configurado, se ejecutarán los archivos de comandos de inicio y quedará en el interprete de comandos que esté configurado en su cuenta.

 

