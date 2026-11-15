-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.createSpy
return function(p_u_1) -- name: createSpy
	local v_u_7 = {
		["callCount"] = 0,
		["values"] = nil,
		["valuesLength"] = 0,
		["values"] = {},
		["value"] = function(...)
			-- upvalues: (copy) v_u_7, (copy) p_u_1
			v_u_7.callCount = v_u_7.callCount + 1
			v_u_7.values = { ... }
			v_u_7.valuesLength = select("#", ...)
			if p_u_1 ~= nil then
				return p_u_1(...)
			end
		end,
		["assertCalledWith"] = function(_, ...)
			-- upvalues: (copy) v_u_7
			local v2 = select("#", ...)
			local v3 = v_u_7.valuesLength
			assert(v3, v2, "length of expected values differs from stored values")
			for v4 = 1, v2 do
				local v5 = select(v4, ...)
				local v6 = v_u_7.values[v4]
				assert(v6, v5, "value differs")
			end
		end
	}
	setmetatable(v_u_7, {
		["__index"] = function(_, p8) -- name: __index
			error(("%q is not a valid member of spy"):format(p8))
		end
	})
	return v_u_7
end