-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.DummyWindow2
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v4 = require(v1.Service)
local v_u_5 = require(v1.Integrations.CommonIcon)
local v_u_6 = require(v1.ChromeShared.Unibar.Constants)
local v7 = {
	["initialAvailability"] = nil,
	["id"] = "dummy_window_2",
	["label"] = "CoreScripts.TopBar.Menu",
	["startingWindowPosition"] = nil,
	["persistWindowState"] = true,
	["components"] = nil
}
local v8
if require(v2.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations() then
	v8 = v4.AvailabilitySignal.Available
else
	v8 = v4.AvailabilitySignal.Unavailable
end
v7.initialAvailability = v8
v7.startingWindowPosition = UDim2.new(1, -245, 0, 95)
v7.components = {
	["Icon"] = function(_) -- name: Icon
		-- upvalues: (copy) v_u_5
		return v_u_5("icons/menu/home_on")
	end,
	["Window"] = function(_) -- name: Window
		-- upvalues: (copy) v_u_3, (copy) v_u_6
		local v9 = v_u_3.createElement
		local v10 = {
			["BackgroundTransparency"] = 0,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v11 = {
			["Corner"] = v_u_3.createElement("UICorner", {
				["CornerRadius"] = v_u_6.CORNER_RADIUS
			})
		}
		return v9("Frame", v10, v11)
	end
}
return v4:register(v7)