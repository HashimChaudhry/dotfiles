set tabstop=4
set smarttab
set autoindent
set shiftwidth=4
set number
set backupcopy=yes
set noundofile
filetype plugin indent on
syntax on

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
