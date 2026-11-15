-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.isAMagicMock
local v_u_1 = require(script.Parent.symbols)
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = getmetatable(p2)
	if v3 then
		return v3[v_u_1.isMagicMock] ~= nil
	else
		return false
	end
end