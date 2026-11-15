-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Elevation.elevation
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.ElevationLayer)
local v_u_3 = {
	[v2.Popover] = {
		["start"] = 4,
		["finish"] = 99,
		["step"] = 1
	},
	[v2.Drawer] = {
		["start"] = 100,
		["finish"] = 199,
		["step"] = 10
	},
	[v2.Sheet] = {
		["start"] = 200,
		["finish"] = 299,
		["step"] = 10
	},
	[v2.Dialog] = {
		["start"] = 300,
		["finish"] = 399,
		["step"] = 10
	},
	[v2.Notification] = {
		["start"] = 400,
		["finish"] = 499,
		["step"] = 1
	}
}
return {
	["ELEVATION_LAYERS"] = v_u_3,
	["getRelativeIndex"] = function(p4) -- name: getRelativeIndex
		-- upvalues: (copy) v_u_3
		local v5 = v_u_3[p4.layer]
		return p4.zIndex - v5.start
	end
}