" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Set the layout of winmanager and taglist
let g:winManagerWindowLayout='FileExplorer|TagList'  
nmap wm :WMToggle<CR>

" molokai color theme config 
let g:molokai_original = 1
let g:rehash256 = 1

" mini bffer config 
nmap mb :MiniBufExplorer<CR>
let g:miniBufExplMapCTabSwitchBufs = 1  
let g:miniBufExplMapWindowNavVim=1  "switch tabs uses <C+h,j,k,l>
"let g:miniBufExplMapWindowNavArrows=1  "swicth  tabs uses <C+left,right,up,down>

" Javascript settings for taglist
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

"file encoding
set fileencodings=utf-8,bg18030,gbk,big5

" highlight current line and column
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
"set the color of cursorcolumn
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"highlight searched string
set hlsearch
set matchpairs+=<:>

set number 
set relativenumber


noremap fm :Autoformat<CR>

"Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Bundle 'gmarik/vundle'
Bundle 'fatih/vim-go'
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
"NERDTree
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

filetype plugin indent on

set ts=2
set expandtab


let g:airline#extensions#tabline#enabled = 0

"Force use 256 color in terminal
set t_Co=256

highlight LineNr ctermfg=yellow

let mapleader='`'
"vim-go key map
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)


"remap window split switch commands
nmap <silent> <leader><Up> :wincmd k<CR>
nmap <silent> <leader><Down> :wincmd j<CR>
nmap <silent> <leader><Left> :wincmd h<CR>
nmap <silent> <leader><Right> :wincmd l<CR>

nmap <silent> <leader>x  :tabc<CR>
nmap <leader>w :w<cr>

nmap <leader><PageUp> :tabn<CR>
nmap <leader><PageDown> :tabp<CR>

nmap <leader>q :q<CR>

