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

if mapcheck('<Plug>(ConsoleLog)') == ''
  noremap <silent><unique> <Plug>(ConsoleLog) :set opfunc=<SID>ConsoleLogFn<CR>g@
endif

if !hasmapto('<Plug>(ConsoleLog)', 'n')
  nmap cl <Plug>(ConsoleLog)
endif

if mapcheck('<Plug>(VConsoleLog)') == ''
  vnoremap <silent><unique> <Plug>(VConsoleLog) :<C-U>call <SID>ConsoleLogFn(visualmode())<CR>
endif

if !hasmapto('<Plug>(VConsoleLog)', 'v')
  vmap cl <Plug>(VConsoleLog)
endif

