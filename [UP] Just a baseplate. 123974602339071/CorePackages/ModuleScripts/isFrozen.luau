-- Path: CorePackages.Packages._Index.Collections.Collections.Object.isFrozen
local v_u_1 = _G.__DEV__
local v2 = script.Parent.Parent.Parent
require(v2.ES7Types)
return function(p3)
	-- upvalues: (copy) v_u_1
	if v_u_1 then
		print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call")
	end
	return table.isfrozen(p3)
end