-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.VoiceDebugConsoleV2TestOverride
local v_u_1 = nil
return {
	["get"] = function() -- name: get
		-- upvalues: (ref) v_u_1
		return v_u_1
	end,
	["setForTesting"] = function(p2) -- name: setForTesting
		-- upvalues: (ref) v_u_1
		local v3 = v_u_1
		v_u_1 = p2
		return v3
	end
}