-- Path: CoreGui.RobloxGui.Modules.Feedback.Thunks.GetSourceLanguageThunk
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Network.GetExperienceSourceLanguage)
local v_u_5 = require(v3.Actions.SetSourceLanguageName)
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	return v_u_2.Single("GetExperienceSourceLanguage", function(p_u_6)
		-- upvalues: (ref) v_u_4, (ref) v_u_5
		return v_u_4():andThen(function(p7)
			-- upvalues: (copy) p_u_6, (ref) v_u_5
			p_u_6:dispatch(v_u_5(p7))
		end)
	end)
end