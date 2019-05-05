FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

SHELL ["/bin/bash", "-c"]

RUN dpkg --add-architecture i386 && \
     apt-get update && \
     apt-get install -y --no-install-recommends \
       curl libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

WORKDIR /work
RUN chmod -R a+w /work

COPY conda.yaml .
RUN conda env create -f conda.yaml && rm conda.yaml
RUN echo "source activate neuzz" > ~/.bashrc

