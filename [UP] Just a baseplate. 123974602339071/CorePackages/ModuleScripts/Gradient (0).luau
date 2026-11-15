-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Gradient.Gradient
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return function(p3) -- name: Gradient
	-- upvalues: (copy) v_u_2
	return v_u_2.createElement("UIGradient", {
		["Rotation"] = p3.fillDirection == Enum.FillDirection.Vertical and 90 or 0,
		["Transparency"] = NumberSequence.new({
			NumberSequenceKeypoint.new(0, p3.top and 0 or 1),
			NumberSequenceKeypoint.new(0.5, p3.top and 0 or 1),
			NumberSequenceKeypoint.new(0.50001, p3.top and 1 or 0),
			NumberSequenceKeypoint.new(1, p3.top and 1 or 0)
		})
	})
end