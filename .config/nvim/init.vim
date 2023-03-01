lua require "plugins"
lua require "alpha"
lua require "keymaps"
lua require "lsp"

" Simple vim settings
inoremap jj <esc>
set number
set relativenumber

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

set incsearch
set nohlsearch

" Formatting before writing buffer
autocmd BufWritePre * lua vim.lsp.buf.format()
" :set background=dark
colorscheme gruvbox
highlight Normal ctermbg=NONE guibg=NONE 
highlight LineNr ctermbg=NONE guibg=NONE 
highlight SignColumn ctermbg=NONE guibg=NONE 

" Remap github copilot
lua vim.g.copilot_no_tab_map = true
lua vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


" Floaterm config 
source $HOME/.config/nvim/lua/floaterm.vim
