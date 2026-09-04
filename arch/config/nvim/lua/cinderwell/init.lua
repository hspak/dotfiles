-- Cinderwell for Neovim
-- Dark-only. Designed as a terminal palette first, then mapped to syntax roles.

local M = {}

local function hl(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "cinderwell"

  local c = require("cinderwell.palette")

  -- 16-color terminal, same slots as the shell theme
  vim.g.terminal_color_0  = c.black
  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_5  = c.magenta
  vim.g.terminal_color_6  = c.cyan
  vim.g.terminal_color_7  = c.white
  vim.g.terminal_color_8  = c.comment
  vim.g.terminal_color_9  = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_magenta
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white

  ---------------------------------------------------------------- editor
  hl("Normal",       { fg = c.fg, bg = c.bg })
  hl("NormalNC",     { fg = c.fg, bg = c.bg })
  hl("NormalFloat",  { fg = c.fg, bg = c.float })
  hl("FloatBorder",  { fg = c.border, bg = c.float })
  hl("FloatTitle",   { fg = c.bright_yellow, bg = c.float, bold = true })
  hl("WinSeparator", { fg = c.border, bg = c.bg })
  hl("VertSplit",    { fg = c.border, bg = c.bg })
  hl("LineNr",       { fg = c.comment, bg = c.bg })
  hl("CursorLineNr", { fg = c.bright_yellow, bg = c.cursorline, bold = true })
  hl("CursorLine",   { bg = c.cursorline })
  hl("CursorColumn", { bg = c.cursorline })
  hl("ColorColumn",  { bg = c.bg_alt })
  hl("SignColumn",   { fg = c.comment, bg = c.bg })
  hl("FoldColumn",   { fg = c.comment, bg = c.bg })
  hl("Folded",       { fg = c.fg_dim, bg = c.bg_alt })
  hl("Cursor",       { fg = c.cursor_text, bg = c.cursor })
  hl("lCursor",      { fg = c.cursor_text, bg = c.cursor })
  hl("CursorIM",     { fg = c.cursor_text, bg = c.cursor })
  hl("TermCursor",   { fg = c.cursor_text, bg = c.cursor })
  hl("Visual",       { bg = c.sel })
  hl("VisualNOS",    { bg = c.sel })
  hl("Search",       { fg = c.bg, bg = c.bright_yellow })
  hl("IncSearch",    { fg = c.bg, bg = c.cursor })
  hl("CurSearch",    { fg = c.bg, bg = c.cursor })
  hl("Substitute",   { fg = c.bg, bg = c.bright_magenta })
  hl("MatchParen",   { fg = c.bright_yellow, bold = true })
  hl("Whitespace",   { fg = c.black })
  hl("NonText",      { fg = c.black })
  hl("SpecialKey",   { fg = c.black })
  hl("EndOfBuffer",  { fg = c.bg })
  hl("Conceal",      { fg = c.comment })
  hl("Directory",    { fg = c.bright_blue })
  hl("Title",        { fg = c.bright_yellow, bold = true })
  hl("Question",     { fg = c.bright_blue })
  hl("MoreMsg",      { fg = c.green })
  hl("ModeMsg",      { fg = c.fg, bold = true })
  hl("ErrorMsg",     { fg = c.bright_red, bold = true })
  hl("WarningMsg",   { fg = c.yellow, bold = true })
  hl("WildMenu",     { fg = c.fg, bg = c.sel })
  hl("QuickFixLine", { bg = c.cursorline })
  hl("Pmenu",        { fg = c.fg, bg = c.float })
  hl("PmenuSel",     { fg = c.fg, bg = c.sel })
  hl("PmenuSbar",    { bg = c.bg_alt })
  hl("PmenuThumb",   { bg = c.border })
  hl("PmenuExtra",   { fg = c.comment, bg = c.float })
  hl("PmenuKind",    { fg = c.cyan, bg = c.float })
  hl("StatusLine",   { fg = c.fg, bg = c.bg_alt })
  hl("StatusLineNC", { fg = c.comment, bg = c.bg_dim })
  hl("TabLine",      { fg = c.comment, bg = c.bg_dim })
  hl("TabLineFill",  { fg = c.comment, bg = c.bg_dim })
  hl("TabLineSel",   { fg = c.fg, bg = c.bg_alt, bold = true })
  hl("WinBar",       { fg = c.fg_dim, bg = c.bg })
  hl("WinBarNC",     { fg = c.comment, bg = c.bg })

  ---------------------------------------------------------------- syntax
  -- Comments recede. Strings are sage. Keywords are clay.
  -- Types are the steel counterweight. Functions are brass.
  hl("Comment",        { fg = c.comment, italic = true })
  hl("Constant",       { fg = c.magenta })
  hl("String",         { fg = c.green })
  hl("Character",      { fg = c.bright_green })
  hl("Number",         { fg = c.magenta })
  hl("Boolean",        { fg = c.bright_magenta })
  hl("Float",          { fg = c.magenta })
  hl("Identifier",     { fg = c.fg })
  hl("Function",       { fg = c.yellow })
  hl("Statement",      { fg = c.red })
  hl("Conditional",    { fg = c.red })
  hl("Repeat",         { fg = c.red })
  hl("Label",          { fg = c.red })
  hl("Operator",       { fg = c.fg_dim })
  hl("Keyword",        { fg = c.red })
  hl("Exception",      { fg = c.bright_red })
  hl("PreProc",        { fg = c.cyan })
  hl("Include",        { fg = c.cyan })
  hl("Define",         { fg = c.cyan })
  hl("Macro",          { fg = c.cyan })
  hl("PreCondit",      { fg = c.cyan })
  hl("Type",           { fg = c.blue })
  hl("StorageClass",   { fg = c.blue })
  hl("Structure",      { fg = c.blue })
  hl("Typedef",        { fg = c.bright_blue })
  hl("Special",        { fg = c.bright_cyan })
  hl("SpecialChar",    { fg = c.bright_yellow })
  hl("Tag",            { fg = c.red })
  hl("Delimiter",      { fg = c.fg_dim })
  hl("SpecialComment", { fg = c.comment, italic = true })
  hl("Debug",          { fg = c.bright_red })
  hl("Underlined",     { fg = c.bright_blue, underline = true })
  hl("Ignore",         { fg = c.comment })
  hl("Error",          { fg = c.bright_red, bold = true })
  hl("Todo",           { fg = c.bright_yellow, bold = true })

  ---------------------------------------------------------------- treesitter
  hl("@comment",                 { fg = c.comment, italic = true })
  hl("@comment.todo",            { fg = c.bright_yellow, bold = true })
  hl("@comment.error",           { fg = c.bright_red, bold = true })
  hl("@comment.warning",         { fg = c.yellow, bold = true })
  hl("@comment.note",            { fg = c.bright_cyan, bold = true })
  hl("@punctuation",             { fg = c.fg_dim })
  hl("@punctuation.delimiter",   { fg = c.fg_dim })
  hl("@punctuation.bracket",     { fg = c.fg_dim })
  hl("@punctuation.special",     { fg = c.cyan })
  hl("@string",                  { fg = c.green })
  hl("@string.escape",           { fg = c.bright_yellow })
  hl("@string.special",          { fg = c.bright_green })
  hl("@string.regexp",           { fg = c.cyan })
  hl("@character",               { fg = c.bright_green })
  hl("@number",                  { fg = c.magenta })
  hl("@boolean",                 { fg = c.bright_magenta })
  hl("@float",                   { fg = c.magenta })
  hl("@function",                { fg = c.yellow })
  hl("@function.builtin",        { fg = c.bright_yellow })
  hl("@function.call",           { fg = c.yellow })
  hl("@function.macro",          { fg = c.cyan })
  hl("@method",                  { fg = c.yellow })
  hl("@method.call",             { fg = c.yellow })
  hl("@constructor",             { fg = c.blue })
  hl("@parameter",               { fg = c.fg })
  hl("@field",                   { fg = c.fg })
  hl("@property",                { fg = c.fg })
  hl("@variable",                { fg = c.fg })
  hl("@variable.builtin",        { fg = c.magenta })
  hl("@variable.parameter",      { fg = c.fg })
  hl("@variable.member",         { fg = c.fg })
  hl("@constant",                { fg = c.magenta })
  hl("@constant.builtin",        { fg = c.bright_magenta })
  hl("@constant.macro",          { fg = c.cyan })
  hl("@module",                  { fg = c.blue })
  hl("@namespace",               { fg = c.blue })
  hl("@type",                    { fg = c.blue })
  hl("@type.builtin",            { fg = c.bright_blue })
  hl("@type.definition",         { fg = c.bright_blue })
  hl("@attribute",               { fg = c.cyan })
  hl("@keyword",                 { fg = c.red })
  hl("@keyword.function",        { fg = c.red })
  hl("@keyword.operator",        { fg = c.red })
  hl("@keyword.return",          { fg = c.red })
  hl("@keyword.import",          { fg = c.cyan })
  hl("@keyword.conditional",     { fg = c.red })
  hl("@keyword.repeat",          { fg = c.red })
  hl("@keyword.exception",       { fg = c.bright_red })
  hl("@operator",                { fg = c.fg_dim })
  hl("@label",                   { fg = c.yellow })
  hl("@tag",                     { fg = c.red })
  hl("@tag.attribute",           { fg = c.yellow })
  hl("@tag.delimiter",           { fg = c.fg_dim })
  hl("@markup.heading",          { fg = c.bright_yellow, bold = true })
  hl("@markup.strong",           { bold = true })
  hl("@markup.italic",           { italic = true })
  hl("@markup.strikethrough",    { strikethrough = true })
  hl("@markup.underline",        { underline = true })
  hl("@markup.link",             { fg = c.bright_blue, underline = true })
  hl("@markup.link.url",         { fg = c.cyan, underline = true })
  hl("@markup.raw",              { fg = c.green })
  hl("@markup.list",             { fg = c.yellow })
  hl("@markup.quote",            { fg = c.comment, italic = true })
  hl("@diff.plus",               { fg = c.green })
  hl("@diff.minus",              { fg = c.red })
  hl("@diff.delta",              { fg = c.yellow })

  ---------------------------------------------------------------- lsp / diagnostics
  hl("DiagnosticError",          { fg = c.bright_red })
  hl("DiagnosticWarn",           { fg = c.yellow })
  hl("DiagnosticInfo",           { fg = c.bright_blue })
  hl("DiagnosticHint",           { fg = c.cyan })
  hl("DiagnosticOk",             { fg = c.green })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = c.bright_red })
  hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
  hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.bright_blue })
  hl("DiagnosticUnderlineHint",  { undercurl = true, sp = c.cyan })
  hl("DiagnosticVirtualTextError", { fg = c.bright_red, bg = c.bg_alt })
  hl("DiagnosticVirtualTextWarn",  { fg = c.yellow, bg = c.bg_alt })
  hl("DiagnosticVirtualTextInfo",  { fg = c.bright_blue, bg = c.bg_alt })
  hl("DiagnosticVirtualTextHint",  { fg = c.cyan, bg = c.bg_alt })
  hl("LspReferenceText",         { bg = c.cursorline })
  hl("LspReferenceRead",         { bg = c.cursorline })
  hl("LspReferenceWrite",        { bg = c.sel })
  hl("LspInlayHint",             { fg = c.comment, italic = true })
  hl("LspSignatureActiveParameter", { fg = c.bright_yellow, bold = true })

  ---------------------------------------------------------------- diff / git
  hl("DiffAdd",      { fg = c.green, bg = c.bg_alt })
  hl("DiffChange",   { fg = c.yellow, bg = c.bg_alt })
  hl("DiffDelete",   { fg = c.red, bg = c.bg_alt })
  hl("DiffText",     { fg = c.bright_yellow, bg = c.sel })
  hl("Added",        { fg = c.green })
  hl("Changed",      { fg = c.yellow })
  hl("Removed",      { fg = c.red })
  hl("GitSignsAdd",    { fg = c.green })
  hl("GitSignsChange", { fg = c.yellow })
  hl("GitSignsDelete", { fg = c.red })

  ---------------------------------------------------------------- spelling
  hl("SpellBad",   { undercurl = true, sp = c.bright_red })
  hl("SpellCap",   { undercurl = true, sp = c.yellow })
  hl("SpellLocal", { undercurl = true, sp = c.cyan })
  hl("SpellRare",  { undercurl = true, sp = c.magenta })

  ---------------------------------------------------------------- common plugins
  hl("TelescopeNormal",        { fg = c.fg, bg = c.float })
  hl("TelescopeBorder",        { fg = c.border, bg = c.float })
  hl("TelescopeTitle",         { fg = c.bright_yellow, bold = true })
  hl("TelescopeSelection",     { bg = c.sel })
  hl("TelescopeMatching",      { fg = c.bright_yellow, bold = true })
  hl("TelescopePromptPrefix",  { fg = c.cursor })

  hl("CmpItemAbbr",            { fg = c.fg })
  hl("CmpItemAbbrMatch",       { fg = c.bright_yellow, bold = true })
  hl("CmpItemAbbrMatchFuzzy",  { fg = c.yellow })
  hl("CmpItemKind",            { fg = c.blue })
  hl("CmpItemMenu",            { fg = c.comment })

  hl("MiniStatuslineModeNormal",  { fg = c.bg, bg = c.green, bold = true })
  hl("MiniStatuslineModeInsert",  { fg = c.bg, bg = c.blue, bold = true })
  hl("MiniStatuslineModeVisual",  { fg = c.bg, bg = c.yellow, bold = true })
  hl("MiniStatuslineModeReplace", { fg = c.bg, bg = c.red, bold = true })
  hl("MiniStatuslineModeCommand", { fg = c.bg, bg = c.magenta, bold = true })

  hl("LazyNormal",   { fg = c.fg, bg = c.float })
  hl("LazyButton",   { fg = c.fg, bg = c.bg_alt })
  hl("LazyH1",       { fg = c.bg, bg = c.yellow, bold = true })

  hl("WhichKey",          { fg = c.yellow })
  hl("WhichKeyGroup",     { fg = c.blue })
  hl("WhichKeyDesc",      { fg = c.fg })
  hl("WhichKeySeparator", { fg = c.comment })

  hl("NotifyERRORBorder", { fg = c.red })
  hl("NotifyWARNBorder",  { fg = c.yellow })
  hl("NotifyINFOBorder",  { fg = c.blue })
  hl("NotifyDEBUGBorder", { fg = c.comment })
  hl("NotifyTRACEBorder", { fg = c.magenta })
  hl("NotifyERRORIcon",   { fg = c.bright_red })
  hl("NotifyWARNIcon",    { fg = c.yellow })
  hl("NotifyINFOIcon",    { fg = c.bright_blue })
  hl("NotifyERRORTitle",  { fg = c.bright_red })
  hl("NotifyWARNTitle",   { fg = c.yellow })
  hl("NotifyINFOTitle",   { fg = c.bright_blue })

  -- leftover classic groups
  link("msgarea", "Normal")
end

return M
