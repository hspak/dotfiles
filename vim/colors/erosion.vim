set background=dark
hi clear
if exists("syntax on")
  syntax reset
endif
let g:color_name="erosion"
 
" Colors
hi Comment      ctermfg=12
hi Constant     ctermfg=15 
hi Identifier   ctermfg=4
hi Statement    ctermfg=2
hi PreProc      ctermfg=6
hi Type         ctermfg=1
hi Special      ctermfg=3
hi Underlined   ctermfg=7
hi Ignore       ctermfg=9
hi Error        ctermfg=11
hi Todo         ctermfg=1
hi Normal ctermfg=none ctermbg=none
hi NonText ctermfg=0 ctermbg=none
hi Directory  ctermfg=12
 
hi VertSplit  ctermfg=black
hi StatusLine ctermfg=9
hi StatusLineNC ctermfg=0 
 
hi Folded ctermbg=0 ctermfg=8
 
hi Pmenu ctermfg=10 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=14
hi LineNr ctermfg=0 ctermbg=none
hi CursorLine ctermfg=none ctermbg=none cterm=none
hi CursorLineNr ctermfg=none ctermbg=0 
hi CursorColumn ctermfg=none ctermbg=0

hi Visual                  ctermfg=15   ctermbg=6
hi VisualNOS               ctermfg=15   ctermbg=6    cterm=bold
 
" Syntax checker colors
highlight SignColumn ctermbg=none
hi SyntasticErrorSign ctermfg=1 ctermbg=none
hi SyntasticWarningSign ctermfg=3 ctermbg=none
hi SyntasticStyleErrorSign ctermfg=1 ctermbg=none
hi SyntasticStyleWarningSign ctermfg=3 ctermbg=none
hi SyntasticErrorLine ctermfg=none ctermbg=none
hi SyntasticWarningLine ctermfg=none ctermbg=none
hi SyntasticStyleErrorLine ctermfg=none ctermbg=none
hi SyntasticStyleWarningLine ctermfg=none ctermbg=none
hi SpellBad ctermfg=0 ctermbg=3
hi SpellCap ctermfg=0 ctermbg=1
