-- Path: CoreGui.RobloxGui.Modules.Shell.Components.Overscan.ControllerHint
local v1 = game:GetService("CoreGui").RobloxGui.Modules
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Roact)
local v_u_4 = require(v1.Shell.GlobalSettings)
local v_u_5 = require(v1.Shell.LocalizedStrings)
return function(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v6 = v_u_3.createElement
	local v7 = {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/Shell/ScreenAdjustment/Controller@1080.png",
		["Size"] = UDim2.new(0, 599, 0, 404),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5)
	}
	local v8 = {}
	local v9 = v_u_3.createElement
	local v10 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, 240, 0, 1),
		["Position"] = UDim2.new(0, 437, 0, 220),
		["BackgroundColor3"] = Color3.new(1, 1, 1)
	}
	local v11 = {
		["InputHint"] = v_u_3.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Font"] = nil,
			["FontSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["Text"] = nil,
			["Size"] = UDim2.new(0, 0, 0, 0),
			["Position"] = UDim2.new(1, 3, 0, -1),
			["Font"] = v_u_4.RegularFont,
			["FontSize"] = v_u_4.ButtonSize,
			["TextColor3"] = v_u_4.WhiteTextColor,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Text"] = v_u_5:LocStringUA("Xbox.Old.ResizeScreenInputHint")
		})
	}
	v8.Line = v9("Frame", v10, v11)
	return v6("ImageLabel", v7, v8)
end