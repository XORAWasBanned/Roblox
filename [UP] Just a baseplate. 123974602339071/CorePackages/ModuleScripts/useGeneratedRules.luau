-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useGeneratedRules
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.ColorMode)
require(v1.Enums.Device)
require(v1.Enums.ThemeName)
local v_u_4 = require(v1.Utility.getGeneratedRules)
return function(p_u_5, p_u_6, p_u_7) -- name: useGeneratedRules
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_5, (copy) p_u_6, (copy) p_u_7
		return v_u_4(p_u_5, p_u_6, p_u_7)
	end, { p_u_5, p_u_6, p_u_7 })
end