" +---------+
" | Tabnine |
" +---------+

" Toggle YouCompleteMe on and off with <C-d>.
function Toggle_ycm()
   if g:ycm_show_diagnostics_ui == 0
      let g:ycm_auto_trigger = 1
      let g:ycm_show_diagnostics_ui = 1
      :YcmRestartServer
      :echo "Tabnine on"
   elseif g:ycm_show_diagnostics_ui == 1
      let g:ycm_auto_trigger = 0
      let g:ycm_show_diagnostics_ui = 0
      :YcmRestartServer
      :echo "Tabnine off"
   endif
endfunction

nmap <leader>D :call Toggle_ycm() <CR> " Toggle YCM on and off.
 
