call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'mohvn/peachpuff-legacy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

syntax on
set background=dark
if 0
  colorscheme peachpuff
  highlight! link SignColumn LineNr 
  autocmd ColorScheme * highlight! link SignColumn LineNr 

  highlight! link CocFloating FgCocWarningFloatBgCocFloating
  autocmd ColorScheme * hi link CocFloating FgCocWarningFloatBgCocFloating

  autocmd FileType * hi clear conceal 
else
  colorscheme codedark
endif

hi clear statusline 
hi clear StatusLineNC
hi clear CursorLine
hi clear VertSplit

set number
set tabstop=2 shiftwidth=2
set expandtab ai
set hlsearch ruler
set mouse=a
highlight Comment ctermfg=green

nnoremap <esc> :noh<return><esc>

let NERDTreeShowHidden=1

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
