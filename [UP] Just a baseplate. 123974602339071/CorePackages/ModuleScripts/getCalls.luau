-- Path: CorePackages.Packages._Index.mock-31ab8d40-0.1.0.mock.getCalls
local v_u_1 = require(script.Parent.symbols)
local v_u_2 = require(script.Parent.Spy)
return function(p3)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if type(p3) == "function" then
		local v4 = v_u_2.lookup(p3)
		if v4 then
			return v4[v_u_1.Calls]
		end
		error("Calling getCalls on a non-spy function")
	end
	local v5 = v_u_1.Calls
	local v6 = rawget(p3, v5)
	if v6 == nil then
		v6 = getmetatable(p3)[v_u_1.Calls]
	end
	if v6 == nil then
		error("Calling getCalls on a non-mock")
	end
	return v6
end