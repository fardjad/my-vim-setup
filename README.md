# My Vim Setup

## Synopsis

This is how I have setup Vim on my Windows machine. I'm writing this just for my own future reference. Current setup is configured for Web Development but I'm also using it for pretty much everything else.

## Instructions

1.  Download and install `vim-x64` via [Chocolatey][1]
2.  *[Optional]* Install [Link Shell Extension][2]
3.  Clone the repository and copy (create symlinks to) **.vimrc** and 
    **.vim\** to (in) your home directory
4.  [Install Vundle][3] to **%USERPROFILE%\\.vim\bundle** (copy 
	**misc/curl.cmd** to your git cmd directory, and skip editing **.vimrc**)
5.  Install [this][4] patched **Source Code Pro** font
6.  Download [HTML Tidy][5] and put it in your **PATH**
7.  Download and install [LLVM][6]
8.  Install [Microsoft Visual C++ Build Tools][7] (Install Windows 
	10 SDK only)
9.  Have Vundle install plugins for you:
    `gvim +PluginInstall +qall`
10. `choco install editorconfig.core ctags python2 python3 nodejs cmake`
11. *[Optional]* `choco install ruby 7zip`
12. *[Optional]* Install [Lua][8]
13. `npm install -g csslint editorconfig jshint typescript`
14. `npm install -g git+https://github.com/ramitos/jsctags.git`
15. Follow [YouCompleteMe][9] full installation guide

[1]: https://chocolatey.org/
[2]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html
[3]: https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows#git-on-windows
[4]: https://github.com/powerline/fonts/tree/master/SourceCodePro
[5]: http://binaries.html-tidy.org/
[6]: http://llvm.org/releases/download.html
[7]: https://www.microsoft.com/en-us/download/details.aspx?id=49983
[8]: https://github.com/rjpcomputing/luaforwindows/releases
[9]: https://github.com/Valloric/YouCompleteMe

## License

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. 
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
