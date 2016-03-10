set nocompatible
filetype off            " for NeoBundle

if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ここからプラグインの設定

" カラー
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'

" Vimの下にあるメニューをカラーにする
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'my_component' ] ] },
    \ 'component_function': {
    \   'my_component': 'LightLineComponent'},
    \}
        
"-----------------------------------

" vim補完neocomplet --------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" --------------------------------------
NeoBundle 'Shougo/neosnippet'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

NeoBundle 'Shougo/neosnippet-snippets'

" --------------------------------------

" nerd-tree
NeoBundle 'scrooloose/nerdtree'

" emmet-vim
NeoBundle 'mattn/emmet-vim'
let user_emmet_expandabbr_key = '<c-e>'
" ここで終了

call neobundle#end()
filetype plugin indent on

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
set paste
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
"vim 起動時にpluginの未インストールを確認
NeoBundleCheck
