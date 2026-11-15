-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.blendColors
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
return function(p2, p3) -- name: blendColors
	local v4 = 1 - (p3.Transparency or 0)
	local v5 = 1 - (p2.Transparency or 0)
	if v4 == 1 or (v5 == 0 or p2.Color3 == nil) then
		return p3
	end
	if v4 == 0 then
		return p2
	end
	local v6 = 1 - v4
	local v7 = v4 + v5 * v6
	local v8 = v7 > 0 and (1 / v7 or 0) or 0
	local v9 = (p3.Color3.R * v4 + p2.Color3.R * (v5 * v6)) * v8
	local v10 = (p3.Color3.G * v4 + p2.Color3.G * (v5 * v6)) * v8
	local v11 = (p3.Color3.B * v4 + p2.Color3.B * (v5 * v6)) * v8
	return {
		["Color3"] = Color3.new(v9, v10, v11),
		["Transparency"] = 1 - v7
	}
end