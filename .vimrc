if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim') "ここからプラグインの設定
call dein#add('nanotech/jellybeans.vim')
" カラー
call dein#add('itchyny/lightline.vim')
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'my_component' ] ] },
    \ 'component_function': {
    \   'my_component': 'LightLineComponent'},
    \}


"-----------------------------------
" 補完系

" NerdTree
call dein#add('scrooloose/nerdtree')
let g:NERDTreeShowHidden=1 " 隠しファイルを表示する
autocmd vimenter * NERDTree " NerdTreeの自動開始
" Nerd Treeを表示する
map <C-\> :NERDTreeToggle<CR>
 
" NeoComplete
call dein#add('Shougo/neocomplete.vim')
let g:neocomplete#enable_at_startup = 1 " 起動時にneocompleteを実行
let g:neocomplete#enable_smart_case = 1 " 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_underbar_completion = 1 " '_'区切りの補完を有効化
let g:neocomplete#sources#syntax#min_keyword_length = 3 " シンタックスファイルの補完候補となるキーワードの長さ

" NeoSnippet
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" emmet-vim
call dein#add('mattn/emmet-vim')
let user_emmet_expandabbr_key = '<c-e>'

" 自動でendを閉じる
call dein#add('tpope/vim-endwise')

"-----------------------------------
" Util系

" Unite vim
call dein#add('Shougo/unite.vim')

" Vim Proc 非同期処理
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

"-----------------------------------
" Ruby
call dein#add('vim-ruby/vim-ruby')
let ruby_operators = 1 " 演算子をハイライト
let ruby_space_errors = 1 " 行末のホワイトスペースをハイライト
let g:ruby_indent_access_modifier_style = 'indent'

" vim-monster
call dein#add('osyo-manga/vim-monster')
" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" With neocomplete.vim
let g:neocomplete#sources#omni#input_patterns = {
            \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
            \}

"-----------------------------------
call dein#end()

if dein#check_install()
  call dein#install()
endif

" --------------------------------------
" ここで終了

filetype plugin indent on

augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.swift setfiletype swift
augroup END

" コピペ対策
set clipboard=unnamed
syntax on
colorscheme jellybeans
set showmatch
set number
set mouse=a
set shiftwidth=4
set autoindent
set expandtab
set tabstop=4
set backspace=start,eol,indent
set hidden
set autoread
set noswapfile
set smartindent
set smarttab
"statuline関連 -------------
set statusline=2
"ステータスラインにコマンドを表示
set showcmd

"ステータスラインを常に表示
set laststatus=2

"ファイルナンバー表示
set statusline=[%n]

"ホスト名表示
set statusline+=%{matchstr(hostname(),'\\w\\+')}@

"ファイル名表示
set statusline+=%<%F

"変更のチェック表示
set statusline+=%m

"読み込み専用かどうか表示
set statusline+=%r

"ヘルプページなら[HELP]と表示
set statusline+=%h

"プレビューウインドウなら[Prevew]と表示
set statusline+=%w

"ファイルフォーマット表示
set statusline+=[%{&fileformat}]

"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]

"ファイルタイプ表示
set statusline+=%y

"----------------------------
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" 対応する括弧やブレースを表示する
set showmatch
" 改行時のコメント自動挿入停止
autocmd FileType * setlocal formatoptions-=ro
"nerd treeのキーマップ
nnoremap <silent><C-1> :NERDTreeToggle<CR>
