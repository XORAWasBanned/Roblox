-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.getSelectionImageObjectRegular
local v1 = script.Parent
local v_u_2 = require(v1.Colors)
return function() -- name: getSelectionImageObjectRegular
	-- upvalues: (copy) v_u_2
	local v3 = Instance.new("ImageLabel")
	v3.Image = "rbxasset://textures/ui/InspectMenu/selection_regular.png"
	v3.ImageColor3 = v_u_2.White
	v3.ScaleType = Enum.ScaleType.Slice
	v3.SliceCenter = Rect.new(5, 5, 120, 20)
	v3.BackgroundTransparency = 1
	v3.Size = UDim2.new(1, 0, 1, 0)
	return v3
end