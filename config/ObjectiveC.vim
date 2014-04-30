if has("unix") && strpart(system("/usr/bin/uname -s"),0,6) == "Darwin" && !exists('g:HasInitialisedObjc')
    let g:HasInitialisedObjc = 1
    " Do Mac stuff here
    "
Bundle 'https://github.com/gilligan/vim-lldb.git'

"-----------------------------------------------------------------------------------
" Single Compile
"-----------------------------------------------------------------------------------
call SingleCompile#SetCompilerTemplate('objc', 
            \'ObjcCommandLineTool',
            \'Clang (Command Line Tool)',
            \'compileobjc', 
            \'$(FILE_NAME)$',
            \'runobjc')
call SingleCompile#SetOutfile('objc', 'ObjcCommandLineTool', g:SingleCompile_common_out_file)

call SingleCompile#SetCompilerTemplate('objc', 
            \'ObjcApplication',
            \'Clang (Application Bundle)',
            \'compileobjcapp', 
            \'$(FILE_NAME)$',
            \'runobjcapp')
call SingleCompile#SetOutfile('objc', 'ObjcApplication', g:SingleCompile_common_out_file)

call SingleCompile#SetCompilerTemplate('cpp', 
            \'CppExperiment',
            \'Clang (C++)',
            \'compileobjc', 
            \'$(FILE_NAME)$',
            \'runobjcapp')
call SingleCompile#SetOutfile('cpp', 'CppExperiment', g:SingleCompile_common_out_file)


" Otherwise .m is used for 'MatLab'
au BufEnter *.m set filetype=objc
au BufEnter *.mm set filetype=objc

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

function SetObjcCompilerForBuffer()
    if BufferIsApp()
        call SingleCompile#SetPriority('objc', 'ObjcApplication',1 )
        call SingleCompile#SetPriority('objc', 'ObjcCommandLineTool',2 )
        call SingleCompile#ChooseCompiler('objc', 'ObjcApplication')
    elseif BufferIsCpp()
        call SingleCompile#SetPriority('cpp', 'CppExperiment',1 )
        call SingleCompile#ChooseCompiler('cpp', 'CppExperiment')
    else
        call SingleCompile#SetPriority('objc', 'ObjcCommandLineTool',1 )
        call SingleCompile#SetPriority('objc', 'ObjcApplication',2 )
        call SingleCompile#ChooseCompiler('objc', 'ObjcCommandLineTool')
    endif
    " Add the 'Headers' directory to 'path'
    let l:headersPath = expand('%:p:h').'/Headers'
    if isdirectory(l:headersPath)
        :execute "set path-=".l:headersPath
        :execute "set path^=".l:headersPath
    endif
endfunction


function SourceSkeletonForMainFile(extension)
    if BufferIsApp()
        :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/appkit-main.".a:extension
    else
        :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/foundation-main.".a:extension
    endif
endfunction

"-----------------------------------------------------------------------------------
" TSkeleton
"-----------------------------------------------------------------------------------
"
" WARNING: These rules should appear in decreasing order of 'specific-ness'
autocmd BufNewFile main.mm  call SourceSkeletonForMainFile('mm')
autocmd BufNewFile main.m   call SourceSkeletonForMainFile('m')
autocmd FileType objc    call SetObjcCompilerForBuffer()
autocmd FileType cpp    call SetObjcCompilerForBuffer()



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

endif

