##1. Introducción {#introduccion}

Un sistema operativo es un programa que facilita tanto a una persona como a otros programas
la utilización de un computador. OpenBSD y Linux son sistemas operativos tipo Unix; este tipo
de sistemas fue cuidadosamente diseñado hacia 1960[^1] inicialmente para programadores, sin embargo
sus implementaciones más comunes hoy en día (MacOSX, Linux, OpenBSD, FreeBSD, NetBSD) además de seguir
ofreciendo todas las ventajas y potencialidades para programadores, incluyen interfaces gráficas y facilidades
para usuarios que se acercan por primera vez a un computador.

[^1]: Prácticamente todos los sistemas operativos actuales han tomado ideas de ese diseño que fue 
planeado para ser multitarea, multiusuario con una política de permisos y para operación en red. 
Incluso MSDOS implementado hacía 1980 tomó unas pocas ideas del interprete de comandos, sobre este 
Windows 3.1 adaptó funcionalidad multitarea y una interfaz gráfica, sobre este Windows 98 empezó a 
adaptar funcionalidad multiusuario y operación en red, mientras que XP y Vista adaptaron el sistema de permisos.

De los sistemas tipos Unix actuales, OpenBSD se caracteriza por ser de fuentes abiertas[^2], por los altos niveles 
de seguridad que brinda[^3] y por el uso de criptografía fuerte[^4]. Otros sistemas se han enfocado en usabilidad 
para usuarios sin experiencia (por ejemplo MacOSX o la distribución Ubuntu CE de Linux).

[^2]: Las fuentes de un programa son las instrucciones para humanos, que permiten construir el programa. Al ser 
abiertas se pueden estudiar para aprender como se construyó el programa y pueden cambiarse para mejorarlo. 
Además de estas posibilidades la licencia de un programa de fuentes abiertas debe permitir su redistribución sin 
tener que pagar regalías. Esta es una gran diferencia con sistemas operativos como Mac OSX y Windows que son de 
fuentes cerradas y sus licencias no permiten redistribuir copias.

[^3]: Las 2 políticas que lo han caracterizado son apertura total y auditorías. Apertura total se refiere a 
transparencia total en cuanto a fallas de seguridad, indicando claramente las vulnerabilidades detectadas y 
las soluciones implementadas con fechas. Auditorías se refiere a inspecciones de las fuentes que buscan garantizar 
ausencia de vulnerabilidades.

[^4]: Código cifrado fuerte: Es una comunicación secreta. Es una manera de guardar información para que no todo el 
mundo tenga acceso directo a ella. Cifrar es transformar información para hacerla ilegible, buscando garantizar 
confidencialidad. Tipicamente se requiere una clave para cifrar. Un ejemplo de un cifrado débil llamado Cesar 
es aumentar cierta cantidad fija a cada carácter del mensaje por cifrar, podemos pensar que la cantidad que se 
aumente es la clave. Por ejemplo el mensaje “Dios te ama” aumentando 2 letras a cada una (es decir cifrado con clave 2),
quedaría “Fkqu vg coc” --aumentar una letra a la D la convierte en E, aumentar dos letras la convierte en F, 
por eso el primer caracter es F, lo análogo se hace con los demás. Es un cifrado débil porque hay técnicas para 
determinar cuando una información usa este cifrado y dado un texto cifrado con este cifrado es fácil encontrar 
la clave y descifrar el mensaje. Un cifrado es fuerte cuando no se conocen métodos rápidos para encontrar 
la clave y descifrarlo. Son ejemplos de cifrados fuertes AES, PGP y Blowfish
