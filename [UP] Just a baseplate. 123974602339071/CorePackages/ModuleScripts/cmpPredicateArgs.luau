-- Path: CorePackages.Packages._Index.mock-31ab8d40-0.1.0.mock.cmpPredicateArgs
local v_u_1 = require(script.Parent.fmtArgs)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	if p2.n ~= p3.n then
		return false, "number of args in " .. v_u_1(p3) .. " does not match number of predicates"
	end
	for v4 = 1, p3.n do
		if p2[v4](p3[v4]) then
			continue
		end
		return false, v_u_1(p3) .. " does not match predicates at position " .. v4
	end
	return true
end