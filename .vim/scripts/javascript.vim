" code folding
" http://www.bestofvim.com/tip/javascript-code-folding/
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99
" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

