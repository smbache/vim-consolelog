function! CLRuby(msg)
  return 'puts({ ''' . a:msg . ''' => '. a:msg .' })'
endfunction

let b:cl_formatter = 'CLRuby'
