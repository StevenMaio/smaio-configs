"    Sections:
"       _Plugin_Settings_
"       _General_Settings_
"       _Macros_
"       _Functions_
"       _Abbreviations_
"       _File_Settings_
"       _Other_

"""""""""""""""""""""
" _Plugin_Settings_ "
"""""""""""""""""""""

let g:netrw_list_hide = '.*\.swp$'

" NERDTre settings
let NERDTreeIgnore = ['\.pyc$', '\.png$']  " use this to ignore files in NERDTree

" Emmit configuration settings
let g:user_emmet_leader_key='``' " Edit emmit leader key
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips" , $HOME."Documents/Projects/smaio-vim/mysnippets/"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""
" _General_Settings_ "
""""""""""""""""""""""

set belloff=all
set tabstop=3
set sw=3
set softtabstop=3
set expandtab
set number
set foldenable
set wildmenu
set showmatch
set autoindent
set backspace=indent,eol,start
set ruler
set incsearch
set showcmd
set ignorecase
set smartcase
set foldmethod=marker
set hlsearch
set scroll=5
set splitbelow
set splitright
syntax on

" GUI specific settings
if has("gui_running")
    set cursorline
    set cursorcolumn
    colorscheme desert
    set guioptions-=Tm
else
    set nocursorline
    colorscheme elflord
    set nocursorcolumn
endif

" Highlight settings
hi Cursor guifg=white guibg=black
hi Search guibg=LightBlue guifg=#ffffff ctermbg=yellow ctermfg=black
hi Visual guifg=#000000 guibg=#ffffff gui=none ctermfg=black ctermbg=white
hi CursorLine cterm=None ctermbg=red
hi CursorColumn ctermbg=red
 
" Set leader key (type <leader> to use it)
let mapleader = "-"
let maplocalleader = "\\"

" grep ignore
set wildignore +=**.pyc

""""""""""""
" _Macros_ "
""""""""""""

" Turns off the highlights on search results
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" returns to normal mode
inoremap jk <esc>
inoremap JK <esc>

" Leader key macros
" Quickly open my _vimrc
nnoremap <leader>ev :vsplit<cr>:execute "edit ".g:main_location<cr>
" Quickly source _vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Source the script.vim at root
nnoremap <leader>ss :call MySourceScriptDotVim()<cr>
" Source current file
nnoremap <leader>so :source %<cr>
" quickly closes the current tab
nnoremap <leader>tc :tabclose<cr>
" Toggle smart case
nnoremap <leader>ic :set ignorecase! <cr> :set smartcase! <cr>
" wraps the current word in whatever ` is
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel
" wraps the selected block in double quotes
vnoremap <leader>` <esc>`<i`<esc>`>la`<esc>
" wraps the current word in single quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" wraps the current word in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" wraps the selected block in double quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
" wraps the selected block in single quotes
cnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
" Open Nerd Tree
nnoremap <leader>nt :NERDTree<cr>:set number<cr>
" capitalizes the current word (only works in insert mode)
inoremap <c-u> <esc>viwU<esc>ea
" have c-e move faster in normal mode
nnoremap <c-e> 5<c-e>
" have c-y move faster in normal mode
nnoremap <c-y> 5<c-y>
" have c-e move faster in visual mode
vnoremap <c-e> 5<c-e>

" opens terminal below and sets the vertical height to be 10 lines
" I'm sorry for the really long expression :(
nnoremap <leader>ot :terminal <cr><c-W>k:execute "resize ".(2*getwininfo(win_getid())[0]['height'] - 10)<cr>:echo<cr><c-W>j
" Opens a small split window for script.vim
nnoremap <leader>os :split<cr>:e script.vim<cr>:execute "resize 10"<cr>:echo<cr><c-W>j
" copy the current selection to the system clipboard
vnoremap <leader>c "+y

" Windows specific settings
if has("win32")
   set shell=powershell
   set shellcmdflag=-command
endif

"""""""""""""""
" _Functions_ "
"""""""""""""""

" Creates a side window and syncs up the cursors and scrolling
function! MyCreateSyncedWindow()
   wincmd l
   setlocal cursorbind
   setlocal scrollbind
   setlocal nonumber
   setlocal nocursorcolumn
   " Set new commands for the buffer?
"   inoremap <silent> <buffer> <ENTER> <ENTER><esc><c-w>lki<ENTER><esc><c-w>hi
   vertical resize 20
   wincmd h
   setlocal cursorbind
   setlocal nocursorcolumn
   setlocal scrollbind
endfunction

" Creates a directory of vim scripts and creates a new vim script
" indexed from 0
function! MyCreateVimScripts()
   if isdirectory("vim_scripts") == 0
      call mkdir("vim_scripts")
      echo "Making vim_scripts directory"
   endif
   let i = 0
   let filename = ""
   while i < 5
      let filename = "vim_scripts/script_".i.".vim"
      if filereadable(filename) == 0
         break
      endif
      let i += 1
   endwhile
   " Open the new file for editing
   execute "edit ".filename
endfunction

function! MySourceScriptDotVim()
   if filereadable("script.vim")
      execute "source script.vim"
   endif
endfunction

" This is the prototype for making comments
function! MyAddComment(comment)
   let l:col_no = getcurpos()[2] + len(a:comment)
   execute "normal! 0i".a:comment
   execute "normal! ".l:col_no."|"
endfunction

function! MyRemoveComment(comment)
   let l:length = len(a:comment)
   let l:col_no = getcurpos()[2] - l:length
   execute "normal! ^"
   for i in range(l:length)
      normal! x
   endfor
   execute "normal! ".l:col_no."|"
endfunction

function! MyBlockComment(comment)
    let l:line_no = getcurpos()[1]
    let l:col_no = getcurpos()[2]
    execute "normal! '<"
    let l:first_line_no = getcurpos()[1]
    execute "normal! '>"
    let l:last_line_no = getcurpos()[1]
    echom l:first_line_no.",".l:last_line_no
    if l:last_line_no == l:first_line_no
        call MyAddComment(a:comment)
    else
        execute ":'<,'>call MyAddComment('".a:comment."')"
    endif
endfunction

function! MyRemoveBlockComment(comment)
    let l:line_no = getcurpos()[1]
    let l:col_no = getcurpos()[2]
    execute "normal! '<"
    let l:first_line_no = getcurpos()[1]
    execute "normal! '>"
    let l:last_line_no = getcurpos()[1]
    echom l:first_line_no.",".l:last_line_no
    if l:last_line_no == l:first_line_no
        call MyAddComment(a:comment)
    else
        execute ":'<,'>call MyRemoveComment('".a:comment."')"
    endif
    execute "normal! ".l:line_no."G"
    execute "normal! ".l:col_no."|"
endfunction

function! MyWrapComment(commentOpen, commentEnd)
   let l:col_no = getcurpos()[2] + len(a:commentOpen)
   execute "normal! I".a:commentOpen." "
   execute "normal! A ".a:commentEnd
   execute "normal! ".l:col_no."|"
endfunction

function! MyRemoveWrapComment(commentOpen, commentEnd)
   let l:col_no = getcurpos()[2] - len(a:commentOpen)
   " Remove the comment opener at the beginning
   execute "normal! ^"
   for i in range(len(a:commentOpen) + 1)
      normal! x
   endfor
   execute "normal! g_"
   for i in range(len(a:commentEnd) + 1)
      normal! x
   endfor
   execute "normal! ".l:col_no."|"
endfunction

function! MyBlockWrapComment(commentOpen, commentEnd)
    let l:line_no = getcurpos()[1]
    let l:col_no = getcurpos()[2]
    execute "normal! '<I".a:commentOpen." "
    execute "normal! '>A ".a:commentEnd
    execute "normal! ".l:line_no."G"
    execute "normal! ".l:col_no."|"
endfunction

function! MyRemoveBlockWrapComment(commentOpen, commentEnd)
   let l:line_no = getcurpos()[1]
   let l:col_no = getcurpos()[2] - len(a:commentOpen)
   " Remove the comment opener at the beginning
   execute "normal! '<^"
   for i in range(len(a:commentOpen) + 1)
      normal! x
   endfor
   execute "normal! '>g_"
   for i in range(len(a:commentEnd) + 1)
      normal! x
   endfor
   execute "normal! ".l:line_no."G"
   execute "normal! ".l:col_no."|"
endfunction

"""""""""""""""""""
" _Abbreviations_ "
"""""""""""""""""""

iabbrev @@ stevenmaio.321@gmail.com
iabbrev adn and

"""""""""""""""""""
" _File_Settings_ "
"""""""""""""""""""

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

augroup filetype_c
	autocmd FileType c,cpp nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment("//")<cr>
	autocmd FileType c,cpp nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment("//")<cr>
	autocmd FileType c,cpp vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment("//")<cr>
	autocmd FileType c,cpp vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment("//")<cr>
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
	autocmd FileType html nnoremap <silent> <buffer> <leader>/ <esc>:call MyWrapComment("<!--", "-->")<cr>
	autocmd FileType html nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveWrapComment("<!--", "-->")<cr>
	autocmd FileType html vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockWrapComment("<!--", "-->")<cr>
	autocmd FileType html vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockWrapComment("<!--", "-->")<cr>
augroup END

" Pug Settings
augroup filetype_pug
	autocmd!
	autocmd FileType pug setlocal tabstop=2
	autocmd FileType pug setlocal softtabstop=2
	autocmd FileType pug setlocal sw=2
	autocmd FileType pug nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment("#")<cr>
	autocmd FileType pug nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment("#")<cr>
	autocmd FileType pug vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment("#")<cr>
	autocmd FileType pug vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment("#")<cr>
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

" Matlab Settings
augroup filetype_matlab
	autocmd FileType matlab nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment("%")<cr>
	autocmd FileType matlab nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment("%")<cr>
	autocmd FileType matlab vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment("%")<cr>
	autocmd FileType matlab vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment("%")<cr>
augroup END

" vim settings
augroup filetype_vim
	autocmd FileType vim nnoremap <silent> <buffer> <leader>/ <esc>:call MyAddComment('" ')<cr>
	autocmd FileType vim nnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveComment('" ')<cr>
	autocmd FileType vim vnoremap <silent> <buffer> <leader>/ <esc>:call MyBlockComment('" ')<cr>
	autocmd FileType vim vnoremap <silent> <buffer> <leader>? <esc>:call MyRemoveBlockComment('" ')<cr>
augroup END

" gitcommit Settings
augroup filetype_gitcommit
   " Add spell check to the file
	autocmd FileType gitcommit setlocal spell
augroup END

" Markdown files
augroup filetype_markdown
augroup END

"""""""""""
" _Other_ "
"""""""""""
