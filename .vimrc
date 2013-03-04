" http://kastaneda.kiev.ua/desktop/dotrc/vim.html

" общие настройки
syntax on             " включить подсветку синтаксиса
set ts=8              " у меня табуляция (tabstop) 4 символа
set tabstop=8
set shiftwidth=2
set textwidth=8
set tw=159
set expandtab
set autoindent
set copyindent
set background=dark   " весьма важная штука! :)
set lbr
set showcmd
set nocompatible      " обойдёмся без стандартного vi
set backspace=indent,eol,start
color desert
set number
nmap <F6> :set invlist<cr>

" Setup for the GNU coding format standard
function! GnuIndent()
    setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
    setlocal shiftwidth=2
    setlocal tabstop=8
endfunction 

" Setup for the Vala coding format standard
function! ValaIndent()
    setlocal shiftwidth=4
endfunction

au FileType c,cpp call GnuIndent()
au FileType vala,vapi call ValaIndent()

" отключение бэкапов
set nobackup
" set backup
" set backupdir=$HOME/.vim/backups
" set directory=$HOME/.vim/temp

" чтобы курсор не прыгал, а вёл себя так, как kwrite и т.п.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk


" файлы автоматом делаются исполняемыми
function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
au BufWritePost * call ModeChange()

" интуитивные горячие клавиши =)
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
nmap <F10> :q!<cr>
vmap <F10> <esc>:q!<cr>i
imap <F10> <esc>:q!<cr>i

" вкладки
:set tabpagemax=99
nmap <C-a> :tabnew<cr>
imap <C-a> <ESC>:tabnew<cr>
map <C-x> :tabnext<cr>
nmap <C-x> :tabnext<cr>
imap <C-x> :tabnext<cr>
map <C-z> :tabprev<cr>
nmap <C-z> :tabprev<cr>
imap <C-z> :tabprev<cr>

" кириллица
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set wildmenu
set wcm=<Tab>
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map <F8> :emenu Encoding.<TAB>
set fileencodings=utf-8,cp1251,cp866,koi8-r

" вкл/выкл автоперенос
set pastetoggle=<F5>
" set paste
" nmap <F6> :set noautoindent<cr>
" imap <F6> :set noautoindent<cr>
" nmap <F5> :set autoindent<cr>
" imap <F5> :set autoindent<cr>
" inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi " чтобы отступы не съезжали при вставке из буфера X Window

" FONT SIZE SHORTCUTS
set guifont=Liberation\ Mono\ 8
let g:MyFontSize = 8
function! ToggleMyFontSize()
  if ( g:MyFontSize == 10 )
    let g:MyFontSize = 8
  elseif ( g:MyFontSize == 8 )
    let g:MyFontSize = 9
  elseif ( g:MyFontSize == 9 )
    let g:MyFontSize = 10
  endif
  execute "set guifont=Liberation\\ Mono\\ ".g:MyFontSize
endfunction
nnoremap  <silent>  <F12> :call ToggleMyFontSize()<CR>

" теги
set tags+=./.ctags
set tags+=~/.big/ctags
cscope add ./.cscope
cscope add ~/.big/cscope
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Foldging
set foldenable
set foldmethod=syntax

" VUNDLE "
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-tags'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
Bundle 'majutsushi/tagbar'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" clang_complete
" let g:clang_complete_copen = 1
" let g:clang_user_options='|| exit 0'
filetype plugin on
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1

" ------- Vala --------
" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1
" Disable trailing space errors
"let vala_no_trail_space_error = 1
" Disable space-tab-space errors
let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120

" ----- Vala taglist ------
" Work-around Tag List for Vala
let tlist_vala_settings='c#;d:macro;t:typedef;n:namespace;c:class;'.
  \ 'E:event;g:enum;s:struct;i:interface;'.
  \ 'p:properties;m:method'

" ----- TagBar ------
nmap <F9> :TagbarToggle<CR> 
let g:tagbar_ctags_bin = "anjuta-tags"

" ----- NERDTree ------
nmap <F12> :NERDTreeToggle<CR> 
