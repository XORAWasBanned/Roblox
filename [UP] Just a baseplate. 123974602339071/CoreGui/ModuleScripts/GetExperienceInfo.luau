-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetExperienceInfo
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v6 = require(v3.createInspectAndBuyKeyMapper)
local v_u_7 = require(v3.Models.ExperienceInfo)
local v_u_8 = require(v3.Actions.SetExperienceInfo)
local v_u_9 = require(v3.Thunks.SendCounter)
local v_u_10 = require(v3.Constants)
local v_u_11 = { v_u_5 }
local v_u_12 = v6("getExperienceInfo")
return function(p13) -- name: GetExperienceInfo
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_5, (copy) v_u_12, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	local v_u_14 = tostring(p13)
	return v_u_4.new(script.Name, v_u_11, function(p_u_15, p16)
		-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_14, (ref) v_u_2, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10
		local v_u_17 = p16[v_u_5]
		local v18 = v_u_12(p_u_15:getState().storeId, v_u_14)
		return v_u_2.Single(v18, function()
			-- upvalues: (copy) v_u_17, (ref) v_u_14, (ref) v_u_7, (copy) p_u_15, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10
			return v_u_17.getExperienceInfo(v_u_14):andThen(function(p19)
				-- upvalues: (ref) v_u_7, (ref) p_u_15, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10
				local v20 = p19.data[1]
				p_u_15:dispatch(v_u_8((v_u_7.fromGetExperienceInfo(v20))))
				p_u_15:dispatch(v_u_9(v_u_10.Counters.GetExperienceInfo .. v_u_10.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_15, (ref) v_u_9, (ref) v_u_10
				p_u_15:dispatch(v_u_9(v_u_10.Counters.GetExperienceInfo .. v_u_10.CounterSuffix.RequestRejected))
			end)
		end)(p_u_15):catch(function(_)
			-- upvalues: (copy) p_u_15, (ref) v_u_9, (ref) v_u_10
			p_u_15:dispatch(v_u_9(v_u_10.Counters.GetExperienceInfo .. v_u_10.CounterSuffix.RequestFailed))
		end)
	end)
end