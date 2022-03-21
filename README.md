![Preview](./preview.png)

## Scope of the project
Creating this config I wanted to recreate vscode with all it's meaningful features. Unlike [NvChad](https://github.com/NvChad/NvChad) (or other big projects) 
this build is simple simultaneously being well structured and intuitive. All these things make it easy to configure and tweak to your liking. You are able to
install new plugins and remove existing ones without breaking whole configuraion.

## Installation
Make sure that you have Neovim (0.6.1+) installed

Installation is really easy. All you need to do is just clone the repo to your config directory.
```bash
$ cd ~/.config && git clone https://github.com/Shintenza/nvim-code
```
After cloning the repo open Neovim and run this command (to install missing dependencies): 
```
:PackerSync
```
## Adding support for different languages
Installing support for new languages is really simple. All you need to do is run:
```
:LspInstall <name_of_language>
```
If you also want a nice syntax highlighting run:
```
:TSInstall <name_of_language>
```
If you use tools like prettier, eslint and others, you can integrate it easily with null-ls (check null-ls.lua file and [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)).

