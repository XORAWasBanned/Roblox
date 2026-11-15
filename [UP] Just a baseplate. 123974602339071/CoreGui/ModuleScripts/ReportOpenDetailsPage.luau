-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.ReportOpenDetailsPage
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Thunk)
local v_u_3 = require(v1.Services.Analytics)
local v_u_4 = require(v1.UtilityFunctions)
local v_u_5 = require(v1.Thunks.SendCounter)
local v_u_6 = require(v1.Constants)
local v_u_7 = { v_u_3 }
return function(p_u_8) -- name: ReportOpenDetailsPage
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	return v_u_2.new(script.Name, v_u_7, function(p9, p10)
		-- upvalues: (ref) v_u_3, (copy) p_u_8, (ref) v_u_4, (ref) v_u_5, (ref) v_u_6
		local v11 = p10[v_u_3]
		local v12 = p_u_8
		if v12 then
			v12 = p_u_8.parentBundleId ~= nil
		end
		local v13, v14
		if v12 then
			v13 = v_u_4.getBundleId(p_u_8)
			v14 = "Bundle"
		else
			v13 = p_u_8.assetId
			v14 = "Asset"
		end
		v11.reportItemDetailPageOpened(v14, v13)
		p9:dispatch(v_u_5(v_u_6.Counters.ItemDetailPageOpened))
	end)
end