" Ant's vimrc file.
" vim: set foldmarker={{,}}  foldmethod=marker nospell:
"
if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

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

" Text manipulation
Bundle 'https://github.com/vim-scripts/textmanip.vim.git'
" Key: mj - move line down
" Key: mk - move line up
" Key: Mj - dup line down
" Key: Mk - dup line up
" toggle insert/replace with <F10>
" {{
nmap mj <S-v>mj
xmap mj <Plug>(textmanip-move-down)<ESC>
nmap mk <S-v>mk
xmap mk <Plug>(textmanip-move-up)<ESC>
xmap mh <Plug>(textmanip-move-left)
xmap ml <Plug>(textmanip-move-right)
nmap Mj <S-v>Mj
xmap Mj <Plug>(textmanip-duplicate-down)<ESC>
nmap Mk <S-v>Mk
xmap Mk <Plug>(textmanip-duplicate-up)<ESC>
nmap <F10> <Plug>(textmanip-toggle-mode)
xmap <F10> <Plug>(textmanip-toggle-mode)
" }}

" Yank Ring
" Bundle 'https://github.com/vim-scripts/YankRing.vim.git'
" nnoremap <silent> <F11> :YRShow<CR>

" Swift language support
Bundle 'https://github.com/Keithbsmiley/swift.vim.git'

" Restart vim with :Restart
Bundle 'https://github.com/tyru/restart.vim.git'

" 'Function' text object ('f')
Bundle 'https://github.com/kana/vim-textobj-function.git'

" 'argument' text object ('a')
Bundle 'https://github.com/vim-scripts/argtextobj.vim.git'

" Voom outliner
" Use ':Voom markdown' for markdown
Bundle 'https://github.com/vim-scripts/VOoM.git'

" original repos on github
Bundle 'http://www.github.com/sukima/xmledit'

" Add user-defined text objects
Bundle 'https://github.com/kana/vim-textobj-user.git'

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
" Key: <F1> - toggle
" {{
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
" CTRL 1 opens tree
map <F1> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_smart_startup_focus = 2 " Focus on file after opening
"Open tree if no files specified when opening vim
"autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeShowHidden=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=30
" Diable arrows if there are rendering issues
"let g:NERDTreeDirArrows=0
" Close vim if it's the NERDTree is the only window left
augroup nerdTree
    autocmd!
    autocmd vimenter * if argc() | NERDTreeClose | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
" }}



" NERDTree tabs
Bundle 'https://github.com/jistr/vim-nerdtree-tabs.git'

Bundle 'https://www.github.com/kien/ctrlp.vim.git'
" {{
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
" }}

Bundle 'http://www.github.com/majutsushi/tagbar'
" <leader>t - toggle tagbar {{
let g:tagbar_width=50
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
let g:tagbar_autofocus = 1
let g:tagbar_expand =0
let g:tagbar_singleclick = 0
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1

nmap <silent> <leader>t :TagbarToggle<CR>
nmap <silent> _tt :TagbarToggle<CR>
" }}

Bundle 'http://www.github.com/altercation/vim-colors-solarized'
" Tmux integration
Bundle 'http://www.github.com/xaviershay/tslime.vim'
" Git mirror of abudden's TagHighlight -- seems to be updated regularly
Bundle 'https://github.com/qiulin/TagHighlight.git'
Bundle 'https://www.github.com/scrooloose/syntastic'
" Syntastic config 
" \e -- active mode
" \s -- toggle syntastic mode
" {{
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'php', 'python'],
                           \ 'passive_filetypes': ['puppet'] }
" Turn off flake8 checking -- annoying
let g:syntastic_python_checkers = ['python']
map <silent> <Leader>e :Errors<CR>
map <silent> <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open = 1
" }}

Bundle 'http://www.github.com/vim-scripts/vcscommand.vim'
Bundle 'http://www.github.com/vim-scripts/genutils'

" Mustache template language
Bundle 'https://github.com/mustache/vim-mustache-handlebars.git'

" SESSION PLUGIN
" Provide 'OpenSession' 'SaveSession' with tab completion. Saves sessions in
" ~/.vim/session
Bundle 'https://github.com/xolox/vim-session.git'
" Session config {{
let g:session_autoload = 'no'
" }}
Bundle 'https://github.com/xolox/vim-misc.git'

" BUFFER EXPLORER PLUGIN
" <leader>be to show all buffers, and allow navigation
Bundle 'https://github.com/jlanzarotta/bufexplorer.git'
Bundle 'https://www.github.com/mileszs/ack.vim'
Bundle 'http://www.github.com/vim-scripts/a.vim'
" * <C-S-a> to :A
" * Alternatives for '.m' and '.h'
" Alternate-file config {{
let g:alternateExtensions_C = "h,H,HPP,hpp"
let g:alternateExtensions_h = "m,C,cpp,c++,c"
let g:alternateExtensions_m = "h,hpp"
noremap <silent> <C-S-a> :A<CR>
" }}


" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'https://www.github.com/fs111/pydoc.vim'
Bundle 'https://github.com/hynek/vim-python-pep8-indent.git'
Bundle 'https://github.com/suprsvn/vim-PythonTidy.git'
" PythonTidy config {{
au FileType python set formatprg=~/script/pythontidy
noremap <F11> gggqG
" }}

" Gist support
" :Gist <blah>
Bundle 'http://github.com/mattn/webapi-vim'
Bundle 'http://github.com/mattn/gist-vim'
" Gist config {{
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
" }}

if ! has("win32unix")
" YouCompleteMe -- auto-completion
Bundle 'https://github.com/Valloric/YouCompleteMe'
" <C_Space> = complete 
" YCM setup {{
let g:ycm_confirm_extra_conf = 0 " Silently source the ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '/Users/ant/.ycm_extra_conf.py'
" Compatibility with UltiSnips
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_invoke_completion = '<C-Space>'
" DEBUG
let g:ycm_server_log_level='debug'
" If the initial directory contains a .ycm_extra_conf.py, set this as the 'global'
" ycm_extra_conf, accessible from any directory. This allows us to descend into
" symlinked directories, and still keep our YCM config
function! SetYcmGlobalConfig()
    if filereadable(".ycm_extra_conf.py")
        let g:ycm_global_ycm_extra_conf = getcwd() . '/' . '.ycm_extra_conf.py'
    endif
endfunc
augroup VimrcYouCompleteMe
    autocmd!
    autocmd VimEnter * call SetYcmGlobalConfig()
    autocmd FileType cpp nnoremap <silent> <C-]> :YcmCompleter GoToDeclaration<CR>
augroup END

" }}
endif


" Local vimrc files (.lvimrc)
" Add each project to the whitelist, below
Bundle 'https://github.com/embear/vim-localvimrc.git'
"let g:localvimrc_whitelist='/path/to/my/project/myproject'

" Enum to case statement
" To use :EnumToCase
Bundle 'https://github.com/vim-scripts/EnumToCase.git'

" Alignment in tabular format
" To use :Tabularize /<pattern>/ 
Bundle 'https://github.com/godlygeek/tabular.git'
" <Leader>a ('a'lign) for tabularize shortcuts {{
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }}

" File templates and snippets
Bundle 'https://github.com/tomtom/tlib_vim.git'
Bundle 'https://github.com/tomtom/tskeleton_vim.git'
" Tskeleton variables (e.g. username), auto-source for *.cpp, *.sh
" Abbreviate TSkeletonSetup to 'Sk', 'Ske', etc. {{
let g:tskelUserName = 'Anthony Dervish'
let g:tskelUserEmail = 'ant@dervishsoftware.com'
let g:tskelUserCompany = 'Dervish Software'
let g:tskelUserWWW = 'http://www.dervishsoftware.com'
let g:tskelMapHyperComplete = '<C-1>' " No hyper-complete shortcut (C-1 cannot be mapped) -- we want YCM to use <C-Space>

" I couldn't get TSkeleton to automatically find it's skeletons, so I use
" $HOME to specify the full path to the skeleton
augroup tskeleton
    autocmd!
    autocmd BufNewFile *main*.cpp :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/main.cpp"
    autocmd BufNewFile *.cpp      :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/basic.cpp"
    autocmd BufNewFile *.sh       :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/shell.sh"
    autocmd BufNewFile *.py       :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/main.py"
    autocmd BufNewFile CMakeLists.txt      :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/CMakeLists.txt"
augroup END

" Translate Sk<SPACE> into TSkeletonSetup
cnoreabbrev Sk TSkeletonSetup
cnoreabbrev Ske TSkeletonSetup
cnoreabbrev Skel TSkeletonSetup
cnoreabbrev Skeleton TSkeletonSetup
" }}


" MRU Files - Depends on tlib
" To use :TRecentlyUsedFiles, etc.
Bundle 'https://github.com/tomtom/tmru_vim.git'
" Key: <leader>ru toggle TMRU
" Key: *<F2> toggle
" {{
noremap <leader>r :TMRU<CR>
map <F2> :TMRU<CR>
" }}

" Haskell
Bundle 'https://github.com/vim-scripts/Superior-Haskell-Interaction-Mode-SHIM.git'
" Lushtags for haskell integration with tagbar
if ! has("win32unix")
    Bundle 'https://github.com/bitc/lushtags.git'
endif
Bundle 'https://github.com/raichoo/haskell-vim.git'
" From https://github.com/raichoo/haskell-vim
" {{
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
" }}

" SingleCompile
Bundle 'https://github.com/xuhdev/SingleCompile.git'
" Setup clang {{
call SingleCompile#SetCompilerTemplate('c', 'clang', 'Clang C Compiler',
            \'clang', '-g -Wno-deprecated-declarations -o $(FILE_TITLE)$', g:SingleCompile_common_run_command)
call SingleCompile#SetCompilerTemplateByDict('c', 'gcc', {
            \ 'pre-do'  : function('SingleCompile#PredoGcc'),
            \ 'priority' : 10,
            \ 'out-file': g:SingleCompile_common_out_file
            \})
call SingleCompile#SetCompilerTemplate('cpp', 'clang++', 'Clang C++ Compiler',
            \'clang++', '-g -std=c++11 -stdlib=libc++ -Wno-deprecated-declarations -o $(FILE_TITLE)$', g:SingleCompile_common_run_command)
call SingleCompile#SetCompilerTemplateByDict('c', 'gcc', {
            \ 'pre-do'  : function('SingleCompile#PredoGcc'),
            \ 'priority' : 10,
            \ 'out-file': g:SingleCompile_common_out_file
            \})
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_silentcompileifshowquickfix = 1
" }}

" Ag -- ack replacement
Bundle 'https://github.com/rking/ag.vim.git'

" DirDiff
" Bundle 'https://github.com/zhaocai/DirDiff.vim.git'
" let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*.git,.DS_Store"

" Add on actions
" Requires tlib
Bundle 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Bundle 'https://github.com/MarcWeber/vim-addon-actions.git'

" Surround
Bundle 'https://github.com/tpope/vim-surround.git'

" Airline enhanced status line
Bundle 'https://github.com/bling/vim-airline.git'
" If powerline-fonts is installed, auto-detect them with this setting... {{
" Powerline-fonts: git clone https://github.com/Lokaltog/powerline-fonts.git
let g:airline_powerline_fonts = 1
" }}

" Seek plugin, remaps 's' to do a 2-character version of 'f'
Bundle 'https://github.com/goldfeld/vim-seek.git'

" Ultisnips
Bundle 'https://github.com/SirVer/ultisnips.git'
" * YCM compatibility functions 
" * Configure <tab> and <c-e>
" {{
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
        call UltiSnips#ExpandSnippet()
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
    call UltiSnips#JumpForwards()
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
augroup ultisnips
    autocmd!
    au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpForwardTrigger . " <C-R>=g:UltiSnips_Tab()<cr>"
augroup END
" }}

" VimShell
Bundle 'http://github.com/Shougo/vimproc'
Bundle 'https://github.com/Shougo/vimshell.vim.git'

" Fugitive -- git plugin
" Adds 'Git...' commands
Bundle 'https://github.com/tpope/vim-fugitive.git'

" Undo Tree
Bundle 'https://github.com/mbbill/undotree.git'
" Key: <leader>ut to toggle
" Undo Tree config {{
nnoremap <leader>ut :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif
" }}

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
" Key: * + <Plug>(expand_region_expand)
" {{
map - <Plug>(expand_region_shrink)
" }}

" vim-multiple-cursors
" In normal mode, Ctrl-n highlights further occurrences of the word under the
" cursor, Ctrl-p unhighlights the last instance. Then use a,s,I, etc. to make
" a change. Ctrl-n in visual mode puts a cursor on every line of the visual
" selection, and live updates the text
Bundle 'https://github.com/terryma/vim-multiple-cursors.git'

" vim-startify
" Better start screen
Bundle 'https://github.com/mhinz/vim-startify.git'

Bundle 'https://github.com/rhysd/vim-clang-format.git'
" Personal clang-format style and mappings {{
let g:clang_format#style_options = {
            \ "BasedOnStyle" : "llvm",
            \ "ColumnLimit" : 0,
            \ "IndentWidth" : 8,
            \ "ContinuationIndentWidth" : 8,
            \ "MaxEmptyLinesToKeep" : 3,
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}
" Map '=' to clang-format
augroup clangFormat
    au!
    au FileType objc* :map = <Plug>(operator-clang-format) 
    au FileType c :map = <Plug>(operator-clang-format) "{{
    au FileType cpp :map = <Plug>(operator-clang-format) "}}
augroup END
" }}


" ZenRoom distraction-less Writing
Bundle 'https://github.com/junegunn/goyo.vim.git'
Bundle 'https://github.com/amix/vim-zenroom2.git'
" Key: <Leader>z enters 'zen' mode
" ZenRoom config {{
noremap <Leader>z :Goyo 120<CR>
" }}

" Tube plugin for mac
if has("gui_macvim")
    Bundle 'https://github.com/gcmt/tube.vim'
endif

" Smart auto-complete braces
Bundle 'https://github.com/jiangmiao/auto-pairs.git'

" Window identification
Bundle 'https://github.com/t9md/vim-choosewin.git'
" Key: '-' in normal mode to highlight window labels
" {{
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable=1 " Cool large-letter overlays
" }}

" Enhanced C++ Highlighting
Bundle 'https://github.com/antmd/vim-cpp-enhanced-highlight.git'

" --------------------------------------------------------------------------------
" Functions
" --------------------------------------------------------------------------------

function! MakeViewCheck()
    " {{
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        " We're in a temp dir
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        " Also in temp dir
        return 0
    endif
    if index(g:skipview_files, expand('%')) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction
" }}

" Use F2 to toggle recent files
function! ToggleHlSearch()
    " {{
    if (&hlsearch == 1)
        set nohlsearch
    else
        set hlsearch
    endif
endfunc
" }}

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
    " {{
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?\s*{\?\s*$"
  hi cppFuncDef ctermfg=white cterm=bold,undercurl guifg=white gui=bold,undercurl
  set errorformat+=%-G%f\|%l\|\ %tarning:\ missing\ initializer\ for\ member
endfunction
" }}

function! SourceVimPathsIfExist()
    " {{
   if filereadable("vim.setpath")
       exe "runtime! vim.setpath"
   endif
endfunction
" }}

" Create directories needed by vim backups, swap, undo
function! InitializeDirectories() 
" {{
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
              \ 'backup': 'backupdir', 
              \ 'views': 'viewdir', 
              \ 'swap': 'directory', 
              \ 'undo': 'undodir' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction " }}

" Show syntax element name under cursor
function! <SID>SynStack()
    " {{
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}

" Relative line numbering, with the current absolute line number for the cursor line
function! RelativeNumbering()
    " {{
    set relativenumber
    set number
endfunc
" }}

" Absolute line numbering
function! AbsoluteNumbering()
    " {{
    set number
    set norelativenumber
endfunc
" }}

" Toggle between absolute and relative line numbering
function! NumberToggle()
    " {{
  if(&relativenumber == 1)
      call AbsoluteNumbering()
  else
      call RelativeNumbering()
  endif
endfunc
" }}

" Do a 'ptag' to open the tag for the current word in a preview window
function! GoToTagInPreviewWindow()
    " {{
    let l:CurrentWord = expand("<cword>")
    exec "ptag ".l:CurrentWord
endfunc
" }}


" Command 'To' -- use Apparix bookmarks to jump to directory
command! -complete=custom,BmCe -nargs=1 To :call BmTo('<args>')
" {{ Apparix command 'To' related functions
" From  http://www.64k-tec.de/2011/05/tt-console-navigation-the-easy-way-with-apparix/
function! BmCe(A,L,P)
    return system("awk 'BEGIN{FS=","}/j,/{print $2}' ~/.apparixrc")
endfun
function! BmLs(dir)
    return system('apparix '.a:dir.' | tr -d "n"')
endfun
function! BmTo(dir)
    execute ':cd '.BmLs(a:dir)
endfun
" }}


filetype plugin indent on     " required! 


" --------------------------------------------------------------------------------
" Settings
" --------------------------------------------------------------------------------

" Complete options (disable preview scratch window, longest removed to aways " show menu) set completeopt=menuone,menu,longest,preview
 " Limit popup menu height
set pumheight=20
" Warning 'preview' on MacVim causes crashes
set completeopt=menu,longest
 
if has('conceal')
    set conceallevel=2
    set concealcursor=vin
endif

" Search for files called 'tags', up to four directory levels above the
" current directory
set tags=./tags;../../../../../../

" Taglist highlights to match the dark Koehler color scheme

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
set undofile " Persistent undo !
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set splitright " Open vertical-split to right of current pane
set splitbelow " Open horiontal-split below current pane

" Set up tabs to use spaces
set shiftwidth=4   " Number of spaces to use for the (auto)indent step
set tabstop=4       " Number of spaces per tab
set expandtab      " Use 'shiftwidth' for tab
set noswapfile


" LINE NUMBERING
" --------------
" Relative line numbering for normal mode, otherwise absolute line numbering
nnoremap <silent> <leader>l :call NumberToggle()<cr>
call RelativeNumbering()

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
set history=50      " keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd      " display incomplete commands
set incsearch      " do incremental searching
set ts=4      " tab stops = four spaces
set vb        " Visual Bell rather than annoying beep
set cursorline " Highlight current line

set textwidth=0   " Limit width of text to 80
set wrapmargin=0 " No wrapping
set nowrap 

set path+=./include,./include/ide
set path+=./generated
set path+=/usr/include/c++/4.1.2/**,/usr/local/include/**,/usr/lib/gcc/x86_64-redhat-linux/4.1.2/include/**,/usr/include/**,/opt/ats/Ice-3.4.2/include,/opt/ats/boost/boost_1_42_0/include

" Use ack instead of grep
set grepprg=ag\ --all-text\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" Auto load/save 'view' -- the set of folds in a current buffer
let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]
" Abbreviations
iabbrev //--- // ------------------------------------------------------------------------------------
iabbrev //=== // ====================================================================================


"---------------------------
" Misc
"---------------------------
 
" When editing a file, always jump to the last cursor position
augroup cursor_restore
    au!
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif
augroup END
 
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

 
" --------------------------------------------------------------------------------
" Key Maps
" --------------------------------------------------------------------------------

"clearing highlighted search
nnoremap <silent> <leader>/ :call ToggleHlSearch()<CR>

" move within long lines
noremap j gj
noremap k gk
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
 
noremap <silent> <D-]> :call GoToTagInPreviewWindow()<CR>
 
" <leader> space on a fold to fold/unfold
nnoremap <silent> <leader><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

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
 
" Command mode emacs-like bindings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
command! CD cd %:p:h

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

let tab_lastvisited=2
noremap <silent> <C-a><C-a> :exe "tabn " tab_lastvisited<CR>
inoremap <silent> <C-a><C-a> <ESC>:exe "tabn " tab_lastvisited<CR>
noremap <silent> <C-a><SPACE> :exe "tabnext"<CR>
inoremap <silent> <C-a><SPACE> <ESC>:exe "tabnext"<CR>
noremap <silent> <C-a>c :exe "tabnew"<CR>
inoremap <silent> <C-a>c <ESC>:exe "tabnew"<CR>
noremap <silent> <C-a>1 :tabn 1<CR>
noremap <silent> <C-a>2 :tabn 2<CR>
noremap <silent> <C-a>3 :tabn 3<CR>
noremap <silent> <C-a>4 :tabn 4<CR>
noremap <silent> <C-a>5 :tabn 5<CR>
noremap <silent> <C-a>6 :tabn 6<CR>
noremap <silent> <C-a>7 :tabn 7<CR>
noremap <silent> <C-a>8 :tabn 8<CR>
noremap <silent> <C-a>9 :tabn 9<CR>
inoremap <silent> <C-a>1 <ESC>:tabn 1<CR>
inoremap <silent> <C-a>2 <ESC>:tabn 2<CR>
inoremap <silent> <C-a>3 <ESC>:tabn 3<CR>
inoremap <silent> <C-a>4 <ESC>:tabn 4<CR>
inoremap <silent> <C-a>5 <ESC>:tabn 5<CR>
inoremap <silent> <C-a>6 <ESC>:tabn 6<CR>
inoremap <silent> <C-a>7 <ESC>:tabn 7<CR>
inoremap <silent> <C-a>8 <ESC>:tabn 8<CR>
inoremap <silent> <C-a>9 <ESC>:tabn 9<CR>
" Map \ff to 'Find File' -- when cursor is over a filename (e.g. include,
" print which file it matches in the search path
nnoremap <silent> <leader>ff  :echo globpath(&path, expand('<cfile>'))<CR>
" <leader>s -- show syntax element and syntax file for cursor position
nnoremap <leader>s :call <SID>SynStack()<CR>


" --------------------------------------------------------------------------------
" Auto Commands
" --------------------------------------------------------------------------------

augroup miscAutoCommands
    autocmd!
    " Always open QuickFix window at the bottom, spanning window width
    autocmd FileType qf wincmd J
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost l* nested lwindow
    let s:default_path = escape(&path, '\ ') " store default value of 'path'

    " Always add the current file's directory to the path and tags list if not
    " already there. Add it to the beginning to speed up searches.
    autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

    " special statusbar for special windows
    au FileType qf
            \ if &buftype == "quickfix" |
            \ setlocal statusline=%2*%-3.3n%0* |
            \ setlocal statusline+=\ \[Compiler\ Messages\] |
            \ setlocal statusline+=%=%2*\ %<%P |
            \ endif

    " For all text files set 'textwidth' to 78 characters.
    " Bold white comments (against all received wisdom)
    " autocmd FileType * hi comment guifg=White gui=Bold
    " autocmd FileType * hi Special gui=underline
    au BufNewFile,BufRead SCons* set filetype=scons
    au Syntax cpp call EnhanceCppSyntax()

    " Implement GNU Screen like keyboard shortcuts
    au TabLeave * let tab_lastvisited=tabpagenr()
    autocmd  VimEnter  * :call SourceVimPathsIfExist()
augroup END

" Autosave & Load Views (folds, cursor position, etc.)
augroup vimrcAutoView
    autocmd!
    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
augroup end

" Automatically source vimrc on save.
autocmd! bufwritepost .vimrc source $MYVIMRC

filetype plugin on
filetype indent on

" Create directories for vim backup, swap, undo, history
call InitializeDirectories() 


" --------------------------------------------------------------------------------
" Theme
" --------------------------------------------------------------------------------

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
hi Folded guibg=#404040 gui=bold
hi FoldColumn guibg=#404040 guifg=cyan
hi MyTagListFileName guibg=#404040 gui=bold
hi Pmenu         ctermfg=0 ctermbg=2
hi PmenuSel      ctermfg=0 ctermbg=7
hi PmenuSbar     ctermfg=7 ctermbg=0
hi PmenuThumb    ctermfg=0 ctermbg=7

if has("gui_running")
    let g:solarized_diffmode="normal"    "default value is normal
else
" Do not interfere with the terminal colors -- they should already be set to Solarized
    hi Normal ctermbg=NONE
    hi statement ctermbg=NONE ctermfg=3
    hi todo ctermbg=NONE
    hi comment ctermfg=green ctermbg=black cterm=none
    hi LineNr ctermbg=black ctermfg=black
endif
colorscheme solarized

set background=dark
syntax enable

if has("win32unix")
    " Do something only in Cygwin
    " Mintty block cursor for vim
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif


if has("mac")
    runtime config/Mac.vim
elseif has("win32")
    runtime config/Windows.vim
endif
