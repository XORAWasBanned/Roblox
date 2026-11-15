-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useDefaultTags
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Components.Types)
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
return function(p_u_5, p_u_6) -- name: useDefaultTags
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	return v_u_4.useMemo(function()
		-- upvalues: (copy) p_u_5, (copy) p_u_6, (ref) v_u_3
		if p_u_5 == nil then
			return p_u_6
		end
		local v7 = p_u_5
		if type(v7) == "string" then
			return ("%* %*"):format(p_u_6, p_u_5)
		end
		local v8 = {
			[p_u_6] = true
		}
		return v_u_3.join(p_u_5, v8)
	end, { p_u_5, p_u_6 })
end