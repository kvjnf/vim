set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Nerdtreeの設定
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" fugitive.vimの設定
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" grep検索の実行後にQuickFix Listを表示する
set statusline+=%{fugitive#statusline()}

" solarized
NeoBundle 'altercation/vim-colors-solarized'

"Railsの設定
""""""""""""""""""""""""""""""
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

" ruby end を自動で挿入
NeoBundle 'tpope/vim-endwise'

" emmet-vim
NeoBundle 'mattn/emmet-vim'

" nerd-tree
NeoBundle 'scrooloose/nerdtree'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
 let g:indent_guides_enable_on_vim_startup = 1

 " 行末の半角スペースを可視化
 NeoBundle 'bronson/vim-trailing-whitespace'

" 全角スペースの表示
function! ZenkakuSpace()
 highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
   augroup ZenkakuSpace
   autocmd!
   autocmd ColorScheme * call ZenkakuSpace()
   autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
   augroup END
   call ZenkakuSpace()
endif

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"コピペ対策
set clipboard=unnamed
syntax on
set showmatch
set number
set mouse=a
set shiftwidth=2
set backspace=start,eol,indent
set hidden
set autoread
set noswapfile
set smartindent
set smarttab
"改行時のコメント自動挿入停止
autocmd FileType * setlocal formatoptions-=ro
