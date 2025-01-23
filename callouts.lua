function BlockQuote(el)
    -- Check if the block quote starts with "[!IMPORTANT]" or "[!NOTE]"
    if #el.content > 0 and el.content[1].t == "Para" then
        local first_para = el.content[1]
        if #first_para.content > 0 and first_para.content[1].t == "Str" then
            local text = first_para.content[1].text
            -- Handle "[!IMPORTANT]"
            if text:match("^%[!IMPORTANT%]") then
                first_para.content[1].text = text:gsub("^%[!IMPORTANT%]%s*", "")
                local content = pandoc.utils.stringify(el)
                return pandoc.RawBlock("latex", "\\begin{importantbox}\n" .. content .. "\n\\end{importantbox}")
            end
            -- Handle "[!NOTE]"
            if text:match("^%[!NOTE%]") then
                first_para.content[1].text = text:gsub("^%[!NOTE%]%s*", "")
                local content = pandoc.utils.stringify(el)
                return pandoc.RawBlock("latex", "\\begin{notebox}\n" .. content .. "\n\\end{notebox}")
            end
        end
    end
    -- Return the block quote unmodified if it doesn't match
    return el
end
