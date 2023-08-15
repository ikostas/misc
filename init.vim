let mapleader =' '
let maplocalleader = ' '
syntax enable
colorscheme monokai
set wrap linebreak nolist
call plug#begin()
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'itchyny/lightline.vim'
  "Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  Plug 'mattn/emmet-vim'
  Plug 'SidOfc/mkdx'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
call plug#end()
set laststatus=2 "For LightLine
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set conceallevel=2 "cocneal links in Markdown
set concealcursor=nc
set clipboard+=unnamedplus
" telescope setup
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
set relativenumber
set rnu
