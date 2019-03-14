" NERDTre settings
let NERDTreeIgnore = ['\.pyc$']  " use this to ignore files in NERDTree

" Emmit configuration settings
let g:user_emmet_leader_key='``' " Edit emmit leader key
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall

" General settings
set belloff=all
set tabstop=4
set sw=4
set softtabstop=4
set number
set foldenable
set wildmenu
set showmatch
set autoindent
set backspace=indent,eol,start
set cursorline
set ruler
set incsearch
set showcmd
set ignorecase
set smartcase
set foldmethod=marker
set hlsearch
syntax on

" Search settings
hi Search guibg=LightBlue
hi Visual guifg=#ffffff guibg=#000000 gui=none
 
" Set leader key (type <leader> to use it)
let mapleader = "-"
let maplocalleader = "\\"

" Macros
" Turns off the highlights on search results
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" returns to normal mode
inoremap jk <esc>h
inoremap JK <esc>h
" capitalizes the current word
inoremap <c-u> <esc>viwU<esc>ea
" capitalizes the current word
nnoremap <c-u> viwU<esc>e
" Makes <c-e> move sligthly faster
nnoremap <c-e> 5<c-e>
" Makes <c-e> move sligthly faster
nnoremap <c-y> 5<c-y>

" Leader key macros

" Quickl open my _vimrc
noremap <leader>ev :vsplit<cr>:execute "edit ".g:main_location<cr>
" Quickly source _vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Toggle smart case
nnoremap <leader>ic :set ignorecase! <cr> :set smartcase! <cr>
" wraps the current word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" wraps the current word in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" wraps the selected block in double quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
" wraps the selected block in single quotes
cnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
" Open Nerd Tree
nnoremap <leader>nt :NERDTree<cr>

" Abbreviations
iabbrev @@ stevenmaio.321@gmail.com
iabbrev adn and

" Python auto commands
augroup filetype_python
	" Shortcut for adding pdb to code
	autocmd FileType python nnoremap <buffer> <localleader>pdb Oimport pdb; pdb.set_trace()<esc>
augroup END

" Latex settings
autocmd FileType latex setlocal spell

" HTML Settings
augroup filetype_html
	autocmd!
	autocmd FileType html setlocal tabstop=2
	autocmd FileType html setlocal softtabstop=2
	autocmd FileType html setlocal sw=2
	autocmd FileType html setlocal expandtab
augroup END
