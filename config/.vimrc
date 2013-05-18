" Ant's vimrc file.

" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif
"
"
let g:alternateSearchPath = 'sfr:./src,sfr:./include,wdr:./src,wdr:./include,sfr:../source,sfr:../src,sfr:../include,sfr:../inc' 

"--------------------------------------------------------------------------------
" VUNDLE
"--------------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

" Note, need to create .vim on Windows, as well.
" See https://github.com/gmarik/vundle/wiki/Vundle-for-Windows for setup on windows
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()




" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'http://www.github.com/sukima/xmledit'


" EASYMOTION PLUGIN
" Provides <leader><leader>w to highlight the start of all words,
" or <leader><leader>f<letter> to highglight all occurrences of <letter>
" then press the letter 'shortcut' to jump to the place you want.
Bundle 'http://www.github.com/Lokaltog/vim-easymotion'

" CONQUE-TERM PLUGIN
" Terminal emulator in a vim split -- run top, etc.
"
" :ConqueTerm bash
" :ConqueTermSplit mysql -h localhost -u joe -p sock_collection
" :ConqueTermTab Powershell.exe
" :ConqueTermVSplit C:\Python27\python.exe
Bundle 'https://github.com/dhazel/conque-term.git'

Bundle 'http://www.github.com/scrooloose/nerdcommenter'
Bundle 'http://www.github.com/scrooloose/nerdtree'
Bundle 'http://www.github.com/ervandew/supertab'
Bundle 'https://www.github.com/kien/ctrlp.vim.git'
Bundle 'http://www.github.com/majutsushi/tagbar'
Bundle 'http://www.github.com/altercation/vim-colors-solarized'
" Bundle 'Rip-Rip/clang_complete'
" Tmux integration
Bundle 'http://www.github.com/xaviershay/tslime.vim'
Bundle 'http://www.github.com/abudden/TagHighlight'
Bundle 'https://www.github.com/scrooloose/syntastic'
Bundle 'http://www.github.com/vim-scripts/vcscommand.vim'
Bundle 'http://www.github.com/vim-scripts/genutils'

" SESSION PLUGIN
" Provide 'OpenSession' 'SaveSession' with tab completion. Saves sessions in
" ~/.vim/session
Bundle 'https://github.com/xolox/vim-session.git'

" BUFFER EXPLORER PLUGIN
" <leader>be to show all buffers, and allow navigation
Bundle 'http://www.github.com/vim-scripts/bufexplorer.zip'
Bundle 'https://www.github.com/mileszs/ack.vim'
Bundle 'http://www.github.com/vim-scripts/a.vim'

" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
Bundle 'https://www.github.com/fs111/pydoc.vim'


" ...

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

"   ___             _  ___                _     _       
"  / _ \ _ __  _ _ (_)/ __|___ _ __  _ __| |___| |_ ___ 
" | (_) | '  \| ' \| | (__/ _ \ '  \| '_ \ / -_)  _/ -_) 
"  \___/|_|_|_|_||_|_|\___\___/_|_|_| .__/_\___|\__\___|
"                                   |_|                 
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after -> let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"] " automatically open and close the popup menu / preview window au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Complete options (disable preview scratch window, longest removed to aways " show menu) set completeopt=menuone,menu,longest,preview
 " Limit popup menu height
set pumheight=20
 

"-----------------------------------------------------------------------------------
" a.vim
"-----------------------------------------------------------------------------------
let g:alternateExtensions_C = "h,H,HPP,hpp"
let g:alternateExtensions_h = "C,cpp,c++,c"

"-----------------------------------------------------------------------------------
" SYNTASTIC
"-----------------------------------------------------------------------------------
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'php', 'python'],
                           \ 'passive_filetypes': ['puppet'] }

"-----------------------------------------------------------------------------------
" NERDTree
"-----------------------------------------------------------------------------------
" CTRL N opens tree
map <C-n> :NERDTreeToggle<CR>
"Open tree if no files specified when opening vim
autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeDirArrows=0


"  ___                   _____     _    
" / __|_  _ _ __  ___ _ |_   _|_ _| |__ 
" \__ \ || | '_ \/ -_) '_|| |/ _` | '_ \ 
" |___/\_,_| .__/\___|_|  |_|\__,_|_.__/
"          |_|                          
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabContextDefaultCompletionType = "<c-p>"


"  ___ _      ___ _         ___ _                
" | _ (_)_ __| _ (_)_ __   / __| |__ _ _ _  __ _ 
" |   / | '_ \   / | '_ \ | (__| / _` | ' \/ _` |
" |_|_\_| .__/_|_\_| .__/  \___|_\__,_|_||_\__, |
"       |_|        |_|                     |___/ 
" SuperTab option for context aware completion let g:SuperTabDefaultCompletionType = "context"

" Tips for clang_complete
" -----------------------

" a) You must use headers from gcc 4.4 onwards: if you don't have gcc 4.4+, you can download the headers only
"    and point clang at them
" b) To debug gnomic issues with clang (you just get the error 'Completion not found'), you can add debug
"    code to the file plugin/libclang.py, function:

" def updateCurrentDiagnostics():
" ...
"   args = userOptionsGlobal + userOptionsLocal + parametersLocal
"   if debug:
"     print "LibClang args = {}".format(args)
" ...

" Then 
" 1) load a file, 
" 2) enter :let g:clang_debug=1, 
" 3) run ClangCheck in vim, 
" 4) use the ex command :messages to view the arguments passed to libclang

" Clang Complete Settings
" g:clang_user_options set at vimprj section 
let g:clang_use_library=1 
let g:clang_library_path = "/proj/fotech/pkgs/sunos-5.10-i86pc/llvm-3.2/lib"
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Configure what 'auto configuration' of the clang options clang_complete does.
" This is a comma-separated list of values 'path', 'gcc', 'clang', '.clang_complete', '<user>'
" 'gcc' and 'clang' are actually two <user> functions supplied as a convenience, and fill out
" the system includes for gcc or clang, automatically.
" '.clang_complete' means search upwards for a .clang_complete file, and if found use that for the options
let g:clang_auto_user_options='.clang_complete'
let g:clang_memory_percent=70
" You can either put your system header paths in 'clang_user_options', or in each .clang_complete you generate
let g:clang_user_options = '' 

if has('conceal')
    set conceallevel=2
    set concealcursor=vin
endif

let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'


" SuperTab completion fall-back for context aware completion
" (incompatible with g:clang_auto_select=0, using the above)
" let g:SuperTabContextDefaultCompletionType='<c-x><c-u><c-p>'

" Reparse the current translation unit in background
command Parse
\ if &ft == 'c' || &ft == 'cpp'   |
\   call g:ClangBackgroundParse() |
\ else                            |
\   echom 'Parse What?'           |
\ endif

" Reparse the current translation unit and check for errors
command ClangCheck
\ if &ft == 'c' || &ft == 'cpp'   |
\   call g:ClangUpdateQuickFix()  |
\ else                            |
\   echom 'Check What?'           |
\ endif



nmap <leader> b g:ClangUpdateQuickFix()


compiler gcc

" Load a file into a clojure repl
nmap silent <Leader>c :call Send_to_Tmux("\n\n\n(load-file \"./myfile.clj\")\n")<CR>


"--------------------------------------------------------------------------------
" Neocomplete config
"--------------------------------------------------------------------------------
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

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

" Use F2 to toggle search result highlighting
map <F2> :let &hlsearch=!&hlsearch<CR>
map <F3> :set syntax=cvs_cnfl<CR>

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
nnoremap <F7> :cprev<CR>
" F8 - CN 
nnorema <F9> :cnext<CR>
" F10 - Open quickfix window
noremap <F10> :bo cw<CR>
" F11 - Close quickfix window
noremap <F11> :ccl<CR>
 
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

" Nice menu font



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
        set gfn=Source\ Code\ Pro:h13
        set lines=105 columns=340
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

