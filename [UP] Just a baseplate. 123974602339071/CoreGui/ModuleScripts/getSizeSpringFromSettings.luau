-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.getSizeSpringFromSettings
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Otter)
return function(p3) -- name: getSizeSpringFromSettings
	-- upvalues: (copy) v_u_2
	local v4 = p3.SizeAnimation
	if not v4.Enabled then
		return v_u_2.instant
	end
	local v_u_5 = {
		["dampingRatio"] = v4.SpringDampingRatio,
		["frequency"] = v4.SpringFrequency
	}
	return function(p6)
		-- upvalues: (ref) v_u_2, (copy) v_u_5
		return v_u_2.spring(p6, v_u_5)
	end
end