-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Pages.Settings
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = require(v1.Service)
local v_u_4 = require(v1.Integrations.CommonIcon)
local v5 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v_u_6 = require(script.Parent.InGameMenuIntegrationUtils)
local v_u_7 = v_u_6.createPageOpenSignal("GameSettingsPage")
local v8 = {
	["initialAvailability"] = nil,
	["id"] = "settings",
	["label"] = "CoreScripts.InGameMenu.PageTitle.GameSettings",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v3.AvailabilitySignal.Available,
	["sideSheetPlacement"] = v5.AboveFold,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_6, (copy) v_u_7
		v_u_6.toggleIGMPage("GameSettingsPage", v_u_7:get())
	end,
	["isActivated"] = v_u_7,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_4, (copy) v_u_7
			return v_u_4("icons/common/settings", "icons/common/settingsOn", v_u_7)
		end
	}
}
return v3:register(v8)