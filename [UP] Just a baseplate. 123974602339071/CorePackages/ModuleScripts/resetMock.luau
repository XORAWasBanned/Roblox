-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.resetMock
local v_u_1 = require(script.Parent.symbols)
local function v_u_6(p2, p3) -- name: resetMock
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	local v4 = getmetatable(p2)
	v4[v_u_1.Calls] = {}
	for _, v5 in pairs(v4[v_u_1.Children]) do
		if p3[v5] then
			continue
		end
		p3[v5] = true
		v_u_6(v5, p3)
	end
end
return function(p7)
	-- upvalues: (copy) v_u_6
	v_u_6(p7, {})
end