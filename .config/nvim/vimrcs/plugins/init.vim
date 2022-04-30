let s:vim_runtime = expand('<sfile>:p:h')."/../.."

" vim-polyglot
let g:polyglot_disabled = []

call plug#begin(s:vim_runtime.'/plugins')
Plug 'neovim/nvim-lspconfig'
" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" snip
" Plug 'L3MON4D3/LuaSnip'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/lsp-status.nvim'

Plug 'svermeulen/vimpeccable'

" Code completion
" Plug 'nvim-lua/completion-nvim' "no longer maintained
Plug 'saecki/crates.nvim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'chriskempson/base16-vim'
" Plug 'navarasu/onedark.nvim'
" Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-commentary'

" File Explorer
" Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Plug 'andymass/vim-matchup'

" lua functions TODO
Plug 'nvim-lua/plenary.nvim'
" Search TODO get used to it
Plug 'eugen0329/vim-esearch'
" Plug 'nvim-telescope/telescope.nvim'
" Show the lens of the search results
Plug 'kevinhwang91/nvim-hlslens'

" an interface to web apis
Plug 'mattn/webapi-vim'

" multi cursor TODO get used to it
" :help visual-muti
" Tutorial vim -Nu path/to/visual-multi/tutorialrc
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'kien/rainbow_parentheses.vim'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'editorconfig/editorconfig-vim'

" Rust tools
" Plug 'simrat39/rust-tools.nvim'
" Optional dependencies
" Plug 'nvim-lua/popup.nvim'
" Debugging (needs plenary from above as well
" Plug 'mfussenegger/nvim-dap'

" Syntactic language support 
" Plug 'cespare/vim-toml'
" Plug 'stephpy/vim-yaml'
" Plug 'rust-lang/rust.vim'
" Plug 'rhysd/vim-clang-format'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

" Multilanguage syntax highlighing support
Plug 'sheerun/vim-polyglot'

" GDB TODO get used to it
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'
Plug 'rlue/vim-barbaric'

Plug 'wakatime/vim-wakatime'

call plug#end()

" integrate visual_muti_start with nvim-hlslens
aug VMlens
    au!
    au User visual_multi_start lua require('vmlens').start()
    au User visual_multi_exit lua require('vmlens').exit()
aug END

source $HOME/.config/nvim/vimrcs/plugins/ultisnips.vim
source $HOME/.config/nvim/vimrcs/plugins/nvim-cmp.lua
source $HOME/.config/nvim/vimrcs/plugins/lspconfig.vim
" source $HOME/.config/nvim/vimrcs/plugins/nerdtree.vim
source $HOME/.config/nvim/vimrcs/plugins/nvim-tree.vim
source $HOME/.config/nvim/vimrcs/plugins/nvim-web-devicons.lua
source $HOME/.config/nvim/vimrcs/plugins/indent_blankline.lua
source $HOME/.config/nvim/vimrcs/plugins/nvim-gdb.vim
source $HOME/.config/nvim/vimrcs/plugins/crates.lua
source $HOME/.config/nvim/vimrcs/plugins/vimtex.vim
source $HOME/.config/nvim/vimrcs/plugins/vim-barbaric.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To disabled the tabular set g:tabular_loaded = 1
" let g:tabular_loaded = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-hlslens
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi default link HlSearchNear IncSearch
hi default link HlSearchLens WildMenu
hi default link HlSearchLensNear IncSearch
hi default link HlSearchFloat IncSearch

