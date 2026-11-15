-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.DummyWindow
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v4 = require(v1.Service)
local v_u_5 = require(v1.Integrations.CommonIcon)
local v_u_6 = require(v1.ChromeShared.Unibar.Constants)
local v7 = require(v1.ChromeShared.Service.WindowSizeSignal)
local v8 = require(v2.Packages.UIBlox)
local v9 = v8.App.ImageSet.Images
local v_u_10 = v8.App.Button.IconButton
local v11 = require(v2.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations
local v_u_12 = v9["icons/navigation/cycleUp"]
local v_u_13 = false
local v_u_14 = v7.new(v_u_6.DEFAULT_WIDTH, v_u_6.DEFAULT_HEIGHT)
local v15 = UDim2.new(1, -95, 0, 165)
local v16 = {
	["initialAvailability"] = nil,
	["id"] = "dummy_window",
	["label"] = "CoreScripts.TopBar.Menu",
	["draggable"] = true,
	["cachePosition"] = true,
	["startingWindowPosition"] = nil,
	["windowSize"] = nil,
	["persistWindowState"] = true,
	["components"] = nil
}
local v17
if v11() then
	v17 = v4.AvailabilitySignal.Available
else
	v17 = v4.AvailabilitySignal.Unavailable
end
v16.initialAvailability = v17
v16.startingWindowPosition = v15
v16.windowSize = v_u_14
v16.components = {
	["Icon"] = function(_) -- name: Icon
		-- upvalues: (copy) v_u_5
		return v_u_5("icons/menu/avatar_on")
	end,
	["Window"] = function(_) -- name: Window
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_10, (copy) v_u_12, (ref) v_u_13, (copy) v_u_14
		local v18 = v_u_3.createElement
		local v19 = {
			["BackgroundTransparency"] = 0,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v20 = {
			["Corner"] = v_u_3.createElement("UICorner", {
				["CornerRadius"] = v_u_6.CORNER_RADIUS
			}),
			["SizeIcon"] = v_u_3.createElement(v_u_10, {
				["icon"] = nil,
				["iconSize"] = nil,
				["anchorPoint"] = nil,
				["position"] = nil,
				["backgroundTransparency"] = 0.5,
				["onActivated"] = nil,
				["icon"] = v_u_12,
				["iconSize"] = v_u_6.CLOSE_ICON_SIZE,
				["anchorPoint"] = Vector2.new(0.5, 1),
				["position"] = UDim2.new(0.5, 0, 1, 0),
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (ref) v_u_13, (ref) v_u_14, (ref) v_u_6
					if v_u_13 then
						v_u_14:requestSize(v_u_6.DEFAULT_WIDTH, v_u_6.DEFAULT_HEIGHT)
						v_u_13 = false
					else
						v_u_14:requestSize(v_u_6.DEFAULT_WIDTH_LARGE, v_u_6.DEFAULT_HEIGHT_LARGE)
						v_u_13 = true
					end
				end
			})
		}
		return v18("Frame", v19, v20)
	end
}
return v4:register(v16)