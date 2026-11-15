-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Party.PartyMicBinder
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = game:GetEngineFeature("AudioFocusManagement")
local v5 = require(v2.Workspace.Packages.CrossExperienceVoice)
local v_u_6
if require(v2.Workspace.Packages.Chrome).Enabled() then
	v_u_6 = require(v1.Service)
else
	v_u_6 = nil
end
local v_u_7 = require(v1.Integrations.Party.Constants)
local v_u_8 = v5.Hooks.useIsVoiceFocused
local v_u_9 = v5.Hooks.useIsVoiceConnected
return function() -- name: PartyMicBinder
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4
	local v_u_10 = v_u_8()
	local v_u_11 = v_u_9()
	local v_u_12 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7
		if v_u_6 then
			return v_u_6:integrations()[v_u_7.TOGGLE_MIC_INTEGRATION_ID]
		else
			return nil
		end
	end, {})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (ref) v_u_4
		if v_u_12 then
			if v_u_11 and (v_u_10 or not v_u_4) then
				v_u_12.availability:available()
				return
			end
			v_u_12.availability:unavailable()
		end
	end, { v_u_11, v_u_10, v_u_12 })
	return nil
end