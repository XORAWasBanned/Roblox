-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1.RobloxGui.Modules
local v_u_4 = require(v2.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_5 = require(v3.Flags.GetFStringInExperienceNotificationsLayer)
local v_u_6 = require(v3.Flags.GetFFlagEnableNewInviteMenuIXP)
local v_u_7 = require(v2.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new(p9) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_8
	local v10 = {
		["_ixpServiceWrapper"] = nil,
		["_styleEnabled"] = false,
		["_customizationEnabled"] = false,
		["_newSendEndpointEnabled"] = false,
		["_inviteListSortOrder"] = nil,
		["_ixpServiceWrapper"] = p9 or v_u_4,
		["_inviteListSortOrder"] = v_u_7() and 0 or nil
	}
	local v11 = v_u_8
	setmetatable(v10, v11)
	return v10
end
function v_u_8.getStyleEnabled(p12) -- name: getStyleEnabled
	return p12._styleEnabled
end
function v_u_8.getCustomizationEnabled(p13) -- name: getCustomizationEnabled
	return p13._customizationEnabled
end
function v_u_8.getNewSendEndpointEnabled(p14) -- name: getNewSendEndpointEnabled
	return p14._newSendEndpointEnabled
end
if v_u_7() then
	function v_u_8.getInviteListSortOrder(p15) -- name: getInviteListSortOrder
		return p15._inviteListSortOrder
	end
end
function v_u_8.initialize(p_u_16) -- name: initialize
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	if v_u_6() then
		task.spawn(function()
			-- upvalues: (copy) p_u_16, (ref) v_u_5, (ref) v_u_7
			p_u_16._ixpServiceWrapper:WaitForInitialization()
			local v17 = p_u_16._ixpServiceWrapper:GetLayerData(v_u_5())
			if v17 then
				p_u_16._styleEnabled = v17.NewInviteMenuStyleEnabled or false
				p_u_16._customizationEnabled = v17.NewInviteMenuCustomizationEnabled or false
				p_u_16._newSendEndpointEnabled = v17.NewInviteMenuEndpointEnabled or false
				p_u_16._inviteListSortOrder = v_u_7() and (v17.invite_list_sort_order or 0) or nil
			end
		end)
	end
end
v_u_8.default = v_u_8.new()
return v_u_8