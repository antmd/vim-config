"if has("unix") && strpart(system("/usr/bin/uname -s"),0,6) == "Darwin" && !exists('g:HasInitialisedObjc')
if !exists('g:HasInitialisedObjc')
    let g:HasInitialisedObjc = 1
    " Do Mac stuff here
    "



function BufferIsApp()
    let l:isApp = 0
    if match( expand('%:p:h:t'), '.*App$' ) >=0 || match( expand('%:p:h:t'), '.*Gui$' ) >=0 
        let l:isApp = 1
    endif
    return l:isApp
endfunction

function BufferIsCpp()
    let l:isCpp = 0
    if match( expand('%:p:h:t'), '.*Cpp$' ) >=0 || match( expand('%:p:h:t'), '.*C++$' ) >=0 
        let l:isCpp = 1
    endif
    return l:isCpp
endfunction


function SourceSkeletonForMainFile(extension)
    if BufferIsApp()
        :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/appkit-main.".a:extension
    else
        :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/foundation-main.".a:extension
    endif
endfunction

augroup objcObjc
    autocmd!
    " Otherwise .m is used for 'MatLab'
    au BufEnter *.m set filetype=objc
    au BufEnter *.mm set filetype=objcpp
augroup END

"-----------------------------------------------------------------------------------
" TSkeleton
"-----------------------------------------------------------------------------------
"
" WARNING: These rules should appear in decreasing order of 'specific-ness'
augroup tskeletonObjc
    autocmd!
    autocmd BufNewFile main.mm  call SourceSkeletonForMainFile('mm')
    autocmd BufNewFile main.m   call SourceSkeletonForMainFile('m')
augroup END



"-----------------------------------------------------------------------------------
" Tagbar Config for Objective-C
"-----------------------------------------------------------------------------------
"
"" BEGIN copied from http://www.daskrachen.com/2011/12/how-to-make-tagbar-work-with-objective.html
" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

runtime config/InsertObjCBracket.vim
endif

