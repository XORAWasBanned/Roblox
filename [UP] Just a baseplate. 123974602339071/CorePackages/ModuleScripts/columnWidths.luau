-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.NodeRenderers.MarkdownTable.columnWidths
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v4 = require(v2.InlineLayout)
local v_u_5 = require(script.Parent.getRowContext)
local v_u_6 = require(v1.Utils.mergeContexts)
require(v1.Types)
local v_u_7 = v4.Components.InlineLayoutElements.HardBreakElement
local v_u_8 = v4.Utils.isInlineElement
local function v_u_13(p9) -- name: measureUnwrappedWidth
	-- upvalues: (copy) v_u_7
	local v10 = 0
	local v11 = 0
	for _, v12 in p9 do
		if v12 == v_u_7 then
			v10 = 0
		else
			v10 = v10 + v12:getWidth()
			v11 = math.max(v11, v10)
		end
	end
	return math.ceil(v11)
end
local function v_u_15(p14) -- name: getStyleKey
	-- upvalues: (copy) v_u_3
	return v_u_3.pretty({
		["textStyles"] = p14.textStyles,
		["codeStyles"] = p14.codeStyles,
		["linkStyles"] = p14.linkStyles,
		["imageStyles"] = p14.imageStyles
	}, {
		["depth"] = 4
	})
end
local function v_u_20(p16) -- name: getContentKey
	-- upvalues: (copy) v_u_3, (copy) v_u_20
	local v17 = p16.text or ""
	local v18 = ("%*:%*:%*"):format(p16.name, #v17, v17)
	if p16.attributes then
		v18 = v18 .. v_u_3.pretty(p16.attributes)
	end
	for _, v19 in p16.children do
		v18 = v18 .. ("(%*)"):format((v_u_20(v19)))
	end
	return v18
end
return {
	["MIN_COLUMN_CONTENT_WIDTH"] = 80,
	["createWidthCache"] = nil,
	["measureColumnContentWidths"] = nil,
	["computeColumnWidths"] = nil,
	["fillUnmeasuredColumns"] = nil,
	["createWidthCache"] = function() -- name: createWidthCache
		return {
			["styleKey"] = "",
			["cellWidths"] = nil,
			["cellWidths"] = {}
		}
	end,
	["measureColumnContentWidths"] = function(p21, p22, p23) -- name: measureColumnContentWidths
		-- upvalues: (copy) v_u_15, (copy) v_u_6, (copy) v_u_5, (copy) v_u_20, (copy) v_u_3, (copy) v_u_8, (copy) v_u_13
		local v24 = v_u_15(p22)
		local v25 = p23.styleKey ~= v24 and {} or p23.cellWidths
		local v26 = {}
		local v27 = {}
		for _, v28 in p21.children do
			local v29 = v_u_6(v_u_5(v28, p22), {
				["isInline"] = true
			})
			for v30, v31 in v28.children do
				local v32 = v28.name .. v_u_20(v31)
				local v33 = v26[v32] or v25[v32] or v_u_13((v_u_3.filter(v29.processChildren(v31, v29), v_u_8)))
				v26[v32] = v33
				local v34 = v27[v30] or 0
				v27[v30] = math.max(v34, v33)
			end
		end
		p23.styleKey = v24
		p23.cellWidths = v26
		return v27
	end,
	["computeColumnWidths"] = function(p35, p36, p37) -- name: computeColumnWidths
		-- upvalues: (copy) v_u_3
		local v_u_38 = {}
		local v39 = {}
		local v40 = 0
		local v41 = 0
		for v42, v43 in p35 do
			v_u_38[v42] = v43 + p37
			v39[v42] = math.min(v43, 80) + p37
			v40 = v40 + v_u_38[v42]
			v41 = v41 + v39[v42]
		end
		if v40 <= p36 then
			return v_u_38
		end
		if p36 <= v41 then
			return v39
		end
		local v_u_44 = (p36 - v41) / (v40 - v41)
		return v_u_3.map(v39, function(p45, p46)
			-- upvalues: (copy) v_u_38, (copy) v_u_44
			local v47 = p45 + (v_u_38[p46] - p45) * v_u_44
			return math.floor(v47)
		end)
	end,
	["fillUnmeasuredColumns"] = function(p48, p49) -- name: fillUnmeasuredColumns
		if p49 <= #p48 then
			return p48
		end
		local v50 = table.clone(p48)
		for v51 = #p48 + 1, p49 do
			v50[v51] = 80
		end
		return v50
	end
}