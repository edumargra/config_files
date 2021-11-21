" Plugins
  call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'jreybert/vimagit'
  Plug 'tpope/vim-fugitive'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'vim-scripts/DoxygenToolkit.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'lervag/vimtex'
  Plug 'tpope/vim-eunuch'
  Plug 'morhetz/gruvbox'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  call plug#end()

  let mapleader ="\<Space>"

" Ros formating
  set shiftwidth=2  " Two space indents
  set tabstop=2     " Tab key indents two spaces at a time
  set expandtab     " Use spaces when the <Tab> key is pressed

" Other formating
  set backspace=indent,eol,start
  set autoindent
  set backup
  set history=500
  set ruler
  set showcmd
  set showmode
  set incsearch
  syntax enable
  set hlsearch
  set ignorecase
  set smartcase
  set linebreak
  set scrolloff=3
  set sidescrolloff=5
  filetype plugin indent on
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \  | wincmd p | diffthis
  set number
  set relativenumber
  set list
  set splitbelow splitright
  set conceallevel=2
  set cursorline
  set spell
  set autoread
  set hidden
  set wildmenu

" Swap file, as in previous instance, saved to an special dir
  set directory=$HOME/.config/nvim/swp//
" No backup file, write to the same file directly
  set nobackup
  set nowb
" Persistent change history
  set undofile
  set undodir=$HOME/.config/nvim/undodir

" Center next/prev search result
  nnoremap n nzz
  nnoremap N Nzz

" Shortcutting split navigation, saving a keypress:
  noremap <C-h> <C-w>h
  noremap <C-j> <C-w>j
  noremap <C-k> <C-w>k
  noremap <C-l> <C-w>l
" Previous/next buffer shortcut
  noremap <leader>k :bprev<CR>
  noremap <leader>j :bnext<CR>
" Move up or down a selection of text
  vnoremap <leader>. :m '<-2<CR>gv=gv
  vnoremap <leader>, :m '>+1<CR>gv=gv

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Easier shortcuts for working with system clipboard
  vnoremap <leader>y "+y
  vnoremap <leader>p "+p
  vnoremap <leader>d "+d
  vnoremap <leader>P "+P
  nnoremap <leader>P "+P
  nnoremap <leader>p "+p

" Clean highlight shortcut
  nnoremap <silent> ,/ :nohlsearch<CR>

  set shell
  set confirm

" NerdTREE
  noremap <leader>n :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  if has('nvim')
      let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
  else
      let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
  endif

" Automatically deletes all trailing whitespace and newlines at end of file on save.
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Gruv color scheme
  let g:gruvbox_italic=1
  set background=dark " Setting light mode
  let g:gruvbox_contrast_light='soft'
  autocmd vimenter * ++nested colorscheme gruvbox

" VimTex options
  let g:vimtex_view_general_viewer = 'zathura'
  " let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
