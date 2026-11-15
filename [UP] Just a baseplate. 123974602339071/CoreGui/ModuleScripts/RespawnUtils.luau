-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.RespawnUtils
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = script:FindFirstAncestor("Chrome")
local v4 = require(v3.ChromeShared.Service.ChromeUtils).MappedSignal
local v5 = require(v1.Workspace.Packages.AppCommonLib).Signal
local v_u_6 = v2:WaitForChild("RobloxGui")
local v_u_7 = require(v3.Flags.FFlagRespawnChromeShortcutTelemetry)
local v_u_8 = false
local v_u_9 = v5.new()
local v10 = v4.new(v_u_9, function()
	-- upvalues: (ref) v_u_8
	return v_u_8
end)
task.defer(function()
	-- upvalues: (copy) v_u_6, (ref) v_u_8, (copy) v_u_9
	local v_u_11 = require(v_u_6.Modules.Settings.SettingsHub)
	v_u_11.CurrentPageSignal:connect(function(p12)
		-- upvalues: (ref) v_u_8, (copy) v_u_11, (ref) v_u_9
		v_u_8 = p12 == v_u_11.Instance.ResetCharacterPage.Page.Name
		v_u_9:fire()
	end)
end)
return {
	["respawnPageOpenSignal"] = v10,
	["respawnPage"] = function(p13) -- name: respawnPage
		-- upvalues: (copy) v_u_6, (ref) v_u_8, (copy) v_u_7
		local v14 = require(v_u_6.Modules.Settings.SettingsHub)
		local v15 = v14.Instance.ResetCharacterPage
		if v14:GetVisibility() then
			if v_u_8 then
				v14:SetVisibility(false)
				return
			elseif v_u_7 then
				local v16 = {}
				local v17
				if p13 then
					v17 = p13.usedShortcut
				else
					v17 = nil
				end
				v16.used_shortcut = v17
				v14.Instance:SwitchToPage(v15, true, nil, nil, nil, v16)
			else
				v14.Instance:SwitchToPage(v15, true)
			end
		elseif v_u_7 then
			v14:SetVisibility(true)
			local v18 = {}
			local v19
			if p13 then
				v19 = p13.usedShortcut
			else
				v19 = nil
			end
			v18.used_shortcut = v19
			v14.Instance:SwitchToPage(v15, true, nil, nil, nil, v18)
		else
			v14:SetVisibility(true, false, v15)
		end
	end
}