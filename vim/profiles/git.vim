nmap <Leader>gst <SID>(fugitive-status)
nmap <Leader>gbl <SID>(fugitive-blame)
nmap <Leader>gg <SID>(fugitive-grep)
nmap <Leader>gl <SID>(fugitive-log)

nmap <Space>gp <SID>(fugitive-push)
nmap <Space>gP <SID>(fugitive-pull)

nnoremap <SID>(fugitive-blame) :<C-u>Git blame<CR>
nnoremap <SID>(fugitive-grep) :<C-u>Git grep 
nnoremap <SID>(fugitive-log) :<C-u>Git log<CR>
nnoremap <SID>(fugitive-pull) :<C-u>Git pull<CR> 
nnoremap <SID>(fugitive-push) :<C-u>Git push<CR>
nnoremap <SID>(fugitive-status) :<C-u>G<CR>
