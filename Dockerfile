#Basado en: https://github.com/andresvidal/jupyter-armv7 

FROM arm32v7/python:3.10
LABEL created_by=https://github.com/crdguez/rpi_mi_jupyter
ARG wheelhouse=https://github.com/crdguez/rpi_mi_jupyter/raw/master/wheelhouse

# Install all OS dependencies for fully functional notebook server
# https://github.com/jupyter/docker-stacks/blob/master/minimal-notebook/Dockerfile
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    git \
    inkscape \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    tzdata \
    unzip \
    nano \
    wget \
    bzip2 \
    ca-certificates \
    locales \
    libblas-dev \
    liblapack-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

RUN pip install \
    $wheelhouse/matplotlib-3.1.1-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/numpy-1.17.4-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/scipy-1.3.2-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/pandas-0.25.3-cp38-cp38-linux_armv7l.whl \
    sympy \
    pypandoc \
    antlr4-python3-runtime==4.7.1 \
    --upgrade jupyter

RUN jupyter notebook --generate-config

WORKDIR /notebooks
ENTRYPOINT ["jupyter", "notebook", "--ip=*", "--allow-root", "--no-browser"]

