" NERDTre settings
let NERDTreeIgnore = ['\.pyc$']  " use this to ignore files in NERDTree

" Emmit configuration settings
let g:user_emmet_leader_key='``' " Edit emmit leader key
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips" , $HOME."/projects/smaio-vim/mysnippets/"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""
" General Settings "
""""""""""""""""""""

set belloff=all
set tabstop=4
set sw=4
set softtabstop=4
set expandtab
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

""""""""""
" Macros "
""""""""""

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
" Quickly open my _vimrc
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

"""""""""""""
" Functions "
"""""""""""""

" This is the prototype for making comments
function! MyAddComment(comment)
   let l:col_no = getcurpos()[2] + len(a:comment)
   execute "normal 0i".a:comment
   execute "normal ".l:col_no."|"
endfunction

function! MyRemoveComment(comment)
   let l:length = len(a:comment)
   let l:col_no = getcurpos()[2] - l:length
   execute "normal ^"
   for i in range(l:length)
      normal x
   endfor
   execute "normal ".l:col_no."|"
endfunction

function! MyBlockComment(comment)
    let l:line_no = getcurpos()[1]
    let l:col_no = getcurpos()[2]
    execute "normal '<"
    let l:first_line_no = getcurpos()[1]
    execute "normal '>"
    let l:last_line_no = getcurpos()[1]
    echom l:first_line_no.",".l:last_line_no
    if l:last_line_no == l:first_line_no
        call MyAddComment(a:comment)
    else
        execute ":'<,'>call MyAddComment(\"".a:comment."\")"
    endif
endfunction

function! MyRemoveBlockComment(comment)
    let l:line_no = getcurpos()[1]
    let l:col_no = getcurpos()[2]
    execute "normal '<"
    let l:first_line_no = getcurpos()[1]
    execute "normal '>"
    let l:last_line_no = getcurpos()[1]
    echom l:first_line_no.",".l:last_line_no
    if l:last_line_no == l:first_line_no
        call MyAddComment(a:comment)
    else
        execute ":'<,'>call MyRemoveComment(\"".a:comment."\")"
    endif
    execute "normal ".l:line_no."G"
    execute "normal ".l:col_no."|"
endfunction

function! MyWrapComment(commentOpen, commentEnd)
   let l:col_no = getcurpos()[2] + len(a:commentOpen)
   execute "normal I".a:commentOpen." "
   execute "normal A ".a:commentEnd
   execute "normal ".l:col_no."|"
endfunction

function! MyRemoveWrapComment(commentOpen, commentEnd)
   let l:col_no = getcurpos()[2] - len(a:commentOpen)
   " Remove the comment opener at the beginning
   execute "normal ^"
   for i in range(len(a:commentOpen) + 1)
      normal x
   endfor
   execute "normal g_"
   for i in range(len(a:commentEnd) + 1)
      normal x
   endfor
   execute "normal ".l:col_no."|"
endfunction

function! MyBlockWrapComment(commentOpen, commentEnd)
    let l:line_no = getcurpos()[1]
    let l:col_no = getcurpos()[2]
    execute "normal '<I".a:commentOpen." "
    execute "normal '>A ".a:commentEnd
    execute "normal ".l:line_no."G"
    execute "normal ".l:col_no."|"
endfunction

function! MyRemoveBlockWrapComment(commentOpen, commentEnd)
   let l:line_no = getcurpos()[1]
   let l:col_no = getcurpos()[2] - len(a:commentOpen)
   " Remove the comment opener at the beginning
   execute "normal '<^"
   for i in range(len(a:commentOpen) + 1)
      normal x
   endfor
   execute "normal '>g_"
   for i in range(len(a:commentEnd) + 1)
      normal x
   endfor
   execute "normal ".l:line_no."G"
   execute "normal ".l:col_no."|"
endfunction

"""""""""""""""""
" Abbreviations "
"""""""""""""""""

iabbrev @@ stevenmaio.321@gmail.com
iabbrev adn and

"""""""""""""""""
" File Settings "
"""""""""""""""""

" Python Settings
augroup filetype_python
	" Shortcut for adding pdb to code
	autocmd FileType python nnoremap <silent> <buffer> <localleader>pdb Oimport pdb; pdb.set_trace()<esc>
	autocmd FileType python nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment("#")<cr>
	autocmd FileType python nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment("#")<cr>
	autocmd FileType python vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment("#")<cr>
	autocmd FileType python vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment("#")<cr>
augroup END

" Java and JavaScript (they're pretty similar)
augroup filetype_java
	autocmd FileType java,javascript nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment("//")<cr>
	autocmd FileType java,javascript nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment("//")<cr>
	autocmd FileType java,javascript vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment("//")<cr>
	autocmd FileType java,javascript vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment("//")<cr>
augroup END

" Latex settings
augroup filetype_latex
	autocmd FileType tex setlocal spell
	autocmd FileType tex nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment("%")<cr>
	autocmd FileType tex nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment("%")<cr>
	autocmd FileType tex vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment("%")<cr>
	autocmd FileType tex vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment("%")<cr>
augroup END

" Plaintext settings
augroup filetype_plaintext
   autocmd FileType text setlocal nowrap
   autocmd FileType text setlocal spell
augroup END

" HTML Settings
augroup filetype_html
	autocmd!
	autocmd FileType html setlocal tabstop=2
	autocmd FileType html setlocal softtabstop=2
	autocmd FileType html setlocal sw=2
	autocmd FileType html setlocal expandtab
	autocmd FileType html nnoremap <silent> <buffer> <leader>/ <esc>:call MyWrapComment("<!--", "-->")<cr>
	autocmd FileType html nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveWrapComment("<!--", "-->")<cr>
	autocmd FileType html vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockWrapComment("<!--", "-->")<cr>
	autocmd FileType html vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockWrapComment("<!--", "-->")<cr>
augroup END

" XML Settings
augroup filetype_xml
   autocmd!
	autocmd FileType xml nnoremap <silent> <buffer> <leader>/ <esc>:call MyWrapComment("<!--", "-->")<cr>
	autocmd FileType xml nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveWrapComment("<!--", "-->")<cr>
	autocmd FileType xml vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockWrapComment("<!--", "-->")<cr>
	autocmd FileType xml vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockWrapComment("<!--", "-->")<cr>
augroup END

" YML Settings
augroup filetype_yaml
	autocmd FileType yaml nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment("#")<cr>
	autocmd FileType yaml nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment("#")<cr>
	autocmd FileType yaml vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment("#")<cr>
	autocmd FileType yaml vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment("#")<cr>
augroup END

" gitcommit Settings
augroup filetype_gitcommit
   " Add spell check to the file
	autocmd FileType gitcommit setlocal spell
augroup END

" Add local settings if one exists in cwd
if filereadable(".vimrc")
   execute "source .vimrc"
endif
