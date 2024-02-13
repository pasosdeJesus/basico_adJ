## Uso de medios de almacenamiento {#uso_de_medios_de_almacenamiento}

En [xref](#conceptos_basicos) se definió archivo y sistema de archivos de 
manera general, en esta sección se aplican esos conceptos para utilizar USB y 
CD-ROM.
En sistemas tipo Unix como adJ es necesario montar los medios de 
almacenamientos en algún directorio del sistema de archivos para poderlos 
emplear y desmontarlos una vez no se requieren más. En adJ los directorios 
donde se montan USBs y CD-ROMs son ```/mnt/usb``` y ```/mnt/cdrom``` 
respectivamente. Ni el montaje, ni el desmontaje se realizan automáticamente, 
sino por orden expresa del usuario.

### Montaje y desmontaje en entorno gráfico {#montaje_y_desmontaje_en_entorno_grafico}

Para montar una unidad de USB debe bastar desde el menú de fluxbox (botón 
derecho del ratón sobre el escritorio) elegir Dispositivo->Montar USB (se 
emplea el análogo para montar un CD-ROM).

![Menú Dispositivo->Montar USB](img/montar.png)


Una vez lo haga podrá ver el manejador de archivos ```xfe``` ubicado en el 
directorio donde queda montado el medio.  
![](img/xfecdrom.png)

Al montar estos medios, el dueño es el usuario administrador que se especificó 
durante la instalación de adJ. 
Este podrá leer de los medios y en el caso de USB es quien podrá escribir.
Una vez termine de emplear el medio de almacenamiento desmóntelo también 
desde el menú de fluxbox Dispositivo->Desmontar USB

### Montaje y desmontaje desde intérprete de órdenes {#montaje_y_desmontaje_desde_interprete_de_ordenes}

Para montar la USB debe bastar ejecutar desde una terminal:
```
doas mount /mnt/usb
```
El CD-ROM se monta de la misma forma cambiando ```usb``` por ```cdrom```.
Para desmontar la USB basta:
```
doas umount /mnt/usb
```
y para desmontar un CD-ROM:
```
doas umount /mnt/cdrom
```
            
### Administrador de archivos Xfe {#administrador_de_archivos_xfe}
 
Con este sencillo programa podrá administrar archivos y directorios, es decir 
crear, copiar, renombrar, crear enlaces, cambiar permisos e incluso hacer estas 
operaciones como superusuario.
Entre las características del porte de adJ destacamos, las siguientes adaptadas 
y traducidas de la ayuda oficial --que podrá consultar desde el menú Ayuda:

- Interfaz gráfica de usuario muy rápida con cuatro formas de administrar 
	archivos: un panel; árbol y panel; dos paneles; árbol y dos paneles.

- Soporta codificación UTF-8 y se ha traducido a 20 idiomas (incluyendo español 
	de Colombia). Puede presentar la interfaz con caracteres no latinos 
	(como chino o japonés) siempre y cuando configure un tipo de letra que 
	soporte Unicode desde el menú Editar/Preferencias/Tipo de letra

- Incluye las siguientes aplicaciones: Editor de texto (X File Write, xfw, 
	ver [xref](#editor_xfw)), Visor de texto (X File View, xfv), 
	Visor de imágenes (X File Image, xfi), Visor/Instalador/Desinstalador 
	de paquetes (rpm o deb) (X File Package, xfp).

- La interfaz gráfica soporta temas con posibilidad de cambiar colores, 
	iconos y apariencia. Cuenta con Barras de herramientas, Marcadores e 
	Historial.

- Papelera para operaciones de eliminación de archivos. Se ubica en ```~/local/share/Trash/files```

- Permite realizar operaciones como superusuario, bien iniciando desde una 
	terminal con:

    doas xfe

	o si está bien configurado puede iniciarse una ventan superusuario desde 
	el menú Herramientas->Ventana superusuario nueva.

- Maneja paquetes de OpenBSD: seleccionando cualquier archivo y pulsando botón 
	derecho podrá elegir en el menú emergente Consultar Paquetes que 
	buscará el paquete que contiene el archivo seleccionado. Si 
	selecciona un paquete y pulsa el botón derecho, en el menú emergente 
	podrá elegir Ver el contenido del paquete Si usa una ventana 
	superusuario de Xfe también podrá   instalarlo/actualizarlo o 
	desinstalarlo, pulsando botón derecho sobre el paquete y eligiendo 
	en el menú emergente Instalar/Actualizar o Desinstalar respectivamente.
	![Uso de Xfe para manejar paquetes en adJ](img/xfepaq.png)

- Permite comprimir en formatos tar, compress, zip, gzip, bzip2, xz y 7zip 
	y descomprimir de formatos tar, compress, zip, gzip, bzip2, xz, lzh, 
	rar, ace, arj y 7zip

- Usable: barras de progreso o cuadros de diálogo para operaciones de archivo 
	demoradas, vista previa con miniaturas, atajos de teclado configurables,
	asociaciones de archivos, operaciones de arrastrar y soltar, ayudas 
	emergentes con las propiedades de los archivos.

- En listados y en el árbol de directorios puede seleccionar varios elementos 
	y al hacer pulsación derecha se abrirá un menú contextual sobre los 
	elementos seleccionados. En los paneles **Ctrl +** pulsación derecha 
	abrirá un menú contextual con otras operaciones.
 
#### Atajos de teclado predeterminados {#atajos_de_teclado_predeterminados}

Los atajos de teclado pueden personalizarse en el cuadro de diálogo Preferencias. Los predeterminados para todas 
la aplicaciones integradas se listan a continuación (vea otros atajos de teclado particulares de cada Aplicación 
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

### Particiones cifradas {#particiones_cifradas}

adJ soporta de manera predeterminada 2 particiones cifradas que se montan 
en  ```/var/postgresql ``` y  ```/var/www/resbase ```. 
La clave de cifrado debe suministrarse durante el arranque, y sólo si esta es 
correcta podrá ver el contenido de esas carpetas y escribir (si durante el 
arranque no le solicita clave de cifrado faltó activar particiones cifradas 
en la instalación --aunque podrá hacerlo actualizando adJ). 
Así que puede verificar si la clave fue correcta examinando esas rutas bien 
con xfe o bien desde un intérprete de órdenes:

- xfe: Inicie **xfe**, asegúrese de ver Árbol y Panel desde el menú Ver. 
	En el Árbol de directorios de la izquierda elija el directorio raíz 
	(primero marcado con /) con doble pulsación del botón izquierdo, bajé 
	para elegir var, a continuación  ```www ``` y a continuación  
	```resbase ```.
- Intérprete de órdenes: Inicie una terminal y teclee 
```
ls /var/www/resbase
```

Allí debe ver directorios como AD o anexos o copias de respaldo o dependiendo 
de la configuración de su servidor, una carpeta para cada usuario.
Si no ve información en este directorio ni en  ```/var/postgresql ``` es 
posible que haya dado mal la clave de cifrado en el arranque, en tal caso 
desde el menú de Fluxbox (botón derecho sobre el escritorio) elija 
Dispositivo->Iniciar Servicios Faltantes o desde un intérprete de órdenes 
teclee
```
doas sh /etc/rc.local
```
Procedimiento que volverá a pedir clave de cifrado en caso de que haya 
hecho falta.

Dependiendo de la configuración de su sistema, si ve directorios para cada 
usuario en ```/var/www/resbase``` usted podrá leer y escribir sólo en su 
carpeta.  

Un superusuario podrá copiar o examinar información en todas las 
carpetas. Con xfe puede asegurar que su ventana es de superusuario 
ejecutando desde una terminal:
```
doas xfe
```

Desde una terminal basta preceder las instrucciones con **doas**.

Por ejemplo para copiar un archivo  ```fuentes.txt ``` que está en una 
USB, con una ventana de superusuario en xfe siga estos pasos:

- Montar la USB
- Ir al directorio  ```/mnt/usb ``` empleando el árbol de directorios
- Buscar el archivo por copiar, elegirlo, pulsar botón derecho y en el menú 
	emergente elegir Copiar.
- Ubicar el directorio  ```/var/www/resbase ``` empleando el árbol de 
	directorios de xfe
- Sobre el directorio resbase en el árbol de directorios pulsar el botón 
	derecho y del menú emergente elegir Pegar.


El mismo procedimiento desde un intérprete de órdenes lo realiza con:
```
doas mount /mnt/usb 
```
```
doas cp /mnt/usb/fuentes.txt /var/www/resbase 
```

### Lecturas recomendadas {#lecturas_recomendadas_medios}

Páginas del manual mount (8) y umount (8)
