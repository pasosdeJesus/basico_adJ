# Reglas para generar HTML, PostScript y PDF de basico_adJ
# Basadas en infraestructura de dominio público de repasa
#   (http://structio.sourceforge.net/repasa)

include Make.inc

# Variables requeridas por comdocbook.mak

EXT_DOCBOOK=xdbk

FUENTESDB=introduccion.xdbk primer_uso_de_adJ.xdbk conceptos_basicos.xdbk soporte.xdbk uso_de_medios_de_almacenamiento.xdbk personalizacion.xdbk edicion_de_textos.xdbk primeras_paginas_html.xdbk transferencia_de_informacion_a_y_desde_el_servidor.xdbk mas_formas_de_uso_de_ssh.xdbk formatos_de_archivos.xdbk correo_electronico.xdbk labores_basicas_de_administracion.xdbk novedades.xdbk bibliografia.xdbk


SOURCES=$(PROYECTO).$(EXT_DOCBOOK) $(FUENTESDB)
# Listado de fuentes XML. Preferiblmente en el orden de inclusión.

IMAGES=img/primerflux.png img/putty1.png img/putty2.png img/pop3s-mozilla.png img/evolution.png img/mutt.png img/vim.png img/html1.png img/home.png img/prev.png img/toc-minus.png img/blank.png img/important.png img/toc-plus.png img/caution.png img/next.png img/tip.png img/up.png img/draft.png img/note.png img/toc-blank.png img/warning.png img/arbol-archivos.png img/putty-tunnel.png img/putty-x11.png img/imaps-1-thunderbird.png img/imaps-2-thunderbird.png img/imaps-3-thunderbird.png img/fluxbox_inicio.png img/mozilla_firefox.png img/espiritualidad.png img/openoffice_writer.png img/openoffice_calc.png img/openoffice_presentacion.png img/documentacion.png img/multimedia.png img/mplayer.png img/xcdplayer.png img/otros.png img/plan.png img/vim1.png img/fluxbox_menu.png img/estilo1.png img/partencr.png img/xdm.png img/consola.png img/pidgin1.png img/pidgin2.png img/pidgin3.png img/pidgin4.png img/pidgin5.png img/pidgin6.png img/pidgin7.png img/silc.png img/filezillaconexion.png img/filezilla.png img/xfecdrom.png img/montar.png img/xfepaq.png img/xfw-p.png img/mg.png

# Listado de imagenes, preferiblemente en formato PNG

HTML_DIR=html
# Directorio en el que se generará información en HTML (con reglas por defecto)

HTML_TARGET=$(HTML_DIR)/index.html
# Nombre del HTML principal (debe coincidir con el especificado en estilohtml.xsl)

XSLT_HTML=estilohtml.xsl
# Hoja XSLT para generar HTML con regla por defecto

PRINT_DIR=imp
# Directorio en el que se genera PostScript y PDF en reglas por defecto

DSSSL_PRINT=estilo.dsl\#print
# Hoja de estilo DSSSL para generar TeX en reglas por defecto

DSSSL_HTML=estilo.dsl\#html
# Hoja de estilo DSSSL para generar HTML en reglas por defecto

OTHER_HTML=

PRECVS=guias/

INDEX=genindice.$(EXT_DOCBOOK)
# Si habrá un índice, nombre del archivo con el que debe generarse (incluirlo al final del documento).


# Variables requeridas por comdist.mk

GENDIST=Derechos.txt $(SOURCES) $(IMAGES)
# Dependencias por cumplir antes de generar distribución

ACTHOST=git@github.com:pasosdeJesus/
# Sitio en Internet donde actualizar. Método indicado por $(ACT_PROC) de confv.sh

ACTDIR=basico_adJ
# Directorio en $(ACTHOST) por actualizar

#USER=$(LOGNAME),structio
# Usuario en $(ACTHOST).  Si es el mismo que en la máquina local comentar.

GENACT=ghtodo $(PROYECTO)-$(PRY_VERSION)_html.tar.gz $(PRINT_DIR)/$(PROYECTO)-$(PRY_VERSION).ps.gz $(PRINT_DIR)/$(PROYECTO)-$(PRY_VERSION).pdf 
# Dependencias por cumplir antes de actualizar sitio en Internet al publicar

FILESACT=$(PROYECTO)-$(PRY_VERSION).tar.gz $(PROYECTO)-$(PRY_VERSION)_html.tar.gz $(HTML_DIR)/* #$(PRINT_DIR)/$(PROYECTO)-$(PRY_VERSION).ps.gz $(PRINT_DIR)/$(PROYECTO)-$(PRY_VERSION).pdf 
# Archivos que se debe actualizar en sitio de Internet cuando se publica

all: $(HTML_TARGET) #$(PRINT_DIR)/$(PROYECTO).ps $(PRINT_DIR)/$(PROYECTO).pdf

cvstodo: distcvs 
	rm -rf $(PROYECTO)-$(PRY_VERSION)
	tar xvfz $(PROYECTO)-$(PRY_VERSION).tar.gz
	(cd $(PROYECTO)-$(PRY_VERSION); ./conf.sh; make $(PROYECTO)-$(PRY_VERSION)_html.tar.gz)
	cp $(PROYECTO)-$(PRY_VERSION)/$(PROYECTO)-$(PRY_VERSION)_html.tar.gz .


ghtodo: distgh
	(cd $(PROYECTO)-$(PRY_VERSION); ./conf.sh; make $(PROYECTO)-$(PRY_VERSION)_html.tar.gz)
	cp $(PROYECTO)-$(PRY_VERSION)/$(PROYECTO)-$(PRY_VERSION)_html.tar.gz .

repasa:
	DEF=$(PROYECTO).def CLA=$(PROYECTO).cla SEC=$(PROYECTO).sec DESC="Información extraida de: $(PROYECTO) $(PRY_VERSION)" FECHA="$(FECHA_ACT)" BIBLIO="$(URLSITE)" TIPO_DERECHOS="Dominio público" TIEMPO_DERECHOS="$(MES_ACT)" DERECHOS="Información cedida al dominio público. Sin garantías." AUTORES="Vladimir Támara" IDSIGNIFICADO="adJ_basico" $(AWK) -f herram/db2rep $(SOURCES)

# Para usar DocBook
include herram/comdocbook.mak

# Para crear distribución de fuentes y publicar en Internet
include herram/comdist.mak

# Elimina hasta configuración
limpiadist: limpiamas
	rm -f confv.sh confv.ent Make.inc personaliza.ent
	rm -rf $(HTML_DIR)
	rm -rf $(PRINT_DIR)

# Elimina archivos generables
limpiamas: limpia
	rm -f img/*.eps img/*.ps
	rm -f $(PROYECTO)-$(PRY_VERSION).tar.gz
	rm -f genindice.xdbk genindice.xdbk.m genindice.xml.m HTML.index.m
	rm -rf $(PROYECTO)-$(PRY_VERSION)
	rm -rf $(PROYECTO)_gh-pages
	rm -f $(INDEX).xdbk $(INDEX).xdbk.m $(INDEX).xml.m HTML.index.m
	rm -f confaux.sed indice.xdbk.m confv.ent


# Elimina backups y archivos temporales
limpia:
	rm -f *bak *~ *tmp confaux.tmp $(PROYECTO)-$(PRY_VERSION)_html.tar.gz
	rm -f $(PROYECTO)-4.1.*


Derechos.txt: $(PROYECTO).$(EXT_DOCBOOK)
	make html/index.html
	$(W3M) %(W3M_OPT) -dump html/index.html | awk -f herram/conthtmldoc.awk > Derechos.txt

instala:
	@mkdir -p $(DESTDIR)$(INSDOC)
	install html/*html html/*png $(DESTDIR)$(INSDOC)
	if (test -f $(PRINT_DIR)/$(PROYECTO).ps) then { install imp/*ps $(DESTDIR)$(INSDOC); } fi;

xfe.xdbk.pre: /usr/ports/mystuff/x11/xfe/files/es_CO.po
	perl -f herram/ayudaxfe2db.pl /usr/ports/mystuff/x11/xfe/files/es_CO.po > xfe.xdbk.pre


infoversion.ent:
	if (test -f ../servidor_adJ/infoversion.ent) then { \
		cp ../servidor_adJ/infoversion.ent .; \
	} fi;

PANDOC=/home/vtamara/.cabal/bin/pandoc 

#introduccion.xdbk: introduccion.md

.SUFFIXES: .md .xdbk
.md.xdbk:
	mkdir -p tmp
	$(PANDOC) -t docbook -o tmp/$@ $<
	sed -e "s/<link linkend=\"\([^\"]*\)\">xref<\/link>/<xref linkend=\"\1\"\/>/g" tmp/$@ > $@

#contenido.xdbk: $(FUENTESMD)
#	$(PANDOC) -t docbook -o pre-contenido.xdbk metadatos.yaml $(FUENTESMD)
#	sed -e "s/<link linkend=\"\([^\"]*\)\">xref<\/link>/<xref linkend=\"\1\"\/>/g" pre-contenido.xdbk > contenido.xdbk
