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
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>		" Turns off the highlights on search results
inoremap jk <esc>h " returns to normal mode
inoremap <c-u> <esc>viwU	" capitalizes the current word
nnoremap <c-u> viwU<esc>e	" capitalizes the current word
nnoremap <c-e> 5<c-e>	" Makes <c-e> move sligthly faster
nnoremap <c-y> 5<c-y>	" Makes <c-e> move sligthly faster

" Leader key macros
noremap <leader>ev :vsplit<cr>:execute "edit ".g:main_location<cr> " Quickl open my _vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> " Quickly source _vimrc
nnoremap <leader>ic :set ignorecase! <cr> :set smartcase! <cr> " Toggle smart case
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel " wraps the current word in double quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel " wraps the current word in single quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc> " wraps the selected block in double quotes
cnoremap <leader>' <esc>`<i'<esc>`>la'<esc> " wraps the selected block in single quotes
nnoremap <leader>nt :NERDTree<cr>			" Open Nerd Tree

" Abbreviations
iabbrev @@ stevenmaio.321@gmail.com		" My email
iabbrev adn and

" Python auto commands
augroup filetype_python
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
