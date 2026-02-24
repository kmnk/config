"call ddu_source_dirmark#set_data_directory_path(expand('<sfile>:h:h:h') . '/json')

nmap [ddu]dd <SID>(dirmark-default)
nmap [ddu]dg <SID>(dirmark-group)

nnoremap <silent><expr> <SID>(dirmark-default) ':<C-u>
      \ call ddu#start(#{
      \   name: "dirmark",
      \   sources: [#{
      \     name: "dirmark",
      \   }],
      \ })
      \ <CR><CR>'
nnoremap <silent><expr> <SID>(dirmark-group) ':<C-u>
      \ call ddu#start(#{
      \   name: "dirmark_group",
      \   sources: [#{
      \     name: "dirmark_group",
      \   }],
      \ })
      \ <CR><CR>'

call ddu#custom#patch_global(#{
      \  kindOptions: #{
      \    dirmark: #{
      \      defaultAction: 'cd',
      \    },
      \    dirmark_group: #{
      \      defaultAction: 'open',
      \    },
      \  },
      \})
