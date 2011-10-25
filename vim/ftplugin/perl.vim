set iskeyword&
set iskeyword+=:

" maps
nmap <Leader>dump <SID>(insert-dumper)
nmap <Leader>Dump <SID>(insert-dumper-with-register)
nmap <Leader>pod  <SID>(open-perldoc)
nmap <Leader>setp <SID>(set-filetype-perl)

" Dump
"   use Data::Dumper;
"   print {*STDERR} Dumper();
nnoremap <SID>(insert-dumper)               ouse Data::Dumper;<CR>print {*STDERR} Dumper();<ESC>h
nnoremap <SID>(insert-dumper-with-register) ouse Data::Dumper;<CR>print {*STDERR} Dumper(<C-R>");<ESC>h

nnoremap <SID>(open-perldoc)  :! perldoc %<CR>
nnoremap <SID>(set-file-type) :set filetype=perl<CR>

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker :
