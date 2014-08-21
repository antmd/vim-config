
" Mac configuration
"
"
" Xcode like bindings
if !exists('g:HasInitialisedMac')
    let g:HasInitialisedMac = 1
    " Cmd-Return - 'only' window command
    noremap <D-Return> <C-w><C-o>
    " Cmd-Alt-comma : split window
    noremap <D-≤> <C-w><C-v>

    " Cmd-b/r for SingleCompile/Run
    noremap <unique> <D-r> :SingleCompileRun<cr>
    inoremap <unique> <D-r> <esc>:SingleCompileRun<cr>
    noremap <unique> <D-b> :SingleCompile<cr>
    inoremap <unique> <D-b> <esc>:SingleCompile<cr>


    set gfn=Sauce\ Code\ Powerline:h13

    " Turn off bindings to the arrow-keys
    let macvim_skip_cmd_opt_movement = 1
    " Bind trackpad swipes to prev/next in jump list
    nmap <SwipeLeft> <C-o>
    nmap <SwipeRight> <C-i>

    runtime config/ObjectiveC.vim
    runtime config/Swift.vim
endif
