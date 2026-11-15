-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Interactable.getOriginalBackgroundStyle
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p_u_5, p_u_6) -- name: getOriginalBackgroundStyle
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if v_u_4.isBinding(p_u_5) and v_u_4.isBinding(p_u_6) then
		return v_u_3.joinBindings({
			["Color3"] = p_u_5,
			["Transparency"] = p_u_6
		})
	elseif v_u_4.isBinding(p_u_5) then
		return p_u_5:map(function(p7)
			-- upvalues: (copy) p_u_6
			return {
				["Color3"] = p7,
				["Transparency"] = p_u_6
			}
		end)
	else
		return not v_u_4.isBinding(p_u_6) and {
			["Color3"] = p_u_5,
			["Transparency"] = p_u_6
		} or p_u_6:map(function(p8)
			-- upvalues: (copy) p_u_5
			return {
				["Color3"] = p_u_5,
				["Transparency"] = p8
			}
		end)
	end
end