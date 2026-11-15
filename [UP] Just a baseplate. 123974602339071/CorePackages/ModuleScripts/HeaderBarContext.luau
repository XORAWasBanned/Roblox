-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HeaderBar.HeaderBarContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.HeaderBarSlot)
local v_u_4 = v_u_3.createContext({
	["testId"] = ""
})
return {
	["Context"] = v_u_4,
	["Provider"] = function(p_u_5) -- name: HeaderBarProvider
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		local v6 = {
			["value"] = v_u_3.useMemo(function()
				-- upvalues: (copy) p_u_5
				return {
					["testId"] = p_u_5.testId,
					["slot"] = p_u_5.slot
				}
			end, { p_u_5.testId, p_u_5.slot })
		}
		return v_u_3.createElement(v_u_4.Provider, v6, p_u_5.children)
	end
}