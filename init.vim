"
"-------------------------------------------------------------
		"Allgemeine Einstellungen 
"-------------------------------------------------------------

"fuer python plugins
"Habe ein python environment angelegt für die Dependencies bzw modules die
"nvim braucht der Pfad weist eben auf die python exe in dem environment, weil
"wir das das python module für nvim installiert haben.
let g:python3_host_prog='/usr/bin/python3'

set encoding=utf-8  " The encoding displayed. - to display german umlauts etc. 
set fileencoding=utf-8  " The encoding written to file.
"use the system keyboard as the default register
set clipboard=unnamed

"vim updatetime erhöhen unter anderm wichtig für GitGutter um Git Änderungen
"zu tracken, schnell anzuzeigen
set updatetime=1000

" leader auf einen key setzen, den man nicht im normal mode braucht
let mapleader = "-"

"benutze truecolor(24bit color) in der console
set termguicolors
"when a file is edited its plugin file is loaded (if there
"is one for the detected filetype)
"You can enable loading the plugin files for specific file types with:
filetype plugin on
"damit wir den vim-internen file explorer ntrw benutzen können
set nocompatible
syntax on


" enable autocomplete with words from spell dictionary
set complete+=k
set history=200
" Avoid the Cursor Keys When Recalling Commands from History
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" escape in terminal mode returns to normal mode
tnoremap <Esc> <C-\><C-n>
" für das einfachere Pasten vom System Clipboard nach vim 
set pastetoggle=<f5>

"Now when we type %% on Vim’s : command-line prompt, it automatically expands
"to the path of the active buffer, just as though we had typed %:h <Tab>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" tell vim where to put its backup files
 set backup
 set backupdir=~/backupFilesVim/backupFiles/
" " tell vim where to put swap files
 set dir=~/backupFilesVim/swpFiles/
 " wegen einen  undo plugin 
 " undo tree plugin 
 set undodir=~/backupFilesVim/undoFiles/
 set undofile

 " beginne früher zu scrollen wenn ich cursor bspw. mit j und k 
 " rauf unter runter bewege - 8 Zeilen vor Ende des files/windows
 set scrolloff=8
" adds an additonal column left to the row numbers 
" great for showing linting errors / warnings
set signcolumn=yes
" we do not want that vim breaks lines for us 
set nowrap 
"keeps any buffer you have been editing around in the background 
"you can go away from it without saving it 
"faster swapping without being worried about safe state 
set hidden 


"-------------------------------------------------------------
		"Einstellungen für die Suche
"-------------------------------------------------------------

"The ** wildcard matches all subdirectories beneath the app/ directory
"find-cmd findet jetzt files im app-Directory und allen Subdirs darunter
":set path+=C:/BitbucketRepos/**

"remove the hightlighting of the current search with ESC
nnoremap <esc> :noh<return><esc>
"schnell das working dir setzen. For example useful for generating tags file
"in a specific directory 
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" schneller tags file fuer ein projekt erstellen
nnoremap <f5> :!ctags -R<CR>
" allow to resize panes with mouse in all modes
set mouse=a

"" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"-------------------------------------------------------------
		"Einstellungen für Einrueckungen, Tabs 
"-------------------------------------------------------------
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

"-------------------------------------------------------------
		"Einstellungen für Zeilennummern 
"-------------------------------------------------------------

" "deactivate setting: set nu! 
 set nu
 set rnu

"-------------------------------------------------------------
		"Einstellungen für Window-movement 
"-------------------------------------------------------------

 " bind Ctrl+<movement> keys to move around the windows, instead of using
 " Ctrl+w + <movement>
  map <c-j> <c-w>j
  map <c-k> <c-w>k
  map <c-l> <c-w>l
  map <c-h> <c-w>h

"-------------------------------------------------------------
		"Plugins VIM-PLUG SECTION
"-------------------------------------------------------------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

"PlugInstall [name ...] [#threads] 	Install plugins
"PlugUpdate [name ...] [#threads] 	Install or update plugins
"PlugClean[!] 	                    Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade                     	Upgrade vim-plug itself
"PlugStatus                     	Check the status of plugins

" Declare the list of plugins.
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' " the essential Git plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "but also install the regular fzf 
Plug 'junegunn/fzf.vim' " install fzf vim
Plug 'junegunn/gv.vim'
Plug 'nelstrom/vim-visual-star-search'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


set statusline=%{FugitiveStatusline()}\ %f\ %m
" fugitive plugin statusline customization
" %{FugitiveStatusline()} - Runs the named function which is provided to us by
" Fugitive. The result looks something like [Git(branchname)] with your
" current branch displayed. If you're checked out to a specific commit, then
" the SHA is displayed instead.
" \ %f - First we escape the space and then use %f to insert the file name,
" replicating what Vim gives us by default.
" \ %m - Another escaped space followed by %m which, again, replicates the
" default modification indicator of [+] if there are unsaved changes.

" git gutter statusline customization
" amends statusline with counts of added, modified and removed lines
function! GitStatus()
      let [a,m,r] = GitGutterGetHunkSummary()
        return printf('+%d ~%d -%d', a, m, r)
    endfunction
    set statusline+=%{GitStatus()}


