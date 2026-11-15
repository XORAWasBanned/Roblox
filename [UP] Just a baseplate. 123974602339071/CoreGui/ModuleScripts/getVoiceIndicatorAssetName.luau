-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.getVoiceIndicatorAssetName
local v1 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_2 = require(v1.Flags.getFFlagEnableShimmeringIconLegacyChatService)
return function(p3, p4, p5)
	-- upvalues: (copy) v_u_2
	if v_u_2() and p3 == "Connecting" then
		return "icons/controls/voice/" .. p5 .. "_0_dark"
	end
	if p3 == "Muted" or p3 == "LOCAL_MUTED" then
		return "icons/controls/voice/" .. p5 .. "_off_light"
	end
	if p3 == "Inactive" or p3 == "Connecting" then
		return "icons/controls/voice/" .. p5 .. "_0_light"
	end
	if p3 ~= "Talking" then
		return "icons/controls/voice/" .. p5 .. "_error_light"
	end
	local v6 = p4 * 5 + 0.5
	local v7 = math.floor(v6) * 20
	return "icons/controls/voice/" .. p5 .. "_" .. tostring(v7) .. "_light"
end