# Linux settings

List of programs:

* Terminal Emulator: <https://github.com/alacritty/alacritty>

* Tmux: <https://github.com/tmux/tmux#from-version-control>

* Vim

* Zsh and Oh My ZSH <https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH>

* i3wm: <https://i3wm.org/>

* AWS CLI <https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html>

* Kubectl <https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux>

* Docker

```bash
curl https://get.docker.com -fsSL | sh -
```

* Docker Compose <https://github.com/docker/compose/releases>

* Terraform  <https://www.terraform.io/downloads.html>

* Fortio (Load testing) <https://github.com/fortio/fortio>

* Stress (stress test) <https://linux.die.net/man/1/stress>

### Clone repo

```bash
mkdir -p $HOME/github && cd $HOME/github
git clone git@github.com:jbuet/settings.git
```

### Install zsh

```bash
dist=""
if [ -r /etc/os-release ]; then
 dist="$(. /etc/os-release && echo "$ID")"
fi
echo "$dist"
if [[ "$dist" = 'fedora' ]]; then
  sudo dnf update -y
  sudo dnf  install zsh git -y
else
  sudo apt update -yq && apt upgrade -y
  sudo apt-get install zsh git -y
fi

chsh -s /bin/zsh
```

### Install on my zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Install and set plugins

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
PLUGINS="plugins=(git docker docker-compose kubectl zsh-syntax-highlighting zsh-autosuggestions fzf)"
sed -i "s|.*plugins=.*|$PLUGINS|g" $HOME/.zshrc
```

### Set spaceship theme

```bash
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i "s|.*ZSH_THEME=.*|ZSH_THEME=spaceship|g" $HOME/.zshrc
```

### Source config

```bash
source ~/.zshrc
```

### install tmux

```bash
cd $HOME && git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
```

### Configure tmux

```bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

### Fortio Load

fortio load -k -a -qps 3000 -t 120s -c 8  https://jbuet.com