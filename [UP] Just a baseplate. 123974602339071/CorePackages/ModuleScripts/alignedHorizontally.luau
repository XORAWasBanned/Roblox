-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.alignedHorizontally
local v_u_1 = require(script.Parent.toRect)
local v_u_2 = require(script.Parent.returnValue)
return function(p3, p4, p5) -- name: alignedHorizontally
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v6 = v_u_1(p3)
	local v7 = v_u_1(p4)
	if p5 == Enum.HorizontalAlignment.Left then
		return v_u_2(v6.Min.X == v7.Min.X, "", "")
	elseif p5 == Enum.HorizontalAlignment.Center then
		local v8 = (v6.Min + v6.Max) / 2
		local v9 = (v7.Min + v7.Max) / 2
		return v_u_2(v8.X == v9.X, "", "")
	elseif p5 == Enum.HorizontalAlignment.Right then
		return v_u_2(v6.Max.X == v7.Max.X, "", "")
	else
		return v_u_2(false, "Invalid horizontal alignment!")
	end
end