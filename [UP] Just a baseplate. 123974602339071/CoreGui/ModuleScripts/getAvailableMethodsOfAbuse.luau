-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Utility.getAvailableMethodsOfAbuse
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Components.Constants)
local v_u_4 = require(v2.Workspace.Packages.RobloxTranslator)
function getAvailableMethodsOfAbuse(p5, p6) -- name: getAvailableMethodsOfAbuse
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v7 = {
		{
			["label"] = v_u_4:FormatByKey(v_u_3.localizationKeys[v_u_3.AbuseMethods.TextChat]),
			["subLabel"] = v_u_4:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Text.Subtitle"),
			["identifier"] = v_u_3.AbuseMethods.TextChat
		}
	}
	if p6 then
		v7[#v7 + 1] = {
			["label"] = v_u_4:FormatByKey(v_u_3.localizationKeys[v_u_3.AbuseMethods.Avatar]),
			["subLabel"] = v_u_4:FormatByKey("Feature.SettingsHub.MethodOfAbuse.AvatarSubtitle"),
			["identifier"] = v_u_3.AbuseMethods.Avatar
		}
	else
		v7[#v7 + 1] = {
			["label"] = v_u_4:FormatByKey(v_u_3.localizationKeys[v_u_3.AbuseMethods.Other]),
			["subLabel"] = v_u_4:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Other.Subtitle"),
			["identifier"] = v_u_3.AbuseMethods.Other
		}
	end
	if p5 then
		local v8 = {
			["label"] = v_u_4:FormatByKey(v_u_3.localizationKeys[v_u_3.AbuseMethods.VoiceChat]),
			["subLabel"] = v_u_4:FormatByKey("Feature.SettingsHub.MethodOfAbuse.VoiceChat.Subtitle"),
			["identifier"] = v_u_3.AbuseMethods.VoiceChat
		}
		table.insert(v7, 1, v8)
	end
	return v7
end
return getAvailableMethodsOfAbuse