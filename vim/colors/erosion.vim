" # Terminal colors to use with
" foreground = #bea492
" background = #191512
" cursor = #404040

" # black
" color0 =                  #332d29
" color8 =                  #817267
" # red
" color1 =                  #8c644c
" color9 =                  #9f7155
" # green
" color2 =                  #746c48
" color10 =                 #857b52
" # yellow
" color3 =                  #908a66
" color11 =                 #9c956e
" # blue
" color4 =                  #646a6d
" color12 =                 #71777a
" # magenta
" color5 =                  #605655
" color13 =                 #656565
" # cyan
" color6 =                  #4b5c5e
" color14 =                 #556d70
" # white
" color7 =                  #504339
" color15 =                 #9a875f

set background=dark
hi clear
if exists("syntax on")
  syntax reset
endif
let g:color_name="erosion"

" Colors
hi Type                       ctermfg=1
hi Boolean                    ctermfg=133       ctermbg=none
hi Comment                    ctermfg=8
hi Constant                   ctermfg=12
hi Conditional                ctermfg=14
hi Identifier                 ctermfg=4                           cterm=none
hi Statement                  ctermfg=2         ctermbg=none
hi Function                   ctermfg=6                           cterm=bold
hi Operator                   ctermfg=1         ctermbg=none
hi Number                     ctermfg=247
hi Float                      ctermfg=14
hi String                     ctermfg=15        ctermbg=none
hi Keyword                    ctermfg=blue
hi Title                      ctermfg=none      ctermbg=none      cterm=bold
hi Exception                  ctermfg=2                           cterm=bold
hi Normal                     ctermfg=none      ctermbg=none
hi Label                      ctermfg=magenta
hi Typedef                    ctermfg=9
hi StorageClass               ctermfg=4
hi Structure                  ctermfg=1

hi ColorColumn                ctermfg=0         ctermbg=none

hi Macro                      ctermfg=6
hi Define                     ctermfg=6
hi PreProc                    ctermfg=6
hi PreCondit                  ctermfg=6

hi Debug                      ctermfg=13
hi Delimiter                  ctermfg=8
hi MatchParen                 ctermfg=16        ctermbg=15
hi IncSearch                  ctermfg=16        ctermbg=12        cterm=none
hi Search                     ctermfg=16        ctermbg=12
hi Visual                     ctermfg=16        ctermbg=12
hi VisualNOS                  ctermfg=16        ctermbg=12        cterm=bold

hi Error                      ctermfg=1         ctermbg=none
hi ErrorMsg                   ctermfg=9         ctermbg=none
hi WarningMsg                 ctermfg=225                         cterm=bold

hi Special                    ctermfg=3
hi SpecialComment             ctermfg=black                       cterm=bold
hi SpecialKey                 ctermfg=green                       cterm=bold
hi SpecialChar                ctermfg=14                          cterm=bold

hi Underlined                 ctermfg=7
hi Ignore                     ctermfg=9
hi Todo                       ctermfg=168       ctermbg=none      cterm=bold
hi NonText                    ctermfg=0         ctermbg=none
hi Directory                  ctermfg=12
hi NoneText                                     ctermbg=none
hi Message                    ctermfg=25
hi ModeMsg                    ctermfg=yellow                      cterm=bold
hi MoreMsg                    ctermfg=cyan                        cterm=bold
hi Question                   ctermfg=14
hi Repeat                     ctermfg=14
hi Tag                        ctermfg=5

hi VertSplit                  ctermfg=7         ctermbg=0         cterm=bold
hi WildMenu                   ctermfg=11        ctermbg=236       cterm=bold
hi StatusLine                 ctermfg=8         ctermbg=234       cterm=none
hi StatusLineNC               ctermfg=3         ctermbg=7         cterm=none

hi Folded                     ctermfg=8         ctermbg=7         cterm=bold
hi FoldColumn                 ctermfg=250       ctermbg=none      cterm=bold

hi Pmenu                      ctermfg=7         ctermbg=none
hi PmenuSel                   ctermfg=13        ctermbg=none      cterm=bold
hi PmenuSbar                  ctermfg=0
hi PmenuThumb                 ctermfg=0

hi LineNr                     ctermfg=0         ctermbg=none
hi CursorLine                 ctermfg=none      ctermbg=none      cterm=none
hi CursorLineNr               ctermfg=none      ctermbg=0
hi CursorColumn               ctermfg=none      ctermbg=0

" Syntax checker colors
hi SignColumn                                   ctermbg=none      cterm=bold
hi SyntasticWarning           ctermfg=1         ctermbg=none      cterm=bold
hi SyntasticErrorSign         ctermfg=1         ctermbg=none
hi SyntasticWarningSign       ctermfg=3         ctermbg=none
hi SyntasticStyleErrorSign    ctermfg=1         ctermbg=none
hi SyntasticStyleWarningSign  ctermfg=3         ctermbg=none
hi SyntasticErrorLine         ctermfg=none      ctermbg=none
hi SyntasticWarningLine       ctermfg=none      ctermbg=none
hi SyntasticStyleErrorLine    ctermfg=none      ctermbg=none
hi SyntasticStyleWarningLine  ctermfg=none      ctermbg=none

hi SpellBad                   ctermfg=1         ctermbg=none      cterm=underline
hi SpellCap                   ctermfg=0         ctermbg=1
hi SpellLocal                 ctermfg=16        ctermbg=cyan      cterm=bold
hi SpellRare                  ctermfg=16        ctermbg=magenta   cterm=bold

hi DiffOldLine                ctermfg=214       ctermbg=none
hi DiffOldFile                ctermfg=160       ctermbg=none
hi DiffNewFile                ctermfg=34        ctermbg=none

hi DiffAdded                  ctermfg=34        ctermbg=none
hi DiffChanged                ctermfg=214       ctermbg=none
hi DiffRemoved                ctermfg=160       ctermbg=none

hi DiffLine                   ctermfg=202       ctermbg=none
hi DiffAdd                    ctermfg=34        ctermbg=none
hi DiffDelete                 ctermfg=160       ctermbg=none
hi DiffChange                 ctermfg=214       ctermbg=none
hi DiffText                   ctermfg=220       ctermbg=none      cterm=bold

hi GitGutterAdd               ctermfg=34        ctermbg=none
hi GitGutterChange            ctermfg=214       ctermbg=none
hi GitGutterDelete            ctermfg=160       ctermbg=none

hi TabLineFill                ctermfg=none      ctermbg=none      cterm=bold
hi TabLine                    ctermfg=0         ctermbg=none      cterm=bold
hi TabLineSel                 ctermfg=15        ctermbg=7         cterm=bold
