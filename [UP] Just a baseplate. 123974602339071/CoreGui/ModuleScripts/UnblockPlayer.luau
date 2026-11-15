-- Path: CoreGui.RobloxGui.Modules.PlayerList.Thunks.UnblockPlayer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.BlockingUtility)
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Actions.SetPlayerIsBlocked)
return function(p_u_5) -- name: UnblockPlayer
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	return function(p_u_6)
		-- upvalues: (ref) v_u_2, (copy) p_u_5, (ref) v_u_4
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_2, (ref) p_u_5, (copy) p_u_6, (ref) v_u_4
			if v_u_2:UnblockPlayerAsync(p_u_5) then
				p_u_6:dispatch(v_u_4(p_u_5, false))
			end
		end)()
	end
end