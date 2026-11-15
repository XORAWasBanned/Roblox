-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.CommonMarkComplianceParser.Tokenize
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v_u_2 = require(script.Parent.Parent.Constants)
local v_u_3 = require(script.Parent.PostProcessTokens)
local v_u_4 = require(script.Parent.Utils)
local v_u_5 = require(v1.Parent.MarkdownCore).Flags
local v_u_6 = table.insert
local v_u_7 = {
	["ACTION"] = true,
	["OPEN"] = true,
	["CLOSE"] = true,
	["OPEN_CLOSE"] = true
}
local function v_u_24(p_u_8) -- name: createInlineCodeTracker
	local v_u_9 = -1
	local v_u_10 = nil
	local v_u_11 = 0
	local v_u_12 = -1
	local v_u_13 = nil
	return {
		["addBacktick"] = function(p14, p15) -- name: addBacktick
			-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13
			if p14 ~= v_u_9 then
				v_u_9 = p14
				v_u_10 = nil
				v_u_11 = 0
				v_u_12 = -1
				v_u_13 = nil
			end
			if p15 ~= v_u_12 + 1 and v_u_11 ~= 0 then
				if v_u_10 == nil then
					v_u_10 = v_u_11
				elseif v_u_10 == v_u_11 then
					v_u_10 = nil
				end
				v_u_11 = 0
				v_u_13 = nil
			end
			v_u_11 = v_u_11 + 1
			v_u_12 = p15
		end,
		["isInside"] = function(p16) -- name: isInside
			-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13
			if p16 ~= v_u_9 then
				v_u_9 = p16
				v_u_10 = nil
				v_u_11 = 0
				v_u_12 = -1
				v_u_13 = nil
			end
			if v_u_11 ~= 0 then
				if v_u_10 == nil then
					v_u_10 = v_u_11
				elseif v_u_10 == v_u_11 then
					v_u_10 = nil
				end
				v_u_11 = 0
				v_u_13 = nil
			end
			return v_u_10 ~= nil
		end,
		["isInsideClosed"] = function(p17, p18) -- name: isInsideClosed
			-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (copy) p_u_8
			if p17 ~= v_u_9 then
				v_u_9 = p17
				v_u_10 = nil
				v_u_11 = 0
				v_u_12 = -1
				v_u_13 = nil
			end
			if v_u_11 ~= 0 then
				if v_u_10 == nil then
					v_u_10 = v_u_11
				elseif v_u_10 == v_u_11 then
					v_u_10 = nil
				end
				v_u_11 = 0
				v_u_13 = nil
			end
			if v_u_10 == nil then
				return false
			end
			if v_u_13 == nil then
				v_u_13 = false
				local v19 = string.find(p_u_8, "\n", p18, true) or #p_u_8 + 1
				local v20 = string.gmatch
				local v21 = p_u_8
				local v22 = v19 - 1
				for v23 in v20(string.sub(v21, p18, v22), "`+") do
					if #v23 ~= v_u_10 then
						continue
					end
					v_u_13 = true
				end
			end
			return v_u_13
		end
	}
end
local v_u_25 = {
	{ "TABLE_ROW", "^[ \t]*|?" }
}
local function v_u_33(p26) -- name: getTableRowCells
	-- upvalues: (copy) v_u_6
	local v27 = string.match(p26, "^%s*(.-)%s*$") or ""
	local v28 = string.gsub(v27, "^|", "")
	local v29 = string.gsub(v28, "|$", "")
	local v30 = string.gsub(v29, "\\|", "")
	local v31 = {}
	for v32 in string.gmatch(v30 .. "|", "([^|]*)|") do
		v_u_6(v31, v32)
	end
	return v31
end
local function v_u_36(p34) -- name: isDelimiterRow
	-- upvalues: (copy) v_u_33
	if not string.find(p34, "|", 1, true) then
		return false
	end
	for _, v35 in v_u_33(p34) do
		if string.match(v35, "^%s*:?%-+:?%s*$") then
			continue
		end
		return false
	end
	return true
end
local v_u_37 = {
	"^ ? ? ?##?#?#?#?#?[ \t]",
	"^ ? ? ?##?#?#?#?#?$",
	"^ ? ? ?%-[ \t]*%-[ \t]*%-[ \t]*[%- \t]*$",
	"^ ? ? ?%*[ \t]*%*[ \t]*%*[ \t]*[%* \t]*$",
	"^ ? ? ?_[ \t]*_[ \t]*_[ \t]*[_ \t]*$",
	"^%s*[%*%-] ",
	"^%s*```",
	"^%s*~~~",
	"^%s*>",
	"^%s*[0-9]+%.[ \t]",
	"^%s*[A-Za-z]%.[ \t]"
}
local function v_u_56(p38, p39, p40, p41) -- name: isTableRow
	-- upvalues: (copy) v_u_36, (copy) v_u_37, (copy) v_u_33
	local v42 = string.find(p38, "\n", p39, true)
	local v43
	if v42 then
		v43 = v42 - 1
	else
		v43 = #p38
	end
	local v44 = string.sub(p38, p39, v43)
	if not p40 then
		if string.find(v44, "|", 1, true) then
			for _, v45 in v_u_37 do
				if not string.find(v44, v45) then
					continue
				end
				v46 = true
			end
			local v46 = false
			if not v46 then
				if p41 then
					p41 = string.sub(v44, 1, 1) == "|"
				end
				if not v42 then
					return p41
				end
				local v47 = string.find(p38, "\n", v42 + 1, true)
				local v48 = v42 + 1
				local v49
				if v47 then
					v49 = v47 - 1
				else
					v49 = #p38
				end
				local v50 = string.sub(p38, v48, v49)
				local v51 = #v_u_33(v44)
				if v_u_36(v50) and #v_u_33(v50) == v51 then
					return true
				end
				local v52 = p41 and not v47
				if v52 then
					if string.find(v50, "^[%s|:%-]*$") == nil then
						v52 = false
					else
						v52 = #v_u_33(v50) <= v51
					end
				end
				return v52
			end
		end
		return false
	end
	local v53 = string.find(v44, "%S") == nil or v_u_36(v44)
	if not v53 then
		for _, v54 in v_u_37 do
			if not string.find(v44, v54) then
				continue
			end
			v55 = true
		end
		local v55 = false
		v53 = not v55
	end
	return v53
end
local v57 = {
	{ "BREAK", "^\\\n" },
	{ "ESCAPE", "^\\(%p)" }
}
local v58 = {
	{ "IMAGE", "^!%[([^%]]+)%]%(([^%)]+)%)" }
}
local v59 = {
	{ "OPEN_CLOSE", "^<([%w-]+)%s?([^>]*)/>" },
	{ "CLOSE", "^</([%w-]+)%s?([^>]*)>" },
	{ "OPEN", "^<([%w-]+)%s?([^>]*)>" }
}
local v60 = {
	{ "BOLD_2", "^%*%*" },
	{ "BOLD", "^%*" }
}
local v61 = {
	{ "ITALIC_2", "^__" },
	{ "ITALIC", "^_" }
}
local v62 = {
	{ "STRIKE", "^~" }
}
local v63 = {
	{ "INLINE_CODE", "^`" }
}
local v_u_64 = {
	["\\"] = v57,
	["!"] = v58,
	["<"] = v59,
	["*"] = v60,
	["_"] = v61,
	["~"] = v62,
	["`"] = v63
}
local v_u_65 = {
	["\n"] = {
		{ "LINE_BREAK", "^\n", 1 },
		{ "HEADING", "^ ? ? ?(##?#?#?#?#?)[ \t]+", 1 },
		{ "HEADING", "^ ? ? ?(##?#?#?#?#?)\n", 1 },
		{ "DIVIDER", "^ ? ? ?%-[ \t]*%-[ \t]*%-[ \t]*[%- \t]*\n", 1 },
		{ "DIVIDER", "^ ? ? ?%*[ \t]*%*[ \t]*%*[ \t]*[%* \t]*\n", 1 },
		{ "DIVIDER", "^ ? ? ?_[ \t]*_[ \t]*_[ \t]*[_ \t]*\n", 1 },
		{ "BULLET_LIST_ITEM", "^(%s*)(%* )" },
		{ "BULLET_LIST_ITEM_2", "^(%s*)(- )" },
		{ "CODE_BLOCK", "^```[ \t]*([^\n]*)[ \t]*\n(.-)```" },
		{ "CODE_BLOCK", "^```[ \t]*([^\n]*)[ \t]*\n(.+)$" },
		{ "CODE_BLOCK", "^~~~[ \t]*([^\n]*)[ \t]*\n(.-)~~~" },
		{ "CODE_BLOCK", "^~~~[ \t]*([^\n]*)[ \t]*\n(.+)$" },
		{ "QUOTE", "^%s*>" },
		{ "ORDERED_LIST_ITEM", "^(%s*)([0-9]+)%.[ \t]+" },
		{ "ORDERED_LIST_ITEM", "^(%s*)([A-Za-z])%.[ \t]+" },
		{ "TABLE_ROW", "^|" }
	},
	["\\"] = v57,
	["-"] = {
		{ "TABLE_HEADER", "^[-]+" }
	},
	["="] = {
		{ "TABLE_HEADER_2", "^[=]+" }
	},
	["!"] = v58,
	["|"] = {
		{ "TABLE_DIVIDER", "^|" }
	},
	["<"] = v59,
	["*"] = v60,
	["_"] = v61,
	["~"] = v62,
	["["] = {
		{ "LINK", "^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]\"([^\n]+)\"[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]\'([^\n]+)\'[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]%(([^\n]+)%)[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*<>[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*<([^\n\t]+)>[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]*%)" },
		{ "ACTION", "^%[%[([^%]]+)%]%]" }
	},
	["`"] = v63
}
local v_u_66 = {
	{ "LINE_BREAK", "^[ \t\r]+\n", 1 }
}
table.move(v_u_65["\n"], 1, #v_u_65["\n"], #v_u_66 + 1, v_u_66)
local function v70(p67) -- name: withoutTableRow
	-- upvalues: (copy) v_u_6
	local v68 = {}
	for _, v69 in p67 do
		if v69[1] == "TABLE_ROW" then
			continue
		end
		v_u_6(v68, v69)
	end
	return v68
end
local v_u_71 = v70(v_u_65["\n"])
local v_u_72 = v70(v_u_66)
local v_u_74 = {
	["LINK"] = {
		["mapToText"] = nil,
		["startToken"] = "LINK_START",
		["endToken"] = "LINK_END",
		["textStartOffset"] = 1,
		["mapToText"] = function(p73) -- name: mapToText
			return p73.capture and p73.capture[1] or ""
		end
	}
}
local v_u_75 = {
	{ "HEADING", "^  ? ?(#+)%s*\n", 1 }
}
local function v_u_120(p76, p77, p78, p79) -- name: tokenizeTextSpan
	-- upvalues: (copy) v_u_5, (copy) v_u_24, (copy) v_u_56, (copy) v_u_64, (copy) v_u_72, (copy) v_u_66, (copy) v_u_25, (copy) v_u_71, (copy) v_u_65, (copy) v_u_75, (copy) v_u_4, (copy) v_u_7, (copy) v_u_2, (copy) v_u_6, (copy) v_u_3
	local v80 = 0
	local v81 = 0
	local v82 = 0
	local v83 = {}
	local v84 = nil
	local v85 = false
	local v86 = v_u_5.FFlagMarkdownTables
	if v86 then
		v86 = p79.isStreaming == true
	end
	local v87
	if v_u_5.FFlagMarkdownTagFallbacks then
		v87 = v_u_24(p76)
	else
		v87 = nil
	end
	while v80 <= #p76 do
		local v88 = v80 == 0 and not p78 and "\n" or string.sub(p76, v80, v80)
		local v89
		if v88 == "\n" then
			v89 = not p78
		else
			v89 = false
		end
		local v90 = v_u_5.FFlagMarkdownTables
		if v90 then
			if v89 then
				local v91 = v_u_56
				local v92 = v80 + 1
				local v93
				if v86 then
					if v80 <= 1 then
						v93 = true
					else
						local v94 = v80 - 1
						local v95 = v80 - 1
						v93 = string.sub(p76, v94, v95) == "\n"
					end
				else
					v93 = v86
				end
				v90 = v91(p76, v92, v85, v93)
			else
				v90 = v89
			end
		end
		local v96 = v_u_5.FFlagMarkdownTables
		if v96 then
			if v89 then
				v96 = not v90
			else
				v96 = v89
			end
		end
		local v97
		if p78 then
			v97 = v_u_64[v88] or {}
		elseif v88 == "\n" and v84 == "QUOTE" then
			if v96 then
				v97 = v_u_72
			else
				v97 = v_u_66
			end
		elseif v90 then
			v97 = v_u_25
		elseif v96 then
			v97 = v_u_71
		else
			v97 = v_u_65[v88] or v_u_75
		end
		local v98 = false
		local v99 = nil
		local v100
		if v88 == "\n" and not p78 then
			v82 = v80
			v100 = 1
		else
			v100 = 0
		end
		for _, v101 in v97 do
			local v102 = v101[2]
			local v103, v104 = string.find(p76, v102, v80 + v100)
			if not (v103 and v104) then
				continue
			end
			local v105 = string.sub(p76, v103, v104)
			local v106 = v101[1]
			local v107 = v101[3] or 0
			local v108 = #v105 - v107
			local v109 = nil
			if not p78 then
				local _, v110 = string.find(v105, "\n[^\n]*$")
				if v110 then
					v82 = v110 + v103
				end
			end
			local v111 = v_u_5.FFlagMarkdownTables
			if v111 then
				if v84 == "TABLE_ROW" then
					v111 = v105 == "\\|"
				else
					v111 = false
				end
			end
			if v106 == "ESCAPE" and not v111 then
				local v112
				if v87 then
					v112 = v87.isInside(v82)
				else
					v112 = v_u_4.isInsideInlineCode(v83, v82)
				end
				if v112 then
					continue
				end
			end
			if v87 and (v_u_7[v106] and v87.isInsideClosed(v82, v80)) then
				continue
			end
			if v_u_2.STYLED_TEXT[v106] then
				v109 = v_u_4.getCharacterContext(p76, v80, v100 + v108)
			end
			local v113 = { string.match(p76, v102, v80 + v100) }
			if p78 and (v88 == "<" and (#v113 > 0 and not p79.inlineTags[v113[1]])) then
				continue
			end
			if v80 ~= v81 then
				local v114 = {
					["name"] = "TEXT",
					["text"] = nil,
					["offset"] = nil
				}
				local v115 = v80 - 1
				v114.text = string.sub(p76, v81, v115)
				v114.offset = v81 + p77
				v_u_6(v83, v114)
			end
			local v116 = not p78
			if v116 then
				v116 = v88 == "\n"
			end
			if v116 then
				v84 = v106
			end
			local v117 = {
				["name"] = v106,
				["text"] = v105
			}
			if #v113 <= 0 then
				v113 = nil
			end
			v117.capture = v113
			v117.isBlock = v116
			v117.offset = v80 + p77
			v117.context = v109
			v_u_6(v83, v117)
			if v87 and v106 == "INLINE_CODE" then
				v87.addBacktick(v82, v80)
			end
			v80 = v80 + (v100 + v108)
			v81 = v80
			v99 = v106
			v98 = true
		end
		if not v98 then
			v80 = v80 + 1
		end
		if not (v_u_5.FFlagMarkdownTables and v89) then
			break
		end
		v85 = v99 == "TABLE_ROW"
	end
	if v80 ~= v81 then
		local v118 = {
			["name"] = "TEXT",
			["text"] = nil,
			["offset"] = nil
		}
		local v119 = v80 - 1
		v118.text = string.sub(p76, v81, v119)
		v118.offset = v81 + p77
		v_u_6(v83, v118)
	end
	return v_u_3(v83)
end
return function(p121, p122) -- name: tokenize
	-- upvalues: (copy) v_u_120, (copy) v_u_74, (copy) v_u_6
	local v123 = {}
	for _, v124 in v_u_120(p121, 0, false, p122) do
		local v125 = v_u_74[v124.name]
		if v125 then
			local v126 = {}
			local v127 = {
				["name"] = v125.startToken,
				["offset"] = v124.offset
			}
			local v128 = v124.offset
			local v129 = v124.offset + v125.textStartOffset - 1
			v127.text = string.sub(p121, v128, v129)
			v127.capture = v124.capture
			__set_list(v126, 1, {v127})
			local v130 = v125.mapToText(v124)
			local v131 = v_u_120(v130, v124.offset + v125.textStartOffset, true, p122)
			table.move(v131, 1, #v131, 2, v126)
			local v132 = v124.offset + v125.textStartOffset + #v130
			local v133 = {
				["name"] = v125.endToken,
				["offset"] = v132
			}
			local v134 = v124.offset + #v124.text - 1
			v133.text = string.sub(p121, v132, v134)
			v_u_6(v126, v133)
			table.move(v126, 1, #v126, #v123 + 1, v123)
		else
			v_u_6(v123, v124)
		end
	end
	return v123
end