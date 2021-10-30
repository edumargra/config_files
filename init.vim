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
  Plug 'tpope/vim-eunuch'
  Plug 'morhetz/gruvbox'
  call plug#end()

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

  set noswapfile
  set nobackup
  set nowb
  set shell
  set confirm

" NerdTREE
  map <leader>n :NERDTreeToggle<CR>
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
