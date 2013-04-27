" Vim color file - neverland2.vim
" Eyes are sober, this is the plan
" I'm sitting in a car heading Neverland
" Author: Magnus Woldrich <trapd00r@trapd00r.se>
" 
" Edited: no gvim stuff, minor changes to colors and bold

set background=dark
hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="neverland2"

" Support for 256-color terminal
if &t_Co > 255
   hi Normal          ctermfg=255  ctermbg=none
   set background=dark

   hi Boolean         ctermfg=135
   hi Character       ctermfg=143
   hi Number          ctermfg=33
   hi String          ctermfg=179
   hi Conditional     ctermfg=196               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=150  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                      ctermbg=none
   hi DiffChange      ctermfg=181  ctermbg=234
   hi DiffDelete      ctermfg=162  ctermbg=232
   hi DiffText                     ctermbg=none cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219  ctermbg=124  
   hi ErrorMsg        ctermfg=199  ctermbg=none cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67   ctermbg=232  cterm=none
   hi Folded          ctermfg=240  ctermbg=234  cterm=none
   hi Function        ctermfg=197               cterm=bold " sub..
   hi Identifier      ctermfg=166  " ..foo
   hi Ignore          ctermfg=244  ctermbg=232
   hi IncSearch       ctermfg=193  ctermbg=16

   hi Keyword         ctermfg=74                cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=218
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=160  ctermbg=232  cterm=bold
   hi ModeMsg         ctermfg=215
   hi MoreMsg         ctermfg=215
   hi Operator        ctermfg=46

   " complete menu
   hi Pmenu           ctermfg=137  ctermbg=none cterm=none
   hi PmenuSel        ctermfg=196  ctermbg=234  cterm=bold
   hi PmenuSbar       ctermfg=000  ctermbg=none cterm=none
   hi PmenuThumb      ctermfg=137  ctermbg=235  cterm=none

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=218
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=252  ctermbg=160

   " marks column
   hi SignColumn      ctermfg=118  ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81   ctermbg=232
   hi SpecialKey      ctermfg=245

   hi SpellBad        ctermfg=196  ctermbg=none cterm=bold
   hi SpellCap        ctermfg=094  ctermbg=none cterm=bold
   hi SpellRare       ctermfg=096  ctermbg=none cterm=bold
   hi SpellLocal      ctermfg=124  ctermbg=none cterm=bold

   hi Statement       ctermfg=228               cterm=bold " my...
   hi StatusLine      ctermfg=232  ctermbg=136
   hi StatusLineNC    ctermfg=232  ctermbg=100
   hi StorageClass    ctermfg=208               cterm=bold
   hi Structure       ctermfg=81                cterm=bold
   hi Tag             ctermfg=161               cterm=bold
   hi Title           ctermfg=21
   hi Todo            ctermfg=160  ctermbg=none cterm=bold

   hi Typedef         ctermfg=81                cterm=bold
   hi Type            ctermfg=81                cterm=bold
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244  ctermbg=232  cterm=bold
   hi VisualNOS                    ctermbg=238
   hi Visual                       ctermbg=235
   hi WarningMsg      ctermfg=21   ctermbg=238  cterm=bold
   hi WildMenu        ctermfg=81   ctermbg=16

   hi Comment         ctermfg=101
   hi ColorColumn                  ctermbg=233
   hi CursorLine                   ctermbg=233  cterm=none
   hi CursorColumn                 ctermbg=234
   hi LineNr          ctermfg=241  ctermbg=232
   hi NonText         ctermfg=none ctermbg=none

   hi TabLine         ctermfg=100  ctermbg=233  cterm=none
   hi TabLineFill     ctermfg=233  ctermbg=233  cterm=none
   hi TabLineSel      ctermfg=220  ctermbg=234  cterm=bold
end
