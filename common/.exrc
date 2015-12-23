" Set vi modes:
set wm=8 sw=8 noautoindent showmode ignorecase
" key setting to turn off word wrapping and enter code mode.
"map  :set wrapmargin=8 smartindent autoindent
" go to the top.
"map g 1G
" format where you are to the end of the next paragraph.
map  !}fmt}z.
" format this line
map  :.!fmt
" add comments
map # :'a,.s/^/# /
map ^ :'a,.s/^# //
"map * :'a,.s/^/> /
"map  1G0Ocommand apples nonspamG7dk:wq
"map  1G0Ocommand apples spamG7dk:wq
