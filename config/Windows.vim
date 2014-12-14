
" Insert mode cursor movement
" provide hjkl movements in Insert mode via the <Alt> modifier key
    inoremap <A-h> <C-o>h
    inoremap <A-j> <C-o>j
    inoremap <A-k> <C-o>k
    inoremap <A-l> <C-o>l
    inoremap <A-b> <C-o>b
    inoremap <A-w> <C-o>w

if has("gui_running")
    " Settings for crappy 15" monitors at work
    set gfn=Source_Code_Pro:h10:cANSI
    set lines=50 columns=200
endif
