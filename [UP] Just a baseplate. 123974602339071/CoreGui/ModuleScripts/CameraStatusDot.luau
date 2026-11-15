-- Path: CoreGui.RobloxGui.Modules.SelfieView.Components.CameraStatusDot
local v1 = game:GetService("CorePackages").Packages
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.UIBlox).Core.Style.useStyle
local v_u_4 = UDim2.fromOffset(4, 4)
local v_u_5 = Vector2.new(0.5, 0.5)
local v_u_6 = UDim2.fromScale(0.8, 0.8)
return function(p7) -- name: CameraStatusDot
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v8 = v_u_3()
	local v9 = v_u_2.createElement
	local v10 = "Frame"
	local v11 = {
		["AnchorPoint"] = p7.AnchorPoint or v_u_5
	}
	local v12
	if p7.Size then
		v12 = p7.Size
	else
		v12 = v_u_4
	end
	v11.Size = v12
	v11.BackgroundColor3 = v8.Theme.OnlineStatus.Color
	v11.Position = p7.Position or v_u_6
	v11.ZIndex = p7.ZIndex
	return v9(v10, v11, {
		["UICorner"] = v_u_2.createElement("UICorner", {
			["CornerRadius"] = UDim.new(1, 0)
		})
	})
end