# rpi_mi_jupyter

Imagen docker para raspberry pi con jupyter, pandas, numpy, scipy, matplotlin y sympy

Esta imagen está basada en esta otra: [https://github.com/andresvidal/jupyter-armv7l](https://github.com/andresvidal/jupyter-armv7)




## crear la imagen a partir del Dockerfile

    git clone https://github.com/crdguez/rpi_mi_jupyter.git
    cd rpi_mi_jupyter
    docker build -t <your hub>/rpi_mi_jupyter .

# Crear contenedor a partir de la imagen

#docker run -it --name conda -p 8888:8888 -v /home/pi/carlos/.jupyter:/home/jovyan/.jupyter -v /home/pi/carlos:/home/jovyan/work  movalex/rpi-jupyter-conda


docker run -d \
    --name jupyter \
    --restart unless-stopped \
    -p 8888:8888 \
    -v "$PWD":/notebooks \
    crdguz/mi_rpi_jupyter --NotebookApp.token=''


Como ya  está creado el contenedor (en su día se generó al ejecutar el comando anterior), tienes que levantarlo:
  
#docker start conda
docker start jupyter

Terminal en el docker:

#docker exec -it -u 0 conda /bin/bash
docker exec -it -u 0 jupyter /bin/bash


Para entrar en Jupyter:

En el navegador: localhost:8888




