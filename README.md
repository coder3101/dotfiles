# dotfiles
Stow managed dot files for my UNIX machine

## Usages

> Don't delete the repository since `stow` only creates symlinks and does not copies configs at appropriate location.
 
You can install `stow` from your package manager, for instance on mac `brew install stow`. <br>
Once `stow` is installed, run `stow nvim` to create appropriate symlinks to neovim configs.

In order to install the plugins for tmux, run `<prefix> i` (default prefix is <kbd>Ctrl-B</kbd>)
