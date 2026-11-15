-- Path: CoreGui.RobloxGui.Modules.Shell.Experiment.XboxPrimaryNavIXPTest
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.ExperimentLayers).AppUserLayers
local v3 = require(script.Parent.makeExperiment)
local v_u_4 = game:DefineFastFlag("XboxPrimaryNavABIXPEnabled", false)
local v_u_5 = game:DefineFastFlag("XboxPrimaryNavABIXPEnrolledForAll", false)
local v_u_6 = game:DefineFastString("XboxPrimaryNavABIXPVariable", "tenFootPrimaryNavEnabled")
local v_u_7 = {}
local function v9(p8) -- name: setExperimentState
	-- upvalues: (ref) v_u_7
	v_u_7 = p8
end
local function v10() -- name: isUserEnrolled
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (ref) v_u_7, (copy) v_u_2, (copy) v_u_6
	if v_u_5 then
		return true
	elseif v_u_5 or v_u_4 then
		return (v_u_7[v_u_2.XboxClassicUILayer] or {})[v_u_6] or false
	else
		return false
	end
end
local v11 = v3("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer")
return {
	["isEnabled"] = function() -- name: isEnabled
		-- upvalues: (copy) v_u_5, (copy) v_u_4
		return v_u_5 or v_u_4
	end,
	["isEnrolledForAll"] = function() -- name: isEnrolledForAll
		-- upvalues: (copy) v_u_5
		return v_u_5
	end,
	["isUserEnrolled"] = v10,
	["layer"] = v_u_2.XboxClassicUILayer,
	["experiment"] = v11,
	["setExperimentState"] = v9
}