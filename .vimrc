" Closing characters
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Interface
set number	" Show current line number
set relativenumber " Show relative numbers

set tabstop=4 " Tabs are 4 spaces long
set softtabstop=0 noexpandtab " Tab uses combinations of spaces and tabs & doesn't insert spaces instead of tabs
set shiftwidth=4 " One indent is a single tab
set autoindent " Mantain top line's indentation 
"set cindent " C style indentation
filetype indent on " Load filetype-specific indent files

set cursorline " Highlight current line

set showcmd " Show command in bottom bar

set wildmenu " Visual autocomplete for command menu
set wildmode=longest:full,full " First <Tab> shows menu, next <Tab> cycles

set showmatch " Highlight matching [{()}]

syntax on " Syntax highlighting

" Color scheme
colorscheme koehler 

" Searching
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

" Copy and paste
vmap <C-c> "+yi " Copy to system clipboard
vmap <C-x> "+c  " Cut to sytem clipboard
vmap <C-v> c<ESC>"+p " Paste from system clipboard
imap <C-v> <ESC>"+pa " Paste and append from system clipboard

" file stats
set ruler

" utf encoding
set encoding=utf-8




