    "   ____             __ _                       _   _                     __                          _            
    "  / ___|___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __  ___    / _| ___  _ __    _ ____   _(_)_ __ ___   
    " | |   / _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \/ __|  | |_ / _ \| '__|  | '_ \ \ / / | '_ ` _ \  
    " | |__| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | \__ \  |  _| (_) | |     | | | \ V /| | | | | | | 
    "  \____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|___/  |_|  \___/|_|     |_| |_|\_/ |_|_| |_| |_| 
    "                         |___/                                                                                    


" 2023.3.2 | Windows11 nvim90
" >>> 插件管理 <<<

call plug#begin()

" > Add : Plug 'path' below"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}              " nerdtree
Plug 'frazrepo/vim-rainbow'                                        " indent rainbow
" Plug 'skywind3000/vim-auto-popmenu'                                " 补全插件
" Plug 'skywind3000/vim-dict'                                        "
Plug 'vim-airline/vim-airline'                                     " 美化底部插件
Plug 'vim-airline/vim-airline-themes'                              "
Plug 'nathanaelkane/vim-indent-guides'                             " indent-rainbow
Plug 'tomasiser/vim-code-dark'                                     " colorscheme
Plug 'sainnhe/everforest'                                          " colorscheme
Plug 'jiangmiao/auto-pairs'                                        " 括号匹配
Plug 'Yggdroot/indentLine'                                         " 括号对齐线
Plug 'lukas-reineke/indent-blankline.nvim'                         " indent-blankline
Plug 'ryanoasis/vim-devicons'                                      " nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                     " nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                                 " nerdtree
Plug 'scrooloose/nerdcommenter'                                    " 注释
Plug 'mhinz/vim-startify'                                          " 首页美化
Plug 'scrooloose/syntastic'                                        " 错误提示
Plug 'majutsushi/tagbar'                                           " 类图
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                " fzf(已弃用)
" Plug 'junegunn/fzf.vim'                                            "
" Plug 'ptzz/lf.vim'                                                 " lf(已弃用)
" Plug 'voldikss/vim-floaterm'                                       "
Plug 'neoclide/coc.nvim', {'branch': 'release'}                    " coc
Plug 'nvim-lua/plenary.nvim'                                       " telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }       " treesitter (for telescope) 
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }


" > Theme
Plug 'ellisonleao/gruvbox.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'ingram1107/moneokai'
Plug 'patstockwell/vim-monokai-tasty'

call plug#end()

" >>> Plug management End <<<



" >>>>>> Telescope <<<<<<

" > Find files using Telescope command-line sugar.
nmap fdf :Telescope fd<Enter>
" nmap fdg :Telescope live_grep<cr>
" nmap fdb :Telescope buffers<cr>
" nmap fdh :Telescope help_tags<cr>

" >>>>>> Telescope End <<<<<<


" >>>>>> Coc <<<<<<
let g:coc_node_path = 'E:\NodeJs\node.exe'


set encoding=utf-8
set hidden
set shortmess+=c
set updatetime=100

" hi CocMenuSel ctermbg=237 guibg=#13354A

inoremap <silent><expr> <c-y> pumvisible() ? coc#_select_confirm() : "\<c-y> "


" > ((切换自动补全生效 
" > Use tab for trigger completion with characters ahead and navigate.
" > NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" > other plugin before putting this into your config.
inoremap <silent><expr> <A-j>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><A-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <Tab>
    \ coc#pum#visible() ? coc#pum#next(1) : 
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()


" > Make <CR> to accept selected completion item or notify coc.nvim to format
" > <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" > ))


" > ((显示文档 
" > Use <A-S-F> to show documentation in preview window.
nnoremap <silent> <A-S-F> :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('<A-S-F>', 'in')
    endif
endfunction
" > ))


" > ((查看函数定义  
" > GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gtd <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" > ))

" >>>>>> coc End <<<<<< 





" >>>>>> 类图 <<<<<<

nmap tb :TagbarToggle<CR>

let g:tagbar_width=30
let g:tagbar_right=1
let g:tagbar_autoclose=1
let g:tagbar_ctags_bin='C:\tools\vim\ctags\ctags.exe'

" >>>>>> 类图 End<<<<<< 




" >>>>>> scrooloose/syntastic <<<<<<

set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()}      
set statusline+=%*     
let g:syntastic_always_populate_loc_list = 1  
let g:syntastic_auto_loc_list = 1  
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_auto_jump = 1
" > 高亮错误
let g:syntastic_enable_highlighting=0
" > 设置error和warning的标志 
let g:syntastic_enable_signs = 1  
let g:syntastic_error_symbol='✗' 
let g:syntastic_warning_symbol='!'  
" > no-unused-args 忽略不使用的参数 
" > no-redefined 忽略重定义 
" > no-max-line-length 忽略每行最长的检测         
" > ignore 542 551 忽略if条件的body为空(如...elseif ret == nil then end，then和end中间没有语句)；忽略空语句(如;)，如果用了;则成对出现该语法检测warning  
" > 有语法错误的一行左侧栏会有S&gt;标识，光标移动到改行，vim下发会给出提示。修改正确后保存，则该'S&gt;'会消失。  
let g:syntastic_lua_checkers = ["/usr/bin/luac5.3.5", "luacheck"]     
let g:syntastic_lua_luacheck_args = "--codes --no-max-comment-line-length --ignore 542 551" 
"
" > c
" let g:syntastic_c_compiler =['gcc', 'clang', 'make']       
" let g:syntastic_c_compiler_options ='-Wpedantic -g'   
let g:syntastic_c_compiler_options ='-std=gnu17'  
let g:syntastic_c_include_dirs=['/usr/include/']        
let g:syntastic_c_config_file='.syntastic_c_config_file'                      
" >
" > cpp         
let g:syntastic_cpp_include_dirs = ['/usr/include/'] 
let g:syntastic_cpp_remove_include_errors = 1 
let g:syntastic_cpp_check_header = 1 
let g:syntastic_cpp_checkers = ['gcc']    
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++17'  

" > 关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

" >>>>>> scrooloose/syntastic <<<<<<





" >>>>>> indentLine <<<<<<
let g:indentLine_enabled = 	1       	" > 使插件生效
let g:indentLine_setColors = 0          " > 取消默认
let g:indentLine_color_term = 239       " > 设置颜色
let g:indentLine_char = '┊'				" > 设置缩进线字符，也可以为 '|', '┆', '┊' 等
let g:indentLine_conceallevel = 2 		" > 使插件正常运行
" >>>>>> indentLine End <<<<<<






" >>>>>> nerdcommenter <<<<<<
" > 使用：
" >> <leader>+cc : 注释
" >> <leader>+cu : 取消
" >> <leader>c<space>  加上/解开注释, 智能判断
" >> <leader>cy   先复制, 再注解(p可以进行黏贴)

" > 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1"
" >>>>>> nerdcommenter End <<<<<<





" >>>>>> indent guides <<<<<<

" let g:indent_guides_enable_on_vim_startup = 1 " > Open this Plugin at beginning"
map <F4> : IndentGuidesToggle<CR>

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lime   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lime   ctermbg=8

" >>>>>> indent guides End <<<<<<






" >>>>>> airline <<<<<<
set laststatus=2    " > 始终显示状态栏
let g:airline#extensions#tabline#enabled = 1                " > 设置开启tab样式
let g:airline#extensions#tabline#formatter = 'jsformatter'  " > 设置默认tab栏样式
let g:airline_powerline_fonts =  1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme="angr"
" > understated
" > base16_adwaita
" > ayu_mirage
" > apprentice
" > ayu_dark
" >>>>>> airline End <<<<<<






" >>>>>> NerdTree <<<<<<
" > F3 打开Nerd tree
map <F3> :NERDTreeToggle<CR>

" > 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" > 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHidden=0     " > 不显示隐藏文件


" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

set encoding=UTF-8
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:Turquoise = "40E0D0"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = "FE405F"
let s:git_orange = "F54D27"
let s:gray = "808A87"
let g:NERDTreeExtensionHighlightColor = {} " > this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['o'] = s:gray " > sets the color of o files to blue
let g:NERDTreeExtensionHighlightColor['h'] = s:blue " > sets the color of h files to blue
let g:NERDTreeExtensionHighlightColor['c'] = s:green " > sets the color of c files to blue
let g:NERDTreeExtensionHighlightColor['cpp'] = s:green " > sets the color of cpp files to blue
let g:NERDTreeExtensionHighlightColor['c++'] = s:green

let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }
" >>>>>> Nerdtree End <<<<<<





" >>>>>> Compleation for txt <<<<<<

" let g:apc_enable = 0
" >  https://zhuanlan.zhihu.com/p/349271041 "
" > !!!! input <tab> to select"
" > 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
" let g:apc_enable_ft = {"*":1}
" > {'text':1, 'markdown':1, 'php':1, "python":1, "cpp":1}

" > 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
" set cpt=.,k,w,b

" > 不要自动选中第一个选项。
" set completeopt=menu,menuone,noselect

" > 禁止在下方显示一些啰嗦的提示
" >>>>>> Compleation for txt End <<<<<<





" >>>>>> Rainbow <<<<<<
let g:rainbow_active = 0

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

" > let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_guifgs = ['yellow', 'lime', 'cyan', 'magenta']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" >>>>>> Rainbow End <<<<<<




" >>>>>> Maps <<<<<<
" > Goto nerdtree --> map <F3> :NERDTreeToggle<CR>
" > Goto indent guides --> map <F4> : IndentGuidesToggle<CR>

" > i: <jk> -> <Esc>; n : <qq> -> <Esc>
imap jk <Esc>
nmap qq <Esc>  

" > 将normal 下的 Ctrl + s --> 保存
nmap <c-s> :w<Enter>
imap <c-s> <Esc>:w<Enter>i<Right>


" > 选中状态下 Ctrl+c 复制(外部)
vmap <C-c> "+y
" > NORMAL状态下全选
nmap <C-a> ggvG
" > i and n 下的粘贴（外部）
imap <C-v> <Esc>"+Pi 
nmap <C-v> "+P




" > C,C++ 按F12编译, Rust F12 build
map <F12> :call CompileFile()<CR>
func! CompileFile()
exec "w"
if &filetype == 'c'
exec "!gcc %"
elseif &filetype == 'cpp'
exec "!g++ %"
elseif &filetype == 'rust'
exec "!cargo build"
elseif &filetype == 'java'
exec "!javac %"
endif 
endfunc


" > 按F11运行（不编译）
map <F11> :call RunFile()<CR>
func! RunFile()
    if &filetype == 'c'
        exec "!a.exe"
    elseif &filetype == 'cpp'
        exec "!a.exe"
    elseif &filetype == 'rust'
        exec "!cargo run"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'java'
        exec "!java %"
    endif 
endfunc


" > 输入<ctrl-b>
map <C-b> :call CompileRunFile()<CR>
func! CompileRunFile()
    exec "w"
    if &filetype == 'c'
        exec "!gcc %"
        exec "!a.exe"
    elseif &filetype == 'cpp'
        exec "!g++ %"
        exec "!a.exe"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'rust'
        exec "!cargo run"
    elseif &filetype == 'java'
        exec "!java %"
    endif 
endfunc


" > Cmake Shutcuts
" > 按<C-S-M> make
map <C-S-m> :call CMakeCompile()<CR>
func! CMakeCompile()
    if &filetype == 'cpp'
        exec "cd.."
        exec "cd build"
        exec "!cmake .."
        exec "!mingw32-make.exe"
    endif
endfunc



" > cmake run(must use CMakeTemplate! or Change the .exe file below)
map <C-S-r> :call CMakeRun()<CR>
func! CMakeRun()
    if &filetype == 'cpp'
        exec "cd.."
        exec "cd build"
        exec "!StdCMake.exe"  
        " > change the row above into "!$You_Project_Name_$.exe"
    endif
endfunc




" > open vertical split :
" > vs -Path/-filename(location)  

" > 窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
" > 光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
" > 时候会变得非常方便.
" nnoremap <C-A-h> <C-w>h
" nnoremap <C-A-j> <C-w>j
" nnoremap <C-A-k> <C-w>k
" nnoremap <C-A-l> <C-w>l

" > insert模式下移动光标
inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-l> <Right>


" > show whitespaces in text
" imap <c-s-F6> <Esc> :%s/ /∗/g<Enter>i
" old version" <Esc> :set list<Enter> :%s/ /∗/g<Enter>i 
" imap <c-F6> <Esc> :%s/∗/ /g<Enter>i 
" old version" <Esc> :set nolist<Enter> :%s/∗/ /g<Enter>i 
" nmap <c-s-F6>  :%s/ /∗/g<Enter>
" old version" :set list<Enter> :%s/ /∗/g<Enter>
" nmap <c-F6>  :%s/∗/ /g<Enter>
" old version" :set nolist<Enter> :%s/∗/ /g<Enter>

" >>>>>> Maps End <<<<<<





" >>>>>> Sets <<<<<<
"
" > set encoding
set encoding=utf8


" > 设置leader建
let mapleader=","



" > 粘贴前按F9防止格式混乱
set pastetoggle=<F9>


" > 高亮显示对应的括号
set showmatch


" > 对应括号高亮的时间（单位是十分之一秒）
" set matchtime=5


" > 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set showcmd


" > 命令行（在状态行）的高度，默认为1,这里是2
set cmdheight=2


" > 设置颜色主题
" colorscheme  elflord
"
" > Apply to Dark backgound:
" >> elflord
" >> evening
" >> darkblue
" > Apply to Light backgound:
" >> habamax(when light backgound)

" > 搜索逐字符高亮
set hlsearch
set incsearch

" > 设置代码折叠
set nofoldenable             " > 启动 vim 时关闭折叠代码
set foldmethod=indent        " > 设置语法折叠
setlocal foldlevel=99        " > 设置折叠层数
nnoremap <space> za          " > 用空格键来开关折叠

"显示行数
set number
" set relativenumber 

" > 规定tab的大小,及替换tab为空格
set tabstop=4
set expandtab

" > 统一缩进为4
set softtabstop=4
set shiftwidth=4

" > 搜索忽略大小写
set ignorecase

" > 显示状态栏
set laststatus=2

" > 上面的状态栏展示信息比较多，，可以如下所示进行集合性配置，如果懒得一一理解，可直接复制进配置文件，因为所有配置对于提升你编程
" > 效率都有帮助。当然如果你不嫌麻烦，也可以以下面所示形式单独配置（注意去掉前面”号）
" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (row\ %l,\ col\ %c)
" set statusline+=%{&ff}  " > 显示文件格式类型
" set statusline+=%h  " > 帮助文件标识
" set statusline+=%m  " > 可编辑文件标识
" set statusline+=%r  " > 只读文件标识
" set statusline+=%y  " > 文件类型
" set statusline+=%c  " > 光标所在列数
" set statusline+=%l/%L  " > 光标所在行数/总行数
" set statusline+=\ %P  " > 光标所在位置占总文件百分比


" > 能够自动补全显示命令行语句，并可利用”Tab”键进行相应的选择。
set wildmenu


" > 语法高亮，可以让你更高效的读懂代码和修改bug代码
syntax on


" > 根据文件类型，加载缩进文件
filetype indent on  


set nobackup       " > 不生成备份文件 filename~
"set noswapfile     " > 不生成交换文件 .filename.swp
set noundofile     " > 不生成undo备份 .filename.un~
"set backup         " > 生成备份文件 filename~
"set swapfile       " > 生成交换文件 .filename.swp
"set undofile       " > 生成undo备份 .filename.un~


" > 关闭错误信息响铃
set noeb
" > 置空错误铃声的终端代码
set vb t_vb= 


" > 打开状态栏标尺
set ruler 


" > 输入的命令显示出来，看的清楚些
set showcmd

" >>>>>> Sets End <<<<<<
  




" >>>>>> others <<<<<<

" > Mode Settings:shape of Cursor
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[6 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" > Cursor settings:
" >> 1 -> blinking block
" >> 2 -> solid block
" >> 3 -> blinking underscore
" >> 4 -> solid underscore
" >> 5 -> blinking vertical bar
" >> 6 -> solid vertical bar

" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" >>>>>> Others End <<<<<<





" >>>>>> Neovide <<<<<< 
if exists("g:neovide")
    " > 
    " > Put anything you want to happen only in Neovide here

    " > Set font-family and size
    set guifont=Pointfree_Nerd_Font:h14

    " g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    let g:neovide_transparency = 1
    let g:transparency = 0.8
    let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0

    " > Full Screen
    " let g:neovide_fullscreen = v:true

endif
 
" >>>>>> Neovide End <<<<<<





" >>>>>> Themes Settings <<<<<<
" > 
" > 1. Monokai vim only
let g:molokai_original = 1
let g:rehash256 = 1

" > 2. gruvbox
" set background=dark
" colorscheme gruvbox

" > 3. nightfox
" colorscheme duskfox
" vim.cmd("colorscheme nightfox")

" > 4. moneokai
syntax enable (if you're using Vim8)
set termguicolors " set t_Co=256 (if you're using Vim8)
set bg=dark
colo moneokai

" > 5. vim-monokai-tasty
" colorscheme vim-monokai-tasty
" let g:vim_monokai_tasty_italic = 1
let g:airline_theme='monokai_tasty'
" let g:vim_monokai_tasty_highlight_active_window = 1

" > 6. sublimemonokai
" syntax on
" set background=dark
" colorscheme sublimemonokai
" set termguicolors
" set t_Co=256

" >>>>>> Themes Settings End <<<<<<

