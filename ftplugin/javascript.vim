function! CLjs(msg)
  let named = matchstr(a:msg, "\\.\\zs[a-zA-Z_]\\+$")
  if named != ""
    return 'console.log({ ' . named . ': ' . a:msg . ' });'
  else
    return 'console.log({ ' . a:msg . ' });'
  endif
endfunction

let b:cl_formatter = 'CLjs'
