"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_statax 
" requires script rundo.sh 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" STATA DO-FILE SCRIPTS
fun! RunDoFile()
    w
    "adjust this path to the bash script
    !sh "/home/dsv/.vim/rundo.sh" "%:p"
endfun
au FileType stata noremap <F12> :<C-U>call RunDoFile()<CR><CR>

fun! RunDoLines()
    let selectedLines = getbufline('%', line("'<"), line("'>"))
    if col("'>") < strlen(getline(line("'>")))
        let selectedLines[-1] = strpart(selectedLines[-1], 0, col("'>"))
    endif
    if col("'<") != 1
        let selectedLines[0] = strpart(selectedLines[0], col("'<")-1)
    endif
    let temp = tempname() . ".do"
    call writefile(selectedLines, temp)
    "adjust this path to the bash script
    exec "!sh /home/dsv/.vim/rundo.sh " . temp
    "au VimLeave * exe "!del -y" temp
    au VimLeave * silent exe '!del /Q "'.$TEMP.'\*.tmp.do"'
endfun
au FileType stata noremap <F11> :<C-U>call RunDoLines()<CR><CR> 

