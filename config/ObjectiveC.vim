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

function SetObjcCompiler(objctype)
    if a:objctype ==? 'app'
        call SingleCompile#SetPriority('objc', 'ObjcApplication',1 )
        call SingleCompile#SetPriority('objc', 'ObjcCommandLineTool',2 )
        call SingleCompile#ChooseCompiler('objc', 'ObjcApplication')
    else
        call SingleCompile#SetPriority('objc', 'ObjcCommandLineTool',1 )
        call SingleCompile#SetPriority('objc', 'ObjcApplication',2 )
        call SingleCompile#ChooseCompiler('objc', 'ObjcCommandLineTool')
    endif
endfunction

"-----------------------------------------------------------------------------------
" TSkeleton
"-----------------------------------------------------------------------------------
"
" WARNING: These rules should appear in order of 'specific-ness'
autocmd BufNewFile *.m   :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/foundation.m"
autocmd BufNewFile *.mm   :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/foundation.m"
autocmd BufEnter *.m   call SetObjcCompiler('cli')

autocmd BufNewFile *[Gg]ui.m   :execute "TSkeletonSetup ".$HOME."/.vim/skeletons/cocoa.m"
autocmd BufEnter *[Gg]ui.m   call SetObjcCompiler('app')

endif

