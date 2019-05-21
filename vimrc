set nocompatible                                                                                                                                                                
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set t_Co=256
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'leshill/vim-json'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/Conque-Shell'
call vundle#end()

filetype plugin indent on
nmap <F4> :TagbarToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
set backspace=2
colorscheme molokai
set ts=4 sw=4 sts=4 tw=100
set expandtab
set nu!
syn on
set autoindent
set smartindent 
set smarttab 
set noswapfile
set nobackup
set hlsearch
set incsearch
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn
set confirm
set cursorline
set clipboard+=unnamed
set completeopt=preview,menu
set ignorecase
let laststatus = 2

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'

""set tags=/home/fangyonghao/test/release_for_qvine_r227959/tags
set tags=/home/fangyonghao/dev/CloudUCS/tags
""set tags=/home/fangyonghao/dev/searcher_ampaddcounter/tags
""set tags=/home/fangyonghao/dev/mod_dispatcher/tags

let g:airline_powerline_fonts = 1
"开启tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif                            
let g:airline_theme="molokai"
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = ''
let g:airline_symbols.crypt = '<d83d><dd12>'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

"autocmd VimEnter * NERDTree
""autocmd VimEnter * Tagbar

let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ale-setting {{{

let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['gcc'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\ }
"}}}
map <leader>td <Plug>TaskList

""autocmd BufNewFile *.cpp,*.cc,*.[ch],*.sh,*.java exec ":call SetTitle()"
func SetTitle() 
    call setline(1, "// Copyright Qihoo ".strftime("%Y")." All rights reserved.")
    call append(line("."), "// Author:fangyonghao@360.cn (Fang Yonghao)")
    call append(line(".")+1, "// desc:")
    call append(line(".")+2, "// date: ".strftime("%Y%m%d"))
    call append(line(".")+3, "")
endfunc                                                              
