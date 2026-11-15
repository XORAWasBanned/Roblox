-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.formatTokens
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(script.Parent.colorScopeKeepPrefix)
require(v1.Providers.Style.Tokens)
require(script.Parent.Rules.Types)
local function v_u_7(p3) -- name: pascalToKebab
	local v4 = p3:gsub("_", "-")
	local v6 = string.gsub(v4, "(%u)", function(p5)
		return "-" .. p5:lower()
	end)
	if v6:sub(1, 1) == "-" then
		v6 = v6:sub(2, #v6)
	end
	return v6
end
return function(p8) -- name: formatTokens
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	local v9 = {}
	local v10 = {}
	local v11 = {}
	local v12 = {}
	local v13 = {}
	local v14 = {}
	local v15 = {}
	local v16 = {}
	local v17 = {}
	local v18 = {}
	local v19 = {
		["colors"] = v9,
		["variants"] = v10,
		["strokes"] = v11,
		["gaps"] = v12,
		["radii"] = v13,
		["sizes"] = v14,
		["typography"] = v15,
		["paddings"] = v16,
		["margins"] = v17,
		["gutters"] = v18
	}
	if p8 == nil or next(p8) == nil then
		return v19
	end
	for v20, v21 in pairs(p8.Color) do
		if v21.Background then
			v10[v_u_7(v20)] = v21
		else
			v9[v20] = {}
			for v24, v23 in v21 do
				if v_u_2[v20] then
					local v24 = v20 .. v24
				end
				v9[v20][v_u_7(v24)] = v23
			end
		end
	end
	for v25, v26 in pairs(p8.Inverse) do
		if v25 ~= "Content" then
			continue
		end
		for v29, v28 in v26 do
			if v_u_2[v25] then
				local v29 = v25 .. v29
			end
			v9[v25][("inverse-%*"):format((v_u_7(v29)))] = v28
		end
	end
	for v30, v31 in pairs(p8.Stroke) do
		local v32 = {
			["name"] = v_u_7(v30),
			["size"] = v31
		}
		table.insert(v11, v32)
	end
	table.insert(v11, {
		["name"] = "none",
		["size"] = 0
	})
	table.sort(v11, function(p33, p34)
		return p33.size < p34.size
	end)
	for v35, v36 in pairs(p8.Gap) do
		local v37 = {
			["name"] = string.lower(v35),
			["size"] = UDim.new(0, v36)
		}
		table.insert(v12, v37)
	end
	table.sort(v12, function(p38, p39)
		return p38.size.Offset < p39.size.Offset
	end)
	for v40, v41 in pairs(p8.Radius) do
		local v42 = {
			["name"] = string.lower(v40),
			["size"] = UDim.new(0, v41)
		}
		table.insert(v13, v42)
	end
	table.sort(v13, function(p43, p44)
		return p43.size.Offset < p44.size.Offset
	end)
	for v45, v46 in pairs(p8.Size) do
		local v47 = {
			["name"] = v_u_7(string.split(v45, "_")[2]),
			["size"] = UDim.new(0, v46)
		}
		table.insert(v14, v47)
	end
	local v48 = {
		["name"] = "full",
		["size"] = nil,
		["size"] = UDim.new(1, 0)
	}
	table.insert(v14, v48)
	table.sort(v14, function(p49, p50)
		return p49.size.Offset < p50.size.Offset
	end)
	for v51, v52 in pairs(p8.Typography) do
		v15[v_u_7(v51)] = {
			["Font"] = v52.Font,
			["TextSize"] = v52.FontSize,
			["LineHeight"] = v52.LineHeight
		}
	end
	for v53, v54 in pairs(p8.Padding) do
		local v55 = {
			["name"] = string.lower(v53),
			["size"] = UDim.new(0, v54)
		}
		table.insert(v16, v55)
	end
	table.sort(v16, function(p56, p57)
		return p56.size.Offset < p57.size.Offset
	end)
	for v58, v59 in pairs(p8.Margin) do
		local v60 = {
			["name"] = string.lower(v58),
			["size"] = UDim.new(0, v59)
		}
		table.insert(v17, v60)
	end
	table.sort(v17, function(p61, p62)
		return p61.size.Offset < p62.size.Offset
	end)
	for v63, v64 in pairs(p8.Gutter) do
		local v65 = {
			["name"] = string.lower(v63),
			["size"] = UDim.new(0, v64)
		}
		table.insert(v18, v65)
	end
	table.sort(v18, function(p66, p67)
		return p66.size.Offset < p67.size.Offset
	end)
	return v19
end