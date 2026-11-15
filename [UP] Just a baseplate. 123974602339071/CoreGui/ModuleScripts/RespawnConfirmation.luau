-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Pages.RespawnConfirmation
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = require(v1.Service)
local v_u_4 = require(v1.Integrations.CommonIcon)
local v5 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v_u_6 = require(script.Parent.InGameMenuIntegrationUtils)
local v7 = require(v2.Workspace.Packages.InExperienceSideSheet).Enums
local v_u_8 = v_u_6.createPageOpenSignal("ResetCharacterPage")
local v9 = {
	["initialAvailability"] = nil,
	["id"] = nil,
	["label"] = "CoreScripts.InGameMenu.QuickActions.Respawn",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v3.AvailabilitySignal.Available,
	["id"] = v7.ActionBinding.Respawn,
	["sideSheetPlacement"] = v5.SessionAction,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_6, (copy) v_u_8
		v_u_6.toggleIGMPage("ResetCharacterPage", v_u_8:get())
	end,
	["isActivated"] = v_u_8,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_4, (copy) v_u_8
			return v_u_4("icons/actions/respawn", nil, v_u_8)
		end
	}
}
return v3:register(v9)