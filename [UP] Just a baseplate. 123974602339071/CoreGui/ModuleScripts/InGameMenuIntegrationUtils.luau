-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Pages.InGameMenuIntegrationUtils
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = v2:WaitForChild("RobloxGui")
local v_u_5 = require(v3.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
local v_u_6 = require(v3.Workspace.Packages.GameInvite).GameInviteModalManager
local v_u_7 = require(v3.Workspace.Packages.AppCommonLib).Signal
local v_u_8 = require(v1.ChromeShared.Service.ChromeUtils).MappedSignal
return {
	["createPageOpenSignal"] = function(p_u_9) -- name: createPageOpenSignal
		-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_4
		local v_u_10 = false
		local v_u_11 = v_u_7.new()
		local v12 = v_u_8.new(v_u_11, function()
			-- upvalues: (ref) v_u_10
			return v_u_10
		end)
		task.defer(function()
			-- upvalues: (ref) v_u_4, (copy) p_u_9, (ref) v_u_10, (copy) v_u_11
			local v_u_13 = require(v_u_4.Modules.Settings.SettingsHub)
			v_u_13.CurrentPageSignal:connect(function(p14)
				-- upvalues: (copy) v_u_13, (ref) p_u_9, (ref) v_u_10, (ref) v_u_11
				local v15 = v_u_13.Instance[p_u_9]
				local v16
				if v15 == nil then
					v16 = false
				else
					v16 = p14 == v15.Page.Name
				end
				v_u_10 = v16
				v_u_11:fire()
			end)
		end)
		return v12
	end,
	["toggleIGMPage"] = function(p17, p18) -- name: toggleIGMPage
		-- upvalues: (copy) v_u_4
		local v19 = require(v_u_4.Modules.Settings.SettingsHub)
		local v20 = v19.Instance[p17]
		if v19:GetVisibility() then
			if p18 then
				v19:SetVisibility(false)
			else
				v19:SwitchToPage(v20, true)
			end
		else
			v19:SetVisibility(true, false, v20)
			return
		end
	end,
	["toggleInviteFriendsPage"] = function() -- name: toggleInviteFriendsPage
		-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
		if v_u_6:isGameModalOpen() then
			v_u_6:closeModal()
		else
			local v21 = require(v_u_4.Modules.Settings.SettingsHub)
			v_u_5:withButtonName(v_u_5.ButtonName.SettingsHub)
			v21:InviteToGame()
		end
	end
}