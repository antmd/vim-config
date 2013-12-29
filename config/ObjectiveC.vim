if has("unix") && strpart(system("/usr/bin/uname -s"),0,6) == "Darwin" && !exists('g:HasInitialisedObjc')
    let g:HasInitialisedObjc = 1
    " Do Mac stuff here

"-----------------------------------------------------------------------------------
" Single Compile
"-----------------------------------------------------------------------------------
call SingleCompile#SetCompilerTemplate('objc', 
            \'ObjcCommandLineTool',
            \'Clang (Command Line Tool)',
            \'compileobjc', 
            \'$(FILE_NAME)$',
            \g:SingleCompile_common_run_command)
call SingleCompile#SetOutfile('objc', 'ObjcCommandLineTool', g:SingleCompile_common_out_file)

call SingleCompile#SetCompilerTemplate('objc', 
            \'ObjcApplication',
            \'Clang (Application Bundle)',
            \'compileobjcapp', 
            \'$(FILE_NAME)$',
            \'open -a $(FILE_TITLE)$.app')
call SingleCompile#SetOutfile('objc', 'ObjcApplication', g:SingleCompile_common_out_file)


autocmd Filetype objc nmap <buffer> <F9> :SingleCompile <CR>


" Otherwise .m is used for 'MatLab'
au BufEnter *.m set filetype=objc

function BufferIsApp()
    let l:isApp = 0
    if match( expand('%:p:h:t'), '.*App$' ) >=0 || match( expand('%:p:h:t'), '.*Gui$' ) >=0 
        let l:isApp = 1
    endif
    return l:isApp
endfunction

function SetObjcCompilerForBuffer()
    if BufferIsApp()
        call SingleCompile#SetPriority('objc', 'ObjcApplication',1 )
        call SingleCompile#SetPriority('objc', 'ObjcCommandLineTool',2 )
        call SingleCompile#ChooseCompiler('objc', 'ObjcApplication')
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


function SourceSkeletonForNewBuffer()
    if BufferIsApp()
        :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/cocoa.m"
    else
        :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/foundation.m"
    endif
endfunction

"-----------------------------------------------------------------------------------
" TSkeleton
"-----------------------------------------------------------------------------------
"
" WARNING: These rules should appear in decreasing order of 'specific-ness'
autocmd BufNewFile *.mm  call SourceSkeletonForNewBuffer()
autocmd BufNewFile *.m   call SourceSkeletonForNewBuffer()
autocmd FileType objc    call SetObjcCompilerForBuffer()

endif

