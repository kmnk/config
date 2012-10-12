" context getter {{{
function! s:get_SID()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_')
endfunction
let s:SID = s:get_SID()
delfunction s:get_SID

function! {{_expr_:substitute(substitute(expand('%:r'), '.*autoload[/]', '', 'g'), '[/]', '#', 'g')}}#__context__()
  return { 'sid': s:SID, 'scope': s: }
endfunction
"}}}
