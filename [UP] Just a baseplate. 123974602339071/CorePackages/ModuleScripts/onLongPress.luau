-- Path: CorePackages.Packages._Index.InputHandlers.InputHandlers.onLongPress
local v1 = script.Parent.Parent
require(v1.FocusNavigation)
local v_u_2 = require(script.Parent.handleInput)
return function(p3, p4, p5) -- name: onLongPress
	-- upvalues: (copy) v_u_2
	local v6 = {
		["hold"] = {
			["durationSeconds"] = p3,
			["onComplete"] = p4,
			["onStep"] = p5
		}
	}
	return v_u_2(v6)
end