-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.BatchGetAssets
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v_u_6 = require(v3.Thunks.SendCounter)
local v_u_7 = require(v3.Constants)
local v_u_8 = require(v3.Actions.SetAssets)
local v_u_9 = require(v3.Thunks.GetProductInfo)
local v_u_10 = require(v3.Thunks.GetAssetBundles)
local v_u_11 = require(v3.Thunks.GetVersionInfo)
local v_u_12 = { v_u_5 }
return function(p_u_13) -- name: BatchGetAssets
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_5, (copy) v_u_2, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
	return v_u_4.new(script.Name, v_u_12, function(p_u_14, p15)
		-- upvalues: (ref) v_u_5, (copy) p_u_13, (ref) v_u_2, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_8, (ref) v_u_6, (ref) v_u_7
		local v_u_16 = p15[v_u_5]
		local v_u_17 = {}
		if p_u_13 then
			for _, v18 in p_u_13 do
				local v19 = v18.assetId
				local v20 = tonumber(v19)
				table.insert(v_u_17, v20)
			end
		end
		return v_u_2.Single("BatchGetAssets", function()
			-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) p_u_14, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_8, (ref) v_u_6, (ref) v_u_7
			return v_u_16.getBatchItemDetails(v_u_17, Enum.AvatarItemType.Asset):andThen(function(p21)
				-- upvalues: (ref) p_u_14, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_8, (ref) v_u_6, (ref) v_u_7
				local v22 = {}
				for _, v23 in p21 do
					local v24 = {}
					local v25 = v23.Id
					v24.assetId = tostring(v25)
					table.insert(v22, v24)
				end
				for _, v_u_26 in v22 do
					coroutine.wrap(function()
						-- upvalues: (ref) p_u_14, (ref) v_u_9, (copy) v_u_26, (ref) v_u_10, (ref) v_u_11
						p_u_14:dispatch(v_u_9(v_u_26.assetId))
						if v_u_26.parentBundleId == nil then
							p_u_14:dispatch(v_u_10(v_u_26.assetId))
						end
						p_u_14:dispatch(v_u_11(v_u_26.assetId))
					end)()
				end
				p_u_14:dispatch(v_u_8(v22))
				p_u_14:dispatch(v_u_6(v_u_7.Counters.BatchGetAssets .. v_u_7.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_14, (ref) v_u_6, (ref) v_u_7
				p_u_14:dispatch(v_u_6(v_u_7.Counters.BatchGetAssets .. v_u_7.CounterSuffix.RequestRejected))
			end)
		end)(p_u_14):catch(function(_)
			-- upvalues: (copy) p_u_14, (ref) v_u_6, (ref) v_u_7
			p_u_14:dispatch(v_u_6(v_u_7.Counters.BatchGetAssets .. v_u_7.CounterSuffix.RequestFailed))
		end)
	end)
end