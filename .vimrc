set nocompatible              "46 down
filetype off
"set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"keeping this for updating vundle itself (:PluginUpdate)
Plugin 'gmarik/Vundle.vim'

"rest of the packages
Plugin 'CSApprox'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'a.vim'
Plugin 'tyok/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/AfterColors.vim'
Plugin 'Shougo/echodoc.vim'

call vundle#end()
filetype plugin indent on

"gui options
set guioptions+=c
set guioptions+=R
set guioptions-=m
set guioptions-=r
set guioptions-=b
set guioptions-=T
set guioptions-=R
set guioptions-=L
set guioptions-=e

set hlsearch

if has("gui_running")
    set lines=999 columns=999
endif
"set guicursor=a:blinkon0 "slow down blinking speed of cursor
	"remapping some symbols
    inoremap ' =
    inoremap < {
    inoremap > }
    inoremap : -
    inoremap " >
    inoremap <C-m> :
    inoremap <C-A-j> (
    inoremap <C-A-k> )
    inoremap <C-A-i> [
    inoremap <C-A-o> ]
    inoremap <C-A-p> !
    inoremap <C-A-u> '
    inoremap <C-A-l> +
    inoremap <A-j> <
    inoremap <A-k> >
    inoremap <C-l> _
    inoremap <C-k> *
    inoremap <C-o> "
    inoremap <C-d> %
    inoremap <C-e> &
    inoremap � <
    inoremap � >
    inoremap ( #
    inoremap � \|
    inoremap � ~
    cnoremap ' =
    cnoremap < {
    cnoremap > }
    cnoremap : -
    cnoremap " >
    cnoremap <C-m> :
    cnoremap <C-A-j> (
    cnoremap <C-A-k> )
    cnoremap <C-A-i> [
    cnoremap <C-A-o> ]
    cnoremap <C-A-p> !
    cnoremap <C-A-u> '
    cnoremap <C-A-l> +
    cnoremap <C-l> _
    cnoremap <C-k> *
    cnoremap <C-o> "
    cnoremap <C-d> %
    cnoremap <C-e> &
    cnoremap <A-j> <
    cnoremap <A-k> >
    cnoremap ( #
    cnoremap � \|
    cnoremap � ~
    noremap ' =
    noremap < {
    noremap > }
    noremap : -
    noremap " >
    noremap <C-m> :
    noremap <C-A-j> (
    noremap <C-A-k> )
    noremap <C-A-i> [
    noremap <C-A-o> ]
    noremap <C-A-p> !
    noremap <C-A-u> '
    noremap <C-A-l> +
    noremap <C-l> _
    noremap <C-k> *
    "noremap <C-o> "
    noremap <C-d> %
    " noremap <C-e> &
    noremap <A-j> <
    noremap <A-k> >
    inoremap ( #
    noremap � \|
    noremap � ~

"remapping numbers
    cnoremap 1 6
    cnoremap 3 0
    cnoremap 5 8
    cnoremap 0 5
    cnoremap 9 3
    cnoremap 8 1
    cnoremap 6 9
    noremap 8 1
    noremap 0 5
    noremap 1 6
    noremap 3 0
    noremap 5 8
    noremap 9 3
    noremap 6 9
    inoremap 1 6
    inoremap 3 0
    inoremap 5 8
    inoremap 0 5
    inoremap 9 3
    inoremap 8 1
    inoremap 6 9

au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

"switch windows quick
":nmap <silent> <C-h> :wincmd h<CR>
":nmap <silent> <C-l> :wincmd l<CR>
":nmap <silent> <C-j> :wincmd j<CR>
":nmap <silent> <C-k> :wincmd k<CR>

filetype plugin indent on

"NERDTree will ignore executable files
function! NERDTreeCustomIgnoreFilter(path)
        return a:path.isExecutable
    endfunction

" set number
set t_Co=256
colorscheme relaxedgreen
" colorscheme heliotrope
" set background=light
syntax on

"tab = 8 spaces
" set nowrap
set smartindent
set tabstop=8
set ts=8
set shiftwidth=8
set expandtab

"disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"use (,) instead of (\) as leader, better for things like nerdcommenter
let mapleader=','
let g:slimv_leader='m'
set ignorecase
set gfn=Monospace\ 15
let g:ycm_collect_identifiers_from_tags_files = 1

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

"last pos when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list=1

set autochdir
let NERDTreeChDirMode=2
"easymotion use leader once
map <Leader> <Plug>(easymotion-prefix)
" easymotion colors
" hi link EasyMotionTarget Search
" hi link EasyMotionTarget2First Search
" hi link EasyMotionTarget2Second Search
" hi link EasyMotionShade Comment

"ultisnips mapping
let g:UltiSnipsExpandTrigger = "<a-i>"
let g:UltiSnipsJumpForwardTrigger = "<a-o>"
let g:UltiSnipsJumpBackwardTrigger = "<a-l>"

let NERDSpaceDelims = 1

" youcompleteme mappings
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>z :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>x :YcmCompleter GetType<CR>


" autocmd BufWritePost * :syntax on

"if has("multi_byte")
	" set encoding=utf-8
        " setglobal fileencoding=utf-8
        " set fileencodings=utf-8
        " setglobal bomb
"endif

" turn off errorbells
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" experimental
let g:cpp_class_scope_highlight = 1
" There are two ways to hightlight template functions. Either
" ```vim
let g:cpp_experimental_simple_template_highlight = 1
" ```
" which works in most cases, but can be a little slow on large files.
" Alternatively set
" ```vim
let g:cpp_experimental_template_highlight = 1
" ```
" which is a faster implementation but has some corner cases where it doesn't
" work.

" _Note: C++ template syntax is notoriously difficult to parse, so don't expect
" this feature to be perfect._

" Highlighting of library concepts is enabled by
" ```vim
let g:cpp_concepts_highlight = 1

" nerdtree cursorline disabled
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set nocursorline

augroup NerdCursor
        autocmd!
        autocmd BufEnter NERD_Tree_* hi CursorLine gui=underline
        autocmd BufLeave NERD_Tree_* highlight clear CursorLine
        autocmd BufAdd * highlight clear CursorLine
augroup END

" let loaded_matchparen = 1
let g:EasyMotion_smartcase=1
set noshowmode
" hi EasyMotionTarget2First ctermfg=darkblue
" hi EasyMotionTarget2Second ctermfg=darkblue
