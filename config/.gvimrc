
" Rebind Tools->Make menu (and Cmd-B) to run SCCompile
" NOTE: remapping MacVim menu items must be done in the gvimrc, not vimrc
" See http://superuser.com/questions/319591/how-can-i-prevent-macvim-from-showing-os-x-find-replace-dialog-when-pressing-co
"
if has("gui_macvim")
  nmenu Tools.Make :call Compile()<CR>
  vmenu Tools.Make :call Compile()<CR>
  imenu Tools.Make <ESC>:call Compile()<CR>
  cmenu Tools.Make :call Compile()<CR>
  omenu Tools.Make :call Compile()<CR>
endif
