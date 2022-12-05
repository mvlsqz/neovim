local color = {
  foreground = "#e6e1cf",
  background = "#0f1419",
  black = "#131721",
  red = "#f07178",
  green = "#b8cc52",
  yellow = "#ffb454",
  blue = "#59c2ff",
  magenta = "#d2a6ff",
  cyan = "#95e6cb",
  white = "#e6e1cf",
  first = "#ffb454",
  second = "#59c2ff",
  third = "#d2a6ff",
  forth = "#b8cc52",
  fifth = "#95e6cb",
  sixth = "#e6e1cf",
  bright_black = "#272d38",
  bright_red = "#f07178",
  bright_green = "#b8cc52",
  bright_yellow = "#ffb454",
  bright_blue = "#95e6cb",
  bright_magenta = "#d2a6ff",
  bright_cyan = "#e6b673",
  bright_white = "#e6e1cf",
}

local hi = {}

hi["@neorg.tags.ranged_verbatim.begin"] = { fg = color.red }
hi["@neorg.tags.ranged_verbatim.end"] = { fg = color.red }
hi["@neorg.tags.ranged_verbatim.code_block"] = { bg = color.bright_black }
hi["@neorg.tags.carryover.begin"] = { fg = color.red }
hi["@neorg.tags.carryover.name.word"] = { fg = color.blue }
hi["@neorg.tags.carryover.parameters.word"] = { fg = color.red }
hi["@neorg.modifiers.escape"] = { fg = color.bright_blue }
hi["@neorg.markup.superscript"] = { fg = color.red, style = "italic" }
hi["@neorg.markup.subscript"] = { fg = color.bright_blue, style = "italic" }
hi["@neorg.markup.verbatim"] = { fg = color.blue, style = "italic" }
hi["@neorg.markup.variable"] = { fg = color.yellow, style = "italic" }
hi["@neorg.markup.spoiler"] = { fg = color.blue }
hi["@neorg.markup.inline_comment"] = { fg = color.bright_magenta }
hi["@neorg.markup.inline_math"] = { fg = color.blue }
hi["@neorg.headings.1.prefix"] = { fg = color.first, style = "bold" }
hi["@neorg.headings.2.prefix"] = { fg = color.second, style = "bold" }
hi["@neorg.headings.3.prefix"] = { fg = color.third, style = "bold" }
hi["@neorg.headings.4.prefix"] = { fg = color.forth, style = "bold" }
hi["@neorg.headings.5.prefix"] = { fg = color.fifth, style = "bold" }
hi["@neorg.headings.6.prefix"] = { fg = color.sixth, style = "bold" }
hi["@neorg.headings.1.title"] = { fg = color.first, style = "bold" }
hi["@neorg.headings.2.title"] = { fg = color.second, style = "bold" }
hi["@neorg.headings.3.title"] = { fg = color.third, style = "bold" }
hi["@neorg.headings.4.title"] = { fg = color.forth, style = "bold" }
hi["@neorg.headings.5.title"] = { fg = color.fifth, style = "bold" }
hi["@neorg.headings.6.title"] = { fg = color.sixth, style = "bold" }
hi["@neorg.lists.unordered.1.prefix"] = { fg = color.first }
hi["@neorg.lists.unordered.2.prefix"] = { fg = color.second }
hi["@neorg.lists.unordered.3.prefix"] = { fg = color.third }
hi["@neorg.lists.unordered.4.prefix"] = { fg = color.forth }
hi["@neorg.lists.unordered.5.prefix"] = { fg = color.fifth }
hi["@neorg.lists.unordered.6.prefix"] = { fg = color.sixth }
hi["@neorg.lists.unordered.1.content"] = { fg = color.first }
hi["@neorg.lists.unordered.2.content"] = { fg = color.second }
hi["@neorg.lists.unordered.3.content"] = { fg = color.third }
hi["@neorg.lists.unordered.4.content"] = { fg = color.forth }
hi["@neorg.lists.unordered.5.content"] = { fg = color.fifth }
hi["@neorg.lists.unordered.6.content"] = { fg = color.sixth }
hi["@neorg.lists.ordered.1.prefix"] = { fg = color.first }
hi["@neorg.lists.ordered.2.prefix"] = { fg = color.second }
hi["@neorg.lists.ordered.3.prefix"] = { fg = color.third }
hi["@neorg.lists.ordered.4.prefix"] = { fg = color.forth }
hi["@neorg.lists.ordered.5.prefix"] = { fg = color.fifth }
hi["@neorg.lists.ordered.6.prefix"] = { fg = color.sixth }
hi["@neorg.lists.ordered.1.content"] = { fg = color.first }
hi["@neorg.lists.ordered.2.content"] = { fg = color.second }
hi["@neorg.lists.ordered.3.content"] = { fg = color.third }
hi["@neorg.lists.ordered.4.content"] = { fg = color.forth }
hi["@neorg.lists.ordered.5.content"] = { fg = color.fifth }
hi["@neorg.lists.ordered.6.content"] = { fg = color.sixth }
hi["@neorg.links.unordered.1.prefix"] = { fg = color.first }
hi["@neorg.links.unordered.2.prefix"] = { fg = color.second }
hi["@neorg.links.unordered.3.prefix"] = { fg = color.third }
hi["@neorg.links.unordered.4.prefix"] = { fg = color.forth }
hi["@neorg.links.unordered.5.prefix"] = { fg = color.fifth }
hi["@neorg.links.unordered.6.prefix"] = { fg = color.sixth }
hi["@neorg.links.ordered.1.prefix"] = { fg = color.first }
hi["@neorg.links.ordered.2.prefix"] = { fg = color.second }
hi["@neorg.links.ordered.3.prefix"] = { fg = color.third }
hi["@neorg.links.ordered.4.prefix"] = { fg = color.forth }
hi["@neorg.links.ordered.5.prefix"] = { fg = color.fifth }
hi["@neorg.links.ordered.6.prefix"] = { fg = color.sixth }
hi["@neorg.quotes.1.prefix"] = { fg = color.first }
hi["@neorg.quotes.2.prefix"] = { fg = color.second }
hi["@neorg.quotes.3.prefix"] = { fg = color.third }
hi["@neorg.quotes.4.prefix"] = { fg = color.forth }
hi["@neorg.quotes.5.prefix"] = { fg = color.fifth }
hi["@neorg.quotes.6.prefix"] = { fg = color.sixth }

for group, colors in pairs(hi) do
  vim.cmd(
    string.format(
      "highlight %s guifg=%s guibg=%s guisp=%s gui=%s blend=%s",
      group,
      colors.fg or "none",
      colors.bg or "none",
      colors.sp or "none",
      colors.style or "none",
      colors.blend or 0
    )
  )
end
