-- Path: CorePackages.Packages._Index.Dash.Dash.isLowercase
local v1 = script.Parent
local v_u_2 = require(v1.assertEqual)
return function(p3) -- name: isLowercase
	-- upvalues: (copy) v_u_2
	v_u_2(#p3 > 0, true, "Attempted to call Dash.isLowercase with an empty string")
	local v4 = p3:sub(1, 1)
	return v4 == v4:lower()
end