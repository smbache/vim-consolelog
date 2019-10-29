function! CLDefault(msg)
  return 'print(' . a:msg . ')'
endfunction

function! ConsoleLog(type)
  let current_selection = &selection
  let &selection = "inclusive"
  let atat = @@

  if a:type == 'v'
    silent exe "normal! gvy"
  elseif a:type == 'char'
    silent exe "normal! `[v`]y"
  endif

  if @@ != atat
    silent exe "normal! o"

    let Format = function(get(b:, 'cl_formatter', 'CLDefault'))
    let msg = Format(@@)
    call setline('.', msg)
    silent exe "normal! =h"
  endif

  let &selection = current_selection
  let @@ = atat
endfunction

noremap <silent> cl :set opfunc=ConsoleLog<CR>g@
vnoremap <silent> cl :<C-U>call ConsoleLog(visualmode())<CR>

