set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" Use pathogen to load plugins from bundle directory
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"switch off the bell
set visualbell t_vb=
set novisualbell

"key maps for window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"editing
set ruler                       " show the co-ordinates of the cursor
set cursorline                  " highlight the line with the cursor
set scrolloff=3                 " provide some context for editing 
set number

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr> 

"" Look
colorscheme solarized
set background=light
set guifont=Consolas:h12

"GUI OPTIONS
if has ('gui')
  set guioptions-=T
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L
  set guioptions-=l
  set guioptions-=m
end

"" Commands

source $VIMRUNTIME/mswin.vim    "allows standard windows copy/paste keystrokes
behave mswin                    "mouse behavior like windows

"" Disable cursor keys in normal mode
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

"backup directories
set backupdir=c:\\Code\temp	
set directory=c:\\Code\temp

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

"set statusline+=Line:%l/%L[%p%%]
set statusline+=Col:%v

if has("statusline") && !&cp
  set laststatus=2        "always show the status bar

  "start the status line
  set statusline=%f\ %m\ %r


  "finish the statusline
  set statusline+=Line:%l/%L[%p%%]%r
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

"read .ru files as rb
au BufNewFile,BufRead *.ru set filetype=ruby

"customizing the insert menu
"http://goo.gl/UqCSV
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" editing vimrc in a jiffy
" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC
" <Leader> is \ by default, so those commands can be invoked by doing \v and \s

