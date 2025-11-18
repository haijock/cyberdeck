FROM mcr.microsoft.com/devcontainers/base:ubuntu
ARG USERNAME=vscode

RUN useradd -ms /bin/fish $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN sudo apt update && sudo apt install -y fish \
    && sudo apt-get autoremove -y && sudo apt-get clean -y

USER $USERNAME    

RUN curl https://mise.run | sh