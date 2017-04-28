" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kergoth/vim-bitbake'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'yegappan/grep'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'lyuts/vim-rtags'
"Plugin 'milkypostman/vim-togglelist'
Plugin 'rhysd/vim-clang-format'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-dispatch'

"All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" common
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256
syntax on
set ttyfast                   "performance
set hlsearch
noremap  <F5> :checktime<Enter>

" backups
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" tabs, spaces, wrapping
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set textwidth=80
set formatoptions=qrn1
"set colorcolumn=+1

" menu
set wildmenu
"set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" line movements
nnoremap <silent> <a-down> :m .+1<cr>==
nnoremap <silent> <a-up> :m .-2<cr>==
inoremap <silent> <a-down> <esc>:m .+1<cr>==gi
inoremap <silent> <a-up> <esc>:m .-2<cr>==gi
vnoremap <silent> <a-down> :m '>+1<cr>gv=gv
vnoremap <silent> <a-up> :m '<-2<cr>gv=gv

" shortcuts
map <leader>s :set spell spelllang=en_us <Enter>
map <leader>S :set nospell <Enter>

" NERD Tree
noremap  <F2> :NERDTreeTabsToggle<Enter>
noremap  <F3> :NERDTreeFind<Enter>
augroup ps_nerdtree
    au!
    au Filetype nerdtree setlocal nolist
augroup END
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\~$', '.*\.pyc$', '.*.pid', '.*\.o$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let g:NERDTreeWinPos = "right"

" air line
let g:airline_theme='sol'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'git ls-files --exclude-standard %s']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
let g:ctrlp_cmd = 'CtrlPMRU'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='/home/knowacki/tmp/mydir'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" search, search under cursor, and replace
noremap <silent> <leader>H :Rgrep<cword><cr>
noremap <silent> <leader>h :Rgrep<cr>
let Grep_Skip_Dirs = '.svn .git build build_*'
let Grep_Skip_Files = 'compile_commands.json'
let Grep_Path = '/usr/bin/ag'
let Grep_Default_Options = '--nogroup --nocolor'
"noremap <leader>h :%s/\<<c-r><c-w>\>/
"map <leader>h :Grep

"clang-format.py
map <C-K> :pyf ~/.vim/clang-format.py<CR>
imap <C-K> <ESC>:pyf ~/.vim/clang-format.py<CR>i

"compilation
"command Make is from dispatch plugin
map <F6> :Make<Enter>
map <F7> :cn<Enter>
map <F8> :cp<Enter>

set makeprg=vimbuild

"syntax
au BufNewFile,BufRead *.tsx set filetype=javascript
au BufNewFile,BufRead *.ts set filetype=javascript

"color scheme
"colorscheme eclipse
hi Search guibg=Yellow guifg=Black ctermbg=Yellow ctermfg=Black

"remove withspaces
map <leader>w :%s/\s\+$//e <Enter>
