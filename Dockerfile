FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime
RUN mkdir app

RUN apt update -y && apt upgrade -y
RUN apt install -y wget git sudo ffmpeg libsm6 libxext6
# install tcmalloc
RUN apt install -y libgoogle-perftools-dev
ADD . /app
WORKDIR /app
RUN chmod 777 -R /app
RUN mkdir /home/miku
RUN chmod 777 -R /home/miku
RUN useradd -u 1100 miku
USER miku
RUN ./webui_docker_build.sh --skip-torch-cuda-test
EXPOSE 7860
EXPOSE 7861
EXPOSE 7862
CMD ["./webui.sh","--listen","--no-half-vae"]