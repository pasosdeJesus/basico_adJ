## Formatos de archivos {#formatos_de_archivos}

Para descargar un archivo de Internet en un directorio de su cuenta puede usar:
```
ftp http://el.servidor.net/la/ruta/elarchivo.ext```
		
Con este método puede descargar archivos con los protocolos ftp o http. Otra posibilidad es emplear alguno de los programas **wget**, **curl** o **w3mir** que le permiten descargar más de un archivo a la vez (o sitios web completos), y manejan más protocolos (e.g https).

La forma de emplear un archivo que descargue, depende del formato en el que esté. El formato usualmente se identifica con la extensión (i.e las últimas letras que están después de un punto).

  - .```txt``` Se trata de un texto plano. Típicamente estará codificado en ASCII. En DOS/Windows los textos planos indican fin de línea con dos caracteres: Retorno de carro[^11] y nueva línea[^12], mientras que en sistemas tipo Unix basta se usa sólo el caracter nueva línea. Para convertir textos DOS/Windows a Unix puede emplear:
```
$ cp carta.txt carta.txt.bak
$ tr -d "\r" < carta.txt.bak > carta.txt```
Si el texto que tiene emplea una codificación que no sea ASCII (por ejemplo Unicode, UTF-8, MAC, Código de Página 850) o requiere convertir de ASCII a otra codificación puede emplear el programa **recode**. Por ejemplo para convertir carta.txt de ASCII a UTF-8[^13]:
```recode txt..utf-8 carta.txt```

  -  .```gz``` Es un archivo comprimido con **gzip**. Suponiendo que fuera ```archivo.txt.gz``` (cuya extensión sugiere un texto comprimido con ```gzip```), lo descomprime con:
```gzip -d archivo.txt.gz```

De forma análoga para comprimir el archivo nombres.```sql``` puede emplear:
```gzip nombres.sql```
	
Nota: ```gzip``` no comprime archivos muy pequeños (digamos 10 bytes):

  - .```tar.gz``` Se trata de un archivo empaquetado con la utilidad **tar** y después comprimido con el algoritmo de **gzip**. Para descomprimirlo y desempaquetarlo en el directorio en el que esté trabajando:
```tar xvfz archivo.tar.gz```
			
Si cuenta con un archivo con extensión .```tar``` para desempaquetarlo basta:
```tar xvf archivo.tar```
			
### Lecturas recomendadas {#lecturas_recomendadas_formato_de_archivos}

La página del manual: **man tar**

[^11] El caracter retorno de carro tiene código ASCII 13, suele llamarse CR (Carriage Return) y diversos programas y lenguajes lo denotan con '\n'.

[^12] El caracter nueva línea tiene código ASCII 10, también se llama LF (Line Feed) y diversos programas y lenguajes lo denotan con '\r'.

[^13] UTF-8 es una de las posibles formas de codificar Unicode en ASCII. Los caracteres Unicode con un ASCII equivalente con código menor de 127 tienen la misma representación en UTF-8. Otros caracteres Unicode emplean una secuencia de dos o más caracteres ASCII para su codificación.
