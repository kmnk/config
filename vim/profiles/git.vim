nmap <Leader>gst <SID>(fugitive-status)
nmap <Leader>gbl <SID>(fugitive-blame)
nmap <Leader>gg <SID>(fugitive-grep)

nnoremap <SID>(fugitive-status) :<C-u>G<CR>
nnoremap <SID>(fugitive-blame) :<C-u>Git blame<CR>
nnoremap <SID>(fugitive-grep) :<C-u>Git grep 
