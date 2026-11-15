-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Utility.isShowSelectInSceneReportMenu
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v_u_2 = game:GetService("ExperienceStateCaptureService")
local v_u_3 = require(v1.Components.Constants)
local v_u_4 = require(v1.Utility.isInSelectInSceneReportMenuOverrideList)
local v_u_5 = false
task.defer(function()
	-- upvalues: (ref) v_u_5, (copy) v_u_4
	v_u_5 = v_u_4()
end)
return function(p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (ref) v_u_5
	if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		return false
	end
	if not game:GetEngineFeature("CaptureModeEnabled") then
		return false
	end
	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		if not v_u_2:CanEnterCaptureMode() then
			p6({
				["type"] = nil,
				["memoryRequirementMet"] = 0,
				["type"] = v_u_3.AnalyticsActions.SetMemoryRequirementMet
			})
			return false
		end
		p6({
			["type"] = nil,
			["memoryRequirementMet"] = 1,
			["type"] = v_u_3.AnalyticsActions.SetMemoryRequirementMet
		})
	end
	return game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") and (v_u_5 and true or true) or false
end