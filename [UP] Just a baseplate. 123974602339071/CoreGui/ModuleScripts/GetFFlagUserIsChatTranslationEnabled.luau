-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagUserIsChatTranslationEnabled
local v_u_1, v_u_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
return function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v3 = v_u_1
	if v3 then
		v3 = v_u_2
	end
	return v3
end