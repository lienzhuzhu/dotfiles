function Block(el)
  if el.t == "BlockQuote" then
    -- Extract the first line of the blockquote as a string
    local first_line = pandoc.utils.stringify(el.content[1])

    -- Match callout types like [!IMPORTANT] or [!NOTE]
    if first_line:match("^%[!IMPORTANT%]") then
      -- Remove the callout label (first line) from the content
      table.remove(el.content, 1)
      -- Process the remaining content
      local body = ""
      for _, block in ipairs(el.content) do
        body = body .. pandoc.write(pandoc.Pandoc({ block }), "latex")
      end
      return pandoc.RawBlock("latex", "\\begin{importantbox}\n" .. body .. "\n\\end{importantbox}")
    elseif first_line:match("^%[!NOTE%]") then
      table.remove(el.content, 1)
      local body = ""
      for _, block in ipairs(el.content) do
        body = body .. pandoc.write(pandoc.Pandoc({ block }), "latex")
      end
      return pandoc.RawBlock("latex", "\\begin{notebox}\n" .. body .. "\n\\end{notebox}")
    end
  end

  -- Return unchanged block if no match
  return el
end

