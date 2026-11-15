-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.FTUXPanel
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.UIBlox).Core.Style.useStyle
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Components.FTUXSlideshow)
local v_u_6 = require(v4.Resources.FTUXConstants)
require(v4.Enums.PlatformEnum)
local v_u_7 = game:DefineFastInt("FTUXPanelXOffset", 50)
return function(p8) -- name: FTUXPanel
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_2, (copy) v_u_7, (copy) v_u_5
	local v9 = v_u_3()
	local v10 = v_u_6[p8.platform].PanelConstants
	local v11 = v10.MAIN_SCREEN_SIZE_WIDTH
	local v12 = v10.MAIN_SCREEN_SIZE_HEIGHT
	local v13 = v10.SLIDESHOW_FRAME_WIDTH
	local v14 = v10.SLIDESHOW_FRAME_HEIGHT
	local v15 = v10.SLIDESHOW_FRAME_X
	local v16 = v10.SLIDESHOW_FRAME_Y
	local v17 = v9.Theme.BackgroundDefault.Color
	local v18 = v_u_2.createElement
	local v19 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, v_u_7, 0, 0)
	}
	local v20 = {}
	local v21 = v_u_2.createElement
	local v22 = {
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0,
		["Size"] = nil,
		["Position"] = nil,
		["BorderSizePixel"] = 0,
		["ClipsDescendants"] = true,
		["BackgroundColor3"] = v17,
		["Size"] = UDim2.new(v13 / v11, 0, v14 / v12, 0),
		["Position"] = UDim2.new(v15 / v11, 0, v16 / v12, 0)
	}
	local v23 = {
		["UICorner"] = v_u_2.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0.02, 0)
		}),
		["Slideshow"] = v_u_2.createElement(v_u_5, {
			["platform"] = p8.platform
		}, {})
	}
	v20.Slideshow = v21("Frame", v22, v23)
	return v18("Frame", v19, v20)
end