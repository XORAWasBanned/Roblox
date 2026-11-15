-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlLayouts.VRGamepadControlsWrapper
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("LocalizationService")
local v4 = v1:WaitForChild("RobloxGui").Modules
local v5 = script.Parent.VRGamepadControls
local v6 = require(v2.Workspace.Packages.HelpPage)
local v_u_7 = require(v2.Packages.Foundation)
local v_u_8 = v_u_7.FoundationProvider
local v_u_9 = require(v2.Workspace.Packages.Localization).LocalizationProvider
local v_u_10 = require(v2.Packages.React)
local v_u_11 = require(v2.Workspace.Packages.InExperienceLocales).Localization.new(v3.RobloxLocaleId)
local v_u_12 = require(script.Parent.Parent.ControlLayoutContainer)
local v_u_13 = v6.HelpReactView
local v14 = v6.Flags.FFlagHelpPageMountVR
local v_u_15
if v14 then
	v_u_15 = require(v4.Settings.Integrations).Utils
else
	v_u_15 = nil
end
if v14 then
	return v_u_10.memo(function() -- name: VRGamepadControlsWrapper
		-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_9, (copy) v_u_11, (copy) v_u_8, (copy) v_u_7, (ref) v_u_15, (copy) v_u_13
		local v16 = v_u_10.createElement
		local v17 = v_u_12
		local v18 = {}
		local v19 = v_u_10.createElement
		local v20 = v_u_9
		local v21 = {
			["localization"] = v_u_11
		}
		local v22 = {
			["FoundationProvider"] = v_u_10.createElement(v_u_8, {
				["colorMode"] = v_u_7.Enums.ColorMode.Dark,
				["device"] = v_u_15.getDeviceType()
			}, {
				["HelpReactView"] = v_u_10.createElement(v_u_13)
			})
		}
		v18.Inner = v19(v20, v21, v22)
		return v16(v17, {
			["titleText"] = "CoreScripts.InGameMenu.Controls.VrControllerTitle"
		}, v18)
	end)
else
	return require(v5)
end