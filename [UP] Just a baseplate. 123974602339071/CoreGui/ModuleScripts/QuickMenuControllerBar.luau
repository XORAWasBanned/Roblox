-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadMenu.QuickMenuControllerBar
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v3 = v_u_2:WaitForChild("RobloxGui")
local v_u_4 = game:GetService("LocalizationService")
local v_u_5 = require(v1.Packages.React)
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.UIBlox)
local v_u_8 = require(v3.Modules.InGameMenuConstants)
local v_u_9 = v7.App.Bar.ControllerBar
require(v1.Workspace.Packages.RobloxTranslator)
local v_u_10 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_11 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
return function(p12) -- name: QuickMenuControllerBar
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_5, (copy) v_u_11, (copy) v_u_6, (copy) v_u_2, (copy) v_u_8, (copy) v_u_9
	local v13 = v_u_10.new(v_u_4.RobloxLocaleId)
	local v14 = {
		{
			["text"] = v13:Format("CoreScripts.TopBar.Respawn"),
			["keyCode"] = Enum.KeyCode.ButtonY
		},
		{
			["text"] = v13:Format("CoreScripts.TopBar.Leave"),
			["keyCode"] = Enum.KeyCode.ButtonX
		}
	}
	if p12.chatMenuEnabled then
		local v16 = {
			["text"] = v13:Format(v_u_11((v_u_5.useCallback(function(p15)
				return p15.chat.visible
			end))) and "CoreScripts.TopBar.HideChat" or "CoreScripts.TopBar.ShowChat"),
			["keyCode"] = Enum.KeyCode.ButtonR1
		}
		table.insert(v14, 1, v16)
	end
	local v17 = v_u_5.createElement
	local v18 = v_u_6.Portal
	local v19 = {
		["target"] = v_u_2
	}
	local v20 = {
		["QuickMenuControllerBar"] = v_u_5.createElement("ScreenGui", {
			["DisplayOrder"] = v_u_8.DisplayOrder.ControllerBar
		}, {
			["ControllerBar"] = v_u_5.createElement(v_u_9, {
				["leftHint"] = {
					["text"] = v13:Format("CoreScripts.TopBar.Back"),
					["keyCode"] = Enum.KeyCode.ButtonB
				},
				["rightHints"] = v14
			})
		})
	}
	return v17(v18, v19, v20)
end