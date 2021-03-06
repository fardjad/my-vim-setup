" Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
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
Plugin 'easymotion/vim-easymotion'
Plugin 'posva/vim-vue'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'millermedeiros/vim-statline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-vinegar'

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

" file type specific settings
au FileType javascript source $HOME/.vim/scripts/javascript.vim
au FileType html source $HOME/.vim/scripts/html.vim
au FileType json source $HOME/.vim/scripts/json.vim

" buffers
" allow switching buffers without writing the changes
set hidden
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
let NERDTreeHijackNetrw=0

" paste
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" encoding
set encoding=utf-8 " also fixes powerline symbols on Windows

" gui
if has("gui_running")
    " Disable cursor blinking
    set guicursor+=a:blinkon0
    set linespace=9
    " window size
    set lines=30
    set columns=150
    if has("gui_macvim")
        set macligatures
        set guifont=Fira\ Code:h14
    elseif has("gui_gtk2")
        set guifont=LiberationMono\ 12
    else
        set guifont=Liberation Mono Powerline:h14
    endif
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
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
" use eslint for javascript
let g:syntastic_javascript_checkers = ['eslint']

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
let g:easytags_async=1
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

" quick resize (http://vim.wikia.com/wiki/Quick_window_resizing)
" resize horzontal split window
nmap <C-K> <C-W>-
nmap <C-J> <C-W>+
" resize vertical split window
nmap <C-H> <C-W>>
nmap <C-L> <C-W><

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
" `s{char}{char}{label}`
nmap <Leader>s <Plug>(easymotion-s2)

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

" NumberToggle
let g:NumberToggleTrigger="<F3>"

" ctrlp
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$'
            \ }

" statline
let g:statline_fugitive = 1
hi link User1 StatusLine
hi link User2 StatusLine
hi link User3 StatusLine
hi link User4 StatusLine
" greyscale statusline
hi StatusLine ctermfg=0 ctermbg=10 gui=none guibg=#073642 guifg=#93a1a1
hi StatusLineNC ctermfg=0 ctermbg=10 gui=none guifg=#657b83 guibg=#073642

" togglecursor
let g:togglecursor_default="block"
let g:togglecursor_insert="line"
let g:togglecursor_leave="block"
let g:togglecursor_replace="underline"

