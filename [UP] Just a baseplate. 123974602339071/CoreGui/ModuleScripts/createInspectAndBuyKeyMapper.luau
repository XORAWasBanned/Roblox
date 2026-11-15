-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.createInspectAndBuyKeyMapper
return function(p_u_1) -- name: createInspectAndBuyKeyMapper
	return function(p2, ...)
		-- upvalues: (copy) p_u_1
		local v3 = "inspectAndBuy." .. p2 .. "." .. p_u_1
		for v4 = 1, select("#", ...) do
			local v5 = select
			v3 = v3 .. "." .. tostring(v5(v4, ...))
		end
		return v3
	end
end