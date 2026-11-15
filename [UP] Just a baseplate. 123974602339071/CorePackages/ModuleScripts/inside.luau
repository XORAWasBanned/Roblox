-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.inside
local v_u_1 = require(script.Parent.toRect)
local v_u_2 = require(script.Parent.returnValue)
return function(p3, p4) -- name: inside
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v5 = v_u_1(p3)
	local v6 = v_u_1(p4)
	local v7 = v_u_2
	local v8 = v5.Min
	local v9
	if v8.X >= v6.Min.X and (v8.X <= v6.Max.X and v8.Y >= v6.Min.Y) then
		v9 = v8.Y <= v6.Max.Y
	else
		v9 = false
	end
	if v9 then
		local v10 = v5.Max
		if v10.X >= v6.Min.X and (v10.X <= v6.Max.X and v10.Y >= v6.Min.Y) then
			v9 = v10.Y <= v6.Max.Y
		else
			v9 = false
		end
	end
	return v7(v9, "Is inside the element", "Is not inside the element")
end