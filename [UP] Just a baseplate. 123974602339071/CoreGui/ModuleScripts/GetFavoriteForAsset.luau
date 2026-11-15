-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetFavoriteForAsset
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v_u_6 = require(v3.Actions.SetFavoriteAsset)
local v7 = require(v3.createInspectAndBuyKeyMapper)
local v_u_8 = require(v3.Thunks.SendCounter)
local v_u_9 = require(v3.Constants)
local v_u_10 = { v_u_5 }
local v_u_11 = v7("getFavoriteForAsset")
return function(p_u_12) -- name: GetFavoriteForAsset
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_11, (copy) v_u_2, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9
	return v_u_4.new(script.Name, v_u_10, function(p_u_13, p14)
		-- upvalues: (ref) v_u_5, (ref) v_u_11, (copy) p_u_12, (ref) v_u_2, (ref) v_u_6, (ref) v_u_8, (ref) v_u_9
		local v_u_15 = p14[v_u_5]
		local v16 = v_u_11(p_u_13:getState().storeId, p_u_12)
		return v_u_2.Single(v16, function(_)
			-- upvalues: (copy) v_u_15, (ref) p_u_12, (copy) p_u_13, (ref) v_u_6, (ref) v_u_8, (ref) v_u_9
			return v_u_15.getFavoriteForAsset(p_u_12):andThen(function(p17)
				-- upvalues: (ref) p_u_13, (ref) v_u_6, (ref) p_u_12, (ref) v_u_8, (ref) v_u_9
				if p17 == "null" then
					local v18 = p_u_12
					p_u_13:dispatch(v_u_6(tostring(v18), false))
				else
					local v19 = p_u_12
					p_u_13:dispatch(v_u_6(tostring(v19), true))
				end
				p_u_13:dispatch(v_u_8(v_u_9.Counters.GetFavoriteForAsset .. v_u_9.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_13, (ref) v_u_8, (ref) v_u_9
				p_u_13:dispatch(v_u_8(v_u_9.Counters.GetFavoriteForAsset .. v_u_9.CounterSuffix.RequestRejected))
			end)
		end)(p_u_13):catch(function(_)
			-- upvalues: (copy) p_u_13, (ref) v_u_8, (ref) v_u_9
			p_u_13:dispatch(v_u_8(v_u_9.Counters.GetFavoriteForAsset .. v_u_9.CounterSuffix.RequestFailed))
		end)
	end)
end