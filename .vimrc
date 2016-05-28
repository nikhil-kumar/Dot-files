set nocompatible

set tabstop=4      " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4   " Number of spaces to use for each step of (auto)indent.
set showcmd        " Show (partial) command in status line.
set number         " Show line numbers.
set relativenumber " Show line numbers in relation to current line.
set mouse=a        " Enable the use of the mouse.
set hidden         " Hides buffers rather than closing them.
set title          " Show filename in window title.
set cursorline     " Highlight current line.
set autoread       " Automaticallly reload buffers when the file is changed.
set ignorecase     " Ignore case in search patterns.

" Override the 'ignorecase' option if the search pattern
" contains upper case characters.
set smartcase
set spell spelllang=en_us
set complete+=kspell

" When a bracket is inserted, briefly jump to the matching
" one. The jump is only done if the match can be seen on the
" screen. The time to show the match can be set with
" 'matchtime'.
set showmatch

" When there is a previous search pattern, highlight all
" its matches.
set hlsearch

" While typing a search command, show immediately where the
" so far typed pattern matches.
set incsearch

" Influences the working of <BS>, <Del>, CTRL-W
" and CTRL-U in Insert mode. This is a list of items,
" separated by commas. Each item allows a way to backspace
" over something.
set backspace=2
					
" Copy indent from current line when starting a new line
" (typing <CR> in Insert mode or when using the "o" or "O"
" command).
set autoindent
let g:airline_powerline_fonts = 1

" Maximum width of text that is being inserted. A longer
" line will be broken after white space to get this width.
set textwidth=79
					
" This is a sequence of letters which describes how
" automatic formatting is to be done.
"
" letter	meaning when present in 'formatoptions'
" ------	---------------------------------------
" c		 Auto-wrap comments using textwidth, inserting
"		   the current comment leader automatically.
" q		 Allow formatting of comments with "gq".
" r		 Automatically insert the current comment leader
"		   after hitting <Enter> in Insert mode.
" t		 Auto-wrap text using textwidth (does not apply
"		   to comments)
set formatoptions=c,q

" Show the line and column number of the cursor position,
" separated by a comma. Not needed with {power,air}line.
"set ruler	

" Following section stolen from gregstallings/vimfiles
" =============================================================================
" Multipurpose Tab Key
" =============================================================================

" Indent if at the beginning of a line, else do completion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'rking/ag.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'sjl/gundo.vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on
syntax enable

" Add go support to vim-tagbar
"so ~/.tagbar-go.vim
"so ~/.tagbar-d.vim

" Shit I added

noremap <F8> :TagbarToggle<CR>
noremap <F7> :NERDTreeToggle<CR>
noremap <A-]> :bn<CR>
noremap <A-[> :bp<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
set foldmethod=syntax
set foldnestmax=10
set nofoldenable

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:gitgutter_realtime = 0 " Disable gitgutter interval-based auto-update.
let g:gitgutter_eager = 0	" Disable gitgutter update on focus/enter/tab.
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

if has("gui_running")
	set guifont=Essential\ PragmataPro\ 12
	set guioptions=aem
else
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

colorscheme solarized
let g:solarized_contrast = "normal"
let g:solarized_termtrans = 1
set background=dark
