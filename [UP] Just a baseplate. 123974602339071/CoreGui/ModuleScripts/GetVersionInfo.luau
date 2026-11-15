-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetVersionInfo
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v_u_6 = require(v3.Models.AssetInfo)
local v_u_7 = require(v3.Actions.SetAssets)
local v8 = require(v3.createInspectAndBuyKeyMapper)
local v_u_9 = require(v3.Thunks.GetExperiencePlayability)
local v_u_10 = require(v3.Thunks.GetExperienceInfo)
local v_u_11 = require(v3.Thunks.SendCounter)
local v_u_12 = require(v3.Constants)
local v_u_13 = { v_u_5 }
local v_u_14 = v8("getVersionInfo")
return function(p_u_15) -- name: GetVersionInfo
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_5, (copy) v_u_14, (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	return v_u_4.new(script.Name, v_u_13, function(p_u_16, p17)
		-- upvalues: (ref) v_u_5, (ref) v_u_14, (copy) p_u_15, (ref) v_u_2, (ref) v_u_6, (ref) v_u_7, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12
		local v_u_18 = p17[v_u_5]
		local v19 = v_u_14(p_u_16:getState().storeId, p_u_15)
		return v_u_2.Single(v19, function()
			-- upvalues: (copy) v_u_18, (ref) p_u_15, (ref) v_u_6, (copy) p_u_16, (ref) v_u_7, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12
			return v_u_18.getVersionInfo(p_u_15):andThen(function(p20)
				-- upvalues: (ref) v_u_6, (ref) p_u_15, (ref) p_u_16, (ref) v_u_7, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12
				local v21 = p20.data[1]
				local v22
				if v21 then
					v22 = v21.creatingUniverseId
				else
					v22 = nil
				end
				if v22 then
					local v23 = tostring(v22)
					p_u_16:dispatch(v_u_7({ (v_u_6.fromGetVersionInfo(p_u_15, v21)) }))
					p_u_16:dispatch(v_u_9(v23))
					p_u_16:dispatch(v_u_10(v23))
				end
				p_u_16:dispatch(v_u_11(v_u_12.Counters.GetVersionInfo .. v_u_12.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_16, (ref) v_u_11, (ref) v_u_12
				p_u_16:dispatch(v_u_11(v_u_12.Counters.GetVersionInfo .. v_u_12.CounterSuffix.RequestRejected))
			end)
		end)(p_u_16):catch(function(_)
			-- upvalues: (copy) p_u_16, (ref) v_u_11, (ref) v_u_12
			p_u_16:dispatch(v_u_11(v_u_12.Counters.GetVersionInfo .. v_u_12.CounterSuffix.RequestFailed))
		end)
	end)
end