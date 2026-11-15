-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.intersect
local v_u_1 = require(script.Parent.toRect)
local v_u_2 = require(script.Parent.returnValue)
return function(p3, p4) -- name: intersect
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v5 = v_u_1(p3)
	local v6 = v_u_1(p4)
	local v7 = v_u_2
	local v8 = v5.Min.X - v6.Min.X
	local v9
	if math.abs(v8) * 2 < v5.Width + v6.Width then
		local v10 = v5.Min.Y - v6.Min.Y
		v9 = math.abs(v10) * 2 < v5.Height + v6.Height
	else
		v9 = false
	end
	return v7(v9, "Intersects the element", "Does not intersect the element")
end