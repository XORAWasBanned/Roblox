-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.UnindentTags
return function(p1, p2) -- name: unindentTags
	local v3 = p2 or 2
	if not string.find(p1, "<.->") then
		return p1
	end
	local v4 = string.gsub(p1, "\r\n", "\n")
	local v5 = string.split(v4, "\n")
	local v6 = table.create(#v5)
	local v7 = {}
	for _, v8 in v5 do
		local _, v9 = string.find(v8, "^[ \t]*")
		local v10 = v9 or 0
		local v11 = v10 + 1
		local v12 = string.sub(v8, v11)
		if string.find(v12, "^<") then
			if string.find(v12, "^</") then
				table.remove(v7)
				table.insert(v6, v12)
			elseif string.find(v12, "/>$") then
				table.insert(v6, v12)
			else
				table.insert(v7, v10)
				table.insert(v6, v12)
			end
		else
			local v13 = v10 - (#v7 <= 0 and 0 or v7[#v7] + v3)
			local v14 = math.max(0, v13)
			local v15 = string.rep(" ", v14) .. v12
			table.insert(v6, v15)
		end
	end
	return table.concat(v6, "\n")
end