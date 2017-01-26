

# Convenciones Generales Markdown

* Para ver mejor las fuentes en diversos editores, cada línea debe tener
  máximo 80 caracteres.  En notas al pie, elementos de una lista  o en 
  definiciones  a partir de segunda línea dejar espacios para indentar
  y distinguir.  Vea por ejemplo las fuentes de 
  [un archivo en modo puro](https://raw.githubusercontent.com/pasosdeJesus/basico_adJ/master/labores_basicas_de_administracion.md).

* Lo que se digita y rutas deben quedar entre \`\`\`.  Por ejemplo ```ls```

* Nombres o términos que se definen en negrillas, entre \*\*. 
  Por ejemplo **cifrado** es ...

* Términos en inglés en itálicas entre \*. Por ejemplo colchon (del inglès 
 *buffer*)


# Convenciones para estas guías

* Usar Markdown genérico en lo posible pero cuando sea indispensable en la 
  sintaxis de Pandoc, ver <http://pandoc.org>

* Las imagenes dejarlas en el mismo repositorio en subdirectorio ```img```
  y referenciar, por ejemplo ```[Pantallazo de XDM](img/xdm.png)```

* Al procesar con Pandoc y DocBook las notas al pie se numerarán
  automáticamente, por eso  como identificador es mejor emplear 
  una palabra que distinga el capítulo seguido de un consecutivo dentro
  del capítulo.  Por ejemplo ```[^conceptos.1]```

* Un titulo de seccion así: ## Editor ```` ```vim``` ```` {#editor_vim}
  generará un ancla ```editor-vim```, para que el ancla sea 
  ```editor_vim``` usar solo ## Editor vim {#editor_vim}
  La referencia que preferimos es el título convirtiendo espacios en _, pasando
  todo a minúsculas y quitando tildes

* Las referencias a otras secciones de las mismas guías es mejor que generen
  un ```xref``` en DocBook, dado que no es soportado por Pandoc (ver 
  https://groups.google.com/forum/#!msg/pandoc-discuss/w6xOxepdV78/SLLvqiI2R2oJ )
  un postprocesador del Docbook generado las convertirá, siempre que
  deje un enlace de la forma: ```[xref](#id_seccion)```, por ejemplo:
	(ver ```[xref](#primer_uso_de_adJ)```)

* Tenemos inconveniente para usar ```pandoc-citepro``` por lo que la 
  bibliografía la estamos haciendo con ```[idlibro](#bibliografia)``` 
  donde ```idlibro``` es uno de los mencionados en ```bibliografia.md```

* Para tablas nos ha ido mejor con ```pipe_tables``` descritas en 
	<http://pandoc.org/README.html#tables>
