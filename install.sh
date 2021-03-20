#!/bin/bash

if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
	echo -e "ZSH and Git are already installed, proceed to install resource files...\n"
else
	if sudo apt install -y zsh git wget; then
		echo -e "zsh wget and git Installed\n"
	else
		echo -e "Failed to install zsh, wget, git: Please install them manually.\n"
	fi
fi

# -n: do not overwrite existing files..
if mv -n ~/.zshrc ~/.zshrc-backup-$(date + "%Y-%m-%d"); then
	echo -e "Backed up the current .zshrc to .zshrc-backup-date\n"
fi


echo -e "Installing oh-my-zsh\n"

if [ -d ~/.oh-my-zsh ]; then
	echo -e "oh-my-zsh is already installed\n"
else
	git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

cp -f .zshrc ~/


if [ -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]; then
	cd ~/.oh-my-zsh/plugins/zsh-autosuggestions && git pull
else
	git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull
    else
	git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
	cd ~/.oh-my-zsh/custom/plugins/zsh-completions && git pull
else
	git clone --depth=1 https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search ]; then
	cd ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search && git pull
else
	git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
fi



