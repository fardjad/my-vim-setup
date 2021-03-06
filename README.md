# My Vim Setup

## Synopsis

This is how I have setup Vim on my machine. Current setup is
mainly configured for Web Development. I'm using these config files on Linux,
Windows, and macOS from time to time and will do my best to keep things
cross-platform.

## Instructions for Windows

1.  Download and install `vim-x64` via [Chocolatey][1]
2.  Install [Link Shell Extension][2]
3.  Clone the repository and create symlinks to **.vimrc** and
    **.vim\** in your home directory.
4.  [Install Vundle][3] to **%USERPROFILE%\.vim\bundle** (copy
	**misc/curl.cmd** to your git cmd directory, and skip editing **.vimrc**)
5.  Install [Liberation Mono Font][4]
6.  Download and install [LLVM][5]
7.  Install [Microsoft Visual C++ Build Tools][6] (Install Windows
	10 SDK only)
8.  Have Vundle install plugins for you: `gvim +PluginInstall +qall`
9.  `choco install editorconfig.core ctags nodejs golang python3`
10. `npm install -g typescript`
11. [`npm install -g git+https://github.com/ramitos/jsctags.git`][7]
12. Follow [YouCompleteMe][8] Windows installation guide (Just ignore the part
    that referes to full installation instructions.) Make sure to pass
    **--clang-completer**, **--gocode-completer**, and **--tern-completer**
    flags to **setup.py**
13. [Run `npm install` in **%USERPROFILE%\.vim\bundle\tern\_for\_vim**][9]
14. Copy/create a symlink to **misc/.tern-config** to/in your home directory.
15. Install required binaries for **go-vim**: [`gvim +GoInstallBinaries`][10]

## Linux Instructions

Configuration should be straightforward on Linux.

Follow the Windows instructions and use the package manager of your distro
to install packages where applicable.

The only gotcha is in **Arch Linux** (and maybe some other distros) you'll need
to install [`libtinfo-5`][11] package for **YouCompleteMe** to work correctly.

## macOS Instructions

1. Install iTerm2, Vim, and MacVim
2. Install [Fira Code Font][12]
3. Install [Solarized Dark][13] color scheme on iTerm2 and set the font to
   **14pt Fira Code** with *150%* vertical line spacing
4. Follow the Windows instructions and use Homebrew to install packages where
   applicable.

## License

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
International License. To view a copy of this license,
visit http://creativecommons.org/licenses/by-sa/4.0/.

[1]:  https://chocolatey.org/
[2]:  http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html
[3]:  https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows#git-on-windows
[4]:  https://fedorahosted.org/liberation-fonts
[5]:  http://llvm.org/releases/download.html
[6]:  http://landinghub.visualstudio.com/visual-cpp-build-tools
[7]:  https://github.com/ramitos/jsctags#install
[8]:  https://github.com/Valloric/YouCompleteMe
[9]:  https://github.com/ternjs/tern_for_vim#manual
[10]: https://github.com/fatih/vim-go#install
[11]: https://github.com/Valloric/YouCompleteMe/issues/778
[12]: https://github.com/tonsky/FiraCode
[13]: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized

