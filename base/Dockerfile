ARG DEBIAN_RELEASE=buster
FROM debian:$DEBIAN_RELEASE

ARG USER_NAME=gordonhart
ARG MAINTAINER_EMAIL=gordon.hart2@gmail.com

LABEL maintainer=$MAINTAINER_EMAIL

# add default user/group/home directory
RUN groupadd --gid 1000 $USER_NAME
RUN useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash $USER_NAME
WORKDIR /home/$USER_NAME
RUN chown -R $USER_NAME:$USER_NAME /home/$USER_NAME

# change root password to 'root', security is not very important for the
# intended use case of these images
RUN echo "root:root" | chpasswd

ENV TERM xterm-256color

RUN DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y apt-transport-https

# base comfort packages
RUN apt install -y \
    git \
    vim \
    python3 \
    curl \
    man

# add environment configuration files for root, user
WORKDIR /root
ADD dotfiles/.bashrc .bashrc
ADD dotfiles/.inputrc .inputrc
ADD dotfiles/.pdbrc .pdbrc
ADD dotfiles/.vimrc .vimrc

USER $USER_NAME
WORKDIR /home/$USER_NAME
ADD --chown=1000:1000 dotfiles/.bashrc .bashrc
ADD --chown=1000:1000 dotfiles/.inputrc .inputrc
ADD --chown=1000:1000 dotfiles/.pdbrc .pdbrc
ADD --chown=1000:1000 dotfiles/.vimrc .vimrc

CMD ["/bin/bash", "-l"]
