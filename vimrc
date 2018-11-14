" --------------------------
" miles .vimrc
" --------------------------
"
"so ~/.exrc
"
" Variable Settings
"
" Don't use vi-compatibility mode
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Use the smart version of backspace
set backspace=2
"
" Tab-related settings
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set cindent
"
" Enable highlighting of misspelled terms
"set spell
"
" Use numbers
set number
"
" I don't like syntax highlighting
syntax off
"
" Always display row/column info 
set ruler
"
" Don't highlight all search terms, just find them
set nohlsearch
"
" Status line improvements from Kim Schultz ("Hacking Vim")
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
"
" Store backup files in a specific directory
" set backupdir=~/.backups
"
" Create backup files with a tilde extension, as 
" some sites seem to change this
set backupext=~
"
" Force creation of backup files 
set backup
"
" Use UTF-8 as the default text encoding
set encoding=utf-8
"
" Try to set right locale
try
    lang en_US
catch
endtry
"
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
"
" Set characters to show for trailing whitespace and 
" end-of-line. Also supports tab, but I set expandtab 
" and thus tabs are always turned into spaces.
set listchars=tab:>>,trail:!,eol:$
"
" --------------------------
"
" Specific settings for different types of files
"
" Settings for editing C files
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 expandtab
"
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
let python_highlight_all=1
syntax on
"
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
"
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"
" ------------------------
"
" Key mappings
"
" Invoke ispell for spelling correction
"
map <F2> :w<CR>:!ispell -x %<CR>:e!<CR><CR>
"
" Re-source my vimrc, JIC
map <F4> :source $HOME/.vimrc<CR>
"
" Use F5 to reformat paragraphs
map <F5> !}fmt <CR>
"
" The following emacs-like bindings are
" present because my fingers automatically
" type them, not because I think that 
" they're golden.
"
" Other window (emacs-like)
map <C-X>o <C-W>w
"
" Split screen horiz, prompt for file, and open
" ala gosmacs visit-file or GNU find-file-other-window
"
map <C-X><C-V> :sp 
"
" Buffer list (emacs-like)
map <C-X><C-B> :buffers<CR>
"
" Write current file/buffer ala emacs
map <C-X><C-W> :w<CR>
"
" --------------------------
"
" Functions
"
" Example from developerWorks:
"   http://www.ibm.com/developerworks/linux/library/l-vim-script-1
"
function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction
"
" Toggle syntax setting on/off
map <F4> :execute ToggleSyntax()<CR>
"
" Similar function for when syntax isn't relevant
function! ToggleColor()
   if &t_Co != 0
      set t_Co=0
   else  
      set t_Co=8
   endif
endfunction
"
" Toggle color on/off
map <F6> :execute ToggleColor()<CR>
"
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme Zenburn
endif
