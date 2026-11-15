-- Path: CoreGui.RobloxGui.Modules.Shell.LocalizedStrings
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.RobloxAppLocales).Localization
local v_u_3 = nil
local v4, v5 = pcall(function()
	return game:GetService("LocalizationService").RobloxLocaleId
end)
local v_u_6 = v4
local v_u_7 = v5
return {
	["LocStringUA"] = function(_, p8) -- name: LocStringUA
		-- upvalues: (ref) v_u_6, (ref) v_u_3, (copy) v_u_2, (ref) v_u_7
		if v_u_6 and not v_u_3 then
			v_u_3 = v_u_2.new(v_u_7)
		else
			v_u_3 = v_u_2.new("en-us")
		end
		return v_u_3.localizationContext:getString(v_u_7, p8) or p8
	end
}