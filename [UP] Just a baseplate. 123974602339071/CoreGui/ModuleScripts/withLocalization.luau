-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Localization.withLocalization
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v_u_4 = v2.t
local v_u_5 = require(script.Parent.LocalizationConsumer)
return function(p_u_6) -- name: withLocalization
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	local v7 = v_u_4.table
	assert(v7(p_u_6))
	return function(p8)
		-- upvalues: (ref) v_u_4, (ref) v_u_3, (ref) v_u_5, (copy) p_u_6
		local v9 = v_u_4.callback
		assert(v9(p8))
		local v10 = {
			["render"] = p8,
			["stringsToBeLocalized"] = p_u_6
		}
		return v_u_3.createElement(v_u_5, v10)
	end
end