" setlocal makeprg=lualatex\ --shell-escape\ --interaction=nonstopmode\ --file-line-error\ %
" setlocal errorformat=%E%f:%l:%m,%Zl.%l\ %m,%C%.%#,%-G%.%#

" call deoplete#initialize()
" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns.tex = '\\(?:'
"       \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"       \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
"       \ . '|hyperref\s*\[[^]]*'
"       \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"       \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
"       \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"       \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ .')'
