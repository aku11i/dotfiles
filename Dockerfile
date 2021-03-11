FROM homebrew/brew:latest

ENV LANG en_US.UTF-8
ENV HOME /root

WORKDIR $HOME/.dotfiles

RUN apt update && \
    apt install -y locales && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    /usr/sbin/locale-gen

RUN brew install \
      fish \
      fzf \
      git \
      neovim \
      node \
      python \
      tmux && \
    brew cleanup -s --prune 0 && \
    rm -rf /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew

COPY . .

RUN ./deploy.sh && \
    npm install -g yarn && \
    pip3 install powerline-status neovim && \
    nvim --headless -c PlugInstall -c qall && \
    nvim --headless -c CocUpdateSync -c qall && \
    fish -c "exit" && \
    fish -c "fisher update" && \
    npm cache verify && \
    yarn cache clean && \
    rm -rf ~/.cache

WORKDIR $HOME

CMD fish
