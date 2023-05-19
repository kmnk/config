" snippets

nmap [denite]t <SID>(sonictemplate)

nnoremap <silent> <SID>(sonictemplate) :<C-u>call <SID>ddu_sonictemplate()<CR>

" https://gist.github.com/liquidz/9a7e1a4cdbc40ff110138847c4278d26
" requires https://github.com/liquidz/ddu-source-custom-list
" cf. https://github.com/mattn/vim-sonictemplate/blob/master/autoload/fzf/sonictemplate.vim
function! s:ddu_sonictemplate() abort
  let id = denops#callback#register(
        \ {s -> sonictemplate#apply(s, 'n')},
        \ {'once': v:true})
  call ddu#start({'sources': [
        \ {'name': 'custom-list',
        \  'params': {'texts': sonictemplate#complete('', '', 0), 'callbackId': id}}]})
endfunction
