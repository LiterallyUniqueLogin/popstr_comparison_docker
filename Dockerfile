from mambaorg/micromamba:latest
SHELL ["/bin/bash", "-c"]

USER root
RUN apt-get update && apt-get upgrade -y
# Utilities for managing the build
RUN apt-get install -y wget unzip

RUN micromamba shell init -s bash

RUN micromamba create -n bio bcftools trtools -y -c conda-forge -c bioconda

RUN mkdir -p /container_install/bin
ENV PATH="$PATH:/container_install/bin"
COPY envsetup /container_install/bin/envsetup
RUN chmod a+rx /container_install/bin/envsetup
USER 1001

