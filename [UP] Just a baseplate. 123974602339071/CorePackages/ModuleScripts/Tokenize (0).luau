-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.WikiMarkdownParser.Tokenize
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v_u_2 = table.insert
return function(p3) -- name: tokenize
	-- upvalues: (copy) v_u_2
	local v4 = 0
	local v5 = {
		["\n"] = {
			{
				"LINE_BREAK",
				"^\n",
				"^\n",
				1
			},
			{ "HEADING", "^[#]+", "^([#]+)" },
			{
				"DIVIDER",
				"^[-]+[ \t]*\n",
				"^([-]+)[ \t]*\n",
				1
			},
			{
				"DIVIDER",
				"^[=]+[ \t]*\n",
				"^([=]+)[ \t]*\n",
				1
			},
			{ "BULLET_LIST_ITEM", "^%s*%*", "^(%s*)(%*)" },
			{ "BULLET_LIST_ITEM_2", "^%s*-", "^(%s*)(-)" },
			{ "CODE_BLOCK", "^```[%w]*\n.-```", "^```([%w]*)\n(.-)```" },
			{ "CODE_BLOCK", "^```[%w]*\n.+$", "^```([%w]*)\n(.+)$" },
			{ "QUOTE", "^%s*>" },
			{ "ORDERED_LIST_ITEM", "^%s*[0-9]+%.[ \t]+", "^(%s*)([0-9]+)%.[ \t]+" },
			{ "ORDERED_LIST_ITEM", "^%s*[A-Za-z]%.[ \t]+", "^(%s*)([A-Za-z])%.[ \t]+" },
			{ "TABLE_ROW", "^|" }
		},
		["\\"] = {
			{ "ESCAPE", "^\\.", "^\\(.)" }
		},
		["-"] = {
			{ "TABLE_HEADER", "^[-]+" }
		},
		["="] = {
			{ "TABLE_HEADER_2", "^[=]+" }
		},
		["!"] = {
			{ "IMAGE", "^!%[[^%]]+%]%([^%)]+%)", "^!%[([^%]]+)%]%(([^%)]+)%)" }
		},
		["|"] = {
			{ "TABLE_DIVIDER", "^|" }
		},
		["<"] = {
			{ "OPEN_CLOSE", "^<[^>]*/>", "^<([%w-]+)%s?([^>]*)/>" },
			{ "CLOSE", "^</[^>]*>", "^</([%w-]+)%s?([^>]*)>" },
			{ "OPEN", "^<[^>]*>", "^<([%w-]+)%s?([^>]*)>" }
		},
		["*"] = {
			{ "BOLD_2", "^%*%*" },
			{ "BOLD", "^%*" }
		},
		["_"] = {
			{ "ITALIC_2", "^__" },
			{ "ITALIC", "^_" }
		},
		["~"] = {
			{ "STRIKE", "^~" }
		},
		["["] = {
			{ "LINK", "^%[[^%]]+%]%([^%)]+%)", "^%[([^%]]+)%]%(([^%)]+)%)" },
			{ "ACTION", "^%[%[[^%]]+%]%]", "^%[%[([^%]]+)%]%]" }
		},
		["`"] = {
			{ "INLINE_CODE", "^`[^\n`]*`", "^`([^\n`]*)`" },
			{ "INLINE_CODE", "^`[^\n`]+$", "^`([^\n`]+)$" }
		}
	}
	local v6 = 0
	local v7 = {}
	while v4 <= #p3 do
		local v8 = v4 == 0 and "\n" or p3:sub(v4, v4)
		local v9 = v5[v8]
		local v10 = false
		if v9 then
			local v11 = v8 == "\n" and 1 or 0
			local v12 = p3:sub(v4 + v11)
			for _, v13 in v9 do
				local v14 = v12:match(v13[2])
				if not v14 then
					continue
				end
				local v15 = v13[1]
				local v16 = v13[3]
				local v17 = v13[4] or 0
				local v18 = #v14 - v17
				if v4 ~= v6 then
					v_u_2(v7, {
						["name"] = "TEXT",
						["text"] = nil,
						["offset"] = nil,
						["text"] = p3:sub(v6, v4 - 1),
						["offset"] = v6
					})
				end
				v_u_2(v7, {
					["name"] = v15,
					["text"] = v14,
					["capture"] = v16 and { v12:match(v16) } or nil,
					["isBlock"] = v8 == "\n",
					["offset"] = v4
				})
				v4 = v4 + (v11 + v18)
				v6 = v4
				v10 = true
			end
		end
		if v10 then
			continue
		end
		v4 = v4 + 1
	end
	if v4 ~= v6 then
		v_u_2(v7, {
			["name"] = "TEXT",
			["text"] = nil,
			["offset"] = nil,
			["text"] = p3:sub(v6, v4 - 1),
			["offset"] = v6
		})
	end
	return v7
end