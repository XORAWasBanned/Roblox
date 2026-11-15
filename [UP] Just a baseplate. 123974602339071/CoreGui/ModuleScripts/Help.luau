-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Pages.Help
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = require(v1.Service)
local v_u_4 = require(v1.Integrations.CommonIcon)
local v5 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v6 = require(v2.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_7 = require(v2.Workspace.Packages.SharedFlags).FFlagRenameHelpToControls
local v_u_8 = require(script.Parent.InGameMenuIntegrationUtils)
local v_u_9 = v_u_8.createPageOpenSignal("HelpPage")
local v10 = {
	["initialAvailability"] = nil,
	["id"] = "help",
	["label"] = nil,
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v3.AvailabilitySignal.Available,
	["label"] = v_u_7 and "CoreScripts.InGameMenu.Controls.ControlsPage" or "CoreScripts.Feedback.Help.MainHeader"
}
local v11
if v6() then
	v11 = v5.AboveFold
else
	v11 = v5.BelowFold
end
v10.sideSheetPlacement = v11
function v10.activated(_) -- name: activated
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	v_u_8.toggleIGMPage("HelpPage", v_u_9:get())
end
v10.isActivated = v_u_9
v10.components = {
	["Icon"] = function(_) -- name: Icon
		-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_9
		return v_u_4(v_u_7 and "Controller" or "CircleQuestion", nil, v_u_9)
	end
}
return v3:register(v10)