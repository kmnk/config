let s:tc = unittest#testcase#new('{{_cursor_}}')

function! s:tc.SETUP()"{{{
endfunction"}}}
function! s:tc.TEARDOWN()"{{{
endfunction"}}}

function! s:tc.test_sample()"{{{
  call self.assert(1)
endfunction"}}}

unlet s:tc
