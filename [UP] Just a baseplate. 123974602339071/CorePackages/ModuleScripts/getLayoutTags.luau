-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ScrollView.getLayoutTags
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Providers.Style.Tokens)
local v_u_3 = require(v1.StyleSheet.Rules.attributeRules)
local v_u_4 = require(v1.StyleSheet.formatTokens)
return function() -- name: getLayoutTags
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v5 = v_u_2.defaultTokens
	local v6 = v_u_4(v5)
	local _, v7 = v_u_3.rulesGenerator(v5, v6)
	local v8 = {}
	for _, v9 in v7 do
		if v9.pseudo ~= "UIListLayout" or not v9.tag then
			continue
		end
		v8[v9.tag] = true
	end
	return v8
end