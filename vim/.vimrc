execute pathogen#infect()
syntax on
set nocompatible
set fileencodings=utf-8
filetype plugin on
filetype indent off

set nofoldenable
set term=xterm
set backspace=indent,eol,start
set laststatus=2
set t_Co=256

:set tabstop=4
:set shiftwidth=4
:set expandtab

" VIM buffer injection using shortcut R into new buffer
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" VIM Crosshair - JS
set background=dark
highlight CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=black guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=black guifg=NONE
nnoremap <C-c> :set cursorline! cursorcolumn!<CR>

set hlsearch

" VIM Airline and set theme
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" merlin initalization
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint2']
let g:syntastic_java_javac_classpath = './src'
" let g:loaded_syntastic_java_javac_checker = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'java', 'scala'] }

" Go syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" YouCompleteMe Python interpreter
" nnoremap <Leader>] :YcmCompleter GoTo<CR>
" let g:ycm_python_binary_path = '/usr/local/bin/python3'
" let g:ycm_rust_src_path = '/Users/jacob/repo/github.com/layer3switch/rust/src'
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_goto_buffer_command = 'new-or-existing-tab'
" let g:ycm_disable_for_files_larger_than_kb = 0

" SaltStack Syntax
let g:sls_use_jinja_syntax = 1

highlight Pmenu ctermfg=15 ctermbg=8 guifg=#ffffff guibg=#808080
