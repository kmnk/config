call ddu_source_cmdl#set_data_directory_path(expand('<sfile>:h:h:h') . '/json')

nmap [ddu]l <SID>(cmdl)

nnoremap <silent> <SID>(cmdl) :<C-u>Denite cmdl<CR>
nnoremap <silent><expr> <SID>(cmdl) ':<C-u>
      \ call ddu#start(#{
      \   name: "cmdl",
      \   sources: [#{
      \     name: "cmdl",
      \   }],
      \ })
      \ <CR><CR>'

call ddu#custom#patch_global(#{
      \  kindOptions: #{
      \    cmdl: #{
      \      defaultAction: 'execute',
      \    },
      \  },
      \})
