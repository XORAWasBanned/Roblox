-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.PerformanceStats
local v1 = script:FindFirstAncestor("Settings")
local v2 = game:GetService("CorePackages")
local v_u_3 = UserSettings().GameSettings
local v4 = require(v2.Workspace.Packages.CachedPolicyService)
local v5 = require(v2.Workspace.Packages.SettingsService)
local v_u_6 = v5.ValueChangedSignal
local v7 = v5.AvailabilitySignal
local v8 = v5.SettingEnum
local v9 = require(v1.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local v10 = v7.new(not v4:IsSubjectToChinaPolicies())
return {
	["id"] = "perf-stats",
	["field_type"] = nil,
	["alreadyLocalized"] = false,
	["label"] = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats",
	["onChanged"] = nil,
	["availability"] = nil,
	["layoutOrder"] = nil,
	["field_type"] = v8.Toggle,
	["onChanged"] = (function() -- name: PerfStatsValue
		-- upvalues: (copy) v_u_6, (copy) v_u_3
		local v_u_11 = v_u_6.new(v_u_3.PerformanceStatsVisible)
		v_u_11:connect(function(p12)
			-- upvalues: (ref) v_u_3
			if v_u_3.PerformanceStatsVisible ~= p12 then
				v_u_3.PerformanceStatsVisible = p12
			end
		end)
		v_u_3.PerformanceStatsVisibleChanged:Connect(function()
			-- upvalues: (copy) v_u_11, (ref) v_u_3
			v_u_11:set(v_u_3.PerformanceStatsVisible)
		end)
		return v_u_11
	end)(),
	["availability"] = v10,
	["layoutOrder"] = v9.PerformanceStatsFrame
}