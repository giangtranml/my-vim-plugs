call plug#begin()
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'jreybert/vimagit'
Plug 'dense-analysis/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
