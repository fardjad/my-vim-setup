" plugins expect bash
set shell=bash

" Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'easymotion/vim-easymotion'
Plugin 'takac/vim-hardtime'
Plugin 'posva/vim-vue'
Plugin 'sjl/vitality.vim' " OS X
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ------------------------------------------------------------------------------

" My config

" show the right margin
set colorcolumn=80

" disable wordwrap
set nowrap

" make more room
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" disable the annoying bell 
set vb
set t_vb=

" search options
set hlsearch
set incsearch
set ignorecase
set smartcase
" disable search highlighting after pressing esc twice
" http://stackoverflow.com/a/27207615
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" enable syntax highlighting
syntax enable

" theme settings
set background=dark
set t_Co=16
colorscheme solarized

" airline
set laststatus=2
let g:airline_powerline_fonts=1

" file type specific settings
au FileType javascript source $HOME/.vim/scripts/javascript.vim
au FileType html source $HOME/.vim/scripts/html.vim
au FileType json source $HOME/.vim/scripts/json.vim

" buffers
" allow switching buffers without writing the changes
set hidden
" enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
" easier buffer switching
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" NERDTree
" open NERDTree automatically when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" toggle NERDTree with Ctrl+/
" http://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
map <C-_> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" paste
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" encoding
set encoding=utf-8 " also fixes powerline symbols on Windows

" gui
if has("gui_running")
  if has("gui_macvim")
    set guifont=Liberation\ Mono\ for\ Powerline:h12
  elseif has("gui_gtk2")
    set guifont=Liberation\ Mono\ for\ Powerline\ 12
  else
    set guifont=Liberation Mono Powerline:h12
  endif
  " window size
  set lines=43
  set columns=132
endif

" emmet
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

" line numbers
set number

" change working directory to current file in active window
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" yankring
nnoremap <silent> <F11> :YRShow<CR>
let g:yankring_paste_using_g=0
let g:yankring_replace_n_pkey=0
let g:yankring_replace_n_nkey=0

" fix backspace problems in Windows
set backspace=indent,eol,start 

" default indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" easytags
set cpoptions+=d
set tags=.vimtags;,$HOME/.vim/.vimtags
let g:easytags_file=$HOME.'/.vim/.vimtags'
let g:easytags_dynamic_files=2
let g:easytags_events=['BufWritePost']
let g:easytags_async=0
let g:easytags_resolve_links=1
let g:easytags_include_members=1
let g:easytags_languages={
            \  'javascript': {
            \     'cmd': 'jsctags',
            \     'args': [],
            \     'fileoutput_opt': '-f',
            \     'stdout_opt': '-f-',
            \     'recurse_flag': '-R'
            \  }
            \}

" tagbar
nmap <F8> :TagbarToggle<CR>

" turn off preview scratch window
set completeopt-=preview

" enable mouse
set mouse=a

" give my self such a hardtime ;-)
let g:hardtime_default_on=1
let g:list_of_disabled_keys=['<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']

" quick resize (http://vim.wikia.com/wiki/Quick_window_resizing)
" resize horzontal split window
nmap <C-K> <C-W>-<C-W>-
nmap <C-J> <C-W>+<C-W>+
" resize vertical split window
nmap <C-H> <C-W>><C-W>>
nmap <C-L> <C-W><<C-W><

" clipboard
if has('win32')
  set clipboard=unnamed
elseif has('mac')
  set clipboard=unnamed
elseif has('unix')
  set clipboard=unnamedplus
endif

" leader
" change the mapleader from \ to ,
let mapleader=","

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" vim-shell
" Disable default mappings (https://github.com/xolox/vim-shell#the-gshell_mappings_enabled-option)
let g:shell_mappings_enabled = 0

" go-vim
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Enable goimports to automatically insert import paths 
let g:go_fmt_command = "goimports"
" Make go-vim and syntastic play nice
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
" go-vim key bindings
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" vim-jsx
" allow jsx in normal .js files
let g:jsx_ext_required = 0

" snippets
" https://medium.com/brigade-engineering/sharpen-your-vim-with-snippets-767b693886db
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" UltiSnip snippets directory
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Disable cursor blinking
set guicursor+=a:blinkon0

