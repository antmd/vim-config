call textobj#user#plugin('objcexpr', {
            \   '-': {
            \     'select-a-function': 'SelectObjcExprA',
            \     'select-a': 'aO',
            \     'select-i-function': 'SelectObjcExprI',
            \     'select-i': 'iO',
            \   },
            \ })

" Function to define an 'Objective-C Expression', which is

function! SelectObjcExprA()
    " End of last word, then forwards one char

    " FIND END OF OBJECTIVE-C EXPRESSION
    if getline('.')[col('.')-1] == ' ' 
        normal! gE
    endif
    let end_of_last_word = getpos('.')

    " Look backwards for the first closing ']'
    let first_square_close_bracket_pos = getpos('.')
    if getline('.')[col('.')] != ']' 
        normal! F]
    endif

    " FIND START OF OBJECTIVE-C EXPRESSION
    if getpos('.') == first_square_close_bracket_pos
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

