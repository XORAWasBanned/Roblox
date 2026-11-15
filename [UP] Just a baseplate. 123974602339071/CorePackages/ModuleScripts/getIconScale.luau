-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getIconScale
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v4 = require(v2.FoundationImages)
local v_u_5 = v4.Images
local v_u_6 = require(v1.Utility.isBuilderIcon)
local v_u_7 = require(v1.Enums.IconSize)
local v_u_8 = {
	[v_u_7.Small] = { Vector2.new(16, 16), Vector2.new(18, 18) },
	[v_u_7.Medium] = { Vector2.new(28, 28), Vector2.new(36, 36) },
	[v_u_7.Large] = { Vector2.new(48, 48) }
}
local v_u_9 = v4.getResolutionScale()
local v_u_10 = {
	["Small"] = {
		[v_u_7.XSmall] = 0.66667,
		[v_u_7.Small] = 0.88889,
		[v_u_7.Medium] = 1.11111,
		[v_u_7.Large] = 1.33333
	},
	["Medium"] = {
		[v_u_7.XSmall] = 0.45,
		[v_u_7.Small] = 0.600003,
		[v_u_7.Medium] = 0.749997,
		[v_u_7.Large] = 0.9
	},
	["Large"] = {
		[v_u_7.XSmall] = 0.24545699999999998,
		[v_u_7.Small] = 0.327276,
		[v_u_7.Medium] = 0.40909500000000004,
		[v_u_7.Large] = 0.490905
	}
}
return function(p11, p12) -- name: useIcon
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_9, (copy) v_u_7, (copy) v_u_3, (copy) v_u_8, (copy) v_u_10
	if not p11 or v_u_6(p11) then
		return nil, 1
	end
	local v13 = v_u_5[p11]
	if not v13 then
		return nil, 1
	end
	local v14 = Vector2.new(v13.ImageRectSize.X / v_u_9, v13.ImageRectSize.Y / v_u_9)
	local v15 = v_u_7.Medium
	if v_u_3.includes(v_u_8[v_u_7.Small], v14) then
		v15 = v_u_7.Small
	elseif v_u_3.includes(v_u_8[v_u_7.Medium], v14) then
		v15 = v_u_7.Medium
	elseif v_u_3.includes(v_u_8[v_u_7.Large], v14) then
		v15 = v_u_7.Large
	end
	return v14, v_u_10[v15][p12]
end