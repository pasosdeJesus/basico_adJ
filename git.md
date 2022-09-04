## Control de versiones con git {#git}

Se trata de un sistema para control de versiones distribuido, rápido y que
facilita trabajar con ramas. Fue creado en el año 2005 por Linus Torvalds
(el mismo creador del kernel Linux) y se ha convertido casi que en un estándar
por su versatilidad y porque es el sistema usado por varias plataformas para
hospedar gratuitamente el código fuente de proyectos de código abierto
particularmente gitlab.com y github.com


Como se indica en Chacon,Straub, 2014, un sistema para control de versiones
permite registrar cambios a un archivo o a un grupo de archivos a lo largo
del tiempo de manera que usted pueda recuperar versiones específicas después
de un tiempo.   Suele emplearse con las fuentes de programas, pero las
versiones de otras "fuentes" que se almacenen como textos planos también pueden
manejarse con git.

Unas características por tener en cuenta al operar con git:
* el conjunto de archivos manejados por git estarán en un directorio el cual
  será tratado como una "foto" y se mantendrá la historia de "fotos" anteriores.
  Para economizar espacio cuando un archivo no cambia de una versión a otra
  sólo se mantiene un enlace a la versión anterior.
* Casi todas las operaciones son locales y se reflejaran en el subdirectorio
  `.git` del directorio del repositorio.
* Mantiene un condensado de cada "foto" que sirve tanto para preservar
  integridad como para referenciar. Se representa como un número hexadecimal
  de 40 dígitos, por ejemplo: `260ac9c71372a1d72c6bba9ef2c223895e79f767`


### Configuración para trabajar en gitlab.com y github.com con llaves ssh

git ya viene como paquete en adJ, pero si requiere actualizar puede intentar
el paquete más reciente con:

    doas pkg_add -r git

Recomendamos crear una cuenta en gitlab.org o en github.com para practicar.

Para autenticarse desde la terminal ante gitlab o github debe usar llaves ssh
o un token generado por esas plataformas.  Cómo es común y más práctico
emplear llaves ssh es el método que presentamos a continuacion:

1. Una llave RSA consta de una parte privada y una parte pública. La parte
   pública es la que se comparte, la parte privada no la debe compartir
   --quien la tenga puede impersonarlo(a)--.  Genere un par con:

     ssh-keygen

  lo cual le solicitará una frase clave en una sesión como la siguiente (que dejará
  la llave pública en `~/.ssh/id_rsa.pub` y la privada en `~/.ssh/id_rsa` como 
  se ve en los mensajes de respuesta):

  ```
  % ssh-keygen
  Generating public/private rsa key pair.
  Enter file in which to save the key (/home/usuario/.ssh/id_rsa):
  Enter passphrase (empty for no passphrase):
  Enter same passphrase again:
  Your identification has been saved in /home/usuario/.ssh/id_rsa
  Your public key has been saved in /home/usuario/.ssh/id_rsa.pub
  The key fingerprint is:
  SHA256:2ocPN6cNiYX8JhL0AHk8mIWUL3p/gTfXFk1achQauS0
  usuario@servidor.pasosdeJesus.org
  The key's randomart image is:
  +---[RSA 3072]----+
  |   .oO.     .oo. |
  |    *.+     oo+  |
  |     oo.    .X   |
  |    ...+ .  E o  |
  |   . ...S .. o   |
  |  . . .++=..o    |
  |   . .o.*+O..    |
  |      ...B *     |
  |       .  o .    |
  +----[SHA256]-----+
  ```

2. Ingrese a su cuenta en gitlab y dirijase a Perfil.
3. Desde allí a la izquierda eliga Llaves SSH
4. Edite la llave pública que genró en el paso 1, por ejemplo con
   `$EDITOR ~/.ssh.id_rsa.pub` y copiela en el portapapeles
5. Pegue lo que copió en el área de texto que gitlab presentará para la llave
   pública.
6. Presione `Agregar`  para añadir la llave suministrada.


Al clonar repositorios fijese en las direcciones de repositorios que
comienzan con git@ pues esas son las que usarán la llave ssh. Por ejemplo
git@gitlab.com:pasosdeJesus/si_jrscol.git


### Lecturas recomendadas {#lecturas_recomendadas_git}

* Scott Chacon, Ben Straub. Pro Git Book. https://git-scm.com/book/en/v2/

* GitLab - SSH Key Setup https://www.tutorialspoint.com/gitlab/gitlab_ssh_key_setup.htm
