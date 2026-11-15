-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.devPrint
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).util.inspect
return function(...) -- name: devPrint
	-- upvalues: (copy) v_u_2
	local v3 = {}
	for v4 = 1, select("#", ...) do
		v3[v4] = v_u_2((select(v4, ...)))
	end
	print(table.unpack(v3))
end