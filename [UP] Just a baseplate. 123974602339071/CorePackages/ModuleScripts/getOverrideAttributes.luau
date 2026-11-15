-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.getOverrideAttributes
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.ColorMode)
require(v1.Enums.Device)
require(v1.Enums.ThemeName)
local v_u_2 = require(v1.Providers.Style.Tokens.TokenProcessingUtilities)
local v_u_3 = require(v1.Providers.Style.Tokens)
local function v_u_9(p4, p5, p6) -- name: emitLeafAttributes
	-- upvalues: (copy) v_u_9
	if type(p6) == "table" then
		for v7, v8 in p6 do
			v_u_9(p4, p5 .. tostring(v7), v8)
		end
	else
		p4[p5] = p6
	end
end
return function(p10, p11, p12, p13) -- name: getOverrideAttributes
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_9
	local v14 = {}
	if not (p13 and next(p13)) then
		return v14
	end
	local v15 = v_u_3.getTokens(p11, p12, 1, nil, p10)
	for v16, v17 in p13 do
		local v18 = v_u_2.resolveTokenOverride(v15, v16, v17)
		if v18 == nil then
			continue
		end
		v_u_9(v14, v16:gsub("%.", ""):gsub("_", ""), v18)
	end
	return v14
end