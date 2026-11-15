-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Image.ImageSet.getScaledSlice
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Components.Types)
local v_u_3 = require(v2.FoundationImages)
return function(p4, p5) -- name: getScaledSlice
	-- upvalues: (copy) v_u_3
	local v6 = v_u_3.getResolutionScale()
	if p4 then
		local v7 = p4.Min * v6
		local v8 = p4.Max * v6
		p4 = Rect.new(v7, v8)
		p5 = (p5 or 1) / v6
	end
	return {
		["center"] = p4,
		["scale"] = p5
	}
end