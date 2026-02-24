" git

" useful maps
nmap <Space>ggh <SID>(go-github)
nmap <Space>ggH <SID>(go-github-on-master)

" fugitive maps
nmap <Leader>gc <SID>(fugitive-commit)
nmap <Space>gp <SID>(fugitive-push)
nmap <Space>gP <SID>(fugitive-pull)
nmap <Space>gf <SID>(fugitive-fetch)

" ddu source git maps
nmap <Leader>gbl <SID>(ddu-git_blame)
nmap <Leader>gg <SID>(ddu-git_grep)

nmap [ddu]gb <SID>(ddu-git_branch)
nmap [ddu]gB <SID>(ddu-git_branch-all)
nmap [ddu]gconf <SID>(ddu-git_config)
nmap [ddu]gl <SID>(ddu-git_log)
nmap [ddu]gL <SID>(ddu-git_log-this-file)
nmap [ddu]gref <SID>(ddu-git_reflog)
nmap [ddu]gremo <SID>(ddu-git_remote)
nmap [ddu]gssh <SID>(ddu-git_stash)
nmap [ddu]gst <SID>(ddu-git_status)
nmap [ddu]gsb <SID>(ddu-git_submodule)
nmap [ddu]gwt <SID>(ddu-git_worktree)

" ddu source git maps {{{
nnoremap <silent><expr> <SID>(ddu-git_blame) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_blame",
      \   sources: [#{
      \     name: "git_blame",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_branch) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_branch",
      \   sources: [#{
      \     name: "git_branch",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_branch-all) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_branch",
      \   sources: [#{
      \     name: "git_branch",
      \     params: #{args: ["--all"]},
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_config) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_config",
      \   sources: [#{
      \     name: "git_config",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_grep) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_grep",
      \   sources: [#{
      \     name: "git_grep",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_log) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_log",
      \   sources: [#{
      \     name: "git_log",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_log-this-file) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_log",
      \   sources: [#{
      \     name: "git_log",
      \     params: #{
      \       args: ["--", expand("%:p")],
      \       cwd: expand("%:p:h"),
      \     },
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_reflog) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_reflog",
      \   sources: [#{
      \     name: "git_reflog",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_remote) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_remote",
      \   sources: [#{
      \     name: "git_remote",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_stash) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_stash",
      \   sources: [#{
      \     name: "git_stash",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_status) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_status",
      \   sources: [#{
      \     name: "git_status",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_submodule) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_submodule",
      \   sources: [#{
      \     name: "git_submodule",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(ddu-git_worktree) ':<C-u>
      \ call ddu#start(#{
      \   name: "git_worktree",
      \   sources: [#{
      \     name: "git_worktree",
      \   }],
      \ })
      \ <CR><CR>'
" }}}

" ddu source git settings {{{
autocmd FileType ddu-ff call s:ddu_ff_git_settings()
function s:ddu_ff_git_settings() abort
  nnoremap <buffer> p <Cmd>call ddu#ui#do_action('togglePreview')<CR>
  if b:ddu_ui_name ==# 'git_status'
    nnoremap <buffer> a <Cmd>call ddu#ui#do_action('itemAction', #{name: 'add'})<CR>
    nnoremap <buffer> u <Cmd>call ddu#ui#do_action('itemAction', #{name: 'restoreStaged'})<CR>
  elseif b:ddu_ui_name ==# 'git_log'
  endif
endfunction

call ddu#custom#patch_global(#{
      \  kindOptions: #{
      \    git_blame: #{
      \      defaultAction: 'open',
      \    },
      \    git_branch: #{
      \      defaultAction: 'switch'
      \    },
      \    git_grep: #{
      \      defaultAction: 'open',
      \    },
      \    git_log_files: #{
      \      defaultAction: 'open',
      \    },
      \    git_status: #{
      \      defaultAction: 'open',
      \    },
      \  },
      \})
call ddu#custom#patch_local('git_log', #{
      \  uiParams: #{
      \    ff: #{
      \      autoAction: #{name: 'preview'},
      \      startAutoAction: v:true,
      \    },
      \  },
      \})
" }}}

" useful maps {{{
nnoremap <silent><expr> <SID>(go-github) ':<C-u>!open "https://github.com/' . ddu_source_git#remote_repo() . '/blob/' . ddu_source_git#hash() . '/' . substitute(expand("%"), ddu_source_git#toplevel(), "", "g") . '\#L' . line('.') . '"<CR>'
nnoremap <silent><expr> <SID>(go-github-on-master) ':<C-u>!open "https://github.com/' . ddu_source_git#remote_repo() . '/blob/master/' . substitute(expand("%"), ddu_source_git#toplevel(), "", "g") . '\#L' . line('.') . '"<CR>'
" }}}

" fugitive maps {{{
nnoremap <silent> <SID>(fugitive-commit) :<C-u>Git commit<CR>
nnoremap <silent><expr> <SID>(fugitive-push) ':<C-u>Git push -u origin ' . ddu_source_git#head() . '<CR>'
nnoremap <silent> <SID>(fugitive-pull) :<C-u>Git pull<CR>
nnoremap <silent> <SID>(fugitive-fetch) :<C-u>Git fetch origin<CR>
" }}}
