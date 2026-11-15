-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetCharacterModelFromUserId
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v6 = require(v3.createInspectAndBuyKeyMapper)
local v_u_7 = require(v3.Thunks.SendCounter)
local v_u_8 = require(v3.Constants)
local v_u_9 = { v_u_5 }
local v_u_10 = v6("getPlayerModel")
return function(p_u_11, p_u_12, p_u_13) -- name: GetCharacterModelFromUserId
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_5, (copy) v_u_10, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8
	return v_u_4.new(script.Name, v_u_9, function(p_u_14, p15)
		-- upvalues: (ref) v_u_5, (ref) v_u_10, (copy) p_u_11, (copy) p_u_12, (ref) v_u_2, (copy) p_u_13, (ref) v_u_7, (ref) v_u_8
		local v_u_16 = p15[v_u_5]
		local v17 = v_u_10(p_u_14:getState().storeId, p_u_11, p_u_12)
		return v_u_2.Single(v17, function()
			-- upvalues: (copy) v_u_16, (ref) p_u_11, (ref) p_u_13, (copy) p_u_14, (ref) v_u_7, (ref) v_u_8
			return v_u_16.getModelFromUserId(p_u_11):andThen(function(p18)
				-- upvalues: (ref) p_u_13, (ref) p_u_14, (ref) v_u_7, (ref) v_u_8
				p_u_13(p18)
				p_u_14:dispatch(v_u_7(v_u_8.Counters.GetCharacterModelFromUserId .. v_u_8.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_14, (ref) v_u_7, (ref) v_u_8
				p_u_14:dispatch(v_u_7(v_u_8.Counters.GetCharacterModelFromUserId .. v_u_8.CounterSuffix.RequestRejected))
			end)
		end)(p_u_14):catch(function(_)
			-- upvalues: (copy) p_u_14, (ref) v_u_7, (ref) v_u_8
			p_u_14:dispatch(v_u_7(v_u_8.Counters.GetCharacterModelFromUserId .. v_u_8.CounterSuffix.RequestFailed))
		end)
	end)
end