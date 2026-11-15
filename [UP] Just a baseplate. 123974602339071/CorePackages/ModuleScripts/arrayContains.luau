-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.arrayContains
local v_u_1 = require(script.Parent.deepEqual)
local v_u_2 = require(script.Parent.deepContains)
return function(p3, p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	for _, v6 in ipairs(p3) do
		if p5 then
			if not v_u_2(v6, p4) then
				continue
			end
			return true
		else
			if not v_u_1(v6, p4) then
				continue
			end
			return true
		end
	end
	return false
end