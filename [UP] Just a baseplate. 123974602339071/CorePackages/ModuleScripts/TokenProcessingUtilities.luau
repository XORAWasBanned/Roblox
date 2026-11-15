-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.Tokens.TokenProcessingUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Logger)
require(v1.Components.Types)
local function v_u_18(p3, p4, p5, p6) -- name: collectTokens
	-- upvalues: (copy) v_u_18
	local v7 = {}
	for v8, v9 in p3 do
		local v10
		if p5 then
			v10 = ("%*.%*"):format(p5, v8)
		else
			v10 = v8
		end
		if type(v9) == "table" and not getmetatable(v9) then
			if p6 then
				local v11
				if type(v9) == "table" and v9.Color3 ~= nil then
					local v12 = v9.Color3
					if typeof(v12) == "Color3" and v9.Transparency ~= nil then
						local v13 = v9.Transparency
						v11 = typeof(v13) == "number"
					else
						v11 = false
					end
				else
					v11 = false
				end
				if v11 then
					table.insert(v7, {
						["key"] = v8,
						["value"] = v9,
						["category"] = p4,
						["fullPath"] = v10
					})
				else
					for v16, v17 in v_u_18(v9, p4, v10, p6) do
						table.insert(v7, v17)
					end
				end
			else
				for v16, v17 in v_u_18(v9, p4, v10, p6) do
					table.insert(v7, v17)
				end
			end
		else
			table.insert(v7, {
				["key"] = v8,
				["value"] = v9,
				["category"] = p4,
				["fullPath"] = v10
			})
		end
	end
	return v7
end
local function v_u_22(p19, p20) -- name: getTokenValue
	for _, v21 in string.split(p20, ".") do
		if p19 == nil or type(p19) ~= "table" then
			return nil
		end
		p19 = p19[v21]
	end
	return p19
end
local function v_u_28(p23, p24) -- name: tokenOverrideValuesCompatible
	-- upvalues: (copy) v_u_28
	if p23 == nil or p24 == nil then
		return false
	end
	if type(p23) ~= "table" or type(p24) ~= "table" then
		return typeof(p23) == typeof(p24)
	end
	for v25, v26 in p23 do
		if v_u_28(v26, p24[v25]) then
			continue
		end
		return false
	end
	for v27 in p24 do
		if p23[v27] ~= nil then
			continue
		end
		return false
	end
	return true
end
return {
	["isColorStyle"] = function(p29) -- name: isColorStyle
		local v30
		if type(p29) == "table" and p29.Color3 ~= nil then
			local v31 = p29.Color3
			if typeof(v31) == "Color3" and p29.Transparency ~= nil then
				local v32 = p29.Transparency
				v30 = typeof(v32) == "number"
			else
				v30 = false
			end
		else
			v30 = false
		end
		return v30
	end,
	["formatColorPreviewHTML"] = function(p33, p34) -- name: formatColorPreviewHTML
		local v35 = p33.R * 255
		local v36 = math.round(v35)
		local v37 = p33.G * 255
		local v38 = math.round(v37)
		local v39 = p33.B * 255
		local v40 = math.round(v39)
		local v41
		if p34 then
			local v42 = (1 - p34) * 1000
			v41 = math.round(v42) / 1000
		else
			v41 = nil
		end
		return ("<span class=\"color-preview\" style=\"background-color: rgba(%*,%*,%*,%*);\"></span>"):format(v36, v38, v40, v41 or 1)
	end,
	["formatTokenValue"] = function(p43) -- name: formatTokenValue
		if typeof(p43) == "Color3" then
			local v44 = p43.R * 255
			local v45 = math.round(v44)
			local v46 = p43.G * 255
			local v47 = math.round(v46)
			local v48 = p43.B * 255
			return ("rgb(%*, %*, %*)"):format(v45, v47, (math.round(v48)))
		end
		if typeof(p43) == "number" then
			local v49 = p43 * 1000
			local v50 = math.round(v49) / 1000
			return tostring(v50)
		end
		local v51
		if type(p43) == "table" and p43.Color3 ~= nil then
			local v52 = p43.Color3
			if typeof(v52) == "Color3" and p43.Transparency ~= nil then
				local v53 = p43.Transparency
				v51 = typeof(v53) == "number"
			else
				v51 = false
			end
		else
			v51 = false
		end
		if not v51 then
			return tostring(p43)
		end
		local v54 = p43.Color3
		local v55 = p43.Transparency
		local v56 = v54.R * 255
		local v57 = math.round(v56)
		local v58 = v54.G * 255
		local v59 = math.round(v58)
		local v60 = v54.B * 255
		local v61 = math.round(v60)
		local v62
		if v55 then
			local v63 = (1 - v55) * 1000
			v62 = math.round(v63) / 1000
		else
			v62 = nil
		end
		return ("rgba(%*, %*, %*, %*)"):format(v57, v59, v61, v62)
	end,
	["formatTokenValueHTML"] = function(p64) -- name: formatTokenValueHTML
		if typeof(p64) == "Color3" then
			local v65 = p64.R * 255
			local v66 = math.round(v65)
			local v67 = p64.G * 255
			local v68 = math.round(v67)
			local v69 = p64.B * 255
			local v70 = math.round(v69)
			local v71 = p64.R * 255
			local v72 = math.round(v71)
			local v73 = p64.G * 255
			local v74 = math.round(v73)
			local v75 = p64.B * 255
			return ("<span class=\"color\">%* rgb(%*, %*, %*)</span>"):format(("<span class=\"color-preview\" style=\"background-color: rgba(%*,%*,%*,%*);\"></span>"):format(v72, v74, math.round(v75), nil or 1), v66, v68, v70)
		end
		if typeof(p64) == "number" then
			local v76 = p64 * 1000
			local v77 = math.round(v76) / 1000
			return tostring(v77)
		end
		local v78
		if type(p64) == "table" and p64.Color3 ~= nil then
			local v79 = p64.Color3
			if typeof(v79) == "Color3" and p64.Transparency ~= nil then
				local v80 = p64.Transparency
				v78 = typeof(v80) == "number"
			else
				v78 = false
			end
		else
			v78 = false
		end
		if not v78 then
			return tostring(p64)
		end
		local v81 = p64.Color3
		local v82 = p64.Transparency
		local v83 = v81.R * 255
		local v84 = math.round(v83)
		local v85 = v81.G * 255
		local v86 = math.round(v85)
		local v87 = v81.B * 255
		local v88 = math.round(v87)
		local v89
		if v82 then
			local v90 = (1 - v82) * 1000
			v89 = math.round(v90) / 1000
		else
			v89 = nil
		end
		local v91 = p64.Color3
		local v92 = p64.Transparency
		local v93 = v91.R * 255
		local v94 = math.round(v93)
		local v95 = v91.G * 255
		local v96 = math.round(v95)
		local v97 = v91.B * 255
		local v98 = math.round(v97)
		local v99
		if v92 then
			local v100 = (1 - v92) * 1000
			v99 = math.round(v100) / 1000
		else
			v99 = nil
		end
		return ("<span class=\"color\">%* rgba(%*, %*, %*, %*)</span>"):format(("<span class=\"color-preview\" style=\"background-color: rgba(%*,%*,%*,%*);\"></span>"):format(v94, v96, v98, v99 or 1), v84, v86, v88, v89)
	end,
	["collectTokens"] = v_u_18,
	["collectTokensWithSubcategories"] = function(p101, p102, p103, p104) -- name: collectTokensWithSubcategories
		-- upvalues: (copy) v_u_18
		local v105 = {}
		for v106, v107 in p101 do
			local v108
			if p103 then
				v108 = ("%*.%*"):format(p103, v106)
			else
				v108 = v106
			end
			if type(v107) == "table" then
				local v109, v110, v111, v112
				if p104 then
					local v113
					if type(v107) == "table" and v107.Color3 ~= nil then
						local v114 = v107.Color3
						if typeof(v114) == "Color3" and v107.Transparency ~= nil then
							local v115 = v107.Transparency
							v113 = typeof(v115) == "number"
						else
							v113 = false
						end
					else
						v113 = false
					end
					if v113 then
						local v116 = not p103 and "Default" or p103:split(".")[1]
						if not v105[v116] then
							v105[v116] = {}
						end
						local v117 = v105[v116]
						table.insert(v117, {
							["key"] = v106,
							["value"] = v107,
							["category"] = p102,
							["fullPath"] = v108
						})
					elseif p103 then
						v109 = v_u_18(v107, p102, v108, p104)
						v110 = p103:split(".")[1]
						if not v105[v110] then
							v105[v110] = {}
						end
						for v120, v121 in v109 do
							v111 = v105[v110]
							table.insert(v111, v121)
						end
					else
						v112 = v_u_18(v107, p102, v106, p104)
						if #v112 <= 0 then
							continue
						end
						v105[v106] = v112
					end
				elseif p103 then
					v109 = v_u_18(v107, p102, v108, p104)
					v110 = p103:split(".")[1]
					if not v105[v110] then
						v105[v110] = {}
					end
					for v120, v121 in v109 do
						v111 = v105[v110]
						table.insert(v111, v121)
					end
				else
					v112 = v_u_18(v107, p102, v106, p104)
					if #v112 <= 0 then
						continue
					end
					v105[v106] = v112
				end
			else
				local v122 = not p103 and "Default" or p103:split(".")[1]
				if not v105[v122] then
					v105[v122] = {}
				end
				local v123 = v105[v122]
				table.insert(v123, {
					["key"] = v106,
					["value"] = v107,
					["category"] = p102,
					["fullPath"] = v108
				})
			end
		end
		return v105
	end,
	["hasSubcategories"] = function(p124) -- name: hasSubcategories
		for _, v125 in p124 do
			if type(v125) ~= "table" then
				continue
			end
			local v126 = false
			for _, v127 in v125 do
				if type(v127) ~= "table" and (typeof(v127) ~= "Color3" and typeof(v127) ~= "number") then
					continue
				end
				v126 = true
			end
			if not v126 then
				break
			end
			return true
		end
		return false
	end,
	["sortTokens"] = function(p128, p129, p130) -- name: sortTokens
		if p128:find("(%u%a+)_(%d+)%.?(%u?%w*)") and p129:find("(%u%a+)_(%d+)%.?(%u?%w*)") then
			local v131, v132, v133 = p128:match("(%u%a+)_(%d+)%.?(%u?%w*)")
			local v134, v135, v136 = p129:match("(%u%a+)_(%d+)%.?(%u?%w*)")
			if v131 == v134 then
				if v132 == v135 then
					return v133 < v136
				else
					return tonumber(v132) < tonumber(v135)
				end
			else
				return p128 < p129
			end
		else
			if not p130 then
				return p128 < p129
			end
			local v137 = p128:match("| (%-?[%d.]+) |$")
			local v138 = p129:match("| (%-?[%d.]+) |$")
			return tonumber(v137) < tonumber(v138)
		end
	end,
	["orderedTokenCategories"] = {
		"Color",
		"Stroke",
		"Size",
		"Radius",
		"Padding",
		"Margin",
		"Gap",
		"Typography",
		"FontSize",
		"FontWeight",
		"LineHeight",
		"Ease",
		"Time",
		"Inverse",
		"DarkMode",
		"LightMode",
		"Config"
	},
	["getTokenValue"] = v_u_22,
	["setTokenValue"] = function(p139, p140, p141) -- name: setTokenValue
		local v142 = string.split(p140, ".")
		for v143 = 1, #v142 - 1 do
			local v144 = v142[v143]
			if p139[v144] == nil then
				return
			end
			p139 = p139[v144]
		end
		local v145 = v142[#v142]
		if p139 and v145 then
			p139[v145] = p141
		end
	end,
	["resolveTokenOverride"] = function(p146, p147, p148) -- name: resolveTokenOverride
		-- upvalues: (copy) v_u_22, (copy) v_u_2, (copy) v_u_28
		local v149
		if type(p148) == "string" then
			v149 = v_u_22(p146, p148)
			if v149 == nil then
				v_u_2:warning((("Token override skipped: unknown source token path \"%*\""):format(p148)))
				v149 = nil
			end
		else
			v149 = p148
		end
		if v149 == nil then
			return nil
		end
		local v150 = v_u_22(p146, p147)
		if v150 == nil then
			v_u_2:warning((("Token override skipped: unknown target token path \"%*\""):format(p147)))
			return nil
		end
		if v_u_28(v150, v149) then
			return v149
		end
		v_u_2:warning((("Token override skipped: type or shape mismatch for \"%*\""):format(p147)))
		return nil
	end,
	["_resolveTokenOverrideSource"] = function(p151, p152) -- name: resolveTokenOverrideSource
		-- upvalues: (copy) v_u_22, (copy) v_u_2
		if type(p152) ~= "string" then
			return p152
		end
		local v153 = v_u_22(p151, p152)
		if v153 ~= nil then
			return v153
		end
		v_u_2:warning((("Token override skipped: unknown source token path \"%*\""):format(p152)))
		return nil
	end
}