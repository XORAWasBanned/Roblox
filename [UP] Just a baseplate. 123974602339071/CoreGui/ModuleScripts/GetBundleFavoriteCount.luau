-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetBundleFavoriteCount
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v_u_6 = require(v3.Actions.SetBundles)
local v_u_7 = require(v3.Models.BundleInfo)
local v8 = require(v3.createInspectAndBuyKeyMapper)
local v_u_9 = require(v3.Thunks.SendCounter)
local v_u_10 = require(v3.Constants)
local v_u_11 = { v_u_5 }
local v_u_12 = v8("getBundleFavoriteCount")
return function(p_u_13) -- name: GetBundleFavoriteCount
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_5, (copy) v_u_12, (copy) v_u_2, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10
	return v_u_4.new(script.Name, v_u_11, function(p_u_14, p15)
		-- upvalues: (ref) v_u_5, (ref) v_u_12, (copy) p_u_13, (ref) v_u_2, (ref) v_u_7, (ref) v_u_6, (ref) v_u_9, (ref) v_u_10
		local v_u_16 = p15[v_u_5]
		local v17 = v_u_12(p_u_14:getState().storeId, p_u_13)
		return v_u_2.Single(v17, function(_)
			-- upvalues: (copy) v_u_16, (ref) p_u_13, (ref) v_u_7, (copy) p_u_14, (ref) v_u_6, (ref) v_u_9, (ref) v_u_10
			return v_u_16.getBundleFavoriteCount(p_u_13):andThen(function(p18)
				-- upvalues: (ref) v_u_7, (ref) p_u_13, (ref) p_u_14, (ref) v_u_6, (ref) v_u_9, (ref) v_u_10
				if p18 then
					p_u_14:dispatch(v_u_6({ (v_u_7.fromGetBundleFavoriteCount(p_u_13, p18)) }))
				end
				p_u_14:dispatch(v_u_9(v_u_10.Counters.GetBundleFavoriteCount .. v_u_10.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_14, (ref) v_u_9, (ref) v_u_10
				p_u_14:dispatch(v_u_9(v_u_10.Counters.GetBundleFavoriteCount .. v_u_10.CounterSuffix.RequestRejected))
			end)
		end)(p_u_14):catch(function(_)
			-- upvalues: (copy) p_u_14, (ref) v_u_9, (ref) v_u_10
			p_u_14:dispatch(v_u_9(v_u_10.Counters.GetBundleFavoriteCount .. v_u_10.CounterSuffix.RequestFailed))
		end)
	end)
end