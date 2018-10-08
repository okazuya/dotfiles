set nocompatible                " Recommend
filetype off                    " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
" NeoBundle 'git://github.com/Shougo/vimfiler.git'
" NeoBundle 'git://github.com/Shougo/unite.vim.git'
" NeoBundle 'git://github.com/Shougo/clang_complete.git'
" NeoBundle 'git://github.com/Shougo/echodoc.git'
" NeoBundle 'git://github.com/Shougo/unite.vim.git'
" NeoBundle 'git://github.com/Shougo/vim-vcs.git'
" NeoBundle 'git://github.com/Shougo/vimshell.git'
" NeoBundle 'git://github.com/Shougo/vinarise.git'
" NeoBundle git://github.com/tpope/vim-fugitive.git

filetype plugin indent on       " required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

set smartcase
set incsearch
set laststatus=2
set nobk
syntax on
set ts=2
set bs=2
set sw=2
set si
set hlsearch

set termencoding=utf-8
set encoding=utf-8
if has('iconv')
  set fileencodings=iso-2022-jp
  set fileencodings+=cp932,sjis
  set fileencodings+=euc-jp
  set fileencodings+=utf-8,ucs-2le,ucs-2
endif

set noerrorbells
set ambiwidth=double

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Coldfusion
autocmd FileType cf :set ic
autocmd FileType cf :set nosmartcase

let @h="s<cfoutput></cfoutput>bba##iHTMLEditFormat()P"

au FileType cf setlocal foldmethod=expr foldexpr=CFCHelpFold(v:lnum)

function! CFCHelpFold(lnum)
  let prev = getline(a:lnum - 1)
  let line = getline(a:lnum)
  let next = getline(a:lnum + 1)
  if prev =~ '^\s*<cffunction.*$' && line !~ '^.*<\/cffunction.*$'
    return '>1'
  elseif prev !~ '^\s*<cffunction.*$' && line =~ '^.*<\/cffunction.*$'
    return '<1'
  endif
  return '='
endfunction
