"""""""""""""""""""""""""""""""""""""""""""""""""
""" llang .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
""" Platform and syntax
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                "Put in VIM mode, not vi...standard vi is too old-school, even for me

" This is a hacked method of determining the platform we are on...
let s:platform = system("uname")
let s:on_linux = s:platform =~? "linux"
let s:on_mac   = has('macunix') || s:platform =~? 'Darwin'

set term=xterm-256color
set t_Co=256                    "Set terminal to 256 colors

"""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntax and coloring
"""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                       
colorscheme wombat256
call pathogen#infect()

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype on                     "Turns on file type detection
  filetype indent on              "Enable loading the plugin files for specific file types
  filetype plugin on              "Allow plugins to do fancy things with file-type detection
  set fileformats=unix,dos,mac    "This gives the end-of-line (<EOL>) formats that will be used/tried

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=90

  augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:>
  augroup END

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif " has("audocmd")

"""""""""""""""""""""""""""""""""""""""""""""""""
""" Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""
set softtabstop=2       "Tabs are 2-spaces...using instead of 'tabstop' as per:
set shiftwidth=2        "Number of spaces to use for each step of (auto)indent
set expandtab           "Replace "tab" characters with the "tabstop" number of spaces
set tabstop=2
set smarttab            "When on a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set cindent             "Get the amount of indent for line according the C indenting rules
set cpoptions-=J        "Put 1 space character after a line ending with a "." when
                        " joining lines (with Shift-J). Without this option, 2-spaces would be retained
set autoindent
" set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""
""" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch          "When there is a previous search pattern, highlight all its matches.
set incsearch         "Incremental search
set ignorecase        "The case of normal letters is ignored when searching
set smartcase         "Override the 'ignorecase' option if the search pattern contains upper
                      " case characters. Essentially, this makes searches with
                     " capital letters case-sensitive. If you're going to go
                      " to all the effort of hitting both <Shift> AND a
                      " letter, your search tool better take it into
                      " consideration.

set list                      "Display unprintable characters, such as
                              " trailing spaces and tabs (Depends on
                              " "listchars" settings).
set listchars=tab:>-,trail:.  "Strings to use in 'list' mode.
                              " trail:c  Character to show for trailing spaces.  When omitted,
                              "           trailing spaces are blank. In this
                              "           case, a trailing "." will be added.
                              "           This is used to identify people who use
                              "           IDE's.
                              " tab:xy	 Two characters to be used to show a Tab.  The first
                              "           char is used once.  The second char is repeated to
                              "           fill the space that the Tab normally occupies.
                              "           "tab:>-" will show a Tab that takes four spaces as
                              "           ">---".  When omitted, a Tab is show as ^I.

set confirm           "Always confirms before performing an operation which
                      " may produce undesireable consequences (...within reason).
                      " An example would be saving a file before exiting with
                      " a ":q"

map N nzz             "Center the line that the search result is on
map n nzz

""""""""""""""""""""""""""""""""""""""""""""""""""
""" UI stuff
""""""""""""""""""""""""""""""""""""""""""""""""""
if has('mouse')
  set mouse=a                   "Enables the use of the mouse...even in the terminal
endif

set ruler                       "Displays line number, column number, and %-location of
                                " cursor in file (on bottom of screen)

set number                      "Displays line numbers on the sidebar
set showmatch                   "When a bracket is inserted, briefly jump to the matching one.
set matchtime=2                 "Tenths of a second to show the matching paren, when 'showmatch' is set
set backspace=indent,eol,start  "Allows backspacing over autoindents and line breaks
set cursorline                  "Highlights the line the cursor is currently on.

set history=1000                "Increase history from 20 default to 1000
set undolevels=999              "Increase undo history

" undo - set up persistent undo
if v:version >= 703
    set undofile
    set undodir=$HOME/.vim/undodir
endif

" if vim is build with +clipboard support, yank using os clipboard
set clipboard=unnamed

" set 10 lines above/below the cursor when moving vertically using j/k
set scrolloff=10

" always show status line
set laststatus=2
set statusline=%<\ %f\ %m%r%y%h\ %*%=%-35.(%l\ of\ %L,\ %c%V%)\ %P

" no more stupid sound
set visualbell

" this is pretty awesome. try it with :e <tab>
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,

"""""""""""""""""""""""""""""""""""""""""""""""""
""" Key remaps for navigation
"""""""""""""""""""""""""""""""""""""""""""""""""
" Use kj to switch mode instead of Esc
inoremap kj <Esc>

" Use space instead of :
nore <Space> :
" Get rid of : all together
" nore : ;

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Treat long lines as break lines
map j gj
map k gk

" Remap :W to :w
cnoreabbrev Wq wq
cnoreabbrev W w

" Move easily between start and end of line
noremap <C-h> ^
noremap <C-l> $

" Sudo write file
cmap w!! w !sudo tee % >/dev/null

" shortcut to yank and delete whole line. use y$ and d$ instead for
" end-of-line
map Y yy
map D dd

" Arrow-key mappings, for the 'unconverted'
"if s:on_linux
"  " Up
"  set t_ku=OA
"  " Down
"  set t_kd=OB
"  " Right
"  set t_kr=OC
"  " Left
"  set t_kl=OD
"elseif s:on_mac
"  " Up
"  set t_ku=[A
"  " Down
"  set t_kd=[B
"  " Right
"  set t_kr=[C
"  " Left
"  set t_kl=[D
"endif
"

""""""""""""""""""""""""""""""""""""""""""""""""""
""" Filetype improvements
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead {Rakefile,Vagrantfile,Capfile,*.pp,*.conf} set ft=ruby
autocmd BufNewFile,BufRead {*.md} set ft=markdown
