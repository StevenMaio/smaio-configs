"{{{ _Vundle_Jazz_

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin()

" let Vundle manage Vundle, required
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'andymass/vim-matchup'
Plug 'RRethy/vim-illuminate'
Plug 'lervag/vimtex'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/utl.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'girishji/vimcomplete'
Plug 'girishji/scope.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

"}}}
"{{{ _Plugin_Settings_

let g:netrw_list_hide = '.*\.swp$'

"{{{ NERDTre settings

let NERDTreeIgnore = ['\.pyc$', '\.png$']  " use this to ignore files in NERDTree

"}}}
"{{{ Emmit configuration settings

let g:user_emmet_leader_key='``' " Edit emmit leader key
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall

"}}}
"{{{ UltiSnips settings

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips" , $HOME."/.smaio-configs/mysnippets/"]
let g:UltiSnipsEditSplit="vertical"

"}}}
"{{{ vim-illuminate settings

let g:Illuminate_delay = 100
let g:Illuminate_highlightUnderCursor = 1

"}}}
"{{{ vimtex settings

let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0

set conceallevel=2

call vimtex#imaps#add_map({
    \ 'lhs': 'b',
    \ 'rhs': '\bm',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
call vimtex#imaps#add_map({
    \ 'lhs': "'",
    \ 'rhs': '\prime',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})

" bars, tilde, hat, vec?
call vimtex#imaps#add_map({
    \ 'lhs': "o",
    \ 'rhs': '\bar',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
call vimtex#imaps#add_map({
    \ 'lhs': "wo",
    \ 'rhs': '\overline',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
call vimtex#imaps#add_map({
    \ 'lhs': "t",
    \ 'rhs': '\tilde',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
call vimtex#imaps#add_map({
    \ 'lhs': "wt",
    \ 'rhs': '\widetilde',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
call vimtex#imaps#add_map({
    \ 'lhs': "h",
    \ 'rhs': '\hat',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
call vimtex#imaps#add_map({
    \ 'lhs': "wh",
    \ 'rhs': '\widehat',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
call vimtex#imaps#add_map({
    \ 'lhs': "v",
    \ 'rhs': '\vec',
    \ 'leader': '#',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})

"}}}
"{{{ EditorConfig stuff

" Custom Hooks
function! FiletypeHook(config)
if has_key(a:config, 'vim_filetype')
    let &filetype = a:config['vim_filetype']
endif
return 0   " Return 0 to show no error happened
endfunction

" Add all of the hooks
call editorconfig#AddNewHook(function('FiletypeHook'))

"}}}
"{{{ vim-notes configuration

let g:notes_suffix = ".vnote" "Add a suffix to notes
let g:notes_directories = ['~/Documents/Notes']

"}}}
"{{{ Utl

let g:utl_cfg_hdl_mt_application_pdf = ':silent !zathura %p &'

"}}}

"}}}
"{{{ _General_Settings_

set belloff=all
set tabstop=4
set sw=4
set softtabstop=4
set expandtab
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
set number
set rnu
syntax on

" Highlight settings
"hi Cursor guifg=white guibg=black
hi Search guibg=LightBlue guifg=#ffffff ctermbg=yellow ctermfg=black
hi Visual guifg=#000000 guibg=#ffffff gui=none ctermfg=black ctermbg=white
"hi CursorLine ctermbg=black cterm=None
"hi CursorColumn ctermbg=black

color peachpuff
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Set leader key (type <leader> to use it)
let mapleader = "-"
let maplocalleader = "\\"

" grep ignore
set wildignore +=**.pyc

"}}} END: General_Settings
"{{{ _Macros_

" Toggles the highlights on search results
nnoremap <silent> <Space> :if &hlsearch<CR>set nohlsearch<CR>else<CR>set hlsearch<CR>endif<cr>
" Turns on hightlight search before starting another search
nnoremap / :set hlsearch<CR>/

" Leader key macros
" Quickly open my _vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
" Quickly source _vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Source the script.vim at root
nnoremap <leader>ss :call MySourceScriptDotVim()<cr>
" Source current file
nnoremap <leader>so :source %<cr>
" quickly closes the current tab TODO: change 
nnoremap <leader>ct :call ToggleVimComplete()<cr>
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
" copy the current selection to the system clipboard
vnoremap <leader>c "+y

" Macros to remap the insert mode complete commands
inoremap  

" maps agbarToggle
nnoremap <leader>tt :TagbarToggle<CR>

" Calls utl (will open a link)
nnoremap <leader>oo :Utl<cr>

"}}}
"{{{ _Functions_

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

"}}} END: Functions
"{{{ _Abbreviations_ 

iabbrev @@ stevenmaio.321@gmail.com
iabbrev adn and

"}}} END: Abbreviations
"{{{ _File_Settings_

" Python Settings
augroup filetype_python
	" Shortcut for adding pdb to code
	autocmd FileType python nnoremap <silent> <buffer> <localleader>pdb Oimport pdb; pdb.set_trace()<esc>
augroup END

" Indentation settings for XML, HTML, and Pug files
augroup filetype_html_pug_xml
	autocmd!
	autocmd FileType html,pug,xml setlocal tabstop=2
	autocmd FileType html,pug,xml setlocal softtabstop=2
	autocmd FileType html,pug,xml setlocal sw=2
augroup END

"}}} END: File_Settings
"{{{ VimComplete Stuff

let g:vimcomplete_enabled = 1

function! ToggleVimComplete()
    if g:vimcomplete_enabled == 1
        VimCompleteDisable
        let g:vimcomplete_enabled = 0
    else
        VimCompleteEnable
        let g:vimcomplete_enabled = 1
    endif
endfunction
"}}}
