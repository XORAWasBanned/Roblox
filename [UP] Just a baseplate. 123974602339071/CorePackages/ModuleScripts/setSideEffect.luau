-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.setSideEffect
local v_u_1 = require(script.Parent.symbols)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	getmetatable(p2)[v_u_1.SideEffect] = p3 and {
		["value"] = nil,
		["calls"] = 0,
		["value"] = p3
	} or nil
end