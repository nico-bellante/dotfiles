call plug#begin("~/.vim/plugged")
  " Plugin Section

  Plug 'kaicataldo/material.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sensible'
  Plug 'dracula/vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jparise/vim-graphql'
  Plug 'vim-scripts/vim-gitgutter'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  Plug 'luochen1990/rainbow'
  Plug 'pantharshit00/vim-prisma'
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'itchyny/lightline.vim'
  Plug 'yegappan/taglist'
call plug#end()
"Config Section

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme material

let g:rainbow_active = 1

" turn hybrid line numbers on
set number relativenumber

let mapleader = "\\"
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader><leader>fi :Files<CR>

nnoremap <leader>] :NERDTreeVCS<CR>
nnoremap <leader>[ :NERDTreeVCS<CR>
let g:NERDTreeWinPos = "right"

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

set so=999

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
