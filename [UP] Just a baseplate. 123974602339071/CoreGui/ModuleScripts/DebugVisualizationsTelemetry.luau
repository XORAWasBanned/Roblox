-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DebugVisualizations.DebugVisualizationsTelemetry
local v_u_1 = game:GetService("RbxAnalyticsService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TelemetryService")
local v_u_4 = {
	["eventName"] = "SlimTintModeSelected",
	["backends"] = nil,
	["throttlingPercentage"] = 10000,
	["lastUpdated"] = nil,
	["description"] = "\t\tSLIM tint mode selected by a user. Shared by the Developer Console Debug Visualizations tab\n\t\t(ui = \"DevConsole\") and the Studio Visualization Modes plugin (ui = \"VisualizationModes\").\n\t\tThe app field is \"Studio\" or \"Player\", since the Developer Console runs in both.\n\t",
	["backends"] = { "Points", "EventIngest" },
	["lastUpdated"] = { 2026, 10, 13 }
}
return {
	["logSlimTintModeSelected"] = function(p5) -- name: logSlimTintModeSelected
		-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
		if p5.Name ~= "None" then
			v_u_3:LogEvent(v_u_4, {
				["customFields"] = {
					["tintMode"] = nil,
					["ui"] = "DevConsole",
					["app"] = nil,
					["clientId"] = nil,
					["tintMode"] = p5.Name,
					["app"] = v_u_2:IsStudio() and "Studio" or "Player",
					["clientId"] = v_u_1:GetClientId()
				}
			})
		end
	end
}