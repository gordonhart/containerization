ARG BASE_IMAGE=v0.1.0.buster
FROM $BASE_IMAGE
MAINTAINER gordon.hart2@gmail.com

# run rustup installer for root and user, accepting defaults

USER root
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

USER gordonhart
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
