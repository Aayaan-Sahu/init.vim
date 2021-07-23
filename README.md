# My neovim configuration (with Neovide)

## Example
<img src="https://raw.githubusercontent.com/Aayaan-Sahu/init.vim/main/Configuration-Screenshot.png" height="450">

## Install FiraCode Nerd Font
1. `brew tap homebrew/cask-fonts`
2. `brew install --cask font-fira-code`

## Install vim-plug
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```


### Also need to install `node` for `CoC` and `clangd` for `CoC`
