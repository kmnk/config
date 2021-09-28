" airline

let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#wordcount#enabled = 0

let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]

let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
let g:airline_section_b = airline#section#create(['hunks', 'branch'])
let g:airline_section_x = '%{&filetype}'
let g:airline_section_y = airline#section#create(['fileencoding', 'fileformat'])
let g:airline_section_z = '%3l:%2v '

