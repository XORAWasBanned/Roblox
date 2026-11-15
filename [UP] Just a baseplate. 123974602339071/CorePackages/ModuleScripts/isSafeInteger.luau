-- Path: CorePackages.Packages._Index.Number.Number.isSafeInteger
local v_u_1 = require(script.Parent.isInteger)
local v_u_2 = require(script.Parent.MAX_SAFE_INTEGER)
return function(p3)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v4 = v_u_1(p3)
	if v4 then
		v4 = math.abs(p3) <= v_u_2
	end
	return v4
end