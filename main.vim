"    Sections:
"       _Vundle_Jazz_
"       _Plugin_Settings_
"       _General_Settings_
"       _Macros_
"       _Functions_
"       _Abbreviations_
"       _File_Settings_
"       _Other_

"""""""""""""""""""""
" _Vundle_Jazz_ "
"""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'andymass/vim-matchup'
Plugin 'RRethy/vim-illuminate'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'lervag/vimtex'
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips" , $HOME."/.smaio-configs/mysnippets/"]
let g:UltiSnipsEditSplit="vertical"

" vim-illuminate settings
let g:Illuminate_delay = 100
let g:Illuminate_highlightUnderCursor = 1

" vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" EditorConfig stuff
function! FiletypeHook(config)
    if has_key(a:config, 'vim_filetype')
        let &filetype = a:config['vim_filetype']
    endif
    return 0   " Return 0 to show no error happened
endfunction

" add a the filetype hook
call editorconfig#AddNewHook(function('FiletypeHook'))

""""""""""""""""""""""
" _General_Settings_ "
""""""""""""""""""""""

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
set wrap
set linebreak
set cursorcolumn
set cursorline
syntax on

" Highlight settings
hi Cursor guifg=white guibg=black
hi Search guibg=LightBlue guifg=#ffffff ctermbg=yellow ctermfg=black
hi Visual guifg=#000000 guibg=#ffffff gui=none ctermfg=black ctermbg=white
hi CursorLine ctermbg=black cterm=None
hi CursorColumn ctermbg=black
 
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
nnoremap <leader>ev :edit $MYVIMRC<cr>
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

" Macros to remap the insert mode complete commands
inoremap  

" Windows specific settings
if has("win32")
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
augroup END

" Java and JavaScript (they're pretty similar)
augroup filetype_java
augroup END

augroup filetype_c
augroup END

" Latex settings
augroup filetype_latex
augroup END

" Plaintext settings
augroup filetype_plaintext
augroup END

" Indentation settings for XML, HTML, and Pug files
augroup filetype_html_pug_xml
	autocmd!
	autocmd FileType html,pug,xml setlocal tabstop=2
	autocmd FileType html,pug,xml setlocal softtabstop=2
	autocmd FileType html,pug,xml setlocal sw=2
augroup END

" YML Settings
augroup filetype_yaml
augroup END

" Matlab Settings
augroup filetype_matlab
augroup END

" vim settings
augroup filetype_vim
augroup END

" gitcommit Settings
augroup filetype_gitcommit
   " NOTE: Nothing is really going on here
augroup END

" Markdown files
augroup filetype_markdown
augroup END

"""""""""""
" _Other_ "
"""""""""""
