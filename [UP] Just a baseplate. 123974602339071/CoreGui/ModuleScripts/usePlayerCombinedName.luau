-- Path: CoreGui.RobloxGui.Modules.PlayerList.Hooks.usePlayerCombinedName
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local v_u_3 = require(v1.Packages.SignalsReact)
return function(p4, p_u_5) -- name: usePlayerCombinedName
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = v_u_2.get().fetchNamesByUserIds({ p4 })(false).data[1]
	return v_u_3.useSignalBinding(v6.names.getInExperienceCombinedName):map(function(p7)
		-- upvalues: (copy) p_u_5
		if string.len(p7) == 0 then
			return p_u_5
		else
			return p7
		end
	end)
end