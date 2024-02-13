## Formatos de archivos {#formatos-de-archivos}

La forma de emplear un archivo que copie, cree o descargue , depende 
del formato en el que esté. 

El formato usualmente se identifica con la extensión (i.e las últimas 
letras que están después de un punto) o mediante los primeros bytes
del contenido.  Para identificar el formato mediante el contenido
puede usarse un programa como `file` o en caso de formatos gráficos
`identify`.  Por ejemplo

        file foto.jpg

podría responder con

        foto.jpg: JPEG image data, JFIF standard 1.01

que indicaría que se trata de una imagen en formato JPEG que sigue
el estándar JFIF 1.01.

Mientras que 

        identify foto.jpg

podria responder con más detalles de la imagen como las dimensiones
y la codificación del color:

        foto.jpeg JPEG 720x1280 720x1280+0+0 8-bit sRGB 85137B 0.010u 0:00.000

### Legibles

- `.txt` Se trata de un texto plano. Típicamente estará codificado en 
  ASCII. En DOS/Windows los textos planos indican fin de línea con dos 
  caracteres: Retorno de carro[^formatos.1] y nueva línea[^formatos.2], 
  mientras que en sistemas tipo Unix basta se usa sólo el caracter nueva 
  línea.  Para convertir textos DOS/Windows a Unix puede emplear:

          $ cp carta.txt carta.txt.bak
          $ tr -d "\r" < carta.txt.bak > carta.txt

  Si el texto que tiene emplea una codificación que no sea ASCII (por 
  ejemplo Unicode, UTF-8, MAC, Código de Página 850) o requiere convertir 
  de ASCII a otra codificación puede emplear el programa **recode**. 
  Por ejemplo para convertir carta.txt de ASCII a UTF-8[^formatos.3]:

          recode txt..utf-8 carta.txt

- `.md` o `.markdown` se trata de texto planos pero con algo 
  de formato que permite presentarlos con estilos al transformarlos
  a HTML.

### Comprimidos o empaquetados

- `.gz` Es un archivo comprimido con **gzip**. Suponiendo que 
  fuera `archivo.txt.gz` (cuya extensión sugiere un texto comprimido 
  con `gzip`), lo descomprime con:

          gzip -d archivo.txt.gz

  De forma análoga para comprimir el archivo nombres.`sql` puede 
  emplear:

          gzip nombres.sql

  Nota: `gzip` no comprime archivos muy pequeños (digamos 10 bytes):

- `.tar.gz` Se trata de un archivo empaquetado con la utilidad **tar** 
  y después comprimido con el algoritmo de **gzip**. Para descomprimirlo 
  y desempaquetarlo en el directorio en el que esté trabajando:

          tar xvfz archivo.tar.gz

  Si cuenta con un archivo con extensión `.tar` para 
  desempaquetarlo basta:

          tar xvf archivo.tar

  Para empaquetar un directorio digamos ./cartas en formato tar emplearía:

          tar cvf cartas.tar ./cartas

  Y si además lo desea comprimir:

          tar cvfz cartas.tar.gz ./cartas

- `.bz2` Se trata de uno o más archivos comprimidos con **bzip2**.
  Se descomprime con:

        bunzip2 archivo.bz2

  Para comprimir un archivo en este formato:

          bzip2 archivo.pdf

  que creará `archivo.pdf.bz2`

- `.rar` Se descomprime con la utilidad **unrar**, por ejemplo con:

          unrar archivo.rar

- `.7z` Uno o más archivos comprimidos y empaquetados con **7-Zip**.
  Descomprime y desempaqueta por ejemplo con:

          7z x archivo.7z

  y crea un comprimido con

          7z a /tmp/resultado.7z archivo1.pdf archivo2.pdf

  Además al comprimir puede establecerse una clave por ejemplo con:

          7z a -mhe=on -pSecreta /tmp/resultado.7z archivo1.pdf archivo2.pdf

### Gráficos

- `.jpg` o `.jpeg`  Formato comprimido tipícamente con perdidas (es decir
  la imagen comprimida pierde un poco de fidelidad respecto a la orginal) 
  que puede ser bien JPEG/Exif (común en cámaras) o JEPG/JFIF (común
  en gráficas para el web). No conviene usarlo cuando la imagen tiene
  textos, lineas o bordes muy definidos (aunque hay variantes como 
  JPEG 20000 que pueden almacenar imágenes sin perdidas).  
  En general este formato es apropiado para fotografías porque comprime
  más (a costa de las perdidas) y porque no maneja transparencias. 
  Puede ver una imagen en este formato con

          display mifoto.jpg

  Para convertir, editar y otras operaciones vea la sección de
  ImageMagick en el manual de usuario.


### Lecturas recomendadas {#lecturas_recomendadas_formato_de_archivos}

* La página del manual: `man tar`
* https://es.wikipedia.org/wiki/Joint_Photographic_Experts_Group


[^formatos.1]: El caracter retorno de carro tiene código ASCII 13, suele 
	llamarse CR (*Carriage Return*) y diversos programas y lenguajes lo 
	denotan con '\n'.

[^formatos.2]: El caracter nueva línea tiene código ASCII 10, también se llama 
	LF (*Line Feed*) y diversos programas y lenguajes lo denotan con '\r'.

[^formatos.3]: UTF-8 es una de las posibles formas de codificar Unicode en 
	ASCII. Los caracteres Unicode con un ASCII equivalente con código menor 
	de 127 tienen la misma representación en UTF-8. Otros caracteres 
	Unicode emplean una secuencia de dos o más caracteres ASCII para su 
	codificación.
