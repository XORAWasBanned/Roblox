-- Path: CorePackages.Packages._Index.React.React.createSignal.roblox
local function v10() -- name: createSignal
	local v_u_1 = {}
	local v_u_2 = {}
	local v_u_3 = false
	return function(p_u_4) -- name: subscribe
		-- upvalues: (ref) v_u_3, (copy) v_u_1, (copy) v_u_2
		local v5 = typeof(p_u_4) == "function"
		assert(v5, "Can only subscribe to signals with a function.")
		local v_u_6 = {
			["callback"] = nil,
			["disconnected"] = false,
			["callback"] = p_u_4
		}
		if v_u_3 and not v_u_1[p_u_4] then
			v_u_2[p_u_4] = v_u_6
		end
		v_u_1[p_u_4] = v_u_6
		return function() -- name: disconnect
			-- upvalues: (copy) v_u_6, (ref) v_u_1, (copy) p_u_4, (ref) v_u_2
			local v7 = not v_u_6.disconnected
			assert(v7, "Listeners can only be disconnected once.")
			v_u_6.disconnected = true
			v_u_1[p_u_4] = nil
			v_u_2[p_u_4] = nil
		end
	end, function(...) -- name: fire
		-- upvalues: (ref) v_u_3, (copy) v_u_1, (copy) v_u_2
		v_u_3 = true
		for v8, v9 in v_u_1 do
			if v9.disconnected or v_u_2[v8] then
				continue
			end
			v8(...)
		end
		v_u_3 = false
		table.clear(v_u_2)
	end
end
local function v_u_14(p11, ...) -- name: fireConnections
	for v12, v13 in p11 do
		if v13.disconnected then
			continue
		end
		v12(...)
	end
	return nil
end
local function v28() -- name: createReentrantSafeSignal
	-- upvalues: (copy) v_u_14
	local v_u_15 = {}
	local v_u_16 = {}
	local v_u_17 = 0
	return function(p_u_18) -- name: subscribe
		-- upvalues: (ref) v_u_17, (copy) v_u_15, (copy) v_u_16
		local v19 = typeof(p_u_18) == "function"
		assert(v19, "Can only subscribe to signals with a function.")
		local v_u_20 = {
			["callback"] = nil,
			["disconnected"] = false,
			["callback"] = p_u_18
		}
		if v_u_17 > 0 and v_u_15[p_u_18] == nil then
			v_u_16[p_u_18] = v_u_20
		else
			v_u_15[p_u_18] = v_u_20
		end
		return function() -- name: disconnect
			-- upvalues: (copy) v_u_20, (ref) v_u_15, (copy) p_u_18, (ref) v_u_16
			local v21 = not v_u_20.disconnected
			assert(v21, "Listeners can only be disconnected once.")
			v_u_20.disconnected = true
			if v_u_15[p_u_18] == v_u_20 then
				v_u_15[p_u_18] = nil
			end
			if v_u_16[p_u_18] == v_u_20 then
				v_u_16[p_u_18] = nil
			end
		end
	end, function(...) -- name: fire
		-- upvalues: (ref) v_u_17, (ref) v_u_14, (copy) v_u_15, (copy) v_u_16
		v_u_17 = v_u_17 + 1
		local v22 = v_u_14
		local v23 = v_u_15
		local v24, v25 = pcall(v22, v23, ...)
		v_u_17 = v_u_17 - 1
		if v_u_17 == 0 and next(v_u_16) ~= nil then
			for v26, v27 in v_u_16 do
				v_u_15[v26] = v27
			end
			table.clear(v_u_16)
		end
		if not v24 then
			error(v25, 0)
		end
	end
end
if require(script.Parent.Parent.Shared).ReactFeatureFlags.enableReentrantSafeSignals then
	return v28
else
	return v10
end