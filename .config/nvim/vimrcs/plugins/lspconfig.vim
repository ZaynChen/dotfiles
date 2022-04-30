lua <<EOF
local lsp_status = require'lsp-status'
lsp_status.register_progress()

-- Setup nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
  },
  -- your other configuration 
  mapping = {
    ["<Tap>"] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
        else
          fallback()
        end
      end,
      s = function(fallback)
        if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
        else
          fallback()
        end
      end
    }),
    ["<S-Tab>"] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prevd_item({ behavior = cmp.SelectBehavior.Insert })
        elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
        else
          fallback()
        end
      end,
      s = function()
        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
        else
          fallback()
        end
      end
    }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<C-n>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end
    }),
    ['<C-p>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end
    }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
    ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false
      }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false})
        else
          fallback()
        end
      end
    }),
    -- you other configuration
  },
  -- you other configuration
})

-- use buffer source for '/'
cmp.setup.cmdline('/', {
  completion = { autocomplete = false }, 
  sources = {
    { name = 'buffer', opt = { keyword_pattern = [=[[^[:blank:]].*]=] } }
  }
})

-- use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  completion = { autocomplete = false },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    name = 'cmdline'
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require'lspconfig'


local on_attach = function(client)
  lsp_status.on_attach(client)
end

-- Cmake language server setting 
lspconfig.cmake.setup({ on_attach=on_attach, capabilities=capabilities })

-- Rust language server setting rust_analyzer
-- rust-tools automatically sets up nvim-lspconfig for rust_analyzer
-- so there is no need to do that manually
-- require('rust-tools').setup({})
lspconfig.rust_analyzer.setup({
  on_attach=on_attach,
  capabilities = lsp_status.capabilities
})

-- Python language server setting pyright
lspconfig.pyright.setup({
  -- handlers = lsp_status.extensions.pyls_ms.setup(),
  settings = { python = { workspaceSymbols = { enabled = true}}},
  on_attach=on_attach,
  capabilities = lsp_status.capabilities
})

-- Cpp language server setting clangd
lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})

-- Texlab language server setting
lspconfig.texlab.setup({ on_attach = on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completion-nvim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c 

" ENABLE/DISABLE AUTO POPUP
" let g:completion_enable_auto_popup = 0

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" map <c-p> to manually trigger completion
" imap <silent> <c-p> <Plug>(completion_trigger)

" use <Tab> as trigger keys
" imap <Tab> <Plug>(completion_smart_tab)
" imap <S-Tab> <Plug>(completion_smart_s_tab)

" SNIPPETS SUPPORT
" By default other snippets source support are disabled, turn them on by
" Supports UltiSnips, Neosnippet, vim-vsnip and snippets.nvim
let g:completion_enable_snippet = "UltiSnips" 

" Code navigation shortcuts
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>


" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Show diagnostic popup on cursor hold
" deprecated
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()
"
" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
autocmd BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" Change the color of error
" hi LspDiagnosticsDefaultError guifg=#db4b4b

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'pbcopy'

