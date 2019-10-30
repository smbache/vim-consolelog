function! CLRuby(msg)
  return 'puts({ ''' . a:msg . ''' => '. a:msg .' })'
endfunction

if !exists("b:cl_formatter")
  let b:cl_formatter = 'CLRuby'
endif
