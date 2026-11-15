-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.Helpers.getPrimingText
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.RobloxTranslator):FormatByKey("Feature.SettingsHub.Prompt.RestartOnMicAccessChange")
return function(p3)
	-- upvalues: (copy) v_u_2
	if p3:GetPlatform() == Enum.Platform.Android then
		return "<b>" .. v_u_2 .. "</b>"
	else
		return nil
	end
end