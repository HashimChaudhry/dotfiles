set tabstop=4
set smarttab
set autoindent
set shiftwidth=4
set number
set backupcopy=yes
set noundofile
filetype plugin indent on
syntax on
set showcmd

call plug#begin()
    Plug 'Raimondi/delimitMate'
    Plug 'alvan/vim-closetag'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'lervag/vimtex'
    Plug 'SirVer/ultisnips'
	Plug 'dracula/vim', {'name': 'dracula'}
	Plug 'preservim/nerdtree'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'dense-analysis/ale'
	Plug 'neoclide/coc.nvim'
call plug#end()

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" Vimtex plugins
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0
let g:tex_flavor='latex'
set conceallevel=1

" Color scheme for Vim
set t_Co=256
set termguicolors
" let g:airline_theme='onehalfdark'
set cursorline

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
colorscheme tokyonight

" colorscheme dracula 

highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE

" Ultisnips directory
set rtp+=~/.vim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', "CurrentCourse"]

" Other options
set modeline

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Linting
let g:ale_enabled = 1

" Linter config
let g:ale_linters = {  
\	'python': ['flake8'], 
\ 	'cpp': ['clangtidy', 'clangd'],
\}

" Display errors and warnings
let g:ale_set_signs = 1
let g:ale_set_highlights = 1

" Lint while editing
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_save = 1

" ==============================
" CoC Autocomplete
" ==============================

" Enable filetype detection
filetype plugin indent on

" Show autocomplete menu
set completeopt=menuone,noselect

" Show partially typed Vim commands
set showcmd

" Always show status bar
set laststatus=2

" Enable syntax highlighting
syntax on

" Tab selects next suggestion
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

" Shift+Tab selects previous suggestion
inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter confirms autocomplete suggestion
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Show documentation with K
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Find references
nmap <silent> gr <Plug>(coc-references)

" Rename symbol
nmap <silent> <leader>rn <Plug>(coc-rename)
