-- Path: CorePackages.Packages._Index.InputHandlers.InputHandlers.onPress
local v1 = script.Parent.Parent
require(v1.FocusNavigation)
local v_u_2 = require(script.Parent.handleInput)
return function(p3) -- name: onPress
	-- upvalues: (copy) v_u_2
	return v_u_2({
		["onPress"] = p3
	})
end