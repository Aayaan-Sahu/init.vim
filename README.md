# My neovim configuration (with Neovide)

## Install FiraCode Nerd Font
`brew tap homebrew/cask-fonts`
`brew install --cask font-fira-code`

## Install vim-plug
```sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Also need to install `node` for `CoC` and `clangd` for `CoC`
