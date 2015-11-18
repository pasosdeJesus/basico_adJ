##5. Uso de medios de almacenamiento###{uso_de_medios_de_almacenamiento}

En [Sección 3, “Conceptos básicos”](http://socrates.io/#KaOWf1G) se definió archivo y sistema de archivos de manera 
general, en esta sección se aplican esos conceptos para utilizar USB y CD-ROM.
En sistemas tipo Unix como adJ es necesario montar los medios de almacenamientos en algún directorio del sistema de 
archivos para poderlos emplear y desmontarlos una vez no se requieren más. En adJ los directorios donde se montan 
USBs y CD-ROMs son ```/mnt/usb y /mnt/cdrom``` respectivamente. Ni el montaje, ni el desmontaje se realizan 
automáticamente, sino por orden expresa del usuario.

##5.1. Montaje y desmontaje en ambiente gráfico###{montaje_y_desmontaje_en_ambiente_gráfico}

Para montar una unidad de USB debe bastar desde el menú de fluxbox (botón derecho del ratón sobre el escritorio) elegir Dispositivo->Montar USB (se emplea el análogo para montar un CD-ROM).

![](http://structio.sourceforge.net/guias/basico_OpenBSD/montar.png)


Una vez lo haga podrá ver el manejador de archivos ```xfe``` ubicado en el directorio donde queda montado el medio.
![](http://structio.sourceforge.net/guias/basico_OpenBSD/xfecdrom.png)
Al montar estos medios, el dueño es el usuario administrador que se especificó durante la instalación de adJ. 
Este podrá leer de los medios y en el caso de USB es quien podrá escribir.
Una vez termine de emplear el medio de alamacenamiento desmontelo también desde el menú de fluxbox 
Dispositivo->Desmontar USB

##5.2. Montaje y desmontaje desde interprete de comandos###{montaje_y_desmontaje_desde_interprete_de_comandos}

Para montar la USB debe bastar ejecutar desde una terminal:
```mount /mnt/usb```
El CD-ROM se monta de la misma forma cambiando ```usb``` por ```cdrom```.
Para demonstar la USB basta:
```umount /mnt/usb```
y para demonstar un CD-ROM:
```umount /mnt/cdrom```
            
##5.3. Administrador de archivos Xfe###{administrador_de_archivos}
 
Con este sencillo programa podrá administrar archivos y directorios, es decir crear, copiar, renombrar, crear 
enlaces, cambiar permisos e incluso hacer estas operaciones como superusuario.
Entre las características del porte de adJ destacamos, las siguientes adaptadas y traducidas de la ayuda oficial 
--que podrá consultar desde el menu Ayuda:
  - Interfaz gráfica de usuario muy rápida con cuatro formas de administrar archivos: un panel; árbol y panel; dos 
  páneles; árbol y dos paneles.
   - Soporta codificación UTF-8 y se ha traducido a 20 idiomas (incluyendo español de Colombia). Puede presentar la 
  interfaz con caracteres no latinos (como chino o japónes) siempre y cuando configure un tipo de letra que soporte 
  Unicode desde el menú Editar/Preferencias/Tipo de letra
   - Incluye las siguientes aplicaciones: Editor de texto (X File Write, xfw, ver [Sección 7.1, “Editor xfw”]()), 
   Visor de texto (X File View, xfv), Visor de imágenes (X File Image, xfi), Visor/Instalador/Desinstalador de 
   paquetes (rpm o deb) (X File Package, xfp).
   - La interfaz gráfica soporta temas con posibilidad de cambiar colores, íconos y apariencia. Cuenta con Barras 
   de herramientas, Marcadores e Historial.
   - Papelera para operaciones de eliminación de archivos. Se ubica en ```~/local/share/Trash/files```
   - Permite realizar operaciones como superusuario, bien iniciando de`sde una terminal con:
```sudo xfe```      
o si está bien configurado puede inicarse una ventan superusuario desde el menu Herramientas->Ventana superusuario 
nueva.
   - Maneja paquetes de OpenBSD: seleccionando cualquier archivo y pulsando botón derecho podrá elegir en el menú 
  emergente Consultar Paquetes que buscará el paquete que contiene el archivo seleccionado. Si selecciona un 
  paquete y pulsa el botón derecho, en el menú emergente podrá elegir Ver el contenido del paquete Si usa una 
  ventana superusuario de Xfe también podrá   instalarlo/actualizarlo o desinstalarlo, pulsando botón derecho sobre 
  el paquete y eligiendo en el menú emergente Instalar/Actualizar o Desistalar respectivamente.
 ![Uso de Xfe para manejar paquetes en adJ](http://structio.sourceforge.net/guias/basico_OpenBSD/xfepaq.png)
  - Permite comprimir en formatos tar, compress, zip, gzip, bzip2, xz y 7zip y descomprimir de formatos tar, 
  compress, zip, gzip, bzip2, xz, lzh, rar, ace, arj y 7zip
   - Usable: barras de progreso o cuadros de diálogo para operaciones de archivo demoradas, vista previa con 
   miniaturas, atajos de teclado configurables, asociaciones de archivos, operaciones de arrastrar y soltar, ayudas 
   emergentes con las propiedades de los archivos.
   - En listados y en el árbol de directorios puede seleccionar varios elementos y al hacer pulsación derecha se 
  abrirá un menú contextual sobre los elementos seleccionados. En los panels **Ctrl +** pulsación derecha abrirá un 
  menú contextual con otras operaciones.
 
##5.3.1. Atajos de teclado predeterminados###{atajos_de_teclado_predeterminados}

Los atajos de teclado pueden personalizarse en el cuadro de diálogo Preferencias. Los predeterminados para todas 
la aplicaciones integradas se listan a continuación (vea otros atajos de teclado partículares de cada Aplicación 
en el menú Ayuda).
  - **Ctrl-A**: Seleccionar todo
  - **Ctrl-C**: Copiar al portapapeles
  - **Ctrl-F**: Buscar
  - **Mayúscula-Ctrl-G**: Buscar anterior
  - **Ctrl-G**: Buscar siguiente
  - **Ctrl-H**: Ir al directorio personal
  - **Ctrl-I**: Invertir selección
  - **Ctrl-O**: Abrir archivo
  - **Ctrl-P**: Imprimir ficha
  - **Ctrl-Q**: Salir de la aplicación
  - **Ctrl-V**: Pegar desde el portapapeles
  - **Ctrl-W**: Cerrar ventana
  - **Ctrl-X**: Cortar al portapapeles
  - **Ctrl-Z**: Deseleccionar todo
  - **F1**: Mostrar ayuda
  - **F2**: Crear un archivo nuevo
  - **F7**: Crear un directorio nuevo
  - **F10**: Listado con iconos grandes
  - **F11**: Listado con iconos pequeños
  - **F12**: Listado detallado de archivos
  - **Ctrl-F6**: Alternar mostrar archivos ocultos
  - **Ctrl-F7**: Alternar mostrar miniaturas
  - **Mayúscula-F2**: Ir al directorio de trabajo
  - **Retroceso**: Ir al directorio superior
  - **Ctrl-Retroceso**: Ir al directorio anterior
  - **Mayúscula-Retroceso**: Ir al directorio siguiente
#Falta link de [Sección 7.1, “Editor xfw”#

 ##5.4. Particiones cifradas###{particiones_cifradas}

adJ soporta por defecto 2 particiones cifradas que se montan en  ```/var/postgresql ``` y  ```/var/www/resbase ```. La clave de cifrado debe suministrarse durante el arranque, y sólo si esta es correcta podrá ver el contenido de esas carpetas y escribir (si durante el arranque no le solicita clave de cifrado faltó activar particiones cifradas en la instalación --aunque podrá hacerlo actualizando adJ). Así que puede verificar si la clave fue correcta examinando esas rutas bien con xfe o bien desde un interprete de comandos:
  - xfe: Inicie **xfe**, asegurese de ver Árbol y Panel desde el menú Ver. En el Árbol de directorios de 
  la izquierda elija el directorio raiz (primero marcado con /) con doble pulsación del botón izquierdo, 
  bajé para elejir var, a continuación  ```www ``` y a continuación  ```resbase ```.
  - Interpete de comandos: Inicide una terminal y teclee
 ```ls /var/www/resbase```
Allí debe ver directorios como AD o anexos o copias de respaldo o dependiendo de la configuración de su servido, 
una carpeta para cada usuario.
Si no ve información en este directorio ni en  ```/var/postgresql ``` es posible que haya dado mal la clave de 
cifrado en el arranque, en tal caso desde el menú de Fluxbox (botón derecho sobre el escritorio) elija 
Dispositivo->Iniciar Servicios Faltantes o desde un interprete de comandos teclee
 ```sudo sh /etc/rc.local ```
Procedimiento que volverá a pedir clave de cifrado en caso de que haya hecho falta.
Dependiendo de la configuración de su sistema, si ve directorios para cada usuario en /var/www/resbase usted 
odrá leer y escribir sólo en su carpeta.
Un superusuario podrá copiar o examinar información en todas las carpetas. Con xfe puede asegurar que su ventana 
es de superusuario con Herramientas->Ventana superusuario nueva o iniciar una desde la terminal con
 ```sudo xfe ```
Desde una terminal basta preceder las instrucciones con **sudo**.
Por ejemplo para copiar un archivo  ```fuentes.txt ``` que está en una USB, con una ventana de superusuario en xfe 
siga estos pasos:
Montar la USB
  - Ir al directorio  ```/mnt/usb ``` empleando el árbol de directorios
  - Buscar el archivo por copiar, elegirlo, pulsar botón derecho y en el menú emergente elegir Copiar.
  - Ubicar el directorio  ```/var/www/resbase ``` empleando el árbol de directorios de xfe
  - Sobre el directorio resbase en el árbol de directorios pulsar el botón derecho y del menú emergente elegir 
  Pegar.
  - El mismo procedimiento desde un interprete de comandos lo realiza con:
 ```sudo mount /mnt/usb ```
 ```sudo cp /mnt/usb/fuentes.txt /var/www/resbase ```

##5.5. Lecturas recomendadas###{lecturas_recomendadas}

Páginas del manual [mount(8)](http://socrates.io/#Gjmxv9k) y [umount(8)](http://socrates.io/#Gjmxv9k)
