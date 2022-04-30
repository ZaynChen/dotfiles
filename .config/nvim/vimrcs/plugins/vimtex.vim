let g:vimtex_quickfix_mode=0
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/sharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_method='skim'

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

let g:vimtex_compiler_latexrun_engines = {
    \ '_'                : 'xelatex',
    \ 'pdflatex'         : 'pdflatex',
    \ 'lualatex'         : 'lualatex',
    \ 'xelatex'          : 'xelatex',
    \}

" let g:vimtex_compiler_latexmk = {
"       \ 'executable' : 'latexmk',
"       \ 'option' : [
"       \   '-xelatex',
"       \   '-file-line-error',
"       \   '-synctex=1',
"       \   '-interaction=nonstopmode',
"       \ ],
"       \}

set conceallevel=1
let g:tex_conceal='abdmg'

augroup vimtex_compilation
  au!
  au User VimtexEventCompileSuccess call UpdateSkim()
augroup END

function! UpdateSkim()
  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']

  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif

  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
