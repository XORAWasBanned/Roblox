-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useCumulativeBackground.useCumulativeBackground
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Utility.useBindable)
return function(p5, p6) -- name: useCumulativeBackground
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v7 = { v_u_4(p5), (v_u_4(p6)) }
	return v_u_3.joinBindings(v7):map(function(p8)
		return {
			["Color3"] = nil,
			["Transparency"] = 0,
			["Color3"] = p8[2].Color3:Lerp(p8[1].Color3, p8[2].Transparency)
		}
	end)
end