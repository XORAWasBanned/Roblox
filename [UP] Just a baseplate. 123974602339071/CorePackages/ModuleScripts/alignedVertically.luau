-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.alignedVertically
local v_u_1 = require(script.Parent.toRect)
local v_u_2 = require(script.Parent.returnValue)
return function(p3, p4, p5) -- name: alignedVertically
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v6 = v_u_1(p3)
	local v7 = v_u_1(p4)
	if p5 == Enum.VerticalAlignment.Top then
		return v_u_2(v6.Min.Y == v7.Min.Y, "", "")
	elseif p5 == Enum.VerticalAlignment.Center then
		local v8 = (v6.Min + v6.Max) / 2
		local v9 = (v7.Min + v7.Max) / 2
		return v_u_2(v8.Y == v9.Y, "", "")
	elseif p5 == Enum.VerticalAlignment.Bottom then
		return v_u_2(v6.Max.Y == v7.Max.Y, "", "")
	else
		return v_u_2(false, "Invalid VerticalAlignment!")
	end
end