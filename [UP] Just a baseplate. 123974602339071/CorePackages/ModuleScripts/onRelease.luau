-- Path: CorePackages.Packages._Index.InputHandlers.InputHandlers.onRelease
local v1 = script.Parent.Parent
require(v1.FocusNavigation)
local v_u_2 = require(script.Parent.handleInput)
return function(p3) -- name: onRelease
	-- upvalues: (copy) v_u_2
	return v_u_2({
		["onRelease"] = p3
	})
end