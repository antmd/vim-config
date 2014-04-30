call textobj#user#plugin('objcexpr', {
            \   '-': {
            \     'select-a-function': 'SelectObjcExprA',
            \     'select-a': 'aO',
            \     'select-i-function': 'SelectObjcExprI',
            \     'select-i': 'iO',
            \   },
            \ })

"
" Get character under cursor. This should be changed to use 'yank' for unicode
function! GetC()
    return getline('.')[col('.')-1]
endfunction

" Function to define an 'Objective-C Expression', which is
function! SelectObjcExprA()
    
    let start_of_objc_expr = 0
    let end_of_objc_expr = 0

    " FIND END OF OBJECTIVE-C EXPRESSION
    if GetC() == ' ' 
        " Jumps backwards to first non-whitespace character
        normal! gE
    endif
    let end_of_last_word = getpos('.')

    " Look backwards for the first closing ']'
    let first_square_close_bracket_pos = 0
    if GetC() != ']' 
        " Searches backwards for first closing square-bracket
        normal! F]
    endif
    let first_square_open_bracket_pos = 0
    if GetC() == ']'
        let first_square_close_bracket_pos = getpos('.')
    else
        " No ']' found on same line, look for first opening bracket
        normal! F[
        if GetC() == '['
            " If an opening bracket is found, the expression is from there to
            " the end of the current line
            return ['v', getpos('.'), end_of_last_word]
        endif
    endif

    " Jump to character after first 'equals' on line, or if none, first non-whitespace character
    normal! 0f=
    let full_expressions_starts_with_square_bracket = 0
    if GetC() == '='
        normal! w
    else
        " No '=' found -- go to first non-space character of line
        normal! ^
    endif
    return ['v', getpos('.'), end_of_last_word]
endfunction

function! SelectObjcExprI()
    return SelectObjcExprA()
endfunction

" Map Ctrl-] in insert mode to call surround plugin, with 'aO' as the text
" object, and adding the square brackets
imap <C-]> <esc>ysaO]%a

