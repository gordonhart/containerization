ARG BASE_IMAGE=v0.1.0.buster
FROM $BASE_IMAGE

ARG USER_NAME=gordonhart

# run rustup installer for root and user, accepting defaults

USER root
WORKDIR /root
ADD dotfiles/.cargo .cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

USER $USER_NAME
WORKDIR /home/$USER_NAME
ADD --chown=1000:1000 dotfiles/.cargo .cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
