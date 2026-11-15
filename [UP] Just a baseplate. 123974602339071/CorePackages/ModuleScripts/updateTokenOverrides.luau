-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.updateTokenOverrides
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.ColorMode)
require(v1.Enums.Device)
local v_u_2 = require(v1.Utility.Flags)
require(v1.Enums.ThemeName)
require(v1.Providers.Style.Tokens)
require(script.Parent.createStyleSheetRules)
local v_u_3 = require(script.Parent.getOverrideAttributes)
local v_u_4 = require(v1.Utility.scaleValue)
return function(p5, p6, p7, p8, p9, p10, p11) -- name: updateTokenOverrides
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	for v12, v14 in v_u_3(p6, p7, p8, p10) do
		if not v_u_2.FoundationDisableTokenScaling then
			local v14 = v_u_4(v14, p9)
		end
		p5:SetAttribute(v12, v14)
		if not p11 then
			continue
		end
		p11[v12] = v14
	end
end