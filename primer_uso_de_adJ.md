##2. Primer uso de adJ## {#primer_uso_de_adJ}

Un servidor adJ puede operarse tanto directamente (sentado frente al computador donde se instaló y configuró), como remotamente por ejemplo con ```ssh```. En esta sección cubrimos ambos escenarios.

###2.1. Arranque###

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

