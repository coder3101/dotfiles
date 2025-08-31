# dotfiles
Stow managed dot files for my UNIX machine

## Usages

> Don't delete the repository since `stow` only creates symlinks and does not copies configs at appropriate location.
 
You can install `stow` from your package manager, for instance on mac `brew install stow`. <br>
Once `stow` is installed, run `stow nvim` to create appropriate symlinks to neovim configs.

In order to install the plugins for tmux, run `<prefix> i` (default prefix is <kbd>Ctrl-B</kbd>)

## Zoxide

Run `brew install zoxide` to install zoxide and myrc would create an alias for `cd` with `zoxide`

## Font
Use [Monaspace by githubnext](https://github.com/githubnext/monaspace/tree/main) for editor and optionally if spaceship prompt does not shows the glyphs install `noto-fonts-emoji`

## Wallpapers
Stow the wallpapers on `~/Wallpapers` because wezterm and hyprland uses wallpapers from here
