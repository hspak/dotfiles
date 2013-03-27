" Vim syntax file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Language:		matlabcolours                                                   "
" Abstract:    A syntax to highlight colour groups designed especially for the "
"					"matlabdark" or "matlablight" colour schemes.                   "
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
" Description: Vim syntax file to highlight the different highlight groups.    " 
"					This file is based on "colours_bandit.vim" by A. S. Budden.     "
" Install:     Put this file in the user's syntax directory (~/.vim/syntax or  "
"              $vim\vimfiles\syntax on Windows systems)                        "
" Version:     1.0.00                                                          "
" Last Change: Aug 15, 2010                                                    "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" clear previous syntax and upload vim's one
syn clear
runtime! syntax/vim.vim

" take the output of the "hi" command and redirect it to "highlights" variable
redir => highlights
silent hi
redir END

" take the first (key)word of each line and insert it to the "keywords" list
let lines = split(highlights, '\n')
let keywords = []
for line in lines
	let keyword = split(line)[0]
	let keywords += [keyword,]
endfor

" run on all the keywords and execute and highlighting command
" match the keyword between "\<...\>" to find the word alone
" the "vimHiGroup" is the group comming right after the "high[light]" command
for keyword in keywords
	if keyword =~ '^\k*$'
		execute 'syn match ' . keyword . ' "\<' . keyword . '\>" containedin=vimHiGroup'
	endif
endfor

" use the colour scheme on itself
let g:color_scheme = expand('<afile>:t:r')
execute "colorscheme " . g:color_scheme
"
let b:current_syntax = "matlabcolours"

