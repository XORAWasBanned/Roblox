-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.FlattenBlocks
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v_u_3 = require(script.Parent.Children)
require(v2.CommonMark)
local v_u_4 = require(script.Parent.ListMarkers)
require(script.Parent.Registry)
local v_u_5 = require(script.Parent.RendererNodes)
require(v1.Types)
local v_u_6 = table.freeze({})
local function v_u_12(p7, p8) -- name: beginLine
	-- upvalues: (copy) v_u_5
	local v9 = p7._out
	local v10 = {
		["entry"] = nil,
		["mark"] = nil,
		["startedBefore"] = nil,
		["contentStart"] = 0,
		["entry"] = p8,
		["mark"] = #v9.children,
		["startedBefore"] = p7._startedLine
	}
	if p7._startedLine then
		v_u_5.append(v9, "BREAK")
		if p8.separator == "paragraph" then
			v_u_5.append(v9, "BREAK")
		end
	end
	p7._startedLine = true
	if p8.prefix ~= nil then
		v_u_5.appendText(v9, p8.prefix)
	end
	local v11
	if p8.prefix == nil then
		v11 = #v9.children
	else
		v11 = v10.mark
	end
	v10.contentStart = v11
	return v10
end
return {
	["start"] = function(p13, p14, p15, p16) -- name: start
		-- upvalues: (copy) v_u_6
		local v17 = {}
		local v18 = {}
		for v19, v20 in p13 do
			table.insert(v17, {
				["unit"] = nil,
				["separator"] = "paragraph",
				["level"] = 0,
				["top"] = nil,
				["unit"] = v20,
				["top"] = v19
			})
		end
		for v21 = #v17, 1, -1 do
			local v22 = v17[v21]
			table.insert(v18, v22)
		end
		return {
			["_units"] = nil,
			["_out"] = nil,
			["_registry"] = nil,
			["_drop"] = nil,
			["_stack"] = nil,
			["_startedLine"] = nil,
			["_drew"] = nil,
			["_openLine"] = nil,
			["_units"] = p13,
			["_out"] = p14,
			["_registry"] = p15,
			["_drop"] = p16 or v_u_6,
			["_stack"] = v18,
			["_startedLine"] = #p14.children > 0,
			["_drew"] = {}
		}
	end,
	["resume"] = function(p23) -- name: resume
		-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
		local v24 = p23._openLine
		if v24 ~= nil then
			p23._openLine = nil
			local v25 = p23._out.children
			if #v25 > v24.contentStart then
				p23._drew[v24.entry.top] = true
			else
				for v26 = #v25, v24.mark + 1, -1 do
					v25[v26] = nil
				end
				p23._startedLine = v24.startedBefore
			end
		end
		local v27 = p23._out
		local v28 = p23._stack
		while #v28 > 0 do
			local v29 = table.remove(v28)
			local v30 = v29.unit.block
			local v31
			if v30 == nil then
				v31 = nil
			else
				v31 = v30.kind
			end
			if v30 == nil then
				p23._openLine = v_u_12(p23, v29)
				return v29.unit.inlines or {}, nil
			end
			if p23._drop[v30.kind] then
				continue
			end
			if v31 == "Paragraph" or v31 == "Heading" then
				p23._openLine = v_u_12(p23, v29)
				return nil, v30
			end
			if v31 == "FencedCodeBlock" or v31 == "IndentedCodeBlock" then
				local v32 = v_u_12(p23, v29)
				local v33 = v30.literal or ""
				if string.sub(v33, -1) == "\n" then
					v33 = string.sub(v33, 1, -2)
				end
				for v34, v35 in string.split(v33, "\n") do
					if v34 > 1 then
						v_u_5.append(v27, "BREAK")
					end
					if v35 == "" then
						continue
					end
					v_u_5.appendText(v27, v35)
				end
				local v36 = p23._out.children
				if #v36 > v32.contentStart then
					p23._drew[v32.entry.top] = true
				else
					for v37 = #v36, v32.mark + 1, -1 do
						v36[v37] = nil
					end
					p23._startedLine = v32.startedBefore
				end
			elseif v31 == "HtmlBlock" then
				local v38 = v_u_12(p23, v29)
				local v39 = v30.literal
				if v39 ~= nil and v39 ~= "" then
					v_u_5.appendText(v27, v39)
				end
				local v40 = p23._out.children
				if #v40 > v38.contentStart then
					p23._drew[v38.entry.top] = true
				else
					for v41 = #v40, v38.mark + 1, -1 do
						v40[v41] = nil
					end
					p23._startedLine = v38.startedBefore
				end
			elseif v31 == "ThematicBreak" then
				local v42 = v_u_12(p23, v29)
				v_u_5.appendText(v27, "---")
				local v43 = p23._out.children
				if #v43 > v42.contentStart then
					p23._drew[v42.entry.top] = true
				else
					for v44 = #v43, v42.mark + 1, -1 do
						v43[v44] = nil
					end
					p23._startedLine = v42.startedBefore
				end
			elseif v31 == "BulletList" or v31 == "OrderedList" then
				local v45 = v29.separator
				if v29.prefix ~= nil then
					local v46 = v_u_12(p23, v29)
					local v47 = p23._out.children
					if #v47 > v46.contentStart then
						p23._drew[v46.entry.top] = true
					else
						for v48 = #v47, v46.mark + 1, -1 do
							v47[v48] = nil
						end
						p23._startedLine = v46.startedBefore
					end
					v45 = "line"
				end
				local v49 = string.rep("  ", v29.level)
				local v50 = v_u_4.bulletPrefix(v30)
				local v51 = v_u_4.startNumber(v30)
				local v52 = {}
				for _, v53 in v_u_3.units(v30, p23._registry, true) do
					local v54
					if v53.block == nil or v53.block.kind ~= "ListItem" then
						v54 = nil
					elseif v51 == nil then
						v54 = v49 .. v50
					else
						v54 = ("%*%*. "):format(v49, (v_u_4.orderedPrefix(v51)))
						v51 = v51 + 1
					end
					local v55 = {
						["unit"] = v53,
						["separator"] = #v52 ~= 0 and "line" or v45,
						["prefix"] = v54,
						["level"] = v29.level,
						["top"] = v29.top
					}
					table.insert(v52, v55)
				end
				for v56 = #v52, 1, -1 do
					local v57 = v52[v56]
					table.insert(v28, v57)
				end
			else
				local v58 = v_u_3.units(v30, p23._registry, false)
				if #v58 == 0 then
					local v59 = v_u_12(p23, v29)
					local v60 = p23._out.children
					if #v60 > v59.contentStart then
						p23._drew[v59.entry.top] = true
					else
						for v61 = #v60, v59.mark + 1, -1 do
							v60[v61] = nil
						end
						p23._startedLine = v59.startedBefore
					end
				end
				local v62
				if v31 == "ListItem" then
					v62 = v29.level + 1
				else
					v62 = v29.level
				end
				local v63 = v31 == "ListItem" and "line" or "paragraph"
				local v64 = {}
				for v65, v66 in v58 do
					local v67 = {
						["unit"] = v66
					}
					local v68
					if v65 == 1 then
						v68 = v29.separator
					else
						v68 = v63
					end
					v67.separator = v68
					local v69
					if v65 == 1 then
						v69 = v29.prefix
					else
						v69 = nil
					end
					v67.prefix = v69
					v67.level = v62
					v67.top = v29.top
					table.insert(v64, v67)
				end
				for v70 = #v64, 1, -1 do
					local v71 = v64[v70]
					table.insert(v28, v71)
				end
			end
		end
		return nil, nil
	end,
	["drawnUnits"] = function(p72) -- name: drawnUnits
		local v73 = {}
		for v74, v75 in p72._units do
			if not p72._drew[v74] then
				continue
			end
			table.insert(v73, v75)
		end
		return v73
	end
}