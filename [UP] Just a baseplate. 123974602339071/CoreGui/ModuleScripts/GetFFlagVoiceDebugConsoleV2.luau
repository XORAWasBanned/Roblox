-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.GetFFlagVoiceDebugConsoleV2
game:DefineFastFlag("VoiceDebugConsoleV2", false)
local v_u_1 = require(script.Parent.VoiceDebugConsoleV2TestOverride)
return function()
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1.get()
	if v2 == nil then
		return game:GetFastFlag("VoiceDebugConsoleV2")
	else
		return v2
	end
end