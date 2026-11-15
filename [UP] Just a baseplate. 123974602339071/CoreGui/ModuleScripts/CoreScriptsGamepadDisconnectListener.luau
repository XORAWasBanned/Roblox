-- Path: CoreGui.RobloxGui.Modules.GamepadDisconnect.CoreScriptsGamepadDisconnectListener
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("EventIngestService")
local v_u_4 = require(v1.Packages.React)
local v5 = require(v1.Workspace.Packages.InputUi)
local v_u_6 = v5.Gamepad.GamepadDisconnectedModal
local v_u_7 = v5.Gamepad.useGamepadDisconnectOverlayEffect
local v_u_8 = require(v2.RobloxGui.Modules.InGameMenuConstants)
local v_u_9 = require(v1.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(v3)
return function() -- name: CoreScriptsGamepadDisconnectListener
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8, (copy) v_u_6
	local v10, v_u_11 = v_u_4.useState(false)
	local v12 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_11
		v_u_11(false)
	end, { v_u_11 })
	v_u_7(v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_11
		v_u_11(true)
	end, { v_u_11 }), v12, v_u_9, "InExperience")
	if v10 then
		return v_u_4.createElement("ScreenGui", {
			["DisplayOrder"] = nil,
			["IgnoreGuiInset"] = true,
			["OnTopOfCoreBlur"] = true,
			["ZIndexBehavior"] = nil,
			["DisplayOrder"] = v_u_8.DisplayOrder.HeadsetDisconnectedDialog,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}, {
			["GamepadDisconnectedModal"] = v_u_4.createElement(v_u_6)
		})
	else
		return nil
	end
end