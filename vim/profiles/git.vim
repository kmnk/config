" git

nmap <Leader>gst <SID>(fugitive-status)
nmap <Leader>gbl <SID>(fugitive-blame)
nmap <Leader>gc <SID>(fugitive-commit)
nmap <Leader>gg <SID>(fugitive-grep)
nmap <Leader>gl <SID>(fugitive-log)
nmap <Leader>gb <SID>(fugitive-branch)
nmap <Leader>gf <SID>(fugitive-fetch)

nmap <Space>gp <SID>(fugitive-push)
nmap <Space>gP <SID>(fugitive-pull)

nmap [denite]gst <SID>(gitn-status)
nmap [denite]gl  <SID>(gitn-log)
nmap [denite]gL  <SID>(gitn-log-this-file)
nmap [denite]gb  <SID>(gitn-branch)
nmap [denite]gB  <SID>(gitn-branch-all)

" {{{
nnoremap <SID>(fugitive-blame) :<C-u>Git blame<CR>
nnoremap <SID>(fugitive-commit) :<C-u>Git commit<CR>
nnoremap <SID>(fugitive-grep) :<C-u>Git grep 
nnoremap <SID>(fugitive-log) :<C-u>Git log<CR>
nnoremap <SID>(fugitive-pull) :<C-u>Git pull<CR>
nnoremap <SID>(fugitive-push) :<C-u>Git push<CR>
nnoremap <SID>(fugitive-status) :<C-u>G<CR>
nnoremap <SID>(fugitive-branch) :<C-u>Git branch<CR>
nnoremap <SID>(fugitive-fetch) :<C-u>Git fetch origin<CR>

nnoremap <silent> <SID>(gitn-status) :<C-u>Denite gitn_status<CR>
nnoremap <silent> <SID>(gitn-log) :<C-u>Denite gitn_log<CR>
nnoremap <silent><expr> <SID>(gitn-log-this-file) ':<C-u>Denite gitn_log:' . expand('%:p') . '<CR>'
nnoremap <silent> <SID>(gitn-branch) :<C-u>Denite gitn_branch<CR>
nnoremap <silent> <SID>(gitn-branch-all) :<C-u>Denite gitn_branch:all<CR>
" }}}
