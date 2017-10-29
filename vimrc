set nocompatible              " be iMproved, required
"Steps to do for a new vimrc setup
" - download/install vundle Plugin Manager
" - download ctags
" - ctags tags file generieren
" - Set tags? 
" - set tags+=<path> in vimrc file
" - Umgebungsvariable HOME in Windows auf meine custom location setzen
" - create backupFiles Directories for vim backup files and vim swp files

"needs to be on so that vim gets filetype/syntax highlightening automatically
filetype on                  " required
"automatic syntax word completion with ctrl x, ctrl o
set omnifunc=syntaxcomplete#Complete

set tags+=c:\Users\weitz\Desktop\Studium\HCI\Assignment_I\WebApp_Stub\web_application_stub\jqt\tags

"make Vim automatically refresh any files that haven't been edited by Vim. 
set autoread

"hiding menus in gvim
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar

"set tags+=C:/Program\ Files/Python27/tags

"verhindern, dass vim komische Sonderzeichen an manchen stellen zeigt
set encoding=utf-8


syntax on

" tell vim where to put its backup files
set backup
set backupdir=C:\\Users\weitz\backupFilesVim\backupFiles\
" tell vim where to put swap files
set dir=C:\Users\weitz\backupFilesVim\swpFiles\

"deactivate setting: set nu! 
set nu
set rnu

"Path: legt fest was alles von den „file-related-commands“ durchsucht wird z. B.
"|gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| etc.
"Star-star -> search through all subdirs
set path+=**

"enables a menu at the bottom of the vim/gvim window.
"wildmenu -> kann man * benutzen für autocomplete wenn man file mit komplizierten namen sucht 
set wildmenu
set wildmode=list:longest,full

"ignore some file extensions in ctrlp and NERDTree
set wildignore=*.obj,*.bak,*.exe,*.pdf

"remove the hightlighting of the current search with ESC
nnoremap <esc> :noh<return><esc>

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"avoid snippets hanging around the gui by setting another font 
set guifont=Consolas:h12

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | endif
augroup END

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" Rebind <Leader> key
let mapleader = ","

"To allow backspacing over everything in insert mode (including automatically
"inserted indentation, line breaks and start of insert)
set bs=2     " make backspace behave like normal again

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
"TODO: collides with build in "till" command
"nnoremap td  :tabclose<CR>
"nnoremap tn :tabnew<CR>

"fine tune the amount of whitespace to be inserted with a <tab> character
set tabstop=4
set softtabstop=4
"fine tune the amount of whitespace to delete or insert using the indentation
"commands in normal mode (< und >)
"setting all to 4 we ensure that indentation in normal mode and tab keys in
"insert mode uses the same amount
set shiftwidth=4
set shiftround
"use spaces instead of tab characters
set expandtab

"set the wrap width; by default it's unset and thus disables line-wrapping. 
set tw=80
"display long lines as just one line (i.e. you have to scroll horizontally to see the entire line)
set nowrap
set formatoptions-=t  " don't automatically wrap text when typing, must be after compatible value is set

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map sort function to a key
vnoremap <Leader>s :sort<CR>

colorscheme jellybeans

"--------------- PLUGIN SETTINGS -----------------------
"let NERDTreeIgnore=['\.bak$','\.exe$','\.obj$','\.pdf']

"map <F2> :NERDTreeToggle<CR>

"let g:ctrlp_max_height = 30
" set the runtime path to include Vundle and initialize

"settings for vim-powerline
"disply status bar
"set laststatus=2
"display fancy symbols
"let g:Powerline_symbols = 'fancy'

"autocmd vimenter * NERDTree

"--------------- PLUGIN SETTINGS -----------------------

set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle/')


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/vimfiles/vundleBundles')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-repeat'
"
"Plugin 'ctrlpvim/ctrlp.vim'
"
"Plugin 'Lokaltog/vim-powerline' 
"
Plugin 'tpope/vim-surround'

"Plugin 'AndrewRadev/linediff.vim'

Plugin 'valloric/MatchTagAlways'

Plugin 'Townk/vim-autoclose'

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
"
" Reformat paragraphs and list.
nnoremap <Leader>f gq}

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <Leader>t :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

""if &diff
""	   setup for diff mode
""	else
""	   setup for non-diff mode
""	endif
""wenn diffmode , dann squarebrackets remappen


