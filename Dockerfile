FROM ubuntu:latest

MAINTAINER aktriver <readonly@akutagawa.dev>

ARG USERNAME=user
ARG PASSWORD=user

RUN apt update && \
    apt install -y sudo locales build-essential curl file git && \
    apt clean && rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    /usr/sbin/locale-gen

RUN useradd -m ${USERNAME} && \
    echo "${USERNAME}:${PASSWORD}" | chpasswd && \
    echo "${USERNAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

ENV HOME /home/${USERNAME}

WORKDIR $HOME/.dotfiles
COPY . .

USER ${USERNAME}

ENV PATH $PATH:/home/linuxbrew/.linuxbrew/bin

RUN ./homebrew.sh
RUN brew tap linuxbrew/xorg
RUN ./brewfile.sh
RUN brew cleanup -s

RUN ./deploy.sh

RUN npm install -g yarn && \
    pip3 install neovim && \
    nvim --headless +PlugInstall +qall

RUN pip3 install powerline-status

RUN fish -c fisher

WORKDIR $HOME

CMD /home/linuxbrew/.linuxbrew/bin/fish
