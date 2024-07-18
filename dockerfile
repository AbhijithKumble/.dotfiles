 FROM fedora:latest

# Install dependencies
RUN dnf upgrade -y && \
    dnf install -y \
    git \
    stow \
    zsh \
    neovim \
    tmux && \
    dnf clean all

# Clone dotfiles
RUN git clone https://github.com/AbhijithKumble/.dotfiles.git /dotfiles

# Set working directory and run install scripts
WORKDIR /dotfiles
#RUN ./clean && ./install
RUN stow -t /root nvim tmux i3 zsh bin 

# Set default shell
CMD ["/bin/zsh"]

