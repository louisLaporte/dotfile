set nocompatible
filetype off


set expandtab
set shiftwidth=4
set softtabstop=4

set ruler           " Show the line and column number of the cursor position,
set mouse=a         " Enable the use of the mouse.
set t_Co=256        " Enable 256 colors
set number          " Enable line numbering 

execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme distinguished

" cygwin
imap ^[OA <ESC>ki
imap ^[OB <ESC>ji
imap ^[OC <ESC>li
imap ^[OD <ESC>hi
" powershell
let g:ps1_nofold_blocks = 1
