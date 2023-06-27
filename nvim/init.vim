"""""""""""""
"
" # Option
"
"""""""""""""
set nu
" colorscheme desert
syntax enable
syntax on
set number
filetype plugin indent on
set noexpandtab
set history=1000
set tabstop=4      "#tab键缩进
set softtabstop=4
set shiftwidth=4   "#配置自动缩进的字符数目
set autoindent
set cindent
set scrolloff=6

set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set nohls
set incsearch
set ignorecase

" 代码折叠
set foldmethod=indent
" 打开nvim时不折叠代码 
set nofoldenable

set relativenumber
set wildmenu
set foldmethod=manual

"#修改一个文件后，自动进行备份，备份的文件名为原文件名加“~“后缀
if has("vms")
   set nobackup
else
   set backup
endif


"""""""""""""
"
" # KeyMap
"
"""""""""""""
noremap R :source $MYVIMRC<cr>
let mapleader = " "

map <C-S-a> ggVG
vmap <C-S-c> "+y
vmap <C-S-v> "+p
nmap <C-S-v> "+p
imap <C-S-v> <ESC>"+pa

set ttimeoutlen=100

noremap K 5k
noremap J 5j

inoremap jk <ESC>

imap <c-s> <ESC>:w<cr>a
nmap <c-s> :w<cr>
vmap <c-s> :w<cr>

noremap tn :tabnew<cr>
noremap tc :tabclose<cr>
map <A-h> :tabn<cr>
map <A-l> :tabp<cr>


map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

" #noremap <LEADER>j <c-w>j<CR>
" #noremap <LEADER>h <c-w>h<CR>
" #noremap <LEADER>l <c-w>l<CR>
" #noremap <LEADER>k <c-w>k<CR>

noremap <LEADER>j :bn<CR>
noremap <LEADER>h :bp<CR>

" resize
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>

" 窗口相关快捷键
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

"窗口缩放
map _ :res -5<CR>
map + :res +5<CR>
map - :vertical :res-5<CR>
map = :vertical :res+5<CR>

" 关闭窗口
nnoremap <silent> q <esc>:close<cr>
vnoremap <silent> q <esc>:close<cr>

" 使用回车打开关闭折叠
"nnoremap <CR> za
" shift enter，为何不可以？
nnoremap <S-Return> zMzo
" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" 使用alt q关闭当前buffer
nnoremap <M-q> <esc>:bdelete<cr>

" 去除EX模式
nmap Q <nop>
" 使用Q进行宏录制
noremap Q q

nmap << <<_
nmap >> >>_

nnoremap ! :!

" 跳转到最后
" 0是跳转到开头
nnoremap 9 $

" 新建终端
nnoremap <leader>tt :terminal<cr>

" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
" inoremap <M-h> <HOME>
inoremap <M-h> <esc>^i
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction
" noremap <silent> <space><space> <esc>:call common#functions#Wall()<cr>
" noremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
" xnoremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
noremap <silent> <space><space> <esc>:silent! write<cr>
xnoremap <silent> <space><space> <esc>:silent! write<cr>

" 复制到末尾
"nnoremap Y y$
"nnoremap vv ^vg_
autocmd BufEnter * silent! :lcd%:p:h
set autochdir 

nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>

map <leader>o <ESC>:call OpenFileLocation()<CR>


" ===
" === markdown 锚点
" ===
autocmd Filetype * inoremap <buffer> <silent> ,, <++>
autocmd Filetype * inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype * nnoremap ,f /<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> <silent> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> <silent> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
autocmd Filetype markdown inoremap <buffer> <silent> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a


call plug#begin('~/.vim/plugged')
   Plug 'scrooloose/nerdtree'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'junegunn/vim-easy-align'
   " Plug 'bling/vim-bufferline'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'kien/ctrlp.vim'
   Plug 'FelikZ/ctrlp-py-matcher'

   Plug 'mbbill/undotree'
   Plug 'ryanoasis/vim-devicons'
   Plug 'voldikss/vim-floaterm'
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   Plug 'voldikss/fzf-floaterm'
   Plug 'tpope/vim-surround'
   Plug 'terryma/vim-multiple-cursors'
   " Plug 'tpope/vim-commentary'
   Plug  'scrooloose/nerdcommenter'
   Plug 'gcmt/wildfire.vim'
   " Plug 'flazz/vim-
   "
   "  scolorschemes'
  " Plug 'itchyny/lightline.vim'
   Plug 'easymotion/vim-easymotion'
   " Plug 'sonph/onehalf', { 'rtp': 'vim' }
   Plug 'ful1e5/onedark.nvim'
   Plug 'jbyuki/venn.nvim'
   Plug 'mileszs/ack.vim'
   Plug 'jbyuki/venn.nvim'
   Plug 'mhinz/vim-startify'
   Plug 'xiyaowong/nvim-transparent'
   Plug 'majutsushi/tagbar'
call plug#end()












map tt :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=25
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeIndicatorMapCustom = {
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
" }}}
"
"

set laststatus=2    " 始终显示状态栏
" Airline
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled=1    " 开启 tab 栏




" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }



" set background=dark
"set background=light
" colorscheme synthwave84

" colorscheme onehalflight
" let g:lightline.colorscheme='onehalfdark'


" colorscheme onedark



let g:floaterm_keymap_new = '<Leader>ft'


map <F1> :FloatermNew<cr>
command! Rg FloatermNew --width=0.8 --height=0.8 rg
command! FZF FloatermNew fzf'
command! Ranger FloatermNew ranger


" 搜索完后不自动跳到第一个结果文件
cnoreabbrev Ack Ack!
" 设置搜索快捷键为<leader> + a
nnoremap <Leader>a :Ack!<CR>
" ack的选项设置
let g:ack_default_options = " -s -H --nocolor --nogroup --column --smart-case --follow"
" 如果不输入任何搜索参数，则默认以光标下的单词为搜索条件，并把它映射到<leader> + s上
nnoremap <leader>s :Ack!<CR>
" 高亮搜索结果
let g:ackhighlight = 1




nmap ss <Plug>(easymotion-s2)




let g:airline_theme="molokai" 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

 "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
 nnoremap <tab> :bn<CR>
 nnoremap <C-tab> :bp<CR>
 " 关闭状态显示空白符号计数
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'
 " 设置consolas字体"前面已经设置过
 "set guifont=Consolas\ for\ Powerline\ FixedD:h11
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " old vim-powerline symbols
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'


  "undotree
nnoremap <F6> :UndotreeToggle<cr>
set undodir=~/.undodir/
set undofile



nmap <F8> :TagbarToggle<CR>

