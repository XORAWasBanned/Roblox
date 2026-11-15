-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.childrenHasFullBleed
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.FullBleed)
return function(p4) -- name: childrenHasFullBleed
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_5 = false
	v_u_2.Children.forEach(p4, function(p6)
		-- upvalues: (ref) v_u_3, (ref) v_u_5
		local v7
		if type(p6) == "table" then
			v7 = p6.type
		else
			v7 = nil
		end
		if v7 == v_u_3 then
			v_u_5 = true
		end
	end)
	return v_u_5
end