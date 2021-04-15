set number
set backspace=2
set whichwrap+=<,>,h,l,[,]
set rtp+=/usr/local/opt/fzf
set completeopt+=popup
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-fugitive'
call plug#end()

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * NERDTreeMirror

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

nmap <F3> :NERDTreeToggle<CR>
nmap <F1> :NERDTreeFind<CR>

inoremap <C-S-Tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-S-w>   <Esc>:tabclose<CR>
imap <C-c> <plug>NERDCommenterInsert

let g:ycm_goto_buffer_command = 'new-or-existing-tab'
nmap <leader>gg :YcmCompleter GoTo<CR>
nmap <leader>gt :YcmCompleter GetType<CR>
nmap <leader>gd :YcmCompleter GetDoc<CR>

let g:ycm_key_list_select_completion = ['<TAB>']
nmap <leader>g<Space> <plug>(YCMHover)

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")

        autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
    augroup END
endif
