FROM docker.pkg.github.com/homebrew/brew/brew:latest

MAINTAINER aktriver <readonly@akutagawa.dev>

ARG USERNAME=user
ARG PASSWORD=user

RUN apt update && \
    apt install -y sudo locales && \
    apt clean && rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    /usr/sbin/locale-gen

RUN useradd -m ${USERNAME} && \
    echo "${USERNAME}:${PASSWORD}" | chpasswd && \
    echo "${USERNAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN chown -R "${USERNAME}" /home/linuxbrew/.linuxbrew

ENV HOME /home/${USERNAME}

WORKDIR $HOME/.dotfiles

USER ${USERNAME}

COPY brewfile.sh .
RUN ./brewfile.sh
RUN brew cleanup --prune 0

RUN pip3 install powerline-status

RUN npm install -g yarn && \
    pip3 install neovim

COPY --chown=${USERNAME}:${USERNAME} .config/nvim $HOME/.config/nvim
RUN nvim --headless -c PlugInstall -c qall && \
    nvim --headless -c CocUpdateSync -c qall

COPY --chown=${USERNAME}:${USERNAME} .config/fish $HOME/.config/fish
RUN fish -c exit

COPY --chown=${USERNAME}:${USERNAME} . .

RUN ./deploy.sh

WORKDIR $HOME

CMD fish
