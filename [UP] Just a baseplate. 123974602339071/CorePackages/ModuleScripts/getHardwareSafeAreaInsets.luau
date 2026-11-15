-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.getHardwareSafeAreaInsets
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers).Services.GuiService
return function() -- name: getHardwareSafeAreaInsets
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
	local v4 = v_u_2:GetInsetArea(Enum.ScreenInsets.None)
	return {
		["left"] = v3.Min.X - v4.Min.X,
		["top"] = v3.Min.Y - v4.Min.Y,
		["right"] = v4.Max.X - v3.Max.X,
		["bottom"] = v4.Max.Y - v3.Max.Y
	}
end