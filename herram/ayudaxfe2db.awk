#!/bin/awk
# Convierte ayuda de xfe a DocBook
# Dominio público de acuerdo a legislación colombiana. 


/=-=-/ { 
	if (e == 1) {
		print "XXX";
		if (p == 1) {
			print "</para>"
			p = 0;
		}
		if (s == 3) {
			print "</sect3>";
		}
		print "<sect3><title>" la "</title>\n";
		s = 3;
	}
}

/Descripci..n\\n/ { 
	e = 1; 
} 

/^".*/ { 
	if (e == 1) { 
		if (m == 1) {
			m = 0;
		} else {
			if (trc == 1) {
				print "<p>" la;
			}
		}
		if (match($0, /^" */) > 0) {
			la = substr($0, RSTART+RLENGTH, length($0) - RSTART - RLENGTH);
			if (substr(la, length(la) - 1, 1) == "\"") {
				la = substr(la, 1, length(la) - 1);
			}
		}
		du = substr(la, length(la) - 1, 2);
		if (du == "\\n") {
			la = substr(la, 1, length(la) - 2);
			trc = 1;
		} else {
			trc = 0;
		}
	} 

} 

/..ltima revisi..n:/ { 
	e = 0; 
} 

BEGIN {
	e = 0; # Estado: 0->fuera de ayuda por convertir, 1->en texto por determinar, 2-> 
	p = 0; # 1 -> Abierto <p> y escribiendolo
	s = 0; # Numero de sección por cerrar
	la = ""; # Línea anterior --por imprimir 
	trc = 0; # 1 línea anterior terminó en retorno de carro \n
	m = 0; # Línea anterior manejada
	print "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n";
	print "<sect2 id=\"xfe\">\n";
	print "<title>Administrador de archivos <command>xfe</command></title>";
	s = 2;
	#print "<para>X File Explorer (xfe) es...</para>";
}

END {
	print "</sect2>";
	s = 0;
}
