-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.Helpers.getMicDeeplinkDirections
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_3 = v2:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithDeeplink")
local v_u_4 = v2:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithDeeplink")
local v_u_5 = v2:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithoutDeeplink")
local v_u_6 = v2:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithoutDeeplink")
return function(p7, p8)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v9 = p8:GetPlatform()
	if v9 == Enum.Platform.Android then
		if p7 then
			return v_u_3
		else
			return v_u_5
		end
	elseif v9 == Enum.Platform.Windows then
		if p7 then
			return v_u_4
		else
			return v_u_6
		end
	else
		return nil
	end
end