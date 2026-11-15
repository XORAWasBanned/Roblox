-- Path: CoreGui.RobloxGui.Modules.Settings.InExperienceMenuReact
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("EventIngestService")
local v3 = require(v1.Packages.Foundation)
local v_u_4 = require(v1.Packages.React)
local v_u_5 = require(v1.Packages.SignalsReact)
local v_u_6 = require(v1.Workspace.Packages.Analytics).Analytics
local v_u_7 = require(v1.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local v8 = require(v1.Workspace.Packages.InExperienceLocales)
local v9 = require(v1.Workspace.Packages.Localization)
local v_u_10 = require(v1.Workspace.Packages.RoactServices).RoactServices.ServiceProvider
local v11 = require(v1.Workspace.Packages.RoactServiceTags)
local v12 = script.Parent
local v_u_13 = require(v12.Integrations.Utils)
local v_u_14 = v11.AppEventIngestService
local v_u_15 = v11.RoactAnalytics
local v_u_16 = v9.LocalizationProvider
local v_u_17 = v9.GetLocalizationServiceStore
local v_u_18 = v8.Localization
local v_u_19 = v3.FoundationProvider
local v_u_20 = {
	["colorMode"] = v3.Enums.ColorMode.Dark
}
return v_u_4.memo(function(p21) -- name: InExperienceMenuReact
	-- upvalues: (copy) v_u_17, (copy) v_u_5, (copy) v_u_18, (copy) v_u_4, (copy) v_u_10, (copy) v_u_14, (copy) v_u_7, (copy) v_u_2, (copy) v_u_15, (copy) v_u_6, (copy) v_u_16, (copy) v_u_19, (copy) v_u_20, (copy) v_u_13
	local v22 = v_u_17(false)
	local v23 = v_u_5.useSignalState(v22.getRobloxLocaleId)
	local v24 = v_u_18.new(v23)
	local v25 = v_u_4.createElement
	local v26 = v_u_10
	local v27 = {
		["services"] = {
			[v_u_14] = v_u_7.new(v_u_2),
			[v_u_15] = v_u_6.new()
		}
	}
	local v28 = {}
	local v29 = v_u_4.createElement
	local v30 = v_u_16
	local v31 = {
		["FoundationProvider"] = v_u_4.createElement(v_u_19, {
			["colorMode"] = p21.theme or v_u_20.colorMode,
			["device"] = v_u_13.getDeviceType()
		}, p21.children)
	}
	v28.LocalizationProvider = v29(v30, {
		["localization"] = v24
	}, v31)
	return v25(v26, v27, v28)
end)