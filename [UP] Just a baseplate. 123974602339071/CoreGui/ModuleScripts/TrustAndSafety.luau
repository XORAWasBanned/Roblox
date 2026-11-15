-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.TrustAndSafety
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = v2:WaitForChild("RobloxGui")
local v5 = require(v3.Workspace.Packages.SharedFlags)
local v6 = require(v1.Service)
local v_u_7 = require(v1.Integrations.CommonIcon)
local v8 = require(v3.Workspace.Packages.AppCommonLib).Signal
local v9 = require(v3.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v10 = require(v1.ChromeShared.Service.ChromeUtils).MappedSignal
local v_u_11 = v5.FFlagStandardizeSafetyIcon
local v_u_12 = false
local v_u_13 = v8.new()
local v_u_14 = v10.new(v_u_13, function()
	-- upvalues: (ref) v_u_12
	return v_u_12
end)
task.defer(function()
	-- upvalues: (copy) v_u_4, (ref) v_u_12, (copy) v_u_13
	local v_u_15 = require(v_u_4.Modules.Settings.SettingsHub)
	v_u_15.CurrentPageSignal:connect(function(p16)
		-- upvalues: (ref) v_u_12, (copy) v_u_15, (ref) v_u_13
		v_u_12 = p16 == v_u_15.Instance.ReportAbusePage.Page.Name
		v_u_13:fire()
	end)
end)
local v18 = {
	["initialAvailability"] = nil,
	["id"] = "trust_and_safety",
	["label"] = "CoreScripts.InGameMenu.QuickActions.Report",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v6.AvailabilitySignal.Available,
	["sideSheetPlacement"] = v9.AboveFold,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_4, (ref) v_u_12
		local v17 = require(v_u_4.Modules.Settings.SettingsHub)
		if v17:GetVisibility() then
			if v_u_12 then
				v17:SetVisibility(false)
			else
				v17:SwitchToPage(v17.Instance.ReportAbusePage, true)
			end
		else
			v17:SetVisibility(true, false, v17.Instance.ReportAbusePage)
			return
		end
	end,
	["isActivated"] = v_u_14,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_14
			if v_u_11 then
				return v_u_7("Flag", nil, v_u_14)
			else
				return v_u_7("icons/menu/safety_off", "icons/menu/safety_on", v_u_14)
			end
		end
	}
}
return v6:register(v18)