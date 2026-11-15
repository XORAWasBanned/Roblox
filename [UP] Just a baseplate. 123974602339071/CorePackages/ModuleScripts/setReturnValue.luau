-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.setReturnValue
local v_u_1 = require(script.Parent.symbols)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	getmetatable(p2)[v_u_1.ReturnValue] = { p3 }
end