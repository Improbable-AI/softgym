FROM nvidia/cudagl:9.2-devel-ubuntu18.04

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Replacing shell with bash for later docker build commands
RUN mv /bin/sh /bin/sh-old && \
  ln -s /bin/bash /bin/sh

RUN apt-get update \
	&& apt-get install -y -qq --no-install-recommends \
	libglvnd0 \
	libgl1 \
	libglx0 \
	libegl1 \
	libxext6 \
	libx11-6 \
	cmake \
	build-essential \
	libgl1-mesa-dev \
	freeglut3-dev \
	libglfw3-dev \
	libgles2-mesa-dev \
	htop \
	vim \
	git \
	wget \
	curl \
	tmux \
	&& rm -rf /var/lib/apt/lists/*

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES \
  ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
  ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# Dependency for EGL
RUN apt update && apt install -y cmake build-essential libgl1-mesa-dev freeglut3-dev libglfw3-dev libgles2-mesa-dev

COPY ./install_pylibs.sh /tmp/install_pylibs.sh
RUN chmod +x /tmp/install_pylibs.sh && /tmp/install_pylibs.sh



RUN mkdir /workspace/ && cd /workspace/

WORKDIR /workspace

COPY ./install_softgym.sh /tmp/install_softgym.sh
RUN chmod +x /tmp/install_softgym.sh && /tmp/install_softgym.sh


COPY ./install_pkgs.sh /tmp/install_pkgs.sh
RUN chmod +x /tmp/install_pkgs.sh && /tmp/install_pkgs.sh

ENV PYFLEXROOT /workspace/softgym/PyFlex
ENV PYTHONPATH ${PYFLEXROOT}/bindings/build
ENV LD_LIBRARY_PATH ${PYFLEXROOT}/external/SDL2-2.0.4/lib/x64:${LD_LIBRARY_PATH}

CMD ["bash"]