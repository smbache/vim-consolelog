function! CLDefault(msg)
  return 'print(' . a:msg . ')'
endfunction

function! s:ConsoleLogFn(type)
  let current_selection = &selection
  let &selection = "inclusive"
  let atat = @@

  if a:type == 'v'
    silent exe "normal! gvy"
  elseif a:type == 'char'
    silent exe "normal! `[v`]y"
  endif

  if @@ != atat
    let msg = trim(@@)
    silent exe "normal! o"

    let Format = function(get(b:, 'cl_formatter', 'CLDefault'))
    let out = Format(msg)
    call setline('.', out)
    silent exe "normal! =h"
  endif

  let &selection = current_selection
  let @@ = atat
endfunction

" noremap <silent> cl :set opfunc=ConsoleLog<CR>g@
noremap <silent><unique> <Plug>(ConsoleLog) :set opfunc=<SID>ConsoleLogFn<CR>g@

if !hasmapto('<Plug>(ConsoleLog)', 'n')
  noremap cl <Plug>(ConsoleLog)
endif

"vnoremap <silent> cl :<C-U>call ConsoleLog(visualmode())<CR>
vnoremap <silent><unique> <Plug>(ConsoleLog) :<C-U>call <SID>ConsoleLogFn(visualmode())<CR>

if !hasmapto('<Plug>(ConsoleLog)', 'v')
  noremap cl <Plug>(ConsoleLog)
endif

