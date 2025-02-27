let mapleader=" "

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged/')

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
"Plug 'VundleVim/Vundle.vim'
"Plug 'tpope/vim-dispatch'
"Plug 'Valloric/YouCompleteMe'
"Plug 'google/vim-maktaba'
"Plug 'google/vim-codefmt'
"Plug 'derekwyatt/vim-fswitch'

call plug#end()

" ~/.vimrc (configuration file for vim only)

function! SKEL_spec()
    0r /usr/share/vim/current/skeletons/skeleton.spec
    language time en_US
    let login = system('whoami')
    if v:shell_error
        let login = 'unknown'
    else
        let newline = stridx(login, "\n")
        if newline != -1
            let login = strpart(login, 0, newline)
        endif
    endif
    let hostname = system('hostname -f')
    if v:shell_error
        let hostname = 'localhost'
    else
        let newline = stridx(hostname, "\n")
        if newline != -1
            let hostname = strpart(hostname, 0, newline)
        endif
    endif
    exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
    exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
    exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()

set nobackup      " do not keep a backup file, use versions instead
set nowritebackup

if has("autocmd")
    filetype plugin indent on

    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent
endif

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

set mouse=a
set hlsearch
set tabstop=2
set scrolloff=5
set shiftwidth=2
set timeoutlen=300
set number
set expandtab
set smartindent
set backspace=indent,eol,start
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Open CTRLP files in current window
let g:ctrlp_open_new_file = 'r'

map <F2> :ls<CR>:b<Space>

" Make in the local folder
nnoremap <F4> :make<cr>

" Run using run script
nnoremap <F5> :!./run<cr>

" Clean the folder then make
nnoremap <F6> :make clean<cr>:make!<cr>

" Remove all trailing whitespace
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Reformat the entire document
map <F7> mngg=G`nzz<CR>

map <F9> mn:w <bar> !./vform %:p<CR>:edit!<CR>'nzz
":edit!<CR>redraw!<CR>

" Set jk as escape sequence
" imap jk <Esc>
imap jk <Esc>

" Miscellaneous
map Q gq
inoremap <C-U> <C-G>u<C-U>

" Highlight a column for width limiting
set colorcolumn=83
hi ColorColumn ctermbg=lightgrey

" YCM config file confirmation ignore
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/configs/.ycm_extra_conf.py'

" Some Fortran code folding improvements
let fortran_do_enddo=1
let fortran_more_precise=1
let fortran_have_tabs=1

augroup custom_autocommands

  " Clear the list of autocommands to stop repeats
  au!
  
  " Stops the preview window keep opening all the time
  autocmd CompleteDone * pclose
          
  " Setup special file highlighting
  au BufRead,BufNewFile *.cl set filetype=c
  au BufRead,BufNewFile *.cuknl set filetype=cpp
  au BufRead,BufNewFile *.cu set filetype=cpp
  au BufRead,BufNewFile *.knls set filetype=cpp
  au BufRead,BufNewFile *.ptx set filetype=asm

  " Setup rwa
  au BufWritePost *.cpp silent! execute "!rwa %:p &" | redraw!
  au BufWritePost *.cu silent! execute ":!rwa %:p &" | redraw!
augroup END

" Permanent undo files
set undofile
set undodir="$HOME/.vim_undo/"

" Disable ex mode
nnoremap Q <nop>

" Nifty
nnoremap ; :

inoremap {<CR> {<C-o>o}<C-o>O

" Set cursor line
"set cursorline

" Enable syntax highlighting
syn enable

" Coloring with solarized theme
set background=dark
colorscheme mmartineau

" Set so that case is generally ignored
set ignorecase
set smartcase

" Make tab completion like in bash
set wildmode=longest,list,full
set wildmenu

" Quick jump to shell
nnoremap <leader>d :sh<CR>
vnoremap <leader>q :ctags -R
nnoremap <leader>v :vsp<CR>
nnoremap <leader>s :sp<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>f :FSHere<CR>

" Better highlighting
highlight Search ctermbg=black ctermfg=yellow cterm=underline

" For comedy
nnoremap <leader>t i#pragma omp target teams distribute parallel for

" Recurse up for tags file
nnoremap <leader>a ma
nnoremap <leader>c o<ESC>cc#endif // if 0<ESC>'aO<ESC>cc#if 0<ESC>
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>n :cn<CR>

" Moving around buffers
nnoremap <S-H> <C-W>h
nnoremap <S-L> <C-W>l
nnoremap <C-J> <S-J>
nnoremap <C-K> <S-K>
nnoremap <C-U> <S-U>
nnoremap <C-D> <S-D>
nnoremap <S-U> <C-U>
nnoremap <S-D> <C-D>
vnoremap <S-U> <C-U>
vnoremap <S-D> <C-D>
nnoremap <S-J> 5j
nnoremap <S-K> 5k
"nnoremap <C-H> :w<CR>:bp<CR>
"nnoremap <C-L> :w<CR>:bn<CR>

" Ignore the warnings through make
set errorformat^=%-G%f:%l:\ warning:%m

" Setup the shell for handling dispatching commands 
"set shell=/bin/bash\ -l
"set shellcmdflag=-ic

" Disable youcompleteme
"let g:loaded_youcompleteme = 1

"augroup autoformat_settings
"  autocmd FileType c,cpp AutoFormatBuffer clang-format
"augroup END
"

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" ~/.vimrc ends here

