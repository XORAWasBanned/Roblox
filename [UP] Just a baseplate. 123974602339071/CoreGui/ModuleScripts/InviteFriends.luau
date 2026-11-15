-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Pages.InviteFriends
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("Players")
local v4 = game:GetService("RunService")
local v5 = require(v2.Workspace.Packages.Chrome)
local v_u_6 = require(v2.Workspace.Packages.GameInvite).GameInviteModalManager
local v7 = require(v2.Workspace.Packages.AppCommonLib)
local v8 = require(v1.Service)
local v_u_9 = require(v1.Integrations.CommonIcon)
local v10 = require(v1.ChromeShared.Service.ChromeUtils).MappedSignal
local v11 = v5.Enums.SideSheetPlacement
local v12 = v7.Signal
local v13 = require(script.Parent.InGameMenuIntegrationUtils)
local v_u_14 = v12.new()
local v_u_15 = v10.new(v_u_14, function()
	-- upvalues: (copy) v_u_6
	return v_u_6:isGameModalOpen()
end)
v_u_6.ToggleGameInviteModalEvent.Event:Connect(function()
	-- upvalues: (copy) v_u_14
	v_u_14:fire()
end)
local v16 = {
	["initialAvailability"] = nil,
	["id"] = "invite_friends",
	["label"] = "CoreScripts.InGameMenu.PageTitle.InviteFriends",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil
}
local v17 = not v4:IsStudio()
if v17 then
	if v3.LocalPlayer == nil then
		v17 = false
	else
		v17 = v3.LocalPlayer.UserId > 0
	end
end
local v18
if v17 then
	v18 = v8.AvailabilitySignal.Available
else
	v18 = v8.AvailabilitySignal.Unavailable
end
v16.initialAvailability = v18
v16.sideSheetPlacement = v11.AboveFold
v16.activated = v13.toggleInviteFriendsPage
v16.isActivated = v_u_15
v16.components = {
	["Icon"] = function() -- name: Icon
		-- upvalues: (copy) v_u_9, (copy) v_u_15
		return v_u_9("PersonArrowFromBottomRight", nil, v_u_15)
	end
}
return v8:register(v16)