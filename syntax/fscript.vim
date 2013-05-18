" Vim syntax file
" Language: F-Script
" Based on Smalltalk: st.vim

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword fscKeyword self super true false nil

syn match   fscMethod  "\<do\>:"
syn match   fscMethod  "\<whileTrue\>:"
syn match   fscMethod  "\<whileFalse\>:"
syn match   fscMethod  "\<ifTrue\>:"
syn match   fscMethod  "\<ifFalse\>:"
syn match   fscMethod  "\<put\>:"
syn match   fscMethod  "\<to\>:"
syn match   fscMethod  "\<at\>:"
syn match   fscMethod  "\<add\>:"
syn match   fscMethod  "\<new\>:"
syn match   fscMethod  "\<for\>:"
syn match   fscMethod  "\<methods\>:"
syn match   fscMethod  "\<methodsFor\>:"
syn match   fscMethod  "\<instanceVariableNames\>:"
syn match   fscMethod  "\<classVariableNames\>:"
syn match   fscMethod  "\<poolDictionaries\>:"
syn match   fscMethod  "\<subclass\>:"

syn region  fscComment   start="\"" end="\""
syn region  fscString    start='\'' skip="''" end='\''
syn match   fscCharacter "$."
syn match   fscSymbol    "\c\(#\<[a-z_][a-z0-9_]*\>\)"
syn match   fscSymbol    "\c\(#'[^']*'\)"
syn match   fscNumber    "\c\<\d\+\(u\=l\=\|lu\|f\)\>"
syn match   fscFloat     "\c\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match   fscFloat     "\c\<\d\+e[-+]\=\d\+[fl]\=\>"
syn match   fscClass     "\v<\zs[A-Z][a-zA-Z0-9_]*>"
syn match   fscBlockVar  "\c\(:[ \t]*\<[a-z_][a-z0-9_]*\>[ \t]*\)\+|" contained
syn region  fscLocalVar  start="^[ \t]*|" end="|"

" Mismatched brackets
syn region  fscParen transparent start='(' end=')' contains=ALLBUT,fscParenErr
syn region  fscBlock transparent start='\[' end='\]' contains=ALLBUT,fscBlockErr
syn region  fscSet   transparent start='{' end='}' contains=ALLBUT,fscSetErr
syn match   fscParenErr ")"
syn match   fscBlockErr "\]"
syn match   fscSetErr   "}"

hi link fscKeyword   Statement
hi link fscMethod    Statement
hi link fscClass     Type
hi link fscComment   Comment
hi link fscCharacter String
hi link fscString    String
hi link fscSymbol    Special
hi link fscNumber    Constant
hi link fscFloat     Constant
hi link fscError     Error
hi link fscParenErr  Error
hi link fscSetErr    Error
hi link fscBlockErr  Error

" Synchronization for syntax analysis
syn sync minlines=50

let b:current_syntax = "fscript"

