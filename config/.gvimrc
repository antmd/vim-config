
" Rebind Tools->Make menu (and Cmd-B) to run SCCompile
" NOTE: remapping MacVim menu items must be done in the gvimrc, not vimrc
" See http://superuser.com/questions/319591/how-can-i-prevent-macvim-from-showing-os-x-find-replace-dialog-when-pressing-co
"
if has("gui_macvim")
  nmenu Tools.Make :SCCompile<CR>
  vmenu Tools.Make :SCCompile<CR>
  imenu Tools.Make <ESC>:SCCompile<CR>
  cmenu Tools.Make :SCCompile<CR>
  omenu Tools.Make :SCCompile<CR>
endif
