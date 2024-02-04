aug MyClojureSetting
  au!
  "au VimEnter * IcedConnect
  "
  nmap <silent> <Leader>gt :A<CR>
  nmap <silent> <Leader>eb :%Eval<CR>
  nmap <silent> <Leader>tn :RunTests<CR>
  nmap <silent> <Leader>tp :0RunTests<CR>
  nmap <silent> <Leader>rrs <Plug>(coc-rename)

  nmap <silent> <Leader>gd <Plug>(coc-definition)
  nmap <silent> <Leader>gD <Plug>(coc-type-definition)
  nmap <silent> <Leader>gI <Plug>(coc-implementation)
  nmap <silent> <Leader>gr <Plug>(coc-references)

  nmap <silent> K :call <SID>show_documentation()<CR>

  "nnoremap <silent> <leader>rcc :call LanguageClient#workspace_executeCommand('cycle-coll', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  "nnoremap <silent> <leader>rth :call LanguageClient#workspace_executeCommand('thread-first', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  "nnoremap <silent> <leader>rtt :call LanguageClient#workspace_executeCommand('thread-last', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  "nnoremap <silent> <leader>rtf :call LanguageClient#workspace_executeCommand('thread-first-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  "nnoremap <silent> <leader>rtl :call LanguageClient#workspace_executeCommand('thread-last-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  "nnoremap <silent> <leader>rml :call LanguageClient#workspace_executeCommand('move-to-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>
  "nnoremap <silent> <leader>ril :call LanguageClient#workspace_executeCommand('introduce-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>
  "nnoremap <silent> <leader>rel :call LanguageClient#workspace_executeCommand('expand-let', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>

  nnoremap <silent> <leader>rcn :call CocAction('runCommand', 'lsp-clojure-clean-ns')<CR>
  nnoremap <silent> <leader>ran :call CocAction('runCommand', 'lsp-clojure-add-missing-libspec')<CR>
  nnoremap <silent> <leader>rai :call CocAction('runCommand', 'lsp-clojure-add-missing-import')<CR>

aug END
