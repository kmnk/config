" maps

nmap <Leader>1 <SID>(toggle-number)
nmap <Leader>2 <SID>(toggle-spell)
nmap <Leader>3 <SID>(toggle-paste)

imap <C-h> <SID>(backspace)

nmap <Leader>ev <SID>(edit-vimrc)
nmap <Leader>eg <SID>(edit-gvimrc)

nmap <Leader>nt <SID>(create-new-tab)
nmap <Leader>mt <SID>(buffer-to-new-tab)

" definition {{{

nnoremap <SID>(toggle-number) :<C-u>set number!<CR>
nnoremap <SID>(toggle-spell) :<C-u>set spell!<CR>
nnoremap <SID>(toggle-paste) :<C-u>set paste!<CR>

inoremap <SID>(backspace) <BS>

nnoremap <silent> <SID>(edit-vimrc) :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <SID>(edit-gvimrc) :<C-u>tabedit $MYGVIMRC<CR>

nnoremap <silent> <SID>(create-new-tab) :<C-u>tabnew<CR>
nnoremap <silent> <SID>(buffer-to-new-tab) :<C-u>call <SID>move_window_into_tab_page(0)<CR>
" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}

" }}}
