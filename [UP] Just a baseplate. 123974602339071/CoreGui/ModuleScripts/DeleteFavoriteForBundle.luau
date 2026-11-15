-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.DeleteFavoriteForBundle
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Promise)
local v_u_3 = require(v1.Workspace.Packages.Http).PerformFetch
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Thunk)
local v_u_6 = require(v4.Services.Network)
local v_u_7 = require(v4.Services.Analytics)
local v_u_8 = require(v4.Actions.SetFavoriteBundle)
local v_u_9 = require(v4.Actions.SetBundles)
local v_u_10 = require(v4.Models.BundleInfo)
local v11 = require(v4.createInspectAndBuyKeyMapper)
local v_u_12 = require(v4.Thunks.SendCounter)
local v_u_13 = require(v4.Constants)
local v_u_14 = { v_u_6, v_u_7 }
local v_u_15 = v11("deleteFavoriteForBundle")
return function(p_u_16) -- name: DeleteFavoriteForBundle
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_6, (copy) v_u_7, (copy) v_u_15, (copy) v_u_3, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_12, (copy) v_u_13, (copy) v_u_2
	return v_u_5.new(script.Name, v_u_14, function(p_u_17, p18)
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_15, (copy) p_u_16, (ref) v_u_3, (ref) v_u_8, (ref) v_u_10, (ref) v_u_9, (ref) v_u_12, (ref) v_u_13, (ref) v_u_2
		local v_u_19 = p18[v_u_6]
		local v_u_20 = p18[v_u_7]
		local v21 = v_u_15(p_u_17:getState().storeId, p_u_16)
		return v_u_3.Single(v21, function()
			-- upvalues: (copy) v_u_19, (ref) p_u_16, (copy) p_u_17, (ref) v_u_8, (ref) v_u_10, (ref) v_u_9, (copy) v_u_20, (ref) v_u_12, (ref) v_u_13, (ref) v_u_2
			return v_u_19.deleteFavoriteForBundle(p_u_16):andThen(function()
				-- upvalues: (ref) p_u_17, (ref) v_u_8, (ref) p_u_16, (ref) v_u_10, (ref) v_u_9, (ref) v_u_20, (ref) v_u_12, (ref) v_u_13, (ref) v_u_2
				p_u_17:dispatch(v_u_8(p_u_16, false))
				local v22 = p_u_17:getState().bundles[p_u_16].numFavorites
				p_u_17:dispatch(v_u_9({ (v_u_10.fromGetBundleFavoriteCount(p_u_16, v22 - 1)) }))
				v_u_20.reportFavoriteItem("Bundle", p_u_16, false, true, "", v22 - 1)
				p_u_17:dispatch(v_u_12(v_u_13.Counters.DeleteFavoriteForBundle .. v_u_13.CounterSuffix.RequestSucceeded))
				return v_u_2.resolve()
			end, function(p23)
				-- upvalues: (ref) p_u_17, (ref) v_u_12, (ref) v_u_13, (ref) v_u_2
				p_u_17:dispatch(v_u_12(v_u_13.Counters.DeleteFavoriteForBundle .. v_u_13.CounterSuffix.RequestRejected))
				local v24 = v_u_2.reject
				local v25 = p23.StatusMessage
				return v24((tostring(v25)))
			end)
		end)(p_u_17):catch(function(p26)
			-- upvalues: (copy) p_u_17, (ref) p_u_16, (copy) v_u_20, (ref) v_u_12, (ref) v_u_13
			local v27 = p_u_17:getState().bundles[p_u_16].numFavorites
			v_u_20.reportFavoriteItem("Bundle", p_u_16, false, false, p26, v27)
			p_u_17:dispatch(v_u_12(v_u_13.Counters.DeleteFavoriteForBundle .. v_u_13.CounterSuffix.RequestFailed))
		end)
	end)
end