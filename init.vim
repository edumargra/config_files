" Install vim-plug if not found
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
" Plugins
  call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'jreybert/vimagit'
  Plug 'tpope/vim-fugitive'
  Plug 'jiangmiao/auto-pairs'
  Plug 'plasticboy/vim-markdown'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'lervag/vimtex'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  call plug#end()

  let mapleader ="\<Space>"

" Basic options
  set backspace=indent,eol,start
  set nocompatible
  set autoindent
  set ruler
  set showmode
  syntax enable
  filetype plugin indent on
  set number
  set relativenumber
  set splitbelow splitright
  set conceallevel=2
  set autoread
  set hidden
  set confirm

" Tab formating
  set shiftwidth=2  " Two space indents
  set tabstop=2     " Tab key indents two spaces at a time
  set expandtab     " Use spaces when the <Tab> key is pressed
  set list
  set listchars=tab:>·,trail:·

" Show changes with respect to the original file
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \  | wincmd p | diffthis

" Search options
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase

" Spell-check
  map <leader>o :setlocal spell! spelllang=en_us<CR>

" command autocompletion
  set showcmd
  set wildmenu
  set wildmode=longest,list,full

" Swap file, as in previous instance, saved to an special dir
  set directory=$HOME/.config/nvim/swp//

" No backup file, write to the same file directly
  set nobackup
  set nowb

" Persistent change history
  set history=1000
  set undofile
  set undodir=$HOME/.config/nvim/undodir

" Leave margins, nice breakline
  set linebreak
  set scrolloff=3
  set sidescrolloff=5

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

" NerdTREE
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  if has('nvim')
      let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
  else
      let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
  endif
  let g:NERDTreeShowLineNumbers=1
  " Close the tab if NERDTree is the only window remaining in it.
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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

" shortcuts
  nnoremap <leader>t :$tabnew<CR>
  nnoremap <leader>s :Files<CR>
  if !empty(glob('/home/edu'))
    nnoremap <leader>h :Files /home/edu/<CR>
  else
    nnoremap <leader>h :Files /home/eduard/<CR>
  endif
  noremap <leader>n :NERDTreeToggle<CR>

" fzf
 let g:rooter_patterns = ['.git']

" Coc
  autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
  "tab to complete
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)
