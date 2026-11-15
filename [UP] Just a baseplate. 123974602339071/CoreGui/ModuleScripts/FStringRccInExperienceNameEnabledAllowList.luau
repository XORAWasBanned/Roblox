-- Path: CoreGui.RobloxGui.Modules.Common.Flags.FStringRccInExperienceNameEnabledAllowList
local v_u_1 = game:DefineFastString("RccInExperienceNameSettingsEnabledAllowList", "")
local v_u_2 = nil
return {
	["isAllowListedUserId"] = function(p3) -- name: isAllowListedUserId
		-- upvalues: (ref) v_u_2, (copy) v_u_1
		local v4 = tostring(p3)
		if v_u_2 == nil then
			v_u_2 = {}
			for v5 in string.gmatch(v_u_1, "[^,]+") do
				v_u_2[v5] = true
			end
		end
		return v_u_2[v4] == true
	end
}