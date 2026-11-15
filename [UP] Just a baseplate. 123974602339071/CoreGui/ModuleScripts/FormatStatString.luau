-- Path: CoreGui.RobloxGui.Modules.PlayerList.FormatStatString
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("LocalizationService")
local v_u_3 = require(v1.Workspace.Packages.Localization).NumberLocalization
local v_u_4 = require(v1.Workspace.Packages.Localization).RoundingBehaviour
return function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	if p5 == nil then
		return "-"
	elseif type(p5) == "number" then
		if tostring(p5):len() >= 7 then
			return v_u_3.abbreviate(p5, v_u_2.RobloxLocaleId, v_u_4.Truncate)
		else
			return v_u_3.localize(p5, v_u_2.RobloxLocaleId)
		end
	else
		return tostring(p5)
	end
end