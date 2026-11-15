-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.getGuiInputPosition
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers).Services.GuiService
return function(p3, p4) -- name: getGuiInputPosition
	-- upvalues: (copy) v_u_2
	local v5 = p4:FindFirstAncestorWhichIsA("ScreenGui")
	if not v5 then
		return p3
	end
	if not v5.IgnoreGuiInset then
		return p3
	end
	local v6
	if v5.ScreenInsets == Enum.ScreenInsets.DeviceSafeInsets then
		v6 = Enum.ScreenInsets.DeviceSafeInsets
	else
		v6 = Enum.ScreenInsets.None
	end
	return p3 + v_u_2:GetInsetArea(v6).Min
end