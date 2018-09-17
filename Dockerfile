FROM base/archlinux
MAINTAINER Geoffrey ROYER

# Set the locale
RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen 
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM xterm-256color

RUN pacman --noconfirm -Syu \
	&& pacman -S --noconfirm base-devel git neovim wget zsh \
	&& chsh -s /usr/bin/zsh \
	&& groupadd -g 1000 ge0 \
	&& useradd -u 1000 -g 1000 -G users,wheel,sys -m -s /usr/sbin/zsh \
	   -c "Geoffrey ROYER" ge0

USER ge0

WORKDIR /home/ge0


RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

COPY --chown=ge0:ge0 .config/nvim ./.config/nvim
COPY --chown=ge0:ge0 dotfiles/ .
COPY --chown=ge0:ge0 install_vim-plug.sh /tmp
RUN  /tmp/install_vim-plug.sh

ENTRYPOINT ["/usr/sbin/zsh"]
