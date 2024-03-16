# Alex and Happy Vim Syntax Highlighting

This repo provides syntax highlighting files for [Alex](https://haskell-alex.readthedocs.io/en/latest/) and [Happy](https://haskell-happy.readthedocs.io/en/latest/), the lexer generator and parser generator for [Haskell](http://haskell.org).

This is a plain Vimscript repo, so it should be compatible with both Vim and Neovim.

## Installation

The easiest way to install is by using a package manager, such as [vim-plug](https://github.com/junegunn/vim-plug).
However, you may also install manually if wished.

### With a package manager (recommended)

Using [vim-plug](https://github.com/junegunn/vim-plug), it's as simple as adding the following to your list of plugins:

```
Plug 'heitor-lassarote/alex-happy-vim'
```

The proceedure should be similar for other package managers.

### Manually

Alternatively, you may copy and paste the `ftdetect` and `syntax` directories into `~/.vim/`.
