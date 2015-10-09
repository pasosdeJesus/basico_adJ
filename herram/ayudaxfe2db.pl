#!/usr/bin/perl
# Convierte ayuda de xfe a DocBook
# Dominio p˙blico de acuerdo a legislaciÛn colombiana. 

use Encode 	qw( encode decode );

eval '$'.$1.'$2;' while $ARGV[0] =~ /^([A-Za-z_0-9]+=)(.*)/ && shift;
			# process any FOO=bar switches

$, = ' ';		# set output field separator
$\ = "\n";		# set output record separator

$e = 0;
# Estado: 0->fuera de ayuda por convertir, 1->en texto por determinar, 2-> 
$p = 0;
# 1 -> Abierto <p> y escribiendolo 2 -> abierto <itemizedlist>
$S = 0;
# Numero de secciC3n por cerrar
$la = '';
# LC-nea anterior --por imprimir 
$trc = 0;
# 1 lC-nea anterior terminC3 en retorno de carro \n
$M = 0;
# Linea anterior manejada
print "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n";
print "<sect2 id=\"xfe\">\n";
print '<title>Administrador de archivos <command>xfe</command></title>';
print '<para>A continuaciÛn se traduce parte de la ayuda oficial de <command>xfe</command> escrita por el desarrollador principal de esa aplicaciÛn Roland Baudin.</para>';
$S = 2;
#print "<para>X File Explorer (xfe) es...</para>";


sub cierre {
	    if ($p == 1) {
		print '</para>';
	    } elsif ($p == 2) {
		print "</para></listitem>";
		print "</itemizedlist>";
		print "</para>";
	    }
	    if ($S == 3) {
		print '</sect3>';
	    }
	    $S = 0;
	    $p = 0;
}

sub teclas {
	my $s = shift;
 	$s =~ s/ (May˙scula-Ctrl-[A-Z])/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (Ctrl-Supr)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (Ctrl-Retroceso)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (Ctrl-F[1-9][0-9]?)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (Ctrl-[A-Z])/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (F[1-9][0-9]?)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (Retroceso)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (Supr)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (Alt-Supr)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (May˙scula-Supr)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/ (May˙scula-Retroceso)/ <keycap>$1<\/keycap>/g;
 	$s =~ s/(May˙scula-F[1-9][0-9]?)/<keycap>$1<\/keycap>/g;
 	$s =~ s/(Ctrl-[+-])/<keycap>$1<\/keycap>/g;
 	$s =~ s/(Retorno) /<keycap>$1<\/keycap> /g;
 	$s =~ s/(Espacio) /<keycap>$1<\/keycap> /g;
 	$s =~ s/(Esc) /<keycap>$1<\/keycap> /g;
 	$s =~ s/ (Ctrl) / <keycap>$1<\/keycap> /g;
	return $s;
}

#	$s =~ s/√Å/¡/g;
sub utf8_latin1_esp {
	my $s = shift;
	return decode('UTF-8', $s);
#	$s =~ s/√Å/¡/g;
#	$s =~ s/√°/·/g;
#	$s =~ s/√≠/Ì/g;
#	$s =~ s/√≥/Û/g;
#	$s =~ s/√∫/˙/g;
#	$s =~ s/√±/Ò/g;
#	return $s;
}

while (<>) {
    chomp;	# strip record separator
    if (/=-=-/) {
	if ($e == 1) {
	    cierre();
	    print '<sect3><title>' . utf8_latin1_esp($la) . "</title>\n";
	    $S = 3;
	    $M = 1;
	    $la = "";
	}
    }

    if (/Descripci..n\\n/) {
	$e = 1;
    }

    if (/^".*/) {
	if ($e == 1) {
	    if ($M == 1) {
		$M = 0;
	    }
	    else {
		if (length($la) > 0) {
			if ($la =~ /^-/ || $la =~ /^\*/) {
				if ($p == 0) {
					print "<para>";
					print "<itemizedlist>";
					$p = 2;
				} elsif ($p == 1) {
					print "<itemizedlist>";
					$p = 2;
				} elsif ($p == 2) {
					print "</para></listitem>";
				}
				print "<listitem><para>";
				print teclas(utf8_latin1_esp(substr($', 1)));
			} elsif ($p == 2) {
				if (length($la) > 0) {
					print teclas(utf8_latin1_esp($la));
				} 
			} else {
				if ($p == 0) {
					print "<para>";
					$p = 1;
				}
				print utf8_latin1_esp($la);
				if ($trc == 1 && $_ =~ /^" *[A-Z]/) {
					print "</para>";
					$p = 0;
				}
			}
		} else {
			if ($trc == 1) {
				cierre();
				$p = 0;
			}
		}
		if (($_ =~ /^" */ ? scalar($RLENGTH = length($&),

					$RSTART = length($`)+1) : 0) > 0) {
			$la = substr($_, ($RSTART + $RLENGTH)-1,

				length($_) - $RSTART - $RLENGTH);
			if (substr($la, (length($la) - 1)-1, 1) eq "\"") {
				$la = substr($la, (1)-1, length($la) - 1);
			}
		}
		$du = substr($la, (length($la) - 1)-1, 2);
		if ($du eq "\\n") {
			$la = substr($la, (1)-1, length($la) - 2);
			$trc = 1;
		}
		else {
			$trc = 0;
		}
	    }
	}
    }

    if (/Fallas\\n/) {
	$e = 0;
    }
}

cierre();
print '</sect2>';
$S = 0;

