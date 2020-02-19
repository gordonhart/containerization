ARG DEBIAN_RELEASE=buster
FROM debian:$DEBIAN_RELEASE
MAINTAINER gordon.hart2@gmail.com

# add default user/group/home directory
RUN groupadd --gid 1000 gordonhart
RUN useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash gordonhart
WORKDIR /home/gordonhart
RUN chown -R gordonhart:gordonhart /home/gordonhart

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

USER gordonhart
WORKDIR /home/gordonhart
ADD --chown=gordonhart:gordonhart dotfiles/.bashrc .bashrc
ADD --chown=gordonhart:gordonhart dotfiles/.inputrc .inputrc
ADD --chown=gordonhart:gordonhart dotfiles/.pdbrc .pdbrc
ADD --chown=gordonhart:gordonhart dotfiles/.vimrc .vimrc

CMD ["/bin/bash", "-l"]
