

Convenciones Generales Markdown

* Par a verlo mejor en editores cada línea máximo 80 caracteres. 
  En notas al pie a partir de segunda línea con un tabulador.

* Lo que se digita debe quedar entre ```

* Nombres o términos que se definen en negrillas, entre **

* Términos en inglés en itálicas entre *



Convenciones para estas guías

* Para imagenes mejor dejarlas en el mismo repositorio en subdirectorio img
  y referenciar e.g img/xdm.png

* Al procesar con Pandoc y DocBook las notas al pie se numerarán
  automáticamente, es mejor emplear por ejemplo una palabra que
  distinga el capítulo seguido de un consecutivo dentro
  del capítulo

* Un titulo de seccion así: ## Editor ```vim``` {#editor_vim}
  generará un ancla editor-vim, para que el ancla sea editor_vim usar solo
  ## Editor vim {#editor_vim}
  La referencia se obtiene del título convirtiendo espacios en _, pasando
  todo a minúsculas y quitando tildes

* Las referencias a otras secciones de las mismas guías es mejor que generen
  un xref en DocBook, dado que no es soportado por Pandoc (ver 
  https://groups.google.com/forum/#!msg/pandoc-discuss/w6xOxepdV78/SLLvqiI2R2oJ )
  un postprocesador del Docbook generado las convertirá, siempre que
  deje un enlace de la forma: [xref](#id_seccion), por ejemplo:
	(ver [xref](#primer_uso_de_adJ))

* Tenemos inconveniente para usar pandoc-citepro por lo que la bibliografía
  la estamos haciendo con [idlibro](#bibliografia) donde idlibro es uno
  de los mencionados en bibliografia.md
