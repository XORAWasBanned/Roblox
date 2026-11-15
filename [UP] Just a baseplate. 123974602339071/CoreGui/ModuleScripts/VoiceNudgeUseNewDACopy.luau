-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.VoiceNudgeUseNewDACopy
local v_u_1 = game:GetService("IXPService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v_u_4 = require(script.Parent.Parent.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopy)
local v_u_5 = game:DefineFastString("DisruptiveVoiceNudgeVariantIXPLayerName", "Voice.CivilityAndSafety")
local v_u_6 = game:DefineFastString("DisruptiveVoiceNudgeVariantIXPVariableName", "UseNewDACopy")
return function() -- name: VoiceNudgeUseNewDACopy
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3
	if v_u_4() then
		return true
	end
	local function v7()
		-- upvalues: (ref) v_u_1, (ref) v_u_5
		return v_u_1:GetUserLayerVariables(v_u_5)
	end
	local v8, v9 = pcall(v7)
	if not v8 or (not v9 or v9[v_u_6] == nil) then
		v_u_3:debug("Failed to get IXP data for layer: " .. v_u_5 .. " with variable: " .. v_u_6)
		return false
	end
	v_u_1:LogUserLayerExposure(v_u_5)
	local v10 = v_u_3
	local v11 = v_u_6
	local v12 = v9[v_u_6]
	v10:debug("Experiment variant for " .. v11 .. ": " .. tostring(v12))
	return v9[v_u_6]
end