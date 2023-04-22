function! MyAutoScroll()
let s:SusLines=3
if winheight(winnr())-winline()>=s:SusLines
return
else
let thisline=winline()
let inbetween=winheight(winnr())-thisline
while inbetween <= s:SusLines
exec "normal! \<c-e>"
let inbetween=inbetween+1
endwhile
echo winheight(winnr()) . winline() . inbetween. s:SusLines
endif
endfunction
autocmd! CursorMoved,CursorMovedI * call MyAutoScroll()

