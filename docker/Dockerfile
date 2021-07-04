FROM ubuntu:latest

# Prevent timezone questions during install of packages
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /development

RUN mkdir workspace projects
COPY vscode/default.code-workspace ./workspace/

COPY scripts/install_defaults.sh .
RUN chmod +x ./install_defaults.sh
RUN ./install_defaults.sh

COPY scripts/install_wordpress.sh .
RUN chmod +x ./install_wordpress.sh
RUN ./install_wordpress.sh
