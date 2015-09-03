set t_Co=256
syntax enable
let g:solarized_termcolors= 256
let g:solarized_termtrans = 0
let g:solarized_degrade   = 0
let g:solarized_bold      = 1
let g:solarized_underline = 1
let g:solarized_italic    = 1
let g:solarized_contrast  = "normal"
let g:solarized_visibility= "normal"
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

hi ColorColumn ctermbg=DarkRed

