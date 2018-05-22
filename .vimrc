" plugins
call plug#begin('$HOME/.vim/plugged')

Plug 'ElmCast/elm-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc', { 'do': 'pip3 install -U neovim' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ap/vim-buftabline'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-surround'
Plug 'heavenshell/vim-jsdoc'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

source $HOME/.vim/basic.vim
source $HOME/.vim/ale.vim
source $HOME/.vim/color.vim
source $HOME/.vim/crontab.vim
source $HOME/.vim/gui.vim
source $HOME/.vim/javascript.vim
source $HOME/.vim/nerdtree.vim
source $HOME/.vim/hardtime.vim
source $HOME/.vim/easymotion.vim
source $HOME/.vim/deoplete.vim
source $HOME/.vim/bufexplorer.vim
source $HOME/.vim/vim-hardtime.vim
source $HOME/.vim/vim-jsdoc.vim
