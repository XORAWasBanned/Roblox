-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Thunks.BlockPlayer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.BlockingUtility)
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Actions.ShowToast)
return function(p_u_5, p_u_6, p_u_7) -- name: BlockPlayer
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	return function(p_u_8)
		-- upvalues: (ref) v_u_2, (copy) p_u_5, (ref) v_u_4, (copy) p_u_6, (copy) p_u_7
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_2, (ref) p_u_5, (copy) p_u_8, (ref) v_u_4, (ref) p_u_6, (ref) p_u_7
			if v_u_2:BlockPlayerAsync(p_u_5) then
				p_u_8:dispatch(v_u_4(p_u_6, p_u_7))
			end
		end)()
	end
end