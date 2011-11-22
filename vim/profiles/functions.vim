" functions.vim

" return current line num
function! Cn()
  return line('.')
endfunction

" retrurn previous line num
function! Pn()
  return line('.') - 1
endfunction

" return current line text
function! Cl()
  return getline('.')
endfunction

" return previous line text
function! Pl()
  return getline(Pn())
endfunction

" return matched text on current line
function! Cm(pattern)
  return matchstr(Cl(), a:pattern)
endfunction

" return matches text on previous line
function! Pm(pattern)
  return matchstr(Pl(), a:pattern)
endfunction

" abbr submatch()
function! Sm(n)
  return submatch(a:n)
endfunction
