# rpi_mi_python
docker python image for rpi

In order to build in Dockerhub: https://github.com/docker/hub-feedback/issues/1261


#fuente: https://github.com/movalex/rpi-jupyter-conda
fuente: https://github.com/andresvidal/jupyter-armv7l

# Crear la imagen
# Ir a la carpeta donde está el Dockerfile

docker build -t crdguez/mi_rpi_jupyter .

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




