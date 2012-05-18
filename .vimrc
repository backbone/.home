" http://kastaneda.kiev.ua/desktop/dotrc/vim.html

" общие настройки
syntax on             " включить подсветку синтаксиса
set ts=8              " у меня табуляция (tabstop) 4 символа
set tabstop=8
set shiftwidth=8
set textwidth=8
set autoindent
set tw=159
set copyindent
" set expandtab
set background=dark   " весьма важная штука! :)
set lbr
set showcmd
set nocompatible      " обойдёмся без стандартного vi
set backspace=indent,eol,start
color desert
set number
nmap <F6> :set invlist<cr>

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
map <C-k> :tabnext<cr>
nmap <C-k> :tabnext<cr>
imap <C-k> :tabnext<cr>
map <C-j> :tabprev<cr>
nmap <C-j> :tabprev<cr>
imap <C-j> :tabprev<cr>

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

