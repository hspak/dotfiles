require("config.lazy")

-- personal keybindings
vim.keymap.set("n", "Q", "<C-W>q")
vim.keymap.set("n", "W", ":wq<CR>")
vim.keymap.set("n", "V", ":vsplit<CR> :wincmd l<CR>")
vim.keymap.set("n", "H", ":split<CR> :wincmd j<CR>")
vim.keymap.set("n", "<F12>", ":set hlsearch! hlsearch?<CR>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set('n', '<LocalLeader>l', ":Lexplore<CR> :vertical resize 30<CR>")

-- vimscript stuff from my old vimrc I can't be bothered to convert
vim.cmd([[
set list
set shortmess=I

filetype plugin on

au FileType c           setlocal ts=8 sw=8
au FileType javascript  setlocal ts=2 sw=2 et
au FileType cpp         setlocal ts=4 sw=4
au FileType rust        setlocal ts=4 sw=4
au FileType java        setlocal ts=4 sw=4
au FileType make        setlocal noet
au FileType python      setlocal sw=4 ts=4 et
au FileType markdown    setlocal ts=2 sw=2 textwidth=80 cc=100 et
au FileType go          setlocal sw=4 ts=4 noet
au FileType lex         setlocal sw=8 ts=8
au FileType yacc        setlocal sw=8 ts=8
au FileType lua         setlocal sw=2 ts=2 et
au FileType json        setlocal conceallevel=0

cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]])
