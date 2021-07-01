function OpenGitWindow()
    call fzf#run({'source': 'git log --format="%h %ar% %d %s%  %ae"'})
                
endfunction


nnoremap <C-g> :call OpenGitWindow()<CR>
nnoremap <C-G> :call OpenGitWindow()<CR>
