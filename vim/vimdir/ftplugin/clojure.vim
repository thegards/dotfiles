aug MyClojureSetting
  au!

  " also show vim documentation
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  nmap <silent> <Leader>gt :A<CR>
  nmap <silent> <Leader>eb :%Eval<CR>
  nmap <silent> <Leader>tn :RunTests<CR>
  nmap <silent> <Leader>tt :.RunTests<CR>
  nmap <silent> <Leader>tp :0RunTests<CR>
  nmap <silent> <Leader>rrs <Plug>(coc-rename)
  nmap <silent> <Leader>=G <Plug>(coc-format)
  nmap <Leader>tctr :%s/.\[[0-9;]\+m//g<CR>

  nmap <silent> <Leader>gd <Plug>(coc-definition)
  nmap <silent> <Leader>gD <Plug>(coc-type-definition)
  nmap <silent> <Leader>gI <Plug>(coc-implementation)
  nmap <silent> <Leader>gr <Plug>(coc-references)

  nmap <silent> K :call <SID>show_documentation()<CR>

aug END
