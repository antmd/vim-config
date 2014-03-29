call textobj#user#plugin('objcexpr', {
            \   '-': {
            \     'select-a-function': 'SelectObjcExprA',
            \     'select-a': 'aO',
            \     'select-i-function': 'SelectObjcExprI',
            \     'select-i': 'iO',
            \   },
            \ })

" Function to define an 'Objective-C Expression', which is
function! GetC()
    return getline('.')[col('.')-1]
endfunction

function! SelectObjcExprA()
    " End of last word, then forwards one char

    " FIND END OF OBJECTIVE-C EXPRESSION
    if getline('.')[col('.')-1] == ' ' 
        " Jumps backwards to first non-whitespace character
        normal! gE
    endif
    let end_of_last_word = getpos('.')

    let first_square_close_bracket_pos = 0
    let first_square_open_bracket_pos = 0

    " Look backwards for the first closing ']'
    if getline('.')[col('.')] != ']' 
        " Searches backwards for first closing square-bracket
        normal! F]
    endif
    if getline('.')[col('.')] == ']'
        let first_square_close_bracket_pos = getpos('.')
    endif

    " FIND START OF OBJECTIVE-C EXPRESSION
    if ! first_square_close_bracket_pos
        " No ']' found on same line, look for first opening bracket
        normal! F[
        if getpos('.') == first_square_close_bracket_pos
            " No '[' found on same line
            " Look from start of line for first '='
            normal! 0f=
            if getpos('.')[2] == 1
                " No '=' found -- go to first non-space character of line
                normal! ^
            else
                " Found '=', now go to the next non-whitespace character
                if getline('.')[col('.')] == ' '
                    normal! w
                endif
            endif
        endif
    else
        " Found a preceding ']' on same line, go to matching '[' bracket
        let first_square_close_bracket_pos = getpos('.')
        normal! %
    endif
    let matching_square_open_bracket_pos = getpos('.')
    if first_square_close_bracket_pos == matching_square_open_bracket_pos
        return 0
    endif
    return ['v', matching_square_open_bracket_pos, end_of_last_word]
endfunction

function! SelectObjcExprI()
    return SelectObjcExprA()
endfunction

" Map Ctrl-] in insert mode to call surround plugin, with 'aO' as the text
" object, and adding the square brackets
imap <C-]> <esc>ysaO]%a

