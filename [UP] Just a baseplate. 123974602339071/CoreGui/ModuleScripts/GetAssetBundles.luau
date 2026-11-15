-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetAssetBundles
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v_u_6 = require(v3.Models.BundleInfo)
local v_u_7 = require(v3.Actions.SetBundles)
local v_u_8 = require(v3.Thunks.GetProductInfo)
local v9 = require(v3.createInspectAndBuyKeyMapper)
local v_u_10 = require(v3.Actions.SetAssetToBundlesMapping)
local v_u_11 = require(v3.Thunks.SendCounter)
local v_u_12 = require(v3.Constants)
local v_u_13 = { v_u_5 }
local v_u_14 = v9("getAssetBundles")
return function(p_u_15) -- name: GetAssetBundles
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_5, (copy) v_u_14, (copy) v_u_2, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	return v_u_4.new(script.Name, v_u_13, function(p_u_16, p17)
		-- upvalues: (ref) v_u_5, (ref) v_u_14, (copy) p_u_15, (ref) v_u_2, (ref) v_u_6, (ref) v_u_8, (ref) v_u_7, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12
		local v_u_18 = p17[v_u_5]
		local v19 = v_u_14(p_u_16:getState().storeId, p_u_15)
		return v_u_2.Single(v19, function(_)
			-- upvalues: (copy) v_u_18, (ref) p_u_15, (ref) v_u_6, (copy) p_u_16, (ref) v_u_8, (ref) v_u_7, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12
			return v_u_18.getAssetBundles(p_u_15):andThen(function(p20)
				-- upvalues: (ref) v_u_6, (ref) p_u_16, (ref) v_u_8, (ref) v_u_7, (ref) v_u_10, (ref) p_u_15, (ref) v_u_11, (ref) v_u_12
				local v21 = {}
				local v22 = {}
				for _, v23 in pairs(p20.data) do
					local v24 = v_u_6.fromGetAssetBundles(v23)
					table.insert(v21, v24)
					local v25 = v24.bundleId
					local v26 = tostring(v25)
					table.insert(v22, v26)
					local v27 = false
					for _, v28 in pairs(v23.items) do
						if v28.type ~= "UserOutfit" then
							continue
						end
						v27 = true
					end
					if v27 then
						break
					end
					for _, v_u_29 in pairs(v23.items) do
						if p_u_16:getState().assets[v_u_29.id] then
							continue
						end
						coroutine.wrap(function()
							-- upvalues: (ref) p_u_16, (ref) v_u_8, (copy) v_u_29
							p_u_16:dispatch(v_u_8(v_u_29.id))
						end)()
					end
				end
				p_u_16:dispatch(v_u_7(v21))
				local v30 = p_u_15
				p_u_16:dispatch(v_u_10(tostring(v30), v22))
				p_u_16:dispatch(v_u_11(v_u_12.Counters.GetAssetBundles .. v_u_12.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_16, (ref) v_u_11, (ref) v_u_12
				p_u_16:dispatch(v_u_11(v_u_12.Counters.GetAssetBundles .. v_u_12.CounterSuffix.RequestRejected))
			end)
		end)(p_u_16):catch(function(_)
			-- upvalues: (copy) p_u_16, (ref) v_u_11, (ref) v_u_12
			p_u_16:dispatch(v_u_11(v_u_12.Counters.GetAssetBundles .. v_u_12.CounterSuffix.RequestFailed))
		end)
	end)
end