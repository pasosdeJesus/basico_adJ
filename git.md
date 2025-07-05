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

* El conjunto de archivos manejados por git estarán en un directorio el cual
  será tratado como una "foto" y se mantendrá la historia de "fotos" anteriores.
  Para economizar espacio cuando un archivo no cambia de una versión a otra
  sólo se mantiene un enlace a la versión anterior.
* Casi todas las operaciones son locales y se reflejaran en el subdirectorio
  `.git` del directorio del repositorio.
* Mantiene un condensado de cada "foto" que sirve tanto para preservar
  integridad como para referenciar. Se representa como un número hexadecimal
  de 40 dígitos, por ejemplo: `260ac9c71372a1d72c6bba9ef2c223895e79f767`
  (corresponde al resultado de una función de condensando SHA1 aplicada
   al árbol de Merkle con la base de datos git, por lo que
   es prácticamente improbable que dos árboles diferentes tengan el mismo
   condensado logrando identificar cada árbol de manera única y garantizando
   que no hay cambios --de haberlos daría un condensado diferente).


### Contribuir en proyectos de fuentes abiertas

Consideramos que tu contribución a proyectos de fuentes
abiertas será más ordenada si sigues los lineamientos de uso de FreeCodeCamp
(ver <https://github.com/freeCodeCamp/freeCodeCamp/blob/main/docs/how-to-setup-freecodecamp-locally.md>), que procuramos resumir inicialmente en
<https://github.com/pasosdeJesus/sip/blob/v2.1/CONTRIBUTING.md>
y ahora aquí:

#### Configuración inicial

1. Bifurca (del inglés __fork__) el repositorio en el que vas a contribuir.
   Por ejemplo este manual (<https://gitlab.com/pasosdeJesus/basico_adJ>)
   a tu cuenta personal.
2. En el computador de desarrollo clona tu bifurcación:
  ```
  git clone git@gitlab.com/miusuario/basico_adJ.git
  ```
3. En la nueva copia en el computador de desarrollo asegurate de tener
   2 repositorios remotos: (1) `origin` que apunte a tu bifurcación y (2)
   por ejemplo `upstream` que apunte a las fuentes originales.
   Puedes ver tus repositorios actuales con `git remote -v` y agrega las
   fuentes del origina como `upstream` con:
  ```
  cd sip
  git remote add upstream https://gitlab.com/pasosdeJesus/basico_adJ.git
  ```

Procura mantener la rama `main` de tu bifurcación "sincronizada" con la
rama `main` del repositorio `upstream` (por lo mismo no debes hacer cambios
a la rama `main` de tu bifuración).  Lo puedes hacer ejecutando con
regularidad:
  ```
  git checkout main
  git pull --rebase upstream main
  git push -f origin main
  ```

#### Iniciar una contribución

Cuando desees hacer una contribución, comienza por sincronizar tu rama
`main` y desde esta crear una nueva rama donde propondrás el cambio
y pon un título que le ayude a limitar el alcance del cambio (si deseas
hacer cambios diferentes es mejor que hagas ramas diferentes a partir
de la rama `main` sincronizada), por ejemplo si fuera una rama 
`mejora-documentacion`:
  ```
  git checkout main
  git pull --rebase upstream main
  git push -f origin main
  git checkout -b mejora-documentacion
  ```
En la nueva rama agrega, edita y/o elimina archivos. Puedes examinar
modificaciones a archivos con:
  ```
  git status -s
  ```
agrega archivos que hayas introducido con:
  ```
  git add _archivo_
  ```
Cuando completes los cambios realiza un __commit__ (como contribución)
con comentario que describa tu contribución, por ejemplo:
  ```
  git commit -m "Mejorando sección sobre sistema de archivos" -a
  ```
Puedes continuar trabajando y hacer otras contribuciones en la misma rama,
pero nos parece más ordenado cuando tu solicitud de cambio (__pull request__)
tiene una sola contribución (__commit__) y no muchas que sobreescriben otras.
Si tienes varias contribuciones para un mismo pull-request más bien
fusiónalas (del inglés __squash__) en una sola.
Por ejemplo puedes fusionar los 2 últimos commits con:
  ```
  git rebase -i HEAD~2
  ```
Esto abrirá un archivo con los mensajes de las 2 últimas contribuciones
y frente a cada uno la palabra `pick` que podrías cambiar por `squash`
en la segunda contribución para fusionarla con la primera.  Después de guardar
y salir volverás a un editor para modificar el mensaje que tendrá la
contribución fusionada

Tras esto si ves la historia de contribuciones notarás la fusión:
  ```
  git log
  ```
Una vez tengas bien tu contribución en orden, empuja (__push__) el cambio 
a la rama que creaste en tu bifurcación:
  ```
  git push -f origin mejora-documentacion
  ```
Y desde la interfaz de github/gitlab examinando tu repositorio bifurcado o el
original verás un botón para crear la solicitud de
cambio (pull-request).  Úsalo, revisa lo que enviarás, pon un comentario
que justifique el cambio y envíalo.

Cuando hagas un pull request se iniciarán sobre el mismo las tareas de
integración continua que estuvieran configuradas y que en general
tu cambio debe pasar. Después los desarrolladores revisarán tu cambio
y si se requiere escribirán sugerencias de cambio, que debes hacer o
justificar por que no conviene antes de que tu contribución sea aceptada.
Es decir habrá un diálogo en la parte de comentarios de tu solicitud de
cambio que debe continuar.


#### Mejorar una contribución

Con la retroalimentación de las tareas de integración continúa y de
desarrolladores debes realizar los cambios en la misma rama donde
hiciste la propuesta inicial, pero antes debes sincronizarla con la
rama `main` del repositorio original por si otros desarrolladores
han hecho cambios recientes. Para eso primero sincroniza tu rama `main`:
```
git checkout main
git pull --rebase upstream main
git push -f origin main
```
Y de inmediato adopta en tu rama donde hiciste la propuesta, los cambios que
pudiera haber en la rama `main` ya sincronizada:
```
git checkout mejora-documentacion
git pull --rebase origin main
```
Esta última operación podría revelar colisiones entre cambios ya aceptados
en el repositorio principal y los que tú habías propuesto (por eso es bueno
tratar de hacer rápido el diálogo con desarrolladores y las propuestas de
cambio).  En caso de colisiones debes arreglarlas (en algunos casos editando
archivos que tienen marcados los cambios con `<<<<` y `>>>>`, en otros
añadiendo o eliminando archivos).
Después aplica las sugerencias y/o fusiona contribuciones y/o arregla tu
código para que pase tareas de integración continua.
```
vi README.md
....
git commit -m "Aplicando sugerencias de revisor" -a
git rebase -i HEAD~2
git push -f origin mejora-documentacion
```
Después de empujar tus cambios (push) en la misma rama, github/gitlab notará
el cambio y actualizará la solicitud de cambio ya hecha, volviendo a
lanzar las tareas de integración continua y los desarrolladores
volverán a auditar tu contribución y continuarán el diálogo en la sección
de comentarios.

Este proceso debe iterarse hasta que tu cambio sea aceptado (o rechazado),
por lo que debes visitar con frecuencia tu solicitud de cambio y ver
nuevos comentarios que puedan haber (los comentarios más recientes
quedan al final de la pestaña de comentarios).


### Configuración para trabajar en gitlab.com y github.com con llaves ssh

git ya viene como paquete en adJ, pero si requiere actualizar puede intentar
el paquete más reciente con:

    doas pkg_add -r git

Recomendamos crear una cuenta en gitlab.org o en github.com para practicar.

Para autenticarse desde la terminal ante gitlab o github debe usar llaves ssh
o un token generado por esas plataformas.  Cómo es común y más práctico
emplear llaves ssh, es el método que presentamos a continuación:

1. Una llave RSA consta de una parte privada y una parte pública. La parte
   pública es la que se comparte, la parte privada no la debe compartir
   --quien la tenga puede impersonarlo(a)--.  Genere un par con:

     ssh-keygen

  lo cual le solicitará una frase clave en una sesión como la siguiente
  (que dejará la llave pública en `~/.ssh/id_rsa.pub` y la privada en
  `~/.ssh/id_rsa` como se ve en los mensajes de respuesta):

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

2. Ingrese a su cuenta en gitlab y diríjase a "Editar Perfil".
3. Desde allí a la izquierda elija "Llaves SSH"
4. Examine la llave pública que generó en el paso 1, por ejemplo con
   ```
   cat ~/.ssh.id_rsa.pub
   ```
   y cópiela en el porta-papeles
5. Pegue lo que copió en el área de texto que gitlab presentará para la llave
   pública.
6. Presione `Agregar`  para añadir la llave suministrada (puede
   poner una fecha de expiración superior a un año).


Al clonar algún repositorio verifique que la dirección del
repositorio comience con `git@` pues esas son las que usarán la llave ssh.
Por ejemplo
`git@gitlab.com:pasosdeJesus/si_jrscol.git`


### Lecturas recomendadas {#lecturas_recomendadas_git}

* Scott Chacon, Ben Straub. Pro Git Book. https://git-scm.com/book/en/v2/

* GitLab - SSH Key Setup https://www.tutorialspoint.com/gitlab/gitlab_ssh_key_setup.htm
