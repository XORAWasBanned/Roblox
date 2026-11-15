-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.CommonMarkComplianceParser.PostProcessTree
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v_u_2 = require(v1.Parent.MarkdownCore).Flags
local v_u_3 = require(v1.Enums.NodeType)
local v_u_4 = require(v1.Enums.TableAlignment)
local v_u_5 = table.insert
local v6 = require(script.Parent.Parent.Constants)
local v_u_7 = v6.CONTAINERS
local v_u_8 = v6.INLINE_TEXT
local v_u_9 = v6.PLAIN_TEXT
local v_u_10 = v6.STYLED_TEXT
local v_u_11 = require(script.Parent.Parent.getNodeType)
local v_u_12 = require(script.Parent.Parent.isNodeBlock)
local v_u_13 = {}
local function v_u_19(p14, p15) -- name: trimLeadingWhitespace
	-- upvalues: (copy) v_u_5
	local v16 = {}
	for _, v17 in p14 do
		if p15 and (v17.name == "TEXT" and v17.text) then
			v17.text = v17.text:gsub("^[ \t]+", "")
			if #v17.text == 0 then
				continue
			end
		end
		if v17.name == "BREAK" and v17.text ~= nil then
			local v18 = v17.text
			p15 = string.sub(v18, -1) == "\n"
		else
			p15 = false
		end
		v_u_5(v16, v17)
	end
	return v16
end
local function v_u_23(p20, p21) -- name: makeContentInline
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_23
	if p20.name == "TAG" then
		p20.type = v_u_3.InlineSpan
	elseif p20.name == "DIVIDER" then
		p20.name = "BREAK"
		p20.type = v_u_11("BREAK", p21)
	end
	for _, v22 in p20.children do
		v_u_23(v22, p21)
	end
end
function v_u_13.postProcessTree(p24, p25) -- name: postProcessTree
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_7, (copy) v_u_23, (copy) v_u_8, (copy) v_u_13, (copy) v_u_5, (copy) v_u_9, (copy) v_u_12, (copy) v_u_19
	local v26 = {}
	local v27 = 1
	local v28 = p24.children
	local v29 = p24.name == "TAG" and (not p25.inlineTags[p24.text] and v_u_2.FFlagMarkdownTagFallbacks)
	if v29 then
		v29 = p24.type == v_u_3.InlineSpan
	end
	local v30 = v_u_7[p24.name]
	if v30 then
		v30 = not v29
	end
	local v31 = v_u_2.FFlagMarkdownTagFallbacks
	if v31 then
		if p24.type == v_u_3.TextBlock then
			v31 = true
		elseif p24.type == v_u_3.InlineSpan then
			v31 = true
		else
			v31 = false
		end
	end
	while v27 <= #v28 do
		local v32 = v28[v27]
		if v31 and v32.name == "TAG" then
			v_u_23(v32, p25)
		end
		local v33 = v32.name == "TAG" and v32.text
		if v33 then
			v33 = p25.inlineTags[v32.text]
		end
		if (v_u_8[v32.name] or v33) and v30 then
			local v34, v35 = v_u_13.buildParagraph(v28, v27, p25)
			local v36 = v34 > 0
			assert(v36, "Did not find an inline node when expected")
			if #v35.children > 0 then
				v_u_5(v26, v35)
			end
			v27 = v27 + v34
		elseif v_u_9[v32.name] then
			local v37, v38 = v_u_13.mergeTextNodes(v28, v27, nil, p25)
			local v39 = v37 > 0
			assert(v39, "Did not find a text node when expected")
			if v38.text and #v38.text > 0 then
				v_u_5(v26, v38)
			end
			v27 = v27 + v37
		elseif v32.name == "LIST_ITEM" then
			local v40, v41 = v_u_13.buildList(v28, v27, p25)
			v_u_5(v26, v41)
			local v42 = v40 > 0
			assert(v42, "Did not find a list node when expected")
			v27 = v27 + v40
		elseif v32.name == "TABLE_ROW" then
			local v43, v44 = v_u_13.buildTable(v28, v27, p25)
			v_u_5(v26, v44)
			local v45 = v43 > 0
			assert(v45, "Did not find a table row node when expected")
			v27 = v27 + v43
		elseif v32.name == "QUOTE" then
			local v46, v47 = v_u_13.buildQuote(v28, v27, p25)
			v_u_5(v26, v47)
			local v48 = v46 > 0
			assert(v48, "Did not find a quote node when expected")
			v27 = v27 + v46
		elseif v32.name == "LINE_BREAK" then
			v27 = v27 + 1
		else
			v32.children = v_u_13.postProcessTree(v32, p25)
			v_u_5(v26, v32)
			v27 = v27 + 1
		end
	end
	if v_u_12(p24) then
		v26 = v_u_19(v26, false)
		local v49 = v26[1]
		if v49 and v49.text then
			v49.text = v49.text:gsub("^%s+", "")
		end
		local v50 = v26[#v26]
		if v50 and v50.text then
			v50.text = v50.text:gsub("%s+$", "")
		end
	end
	return v26
end
function v_u_13.buildParagraph(p51, p52, p53, p54) -- name: buildParagraph
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_13, (copy) v_u_5, (copy) v_u_19, (copy) v_u_2, (copy) v_u_23, (copy) v_u_11
	local v55 = p52
	local v56 = {}
	local v57 = 0
	while p52 <= #p51 do
		local v58 = p51[p52]
		local v59 = v58.name == "TAG" and v58.text
		if v59 then
			v59 = p53.inlineTags[v58.text]
		end
		local v60 = v_u_8[v58.name] or v59
		if v_u_9[v58.name] then
			local v61, v62 = v_u_13.mergeTextNodes(p51, p52, p54, p53)
			if v62.text and #v62.text > 0 then
				v_u_5(v56, v62)
			end
			local v63 = v61 > 0
			assert(v63, "Did not find a rich text node when expected")
			v57 = v57 + v61
			p52 = p52 + v61
		elseif v58.name == "STYLED_TEXT" then
			local _, v64 = v_u_13.buildParagraph(v58.children, 1, p53, true)
			if v58.attributes and v58.attributes.style == "INLINE_CODE" then
				v58.children = v_u_13.applyCodeSpanRules(v64.children)
			else
				v58.children = v_u_19(v64.children, false)
			end
			v_u_5(v56, v58)
			v57 = v57 + 1
			p52 = p52 + 1
		else
			if not v60 then
				break
			end
			if v_u_2.FFlagMarkdownTagFallbacks and v58.name == "TAG" then
				v_u_23(v58, p53)
			end
			v_u_5(v56, v58)
			v57 = v57 + 1
			p52 = p52 + 1
		end
	end
	if not p54 then
		local v65 = p51[v55 - 1]
		local v66 = v_u_19
		if v65 then
			v65 = v65.name == "TAG"
		end
		v56 = v66(v56, not v65)
	end
	return v57, {
		["name"] = "PARAGRAPH",
		["children"] = nil,
		["offset"] = nil,
		["type"] = nil,
		["children"] = v56,
		["offset"] = p51[v55].offset,
		["type"] = v_u_11("PARAGRAPH", p53)
	}
end
function v_u_13.outputRichText(p67, p68) -- name: outputRichText
	-- upvalues: (copy) v_u_10, (copy) v_u_13
	local v69
	if p67.attributes then
		v69 = v_u_10[p67.attributes.style]
	else
		v69 = nil
	end
	if v69 then
		local v70, v71 = v_u_13.mergeTextNodes(p67.children, 1, nil, p68)
		local v72 = v70 == #p67.children
		local v73 = ("Found non-inline content inside inline element at %*"):format(p67.offset)
		assert(v72, v73)
		return ("<%*>%*</%*>"):format(v69, v71.text, v69)
	end
	if p67.text then
		return p67.text
	end
	local v74 = ("No text for node at %*"):format(p67.offset)
	assert(false, v74)
end
function v_u_13.buildList(p75, p76, p77) -- name: buildList
	-- upvalues: (copy) v_u_13, (copy) v_u_5, (copy) v_u_11
	local v78 = p75[p76].attributes.depth
	local v79 = p76
	local v80 = {}
	local v81 = 0
	while p76 <= #p75 do
		local v82 = p75[p76]
		if v82.name ~= "LIST_ITEM" then
			break
		end
		if v82.attributes.depth == v78 then
			v82.children = v_u_13.postProcessTree(v82, p77)
			v_u_5(v80, v82)
			v81 = v81 + 1
			p76 = p76 + 1
		else
			if v78 >= v82.attributes.depth then
				break
			end
			local v83, v84 = v_u_13.buildList(p75, p76, p77)
			v_u_5(v80, v84)
			local v85 = v83 > 0
			assert(v85, "Did not find a list node when expected")
			p76 = p76 + v83
			v81 = v81 + v83
		end
	end
	return v81, {
		["name"] = "LIST",
		["attributes"] = nil,
		["children"] = nil,
		["offset"] = nil,
		["type"] = nil,
		["attributes"] = {
			["depth"] = v78
		},
		["children"] = v80,
		["offset"] = p75[v79].offset,
		["type"] = v_u_11("LIST", p77)
	}
end
local function v_u_88(p86) -- name: isEmptyQuoteLine
	for _, v87 in p86 do
		if v87.name == "TEXT" and (not v87.text or #v87.text <= 0) then
			continue
		end
		return false
	end
	return true
end
function v_u_13.buildQuote(p89, p90, p91) -- name: buildQuote
	-- upvalues: (copy) v_u_13, (copy) v_u_5, (copy) v_u_88, (copy) v_u_11
	local v92 = p90
	local v93 = {}
	local v94 = 0
	while p90 <= #p89 and p89[p90].name == "QUOTE" do
		local v95 = p89[p90]
		v_u_5(v93, {
			["node"] = v95,
			["children"] = v_u_13.postProcessTree(v95, p91)
		})
		v94 = v94 + 1
		p90 = p90 + 1
	end
	local v96 = #v93
	local v97 = 1
	while v97 <= v96 and v_u_88(v93[v97].children) do
		v97 = v97 + 1
	end
	while v97 <= v96 and v_u_88(v93[v96].children) do
		v96 = v96 - 1
	end
	local v98 = {}
	for v99 = v97, v96 do
		local v100 = v93[v99]
		if v97 < v99 then
			v_u_5(v98, {
				["name"] = "BREAK",
				["children"] = nil,
				["offset"] = nil,
				["type"] = nil,
				["children"] = {},
				["offset"] = v100.node.offset,
				["type"] = v_u_11("BREAK", p91)
			})
		end
		for _, v101 in v100.children do
			if v101.name == "TEXT" and v101.text == "" then
				continue
			end
			v_u_5(v98, v101)
		end
	end
	local v102 = p89[v92]
	v102.children = v98
	return v94, v102
end
local function v_u_114(p103, p104) -- name: buildTableCellsLegacy
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_5
	local v105 = p103.children[1]
	local v106 = {}
	local v107 = true
	local v108 = {}
	for v109 = 1, #p103.children do
		local v110 = p103.children[v109]
		if v110.name == "TABLE_DIVIDER" then
			local v111 = {
				["name"] = "TABLE_CELL",
				["children"] = nil,
				["offset"] = nil,
				["type"] = nil,
				["children"] = v106
			}
			local v112
			if v106[1] then
				v112 = v106[1].offset
			else
				v112 = p103.offset
			end
			v111.offset = v112
			v111.type = v_u_11("TABLE_CELL", p104)
			v111.children = v_u_13.postProcessTree(v111, p104)
			v_u_5(v108, v111)
			local v113 = v105.text
			if v113 then
				v113 = v105.text:match("^[ \t-=]+$") ~= nil
			end
			v106 = {}
			v107 = v107 and v113 and v113 or false
		else
			v_u_5(v106, v110)
		end
	end
	if v107 then
		return nil
	else
		return v108
	end
end
local function v_u_123(p115, p116, p117) -- name: buildTableLegacy
	-- upvalues: (copy) v_u_114, (copy) v_u_5, (copy) v_u_11
	local v118 = 0
	local v119 = {}
	for v120 = p116, #p115 do
		local v121 = p115[v120]
		if v121.name ~= "TABLE_ROW" then
			break
		end
		local v122 = v_u_114(v121, p117)
		if v122 then
			v121.children = v122
			v_u_5(v119, v121)
		elseif #v119 > 0 then
			v119[#v119].name = "TABLE_HEADER"
		end
		v118 = v118 + 1
	end
	return v118, {
		["name"] = "TABLE",
		["children"] = nil,
		["offset"] = nil,
		["type"] = nil,
		["children"] = v119,
		["offset"] = p115[p116].offset,
		["type"] = v_u_11("TABLE", p117)
	}
end
local function v_u_130(p124) -- name: getDelimiterAlignment
	-- upvalues: (copy) v_u_4
	local v125 = ""
	for _, v126 in p124.children do
		v125 = v125 .. (v126.text or "")
	end
	local v127 = string.match(v125, "^%s*(.-)%s*$") or ""
	local v128 = string.sub(v127, 1, 1) == ":"
	local v129 = string.sub(v127, -1) == ":"
	if v128 and v129 then
		return v_u_4.Center
	elseif v129 then
		return v_u_4.Right
	elseif v128 then
		return v_u_4.Left
	else
		return nil
	end
end
function v_u_13.buildTable(p131, p132, p133) -- name: buildTable
	-- upvalues: (copy) v_u_2, (copy) v_u_123, (copy) v_u_13, (copy) v_u_130, (copy) v_u_5, (copy) v_u_11
	if not v_u_2.FFlagMarkdownTables then
		return v_u_123(p131, p132, p133)
	end
	local v134 = {}
	local v135 = {}
	local v136 = 0
	for v137 = p132, #p131 do
		local v138 = p131[v137]
		if v138.name ~= "TABLE_ROW" then
			break
		end
		local v139, v140 = v_u_13.buildTableCells(v138, p133)
		if v140 and v136 == 1 then
			v134[1].name = "TABLE_HEADER"
			for v141, v142 in v139 do
				v135[v141] = v_u_130(v142)
			end
		else
			v138.children = v139
			v_u_5(v134, v138)
		end
		v136 = v136 + 1
	end
	if v134[1] then
		local v143 = #v134[1].children
		for _, v144 in v134 do
			for _ = #v144.children + 1, v143 do
				v_u_5(v144.children, v_u_13.buildTableCell({}, v144, p133))
			end
			for _ = v143 + 1, #v144.children do
				table.remove(v144.children)
			end
			for v145, v146 in v144.children do
				local v147 = v135[v145]
				if not v147 then
					continue
				end
				v146.attributes = {
					["alignment"] = v147
				}
			end
		end
	end
	return v136, {
		["name"] = "TABLE",
		["children"] = nil,
		["offset"] = nil,
		["type"] = nil,
		["children"] = v134,
		["offset"] = p131[p132].offset,
		["type"] = v_u_11("TABLE", p133)
	}
end
local function v_u_151(p148) -- name: isDividerCell
	local v149 = ""
	for _, v150 in p148.children do
		if v150.name ~= "TEXT" then
			return false
		end
		v149 = v149 .. (v150.text or "")
	end
	return v149:match("^%s*:?%-+:?%s*$") ~= nil
end
local function v_u_154(p152) -- name: hasContent
	for _, v153 in p152 do
		if v153.name == "TEXT" and not (v153.text and v153.text:find("%S")) then
			continue
		end
		return true
	end
	return false
end
function v_u_13.buildTableCell(p155, p156, p157) -- name: buildTableCell
	-- upvalues: (copy) v_u_11, (copy) v_u_13
	local v158 = {
		["name"] = "TABLE_CELL",
		["children"] = nil,
		["offset"] = nil,
		["type"] = nil,
		["children"] = p155
	}
	local v159
	if p155[1] then
		v159 = p155[1].offset
	else
		v159 = p156.offset
	end
	v158.offset = v159
	v158.type = v_u_11("TABLE_CELL", p157)
	v158.children = v_u_13.postProcessTree(v158, p157)
	return v158
end
function v_u_13.buildTableCells(p160, p161) -- name: buildTableCells
	-- upvalues: (copy) v_u_13, (copy) v_u_5, (copy) v_u_151, (copy) v_u_154
	local v162 = {}
	local v163 = {}
	local v164 = true
	for v165 = 1, #p160.children do
		local v166 = p160.children[v165]
		if v166.name == "TABLE_DIVIDER" then
			local v167 = v_u_13.buildTableCell(v162, p160, p161)
			v_u_5(v163, v167)
			if v164 then
				v164 = v_u_151(v167)
			end
			v162 = {}
		else
			v_u_5(v162, v166)
		end
	end
	if v_u_154(v162) then
		local v168 = v_u_13.buildTableCell(v162, p160, p161)
		v_u_5(v163, v168)
		if v164 then
			v164 = v_u_151(v168)
		end
	end
	if v164 then
		v164 = #v163 > 0
	end
	return v163, v164
end
function v_u_13.mergeTextNodes(p169, p170, p171, p172) -- name: mergeTextNodes
	-- upvalues: (copy) v_u_9, (copy) v_u_11
	local v173 = ""
	local v174 = 0
	for v175 = p170, #p169 do
		local v176 = p169[v175]
		if not v_u_9[v176.name] then
			break
		end
		v173 = v173 .. v176.text
		v174 = v174 + 1
	end
	if not p171 then
		v173 = v173:gsub("^\n*(.-)\n*$", "%1")
	end
	return v174, {
		["name"] = "TEXT",
		["text"] = nil,
		["children"] = nil,
		["offset"] = nil,
		["type"] = nil,
		["text"] = v173,
		["children"] = {},
		["offset"] = p169[p170].offset,
		["type"] = v_u_11("TEXT", p172)
	}
end
function v_u_13.applyCodeSpanRules(p177) -- name: applyCodeSpanRules
	local v178 = nil
	local v179 = nil
	local v180 = false
	for _, v181 in p177 do
		if not v181.text or #v181.text <= 0 then
			continue
		end
		if v178 == nil then
			v178 = v181
		end
		if v181.text:find("[^\n ]") then
			v179 = v181
			v180 = true
		else
			v179 = v181
		end
	end
	if v178 == nil or v179 == nil then
		return p177
	end
	local v182 = (v178.text or ""):gsub("\n", " ")
	local v183 = (v179.text or ""):gsub("\n", " ")
	if v182:sub(1, 1) == " " and (v183:sub(-1, -1) == " " and v180) then
		if v178 == v179 then
			v182 = v182:sub(2, -2)
			v183 = v182
		else
			v182 = v182:sub(2)
			v183 = v183:sub(1, -2)
		end
	end
	v178.text = v182
	v179.text = v183
	return p177
end
return v_u_13.postProcessTree