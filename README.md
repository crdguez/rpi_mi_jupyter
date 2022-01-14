# rpi_mi_jupyter

Imagen docker para raspberry pi con:

	- jupyter
	- pandas
	- numpy
	- scipy
	- matplotlib
	- sympy

Esta imagen está basada en esta otra: [https://github.com/andresvidal/jupyter-armv7l](https://github.com/andresvidal/jupyter-armv7l)
											
## Instrucciones

### Crear contenedor a partir de la imagen

Podemos crear un contenedor a partir de la imagen con el siguiente comando:

    docker run -d \
        --name jupyter \
        --restart unless-stopped \
        -p 8888:8888 \
        -v "$PWD":/notebooks \
        crdguez/rpi_mi_jupyter --NotebookApp.token=''


### Levantar el contenedor

Una vez creado si reiniciamos las raspberry, tendrás que levantarlo:

    docker start jupyter

### Terminal en el docker:

Para poder acceder a una terminal del contenedor (por ejemplo, si queremos instalar algún paquete adicional):

    docker exec -it -u 0 jupyter /bin/bash


### Acceder a Jupyter:

En el navegador: 

    raspberrypi.local:8888


### Crear una imagen a partir del Dockerfile

Si se quiere modificar la imagen 

    git clone https://github.com/crdguez/rpi_mi_jupyter.git
    cd rpi_mi_jupyter
    docker build -t <your hub>/rpi_mi_jupyter .

### Borrar el contenedor y la imagen de la raspberry

    docker rm jupyter
    docker rmi crdguez/rpi_mi_jupyter



