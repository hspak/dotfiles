" Vim's colour scheme file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" File Name:   matlablight.vim                                                 "
" Abstract:    A colour scheme that resembles MATLAB's default with additions  "
" Maintainer:  Yaroslav Don                                                    "
" Copyright:   (c) 2010-11, Yaroslav Don. All rights reserved.                 "
"              Redistribution and use in source and binary forms, with or      "
"              without modification, are permitted provided that the following "
"              conditions are met:                                             "
"              * Redistributions of source code must retain the above copyright"
"                notice, this list of conditions and the following disclaimer. "
"              * Redistributions in binary form must reproduce the above       "
"                copyright notice, this list of conditions and the following   "
"                disclaimer in the documentation and/or other materials        "
"                provided with the distribution.                               "
" Description: Vim colorscheme based on Ian Langworth's "tolerable.vim",       "
"              modified to resemble MATLAB's default colours on a light back-  "
"              ground. The colours are easily distinguishable and best suited  "
"              for MATLAB's purposes (see "group-name" for help, or            "
"              Syntax/Highlight-test menu ":runtime syntax/hitest.vim").       "
"              This colorscheme is to be used with Fabrice Guy's "matlab.vim". "
"              The latest version can be downloaded on:                        "
"              http://www.mathworks.com/matlabcentral/fileexchange/21798-editing-matlab-files-in-vim "
" Install:     Put this file in the user's colors directory (~/.vim/colors or  "
"              $vim\vimfiles\colors on Windows systems) then load it with      "
"              :colorscheme matlablight                                        "
" Version:     1.0.00                                                          "
" Last Change: Jul 15, 2010                                                    "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Preprocess {{{

if !has("gui_running")
    runtime! colors/default.vim
    finish
endif

set background=light

hi clear

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "matlablight"

" }}}

" Common {{{

hi Normal			guifg=Black			guibg=White			gui=NONE			ctermfg=Black		ctermbg=White		cterm=NONE			| " Normal text
hi Visual			guifg=NONE			guibg=LightGray		gui=NONE			ctermfg=NONE		ctermbg=LightGray	cterm=NONE			| " Visual highlight
hi Cursor			guifg=#D4D0C8		guibg=#FF0000		gui=NONE			ctermfg=LightGray	ctermbg=Red			cterm=NONE			| " Cursor
"                                                                                
hi Search			guifg=NONE			guibg=Yellow		gui=NONE			ctermfg=NONE		ctermbg=Yellow		cterm=NONE			| " Search
hi MatchParen		guifg=NONE			guibg=Cyan			gui=NONE			ctermfg=NONE		ctermbg=Cyan		cterm=NONE			| " Match () [] {}
"                                                                                
hi LineNr			guifg=#770000		guibg=#EEEEFF		gui=NONE			ctermfg=DarkRed		ctermbg=LightGray	cterm=NONE			| " Line numbers
hi Title			guifg=#008800		guibg=LightGreen	gui=BOLD,UNDERLINE	ctermfg=DarkGreen	ctermbg=Green		cterm=BOLD,UNDERLINE| " Cell titles
hi Underlined		guifg=#0000FF		guibg=NONE			gui=UNDERLINE		ctermfg=Blue		ctermbg=NONE		cterm=UNDERLINE		| " Links, etc.
                                                                                 
" }}}                                                                            
                                                                                 
" Split {{{                                                                      
                                                                                 
hi StatusLine		guifg=#E0E0E0		guibg=#707070		gui=NONE			ctermfg=LightGray	ctermbg=DarkGray	cterm=NONE			| " Status line
hi StatusLineNC		guifg=#E0E0E0		guibg=#909090		gui=NONE			ctermfg=LightGray	ctermbg=DarkGray	cterm=NONE			| " Status line non-current window
hi VertSplit		guifg=#909090		guibg=#909090		gui=NONE			ctermfg=DarkGray	ctermbg=DarkGray	cterm=NONE			| " Vertical split
                                                                                 
" }}}                                                                            
                                                                                 
" Folder {{{                                                                     
                                                                                 
hi Folded			guifg=#707070		guibg=#E0E0E0		gui=NONE			ctermfg=DarkGray	ctermbg=LightGray	cterm=NONE			| " Folded lines
hi FoldColumn		guifg=#0000AA		guibg=#AAAAAA		gui=NONE			ctermfg=DarkBlue	ctermbg=DarkGray	cterm=NONE			| " Folded column
                                                                                 
" }}}                                                                            
                                                                                 
" Syntax {{{                                                                     
                                                                                 
hi Statement		guifg=Blue			guibg=NONE			gui=NONE			ctermfg=Blue		ctermbg=NONE		cterm=NONE			| " Major Statements (including Conditional, Repeat, Label, Keyword)
hi Exception		guifg=#E25822		guibg=NONE			gui=NONE			ctermfg=Brown		ctermbg=NONE		cterm=NONE			| " Exceptions and Warnings
"hi Exception		guifg=Orange		guibg=NONE			gui=NONE			ctermfg=Brown		ctermbg=NONE		cterm=NONE			| " Exceptions and Warnings (different colour)
"                                                                                
hi Type				guifg=#A6004B		guibg=NONE			gui=NONE			ctermfg=DarkMagenta	ctermbg=NONE		cterm=NONE			| " Major Types (including Structure, Typedef)
hi StorageClass		guifg=Blue			guibg=NONE			gui=NONE			ctermfg=Blue		ctermbg=NONE		cterm=NONE			| " Storage Classes (static, volatile, etc.)
"                                                                                
hi Identifier		guifg=#FF2277		guibg=NONE			gui=NONE			ctermfg=Magenta		ctermbg=NONE		cterm=NONE			| " Variable names (mostly, varargin/out, colormaps and Class attributes)
hi Function			guifg=#2277FF		guibg=NONE			gui=NONE			ctermfg=Cyan		ctermbg=NONE		cterm=NONE			| " Functions on the path (w/o user's)
"                                                                                
hi Number			guifg=Magenta		guibg=NONE			gui=NONE			ctermfg=Magenta		ctermbg=NONE		cterm=NONE			| " Number or Float
hi Boolean			guifg=#22BB77		guibg=NONE			gui=NONE			ctermfg=Cyan		ctermbg=NONE		cterm=NONE			| " Booleans
hi Constant			guifg=#A000A0		guibg=NONE			gui=NONE			ctermfg=DarkMagenta	ctermbg=NONE		cterm=NONE			| " Constants (eps, inf, pi and NaN)
"hi Constant		guifg=#d000ff		guibg=NONE			gui=NONE			ctermfg=DarkMagenta	ctermbg=NONE		cterm=NONE			| " Constants (eps, inf, pi and NaN) (different colour)
"                                                                                
hi String			guifg=#A020F0		guibg=NONE			gui=NONE			ctermfg=DarkMagenta	ctermbg=NONE		cterm=NONE			| " Strings
hi SpecialChar		guifg=DarkBlue		guibg=NONE			gui=NONE			ctermfg=DarkBlue	ctermbg=NONE		cterm=NONE			| " Sprintf identifiers
hi Character		guifg=Brown			guibg=NONE			gui=NONE			ctermfg=Brown		ctermbg=NONE		cterm=NONE			| " TeX identifiers
hi WarningMsg		guifg=DarkRed		guibg=NONE			gui=NONE			ctermfg=DarkRed		ctermbg=NONE		cterm=NONE			| " Incomplete strings
"                                                                                
hi Delimiter		guifg=#009999		guibg=NONE			gui=BOLD			ctermfg=DarkCyan	ctermbg=NONE		cterm=BOLD			| " Delimiters: () [] {}
hi Operator			guifg=DarkOrange	guibg=NONE			gui=BOLD			ctermfg=Brown		ctermbg=NONE		cterm=BOLD			| " Operators (+ - * / ^ < > = ~ : . ? @ etc.)
"                                                                                
hi Special			guifg=Blue			guibg=NONE			gui=BOLD			ctermfg=Blue		ctermbg=NONE		cterm=BOLD			| " Line continuation: ...
hi SpecialKey		guifg=Red			guibg=NONE			gui=BOLD			ctermfg=Red			ctermbg=NONE		cterm=BOLD			| " Colon and Semicolon:  , :
"hi SpecialKey		guifg=#707070		guibg=#E0E0E0		gui=NONE			ctermfg=Red			ctermbg=LightGray	cterm=NONE			| " Colon and Semicolon:  , : (different colour)
"                                                                                
hi Comment			guifg=#008800		guibg=NONE			gui=NONE			ctermfg=Green		ctermbg=NONE		cterm=NONE			| " Comments
hi SpecialComment	guifg=#004400		guibg=NONE			gui=ITALIC			ctermfg=DarkGreen	ctermbg=NONE		cterm=ITALIC		| " MLint identifiers
hi Todo				guifg=#0000AA		guibg=#BBFFFF		gui=UNDERLINE		ctermfg=DarkBlue	ctermbg=Cyan		cterm=UNDERLINE		| " To-Do
"hi SpecialComment	guifg=#008800		guibg=#E8F8C0		gui=ITALIC			ctermfg=Green		ctermbg=NONE		cterm=ITALIC		| " MLint identifiers (different colour)
"hi Todo			guifg=#FF0000		guibg=#FFFF00		gui=UNDERLINE		ctermfg=DarkBlue	ctermbg=Cyan		cterm=UNDERLINE		| " To-Do (different colour)
                                                                                 
" }}}                                                                            
                                                                                 
" Others {{{                                                                     
                                                                                 
hi PreProc			guifg=DarkYellow	guibg=NONE			gui=NONE			ctermfg=Brown		ctermbg=NONE		cterm=NONE			| " Preprocessor and System commands: !
"hi PreProc			guifg=#770077		guibg=NONE			gui=NONE			ctermfg=Brown		ctermbg=NONE		cterm=NONE			| " Preprocessor and System commands: ! (different colour)
"                                                                                
hi Tag				guifg=#229955		guibg=NONE			gui=NONE			ctermfg=Cyan		ctermbg=NONE		cterm=NONE			| " Tags
hi Debug			guifg=Orange		guibg=NONE			gui=NONE			ctermfg=Brown		ctermbg=NONE		cterm=NONE			| " Debugging statements
"                                                                                
hi Error			guifg=#FF0000		guibg=NONE			gui=UNDERLINE		ctermfg=Red			ctermbg=NONE		cterm=UNDERLINE		| " Errors

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" vim:foldmethod=marker:nofoldenable:tabstop=4:filetype=matlabcolours          
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

