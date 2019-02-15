"参照 https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set pastetoggle=<F9>                "粘贴前按F9 防止缩进混乱

set nocompatible                    "去掉vi的一致性
set t_Co=256                        "设置终端为256色
set number                          "显示行号

set guioptions-=r                   "隐藏滚动条
set guioptions-=L
set guioptions-=b

set history=1000                    "历史记录数
"set nobackup                       "禁止生成临时文件文件
"set noswapfile

set showtabline=0                   "隐藏顶部标签栏

set guifont=m+\ 1mn:h14             "设置字体
syntax on                           "开启语法高亮
"colorscheme solarized              "设置主题
colorscheme dracula                 "设置主题
set background=dark                 "设置背景色
set wrap                            "设置自动折行
"set nowrap                         "设置不换行
set fileformat=unix                 "设置以unix的格式保存文件
set nosmartindent                   "不自动缩进
set noautoindent
"set showmatch                       "显示匹配的括号
set scrolloff=5                     "距离顶部和底部5行
set laststatus=2                    "命令行为两行
set fenc=utf-8                      "文件编码
set backspace=2
"set mouse=a                         "启用鼠标
set mouse=v
set selection=exclusive
set selectmode=mouse,key
set matchtime=5

set ignorecase                      "搜索忽略大小写
set incsearch                       "高亮搜索项
set hlsearch

set tabstop=4                       "Tab键的宽度
set softtabstop=4                   "统一缩进为4
set shiftwidth=4
set expandtab                       "使用空格代替制表符

set whichwrap+=<,>,h,l
set autoread
set cursorline                      "突出显示当前行
set cursorcolumn                    "突出显示当前列
set ruler                           "打开状态栏标尺
set cursorline                      "突出显示当前行

set list
set listchars=tab:>-,trail:∙        "显示空格

set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030


filetype plugin indent on           "打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"python补全
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


let g:indentLine_char='┆'           "缩进指示线
let g:indentLine_enabled = 1


let g:autopep8_disable_show_diff=1   "autopep8设置



"F6 代码格式优化
map <F6> :call FormartSrc()<CR><CR>
"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc





"python 代码补全 来源 https://www.jianshu.com/p/f0513d18742a
"默认配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径
let g:ycm_path_to_python_interpreter='python'
"是否开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口
let g:ycm_autoclose_preview_window_after_completion=1
"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"字符串中也开启补全
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif



"列出当前目录文件
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc']
"只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif


"PowerLine
let g:Powerline_symbols = 'fancy'


"ctrlp
let mapleader="\\"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn|rvm)$', 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$'}
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
