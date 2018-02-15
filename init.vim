let mapleader = ","

syntax on
filetype plugin on
filetype indent on

set nocompatible
set number
set nospell
set encoding=utf-8
set termencoding=utf-8
set hlsearch
set incsearch
set scrolloff=10
set autoread
set backspace=indent,eol,start
set autoindent
set history=1000
set lazyredraw
set mouse=a
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

call plug#begin('~/.config/nvim/plugged')
"Plug 'twerth/ir_black'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'scrooloose/nerdcommenter'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript' ", { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx' ", { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'isRuslan/vim-es6'
Plug 'othree/html5.vim'
Plug 'wavded/vim-stylus'
Plug 'posva/vim-vue'
"Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/tsuquyomi'
Plug 'ternjs/tern_for_vim' ", { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs' ", { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim' ", { 'for': ['javascript', 'javascript.jsx'] }
Plug 'Galooshi/vim-import-js'
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'ahw/vim-hooks'
Plug 'rakr/vim-one'
Plug 'tpope/vim-abolish'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1


set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.pug
autocmd FileType javascript set softtabstop=2|set tabstop=2|set shiftwidth=2|set expandtab
"au BufNewFile,BufRead *.vue setf vue 
"autocmd BufNewFile,BufRead *.vue set filetype=html

"color ir_dark
"color ir_black
let g:one_allow_italics = 0
let g:airline_theme='one'
colorscheme one
set background=dark


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1 
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'varcheck', 'ineffassign', 'interfacer', 'unconvert', 'goconst', 'gas', 'gosimple', 'staticcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet']
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"let g:go_metalinter_command = 'gometalinter.v2'
let g:go_metalinter_deadline = "60s"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_decls_includes = "func,type"
set updatetime=1000

let g:ctrlp_user_command = [ '.git', 'cd %s && git ls-files' ]

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h11
        "set guifont=Inconsolata\ for\ Powerline:h15
    endif
endif

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"

" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=0

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_mode_map = { 'passive_filetypes': ['html', 'vue'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

let g:syntastic_html_tidy_ignore_errors = [ '<template> is not recognized!' ]

"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
"imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"au User CmSetup call cm#register_source({'name' : 'cm-css',
"        \ 'priority': 9, 
"        \ 'scoping': 1,
"        \ 'scopes': ['css','scss'],
"        \ 'abbreviation': 'css',
"        \ 'word_pattern': '[\w\-]+',
"        \ 'cm_refresh_patterns':['[\w\-]+\s*:\s+'],
"        \ 'cm_refresh': {'omnifunc': 'csscomplete#CompleteCSS'},
"        \ })

"highlight CursorLine cterm=None ctermbg=234 ctermfg=None
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

let g:nvim_typescript#vue_support=1
let g:vue_disable_pre_processors=1

