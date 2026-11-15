-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer.friends
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Cryo
local v4 = v2.Rodux
local v5 = script.Parent.Parent
local v6 = require(v5.Actions.SetFriendStatus)
return v4.createReducer({}, {
	[v6.name] = function(p7, p8)
		-- upvalues: (copy) v_u_3
		local v9 = p8.userId
		local v10 = p8.friendStatus
		return v_u_3.Dictionary.join(p7, {
			[v9] = v10 or v_u_3.None
		})
	end
})