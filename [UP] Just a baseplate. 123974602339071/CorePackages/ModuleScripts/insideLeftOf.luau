-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.insideLeftOf
local v_u_1 = require(script.Parent.toRect)
local v_u_2 = require(script.Parent.returnValue)
return function(p3, p4, p5) -- name: insideLeftOf
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v6 = v_u_1(p3)
	local v7 = v_u_1(p4)
	local v8 = -(v6.Max - v7.Max)
	if not p5 then
		return v_u_2(v8.X >= 0, "Was not right of the element", "Was too far right of the element")
	end
	if typeof(p5) == "number" then
		p5 = NumberRange.new(p5)
	end
	local v9 = v_u_2
	local v10
	if p5.Min <= v8.X then
		v10 = p5.Max >= v8.X
	else
		v10 = false
	end
	return v9(v10, "Was within range", "Was not within range ( " .. tostring(p5) .. ")")
end