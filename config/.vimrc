" Ant's vimrc file.
"
let g:alternateSearchPath = 'sfr:./src,sfr:./include,wdr:./src,wdr:./include,sfr:../source,sfr:../src,sfr:../include,sfr:../inc' 

"--------------------------------------------------------------------------------
" VUNDLE
"--------------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

" Note, need to create .vim on Windows, as well.
" See https://github.com/gmarik/vundle/wiki/Vundle-for-Windows for setup on windows
set rtp+=~/.vim/bundle/vundle/,~/.vim
call vundle#rc()




" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'http://www.github.com/sukima/xmledit'

" Add user-defined operators
Bundle 'https://github.com/kana/vim-operator-user.git'
" Adds ':Grex', ':Gred' and ':Grey' for delete, delete-line and yank based on
" the last successful search
Bundle 'https://github.com/kana/vim-grex.git'

" EASYMOTION PLUGIN
" Provides <leader><leader>w to highlight the start of all words,
" or <leader><leader>f<letter> to highglight all occurrences of <letter>
" then press the letter 'shortcut' to jump to the place you want.
Bundle 'http://www.github.com/Lokaltog/vim-easymotion'

Bundle 'http://www.github.com/scrooloose/nerdcommenter'
" NERDTree
Bundle 'http://www.github.com/scrooloose/nerdtree'
" NERDTree tabs
Bundle 'https://github.com/jistr/vim-nerdtree-tabs.git'

Bundle 'https://www.github.com/kien/ctrlp.vim.git'
Bundle 'http://www.github.com/majutsushi/tagbar'
Bundle 'http://www.github.com/altercation/vim-colors-solarized'
" Tmux integration
Bundle 'http://www.github.com/xaviershay/tslime.vim'
" Git mirror of abudden's TagHighlight -- seems to be updated regularly
Bundle 'https://github.com/qiulin/TagHighlight.git'
Bundle 'https://www.github.com/scrooloose/syntastic'
Bundle 'http://www.github.com/vim-scripts/vcscommand.vim'
Bundle 'http://www.github.com/vim-scripts/genutils'

" SESSION PLUGIN
" Provide 'OpenSession' 'SaveSession' with tab completion. Saves sessions in
" ~/.vim/session
Bundle 'https://github.com/xolox/vim-session.git'
Bundle 'https://github.com/xolox/vim-misc.git'

" BUFFER EXPLORER PLUGIN
" <leader>be to show all buffers, and allow navigation
Bundle 'http://www.github.com/vim-scripts/bufexplorer.zip'
Bundle 'https://www.github.com/mileszs/ack.vim'
Bundle 'http://www.github.com/vim-scripts/a.vim'

" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'http://www.github.com/klen/python-mode'
Bundle 'https://www.github.com/fs111/pydoc.vim'

" Gist support
" :Gist <blah>
Bundle 'http://github.com/mattn/webapi-vim'
Bundle 'http://github.com/mattn/gist-vim'

" YouCompleteMe -- auto-completion
Bundle 'https://github.com/Valloric/YouCompleteMe'

" Markdown support
"Bundle 'https://github.com/suan/vim-instant-markdown.git'
"Bundle 'https://github.com/tpope/vim-markdown.git'
"Bundle 'https://github.com/nelstrom/vim-markdown-folding.git'


" Local vimrc files (.lvimrc)
" Add each project to the whitelist, below
Bundle 'https://github.com/embear/vim-localvimrc.git'

" Enum to case statement
" To use :EnumToCase
Bundle 'https://github.com/vim-scripts/EnumToCase.git'

" Alignment in tabular format
" To use :Tabularize /<pattern>/ 
Bundle 'https://github.com/godlygeek/tabular.git'

" File templates and snippets
Bundle 'https://github.com/tomtom/tlib_vim.git'
Bundle 'https://github.com/tomtom/tskeleton_vim.git'
" MRU Files - Depends on tlib
" To use :TRecentlyUsedFiles, etc.
Bundle 'https://github.com/tomtom/tmru_vim.git'

" Haskell
Bundle 'https://github.com/vim-scripts/Superior-Haskell-Interaction-Mode-SHIM.git'

" SingleCompile
Bundle 'https://github.com/xuhdev/SingleCompile.git'

" Add on actions
" Requires tlib
Bundle 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Bundle 'https://github.com/MarcWeber/vim-addon-actions.git'

" Surround
Bundle 'https://github.com/tpope/vim-surround.git'

" Airline enhanced status line
Bundle 'https://github.com/bling/vim-airline.git'
" If powerline-fonts is installed, auto-detect them with this setting...
" Powerline-fonts: git clone https://github.com/Lokaltog/powerline-fonts.git
let g:airline_powerline_fonts = 1

" Seek plugin, remaps 's' to do a 2-character version of 'f'
Bundle 'https://github.com/goldfeld/vim-seek.git'

" Ultisnips
Bundle 'https://github.com/SirVer/ultisnips.git'

" VimShell
Bundle 'http://github.com/Shougo/vimproc'
Bundle 'https://github.com/Shougo/vimshell.vim.git'

" Fugitive -- git plugin
" Adds 'Git...' commands
Bundle 'https://github.com/tpope/vim-fugitive.git'

" Undo Tree
Bundle 'https://github.com/mbbill/undotree.git'
" <leader>ut to toggle
nnoremap <leader>ut :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

" Unimpaired
" ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious, etc.
" Linewise mappings [e and ]e exchange the current line with the one above or below it.
" Toggling options. [os, ]os, and cos perform :set spell, :set nospell, and :set invspell, respectively.
" [x and ]x encode and decode XML (and HTML). [u and ]u encode and decode URLs. [y and ]y do C String style escaping.
" yp or Yp enter append, or insert modes with 'set paste'. 
" lots more, see 'help unimpaired' 
Bundle 'https://github.com/tpope/vim-unimpaired.git'

" vim-expand-region
" + to expand region, - to shrink 
Bundle 'https://github.com/terryma/vim-expand-region.git'
"map + <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)
" ...

" vim-multiple-cursors
" In normal mode, Ctrl-n highlights further occurrences of the word under the
" cursor, Ctrl-p unhighlights the last instance. Then use a,s,I, etc. to make
" a change. Ctrl-n in visual mode puts a cursor on every line of the visual
" selection, and live updates the text
Bundle 'https://github.com/terryma/vim-multiple-cursors.git'

" vim-startify
" Better start screen
Bundle 'https://github.com/mhinz/vim-startify.git'

" Call clang-format from vim
Bundle 'https://github.com/rhysd/vim-clang-format.git'


filetype plugin indent on     " required! 

""" Custom Configs include.
" All custom config settings are stored in the .vim/config folder to
" differentiate them from 3rd-party libraries.
runtime! config/**/*.vim

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ " NOTE: comments after Bundle command are not allowed..

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Complete options (disable preview scratch window, longest removed to aways " show menu) set completeopt=menuone,menu,longest,preview
 " Limit popup menu height
set pumheight=20
" Warning 'preview' on MacVim causes crashes
set completeopt=menu,longest
 
"--------------------------------------------------
" Local vimrc
" See
" http://diffingdiffs.blogspot.co.uk/2012/09/jumping-to-template-files-in-vim.html
"--------------------------------------------------
let g:localvimrc_whitelist='/path/to/my/project/myproject'

"-----------------------------------------------------------------------------------
" TSkeleton
"-----------------------------------------------------------------------------------
let g:tskelUserName = 'Anthony Dervish'
let g:tskelUserEmail = 'ant@dervishsoftware.com'
let g:tskelUserCompany = 'Dervish Software'
let g:tskelUserWWW = 'http://www.dervishsoftware.com'
let g:tskelMapHyperComplete = '<C-1>' " No hyper-complete shortcut (C-1 cannot be mapped) -- we want YCM to use <C-Space>

" I couldn't get TSkeleton to automatically find it's skeletons, so I use
" $HOME to specify the full path to the skeleton
autocmd BufNewFile *main*.cpp :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/main.cpp"
autocmd BufNewFile *.cpp      :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/basic.cpp"
autocmd BufNewFile *.sh       :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/shell.sh"


"-----------------------------------------------------------------------------------
" YouCompleteMe
"-----------------------------------------------------------------------------------
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_confirm_extra_conf = 0 " Silently source the ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '/Users/ant/.ycm_extra_conf.py'
" Compatibility with UltiSnips
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_invoke_completion = '<C-Space>'

" DEBUG
" let g:ycm_server_log_level='debug'
" let g:ycm_server_use_vim_stdout = 1


"-----------------------------------------------------------------------------------
" UltiSnips
"-----------------------------------------------------------------------------------
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"

" Add our local snippets to the UltiSnips search path (which is runtimepath)
set rtp+=~/.vim/snippets

" YCM <-> UltiSnips Compatibility Routines
" Because YCM and UltiSnips both use TAB and Return, we need to be context-sensitive
" and do different things depending if:
" a) An UltiSnip suggestion is selected in the Pop-Up Menu, and we hit 'Return'
" b) We are in an UltiSnip completion with placeholders, and we hit 'Tab'
function! g:UltiSnips_Complete()
    if pumvisible()
        call UltiSnips_ExpandSnippet()
        if g:ulti_expand_res == 1
            return ""
        else
            return ""
        endif
    endif
    return ""
endfunction

" Install our custom RETURN handler
inoremap <silent> <Return> <C-R>=g:UltiSnips_Complete()<CR>

function! g:UltiSnips_Tab()
    " First try UltiSnips jump forwards
    call UltiSnips_JumpForwards()
    if g:ulti_jump_forwards_res == 0
        " Not in an UltiSnips completion context
        if pumvisible()
            return "\<C-n>" " YCM completion using first completion
        else
            return "\<TAB>"
        endif
    endif
    " UltiSnips has jumped to next placeholder
    return ""
endfunction

" Install our custom TAB handler
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpForwardTrigger . " <C-R>=g:UltiSnips_Tab()<cr>"

"-----------------------------------------------------------------------------------
" SingleCompile
"-----------------------------------------------------------------------------------
noremap <unique> <F8> :SingleCompile<cr>
noremap <unique> <F9> :SingleCompileRun<cr>
call SingleCompile#SetCompilerTemplate('c', 'clang', 'Clang C Compiler',
            \'clang', '-g -Wno-deprecated-declarations -o $(FILE_TITLE)$', g:SingleCompile_common_run_command)
call SingleCompile#SetCompilerTemplateByDict('c', 'gcc', {
            \ 'pre-do'  : function('SingleCompile#PredoGcc'),
            \ 'priority' : 10,
            \ 'out-file': g:SingleCompile_common_out_file
            \})


"-----------------------------------------------------------------------------------
" Clang format
"-----------------------------------------------------------------------------------
let g:clang_format#style_option = {'BasedOnStyle': 'llvm', 'IndentWidth': 4, 'ColumnLimit': 100, 'MaxEmptyLinesToKeep': 3, 'BreakBeforeBraces': 'Stroustrup', 'ContinuationIndentWidth': 8 }

"-----------------------------------------------------------------------------------
" a.vim
"-----------------------------------------------------------------------------------
let g:alternateExtensions_C = "h,H,HPP,hpp"
let g:alternateExtensions_h = "m,C,cpp,c++,c"
let g:alternateExtensions_m = "h,hpp"
noremap <silent> <C-S-a> :A<CR>

"-----------------------------------------------------------------------------------
" SYNTASTIC
"-----------------------------------------------------------------------------------
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php', 'python'],
                           \ 'passive_filetypes': ['puppet'] }

"-----------------------------------------------------------------------------------
" NERDTree
"-----------------------------------------------------------------------------------
" CTRL 1 opens tree
map <F1> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_smart_startup_focus = 2 " Focus on file after opening
"Open tree if no files specified when opening vim
"autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeDirArrows=0
" Close vim if it's the NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"--------------------------------------------------
" Gist
"--------------------------------------------------
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1

"--------------------------------------------------
" TMRU most recently used files
"--------------------------------------------------
noremap <leader>ru :TMRU<CR>
map <F2> :TMRU<CR>


if has('conceal')
    set conceallevel=2
    set concealcursor=vin
endif

compiler clang

" Load a file into a clojure repl
nmap silent <Leader>c :call Send_to_Tmux("\n\n\n(load-file \"./myfile.clj\")\n")<CR>

"--------------------------------------------------------------------------------

" Map \ff to 'Find File' -- when cursor is over a filename (e.g. include,
" print which file it matches in the search path
nmap <silent> <leader>ff  :echo globpath(&path, expand('<cfile>'))<CR>

"--------------------------------------------------------------------------------
" Configure CTRL-P
"--------------------------------------------------------------------------------
let g:ctrlp_extensions = ['tag', 'dir']
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn\|modules\/include$',
    \ 'file': '\.exe$\|\.so$\|\.dll$|\.os|\.o|\.a',
    \ 'link': 'some$\|bad$\|symbolic$\|links$',
    \ }


compiler gcc

"--------------------------------------------------------------------------------
" Configure NERDTree
"--------------------------------------------------------------------------------
"
" Open NERDTree if no other file is open
"autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <Leader>fe :NERDTreeToggle<CR>

" Otherwise FuzzyFinder sets this too low for easytags

"~~~~~~~~~~~~~~~~~~~
" Configure Tagbar
"~~~~~~~~~~~~~~~~~~~

let g:tagbar_width=50
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
let g:tagbar_autofocus = 1
let g:tagbar_expand =0
let g:tagbar_singleclick = 0
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1

nmap <silent> <leader>t :TagbarToggle<CR>
nmap <silent> _tt :TagbarToggle<CR>

" Search for files called 'tags', up to four directory levels above the
" current directory
set tags=./tags;../../../../../../


" Taglist highlights to match the dark Koehler color scheme

" Use man page lookup ':Man [<section>] <title>'
runtime! ftplugin/man.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
let do_syntax_sel_menu = 1
let mysyntaxfile="$HOME/tcl.vim"

" Don't have silly graphical menu
set go=ageimrLt

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set showmatch
set autoindent      " always set autoindenting on
set autoread       " Read file automatically when it has been changed outside vim
set autowrite      " Writes file automatically when moving to another file, or using 'make'
"set backupdir=~/vimbackup " Directory list to store backup files
set nobackup
set nowritebackup
set backupdir=

" Set up tabs to use spaces
set shiftwidth=4   " Number of spaces to use for the (auto)indent step
set tabstop=4       " Number of spaces per tab
set expandtab      " Use 'shiftwidth' for tab
set nonumber " line numbers on
set noswapfile


set foldmethod=syntax
set foldnestmax=5
set foldlevel=99 " Unfold everything


set laststatus=2   " Always a status line
" Enable modelines
set modeline modelines=10

" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding}, " encoding
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
set statusline+=%2*0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" special statusbar for special windows
au FileType qf
            \ if &buftype == "quickfix" |
            \ setlocal statusline=%2*%-3.3n%0* |
            \ setlocal statusline+=\ \[Compiler\ Messages\] |
            \ setlocal statusline+=%=%2*\ %<%P |
            \ endif


set history=50      " keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd      " display incomplete commands
set incsearch      " do incremental searching
set ts=4      " tab stops = four spaces
set vb        " Visual Bell rather than annoying beep

set textwidth=0   " Limit width of text to 80
set wrapmargin=0 " No wrapping
set nowrap 

" Abbreviations

iabbrev //--- //------------------------------------------------------------------------------------
iabbrev //=== //====================================================================================

" Use F2 to toggle recent files

" move within long lines
noremap j gj
noremap k gk
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
 
"---------------------------
" Tabs
"---------------------------
 
" also, gt/gT...
:nmap <A-PageUp>   :tabprevious<cr>
:nmap <A-PageDown> :tabnext<cr>
:map  <A-PageUp>   :tabprevious<cr>
:map  <A-PageDown> :tabnext<cr>
" note: requires XON/XOFF disabled! (`stty -ixon`)
:nmap <C-q>        :tabclose<cr>
 
" source $MYVIMRC reloads the saved $MYVIMRC
" <Leader> defaults to back-slash
":nmap <Leader>f :FufFile<cr>
":nmap <Leader>r :FufMruFile<cr>
":nmap <Leader>d :FufDir<cr>
":nmap <Leader>b :FufBuffer<cr>
":nmap <Leader>t :FufTag<cr>
":nmap <Leader>q :FufQuickfix<cr>
let g:fuf_modesDisable = [ 'mrucmd', ]



"---------------------------
" Command-line mappings
"---------------------------
" Uncrustify
function! Uncrustify()
    exe ":silent! 1,$!/devtools/bin/uncrustify -q -c /devtools//etc/uncrustify.cfg"
    "Correct a couple of stupid Uncrustify insertions
    " Get rid of copious spaces after function argument ,
    exe ":silent! %s/, \{5,}\([^\"]*\)$/\, \1/g"
    " Get rid of copious spaces after close brace
    exe ":silent! %s/\} \{5,}\(\/\/[^\"]*\)$/\} \1/g"
endfunc

:nmap <Leader>f :Uncrustify()
 
" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?\s*{\?\s*$"
  hi cppFuncDef ctermfg=white cterm=bold,undercurl guifg=white gui=bold,undercurl
  set errorformat+=%-G%f\|%l\|\ %tarning:\ missing\ initializer\ for\ member
endfunction

function! SourceVimPathsIfExist()
   if filereadable("vim.setpath")
       exe "runtime! vim.setpath"
   endif
endfunction

autocmd  VimEnter  * :call SourceVimPathsIfExist()

"---------------------------
" Misc
"---------------------------
 
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
 
" keep 50 lines of command line/search/etc history
set history=50
 
" ignore case, except if there's at least one upper-case character
" highlight search results
set ignorecase
set smartcase
set hlsearch
 
set diffopt+=iwhite

" WARN: When 'paste' mode is on, tab completion will not work
set pastetoggle=<F2>
 
" loose the BRGNCC
set novisualbell
set noerrorbells
 
"Show menu with possible completions
set wildmenu
 
" Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*/.hg/*,*/.svn/*

 
" [nvilc]noremap means no remapping of right hand side.
" where nvilc is normal, visual, insert, ... 
 
"--------------------------
" Tabs
"--------------------------
nmap <A-PageUp>   :tabprevious<cr>
nmap <A-PageDown> :tabnext<cr>
map  <A-PageUp>   :tabprevious<cr>
map  <A-PageDown> :tabnext<cr>
imap <A-PageUp>   <ESC>:tabprevious<cr>i
imap <A-PageDown> <ESC>:tabnext<cr>i


""-------------------------------------------------------------------------------
"" autocomplete parenthesis, brackets and braces
""-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
""
"vnoremap ( s()<Esc>P<Right>%
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%
""
 
 
" F7 - CP 
nnoremap ,p :cprev<CR>
" F8 - CN 
nnorema ,n :cnext<CR>
" F10 - Open quickfix window
noremap ,qo :bo cw<CR>
" F11 - Close quickfix window
noremap ,qc :ccl<CR>
 
" scroll down half a page w/ space, up with -
noremap <Space> <C-D>
nnoremap - <C-U>
 
" remap Ex-mode into reformatting the current paragraph in visual mode
" or the current paragraph in normal mode (plus following if count specified).
nnoremap Q gqap
vnoremap Q gq
 
" Move around in the windows and make them maximum size
" nnoremap <Left> <C-W>h<C-W>_:vertical resize 100001<CR>

" nnoremap <Right> <C-W>l<C-W>_:vertical resize 100000<CR>
" nnoremap <Down> <C-W>j<C-W>_
" nnoremap <Up> <C-W>k<C-W>_
" Move around in the windows
" nnoremap <Left> <C-W>h
" nnoremap <Right> <C-W>l
" nnoremap <Down> <C-W>j
" nnoremap <Up> <C-W>k

" Don't use Ex mode, use Q for formatting
map Q gq

map mf :!tkdiff -conflict <cfile><CR>

" Command mode emacs-like bindings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
command CD cd %:p:h


" Project Plugin
let g:proj_window_width=50
" c - close project window after selecting file
let g:proj_flags="mstc"
" \P to open project window
nmap <silent> <Leader>P <Plug>ToggleProject

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>


" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Filetype specific commands

" For all text files set 'textwidth' to 78 characters.
" Bold white comments (against all received wisdom)
" autocmd FileType * hi comment guifg=White gui=Bold
" autocmd FileType * hi Special gui=underline
au BufNewFile,BufRead SCons* set filetype=scons
au Syntax cpp call EnhanceCppSyntax()

" Implement GNU Screen like keyboard shortcuts
au TabLeave * let tab_lastvisited=tabpagenr()
let tab_lastvisited=2
map <silent> <C-a><C-a> :exe "tabn " tab_lastvisited<CR>
imap <silent> <C-a><C-a> <ESC>:exe "tabn " tab_lastvisited<CR>
map <silent> <C-a><SPACE> :exe "tabnext"<CR>
imap <silent> <C-a><SPACE> <ESC>:exe "tabnext"<CR>
map <silent> <C-a>c :exe "tabnew"<CR>
imap <silent> <C-a>c <ESC>:exe "tabnew"<CR>
map <silent> <C-a>1 :tabn 1<CR>
map <silent> <C-a>2 :tabn 2<CR>
map <silent> <C-a>3 :tabn 3<CR>
map <silent> <C-a>4 :tabn 4<CR>
map <silent> <C-a>5 :tabn 5<CR>
map <silent> <C-a>6 :tabn 6<CR>
map <silent> <C-a>7 :tabn 7<CR>
map <silent> <C-a>8 :tabn 8<CR>
map <silent> <C-a>9 :tabn 9<CR>
imap <silent> <C-a>1 <ESC>:tabn 1<CR>
imap <silent> <C-a>2 <ESC>:tabn 2<CR>
imap <silent> <C-a>3 <ESC>:tabn 3<CR>
imap <silent> <C-a>4 <ESC>:tabn 4<CR>
imap <silent> <C-a>5 <ESC>:tabn 5<CR>
imap <silent> <C-a>6 <ESC>:tabn 6<CR>
imap <silent> <C-a>7 <ESC>:tabn 7<CR>
imap <silent> <C-a>8 <ESC>:tabn 8<CR>
imap <silent> <C-a>9 <ESC>:tabn 9<CR>

" Always open QuickFix window at the bottom, spanning window width
autocmd! FileType qf wincmd J
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow

set path+=./include
set path+=./generated
set path+=/usr/include/c++/4.1.2/**,/usr/local/include/**,/usr/lib/gcc/x86_64-redhat-linux/4.1.2/include/**,/usr/include/**,/opt/ats/Ice-3.4.2/include,/opt/ats/boost/boost_1_42_0/include


filetype plugin on
filetype indent on

" Use ack instead of grep
set grepprg=ack\ --all-types\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m


" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1

"  _____ _                  
" |_   _| |_  ___ _ __  ___ 
"   | | | ' \/ -_) '  \/ -_)
"   |_| |_||_\___|_|_|_\___|
"                           

hi DiffText guibg=black

hi LineNr term=bold,reverse cterm=bold,reverse ctermfg=1 ctermbg=9 guibg=DarkGrey
hi Special gui=bold guifg=white
" Theme Settings
"set guifont=dina-10,-dec-terminal-medium-r-normal-*-*-140-*-*-c-*-iso8859-1
hi Normal guifg=#e0e0e0
" Highlight doxygen as normal comments
hi doxygenComment guifg=white gui=bold
hi doxygenBrief guifg=white gui=bold
hi doxygenPrev guifg=white gui=bold

" Folding stuff
hi Folded guibg=#404040 gui=bold
hi FoldColumn guibg=#404040 guifg=cyan

hi MyTagListFileName guibg=#404040 gui=bold

hi Pmenu         ctermfg=0 ctermbg=2
hi PmenuSel      ctermfg=0 ctermbg=7
hi PmenuSbar     ctermfg=7 ctermbg=0
hi PmenuThumb    ctermfg=0 ctermbg=7



if has("gui_running")
    colorscheme solarized
    let g:solarized_diffmode="normal"    "default value is normal
    if has("gui_mac") || has("gui_macvim")
        set gfn=Sauce\ Code\ Powerline:h13
        set lines=105 columns=340
        " Turn off bindings to the arrow-keys
        let macvim_skip_cmd_opt_movement = 1
        " Bind trackpad swipes to prev/next in jump list
        nmap <SwipeLeft> <C-o>
        nmap <SwipeRight> <C-i>
    else
        " Settings for crappy 15" monitors at work
        set gfn=Source_Code_Pro:h10:cANSI
        set lines=50 columns=200
    endif
else
" Do not interfere with the terminal colors -- they should already be set to Solarized
    hi Normal ctermbg=NONE
    hi statement ctermbg=NONE ctermfg=3
    hi todo ctermbg=NONE
    hi comment ctermfg=green ctermbg=black cterm=none
endif


set background=dark
syntax enable

runtime 'config/ObjectiveC.vim'
