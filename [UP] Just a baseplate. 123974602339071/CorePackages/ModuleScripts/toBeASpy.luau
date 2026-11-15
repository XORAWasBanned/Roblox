-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.Matchers.toBeASpy
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Spy)
return function(p3)
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2.is(p3)
	return {
		["pass"] = v4,
		["message"] = v4 and "Expected object to be anything but a Spy." or string.format("Expected object to be a Spy. Got %q instead.", (tostring(p3)))
	}
end