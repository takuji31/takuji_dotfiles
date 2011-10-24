setup: $(HOME)/.zshenv \
	   $(HOME)/.zshrc \
	   $(HOME)/.zshrc_custom \
	   $(HOME)/.gitconfig \
	   $(HOME)/.vimrc \
	   $(HOME)/.vim \
	   $(HOME)/.perltidyrc \
	   $(HOME)/.module-setup \
	   $(HOME)/.tmux.conf\
	   $(HOME)/.vrapperrc\
	   $(HOME)/.byobu\
	   $(HOME)/.screenrc\


$(HOME)/.zshenv:
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv

$(HOME)/.zshrc:
	touch  $(HOME)/.zshrc

$(HOME)/.zshrc_custom:
	touch $(HOME)/.zshrc_custom

$(HOME)/.gitconfig:
	ln -sf `pwd`/git/gitconfig $(HOME)/.gitconfig

$(HOME)/.screenrc:
	ln -sf `pwd`/screen/screenrc $(HOME)/.screenrc

$(HOME)/.vimrc:
	ln -sf `pwd`/vim/vimrc $(HOME)/.vimrc

$(HOME)/.vim:
	ln -sf `pwd`/vim $(HOME)/.vim

$(HOME)/.perltidyrc:
	ln -sf `pwd`/perltidy/perltidyrc $(HOME)/.perltidyrc

$(HOME)/.module-setup:
	ln -sf `pwd`/module-setup $(HOME)/.module-setup

$(HOME)/.tmux.conf:
	ln -sf `pwd`/tmux/tmux.conf $(HOME)/.tmux.conf

$(HOME)/.vrapperrc:
	ln -sf `pwd`/vrapper/vrapperrc $(HOME)/.vrapperrc

$(HOME)/.byobu:
	ln -sf `pwd`/byobu $(HOME)/.byobu
