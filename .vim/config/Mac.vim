
" Mac configuration
"
"
" Xcode like bindings
if !exists('g:HasInitialisedMac')

    if has("gui_running")
        set lines=105 columns=340
    endif
    let g:HasInitialisedMac = 1
    " Cmd-Return - 'only' window command
    noremap <D-Return> <C-w><C-o>
    " Cmd-Alt-comma : split window
    noremap <D-≤> <C-w><C-v>

    " Cmd-b/r for Vimmake Compile/Run
    noremap <unique> <D-r> :VimTool compile-run<cr>
    inoremap <unique> <D-r> <esc>:VimTool compile-run<cr>
    noremap <unique> <D-b> :VimTool compile<cr>
    inoremap <unique> <D-b> <esc>:VimTool compile<cr>

    " Insert mode cursor movement
    " provide hjkl movements in Insert mode via the <Alt> modifier key
    inoremap ˙ <C-o>h
    inoremap ∆ <C-o>j
    inoremap ˚ <C-o>k
    inoremap ¬ <C-o>l
    inoremap ∫ <C-o>b
    inoremap ∑ <C-o>w
    inoremap å <C-o>A

    set gfn=Sauce\ Code\ Powerline:h13

    " Turn off bindings to the arrow-keys
    let macvim_skip_cmd_opt_movement = 1
    " Bind trackpad swipes to prev/next in jump list
    nmap <SwipeLeft> <C-o>
    nmap <SwipeRight> <C-i>

    runtime config/ObjectiveC.vim
    runtime config/Swift.vim
endif
