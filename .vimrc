set nocompatible                " Recommend
filetype off                    " Required!

filetype plugin indent on       " required!

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

" ruby
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et

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
