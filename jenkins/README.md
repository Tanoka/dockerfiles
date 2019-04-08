Para los containers de la base de datos, sphinx y mongo podemos utilizas las mismas imágenes de desarrolo. Estos containers apuntarán a volumenes propios solo para testing.
Creamos el volumen para la base de datoc copiando el volumen de la base de datos de desarrollo, así no hay que volverla a instalar.
Sphinx y mongo no hace falta, se crean muy rápido

## Creamos el volumen jenkins_db
`docker volume create jenkins_db`

montamos los volumenes `docker_mysqldata` (donde tenemos la base de datos) y `jenkins_db` en dos directorios cualquiera sobre una imagen linux y copiamos los datos de un directorio a otro

`docker run -it -v docker_mysqldata:/from -v jenkins_db:/to alpine ash -c "cd /from ; cp -av . /to"`


## Instalamos Jenkins
En este caso nos bajamos una imagen con un jenkins y instalado.  
En el Dockerfile añadiremos el resto de software que nos hace falta.  
Como lo queremos para proyectos PHP instalamos PHP, sus librerias, composer, xdebug, los módulos de Jenkins para PHP (esto tambien lo podemos hacer después) y ant.  
Instalamos las herramientas php:  
phpunit, phpmd, pdepend, php_codesniffer, phploc, phpcpd. Podemos tener un composer general e instalarlos en la home de jenkins. O tenerlos en el composer del proyecto a integrar en jenkins como require -dev

## Instalamos los plugins en jenkins:
checkstyle, cloverphp, crap4j, dry, htmlpublisher, jdepend, plot, pmd, violations, warnings, xunit.  
Creamos un fichero build.xml. Es un fichero Ant en el que indicamos lo que queremos ejecutar, donde, como guardamos los resultados (xml normalmente), etc.  
En nuestro caso serán los programas php que hemos instalado previamente, phpunit, phpmd, etc.  
Este fichero hay que ponerlo en el container, para ello lo montaremos como un volumen para compartir fichero.  
Nota: La sintaxis de Ant puede ser un poco liosa, sobre todo con el tema de los path.  
Además de este fichero habrá que compartir los ficheros de configuración de phpunit y phpmd.  
## Configurando jenkins
Creamos una una tarea del tipo "Freestyle project".  
Configuramos el nuevo projecto.  
### Configure  
El contenido de esta sección se ejecuta cada vez que hacemos un build, con "build now", triggers, etc.   
#### Source Code Management  
Indicamos Git para bajar el ćodigo. En Branches to build podemos indicar la branch: */Conectividad si queremos.  
####  Build  
Comandos que se ejecutan para construir y ejecutar la build.   
Aquí podemos poner instrucciones de linux, por ejemplo para copiar los ficheros de configuración al proyecto, pues no están en git.  
Ejecutar composer para instalar todas las dependencias. Cada vez que construimos una build se baja el código de git y hay que reconstruir vendor.  
Y el más importante, Ant con su fichero build.xml, que es el que hará todo el trabajo.  

Por ejemplo como cada vez que se ejecuta una build se baja de nuevo, los ficheros de configuración habrá que copiarlos cada vez.

command:  
`cp /home/jenkins/parameters.yml WORKSPACE/app/config/parameters.yml \
&&  cp /home/jenkins/config_test.yml $WORKSPACE/app/config/config_test.yml`

Estos ficheros solo haría falta copiarlos una vez tras montar la imagen.  
`cp /home/jenkins/build.xml $JENKINS_HOME/build.xml \
&& cp /home/jenkins/phpmd.xml $JENKINS_HOME/phpmd.xml \
&& cp /home/jenkins/phpunit.xml $JENKINS_HOME/phpunit.xml \
&& cp /home/jenkins/phpunit_func.xml $JENKINS_HOME/phpunit_func.xml`

Instalamos todas las dependencias

command:   
`cd $WORKSPACE \
&& /usr/local/bin/composer install `

Ejecutamos ant. El fichero build.xml es el que contiene las instrucciones para ant. Programas a ejecutar, como phpunit o phpmd, donde tienen que dejar los logs, etc.

Invoke Ant:  
ant version: ant  
Build File: /var/jenkins_home/build.xml   

#### Post-build Actions  
Esta sección es la que se encarga de mostrar los resultados generados con Ant en la sección anterior.  
Ant habrá ejecutado phpunit y habremos generado xml con los resultados, y lo mismo para el resto.  
En el seleccionable indicamos que plugins queremos usar para mostrar los diferentes resultados, por ejemplo:  

Desde ant, con phpcs-ci hemos generado un fichero build/logs/checkstyle.xml, lo mostramos en los resultados:  

Publish checkstyle analysis results:  
checkstyle results: build/logs/checkstyle.xml  
Los path de los xml están definidos en los ficheros build.xml y phpunit.xml.  

La configuración que se genera desde jenkins para cada tarea se guarda en el directorio jobs de la tarea, en nuestro caso:
/var/jenkins_home/jobs/[nombre tarea]/config.xml


