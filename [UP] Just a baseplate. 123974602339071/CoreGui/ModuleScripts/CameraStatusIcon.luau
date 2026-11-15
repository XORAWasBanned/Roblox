-- Path: CoreGui.RobloxGui.Modules.SelfieView.Components.CameraStatusIcon
local v1 = game:GetService("CorePackages").Packages
local v_u_2 = require(v1.React)
local v3 = require(v1.UIBlox)
local v_u_4 = v3.App.ImageSet.Images
local v_u_5 = v3.Core.ImageSet.ImageSetLabel
local v_u_6 = require(script.Parent.Parent.Hooks.useCameraOn)
local v_u_7 = UDim2.fromScale(1, 1)
return function(p8) -- name: CameraStatusIcon
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
	local v9 = v_u_6()
	local v10 = v_u_2.createElement
	local v11 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v12 = {
		["Icon"] = v_u_2.createElement(v_u_5, {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ImageTransparency"] = nil,
			["Image"] = v9 and v_u_4["icons/controls/video"] or v_u_4["icons/controls/videoOff"],
			["Size"] = p8.iconSize or v_u_7,
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["ImageTransparency"] = p8.transparency or 0
		})
	}
	return v10("Frame", v11, v12)
end