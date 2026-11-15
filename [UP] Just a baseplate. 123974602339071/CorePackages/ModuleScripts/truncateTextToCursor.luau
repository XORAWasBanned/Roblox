-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalTextInput.truncateTextToCursor
return function(p1) -- name: truncateTextToCursor
	local v2 = p1.CursorPosition
	if v2 == -1 then
		return ""
	end
	local v3 = p1.Text
	local v4 = p1.TextSize * p1.LineHeight / 1.4
	local v5 = v2 + p1.AbsoluteSize.X / v4
	local v6 = string.find(v3, "\n", v2) or (1 / 0)
	local v7 = string.find(v3, "[ \t\f\11]", v2) or (1 / 0)
	local v8 = v6 - 1
	local v9 = #v3
	local v10 = math.min(v8, v7, v9)
	local v11 = v3:sub(v2, v2):match("\n")
	if v11 then
		local v12 = v2 - 1
		v11 = v3:sub(v12, v12):match("\n") or v2 == 1
	end
	if v11 then
		v2 = v2 - 1
	elseif v5 >= v10 then
		v2 = v10
	end
	return utf8.char(utf8.codepoint(v3, 1, v2))
end