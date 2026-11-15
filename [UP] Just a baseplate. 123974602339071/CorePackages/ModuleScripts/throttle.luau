-- Path: CorePackages.Packages._Index.Dash.Dash.throttle
local v1 = script.Parent
local v_u_2 = require(v1.assign)
return function(p_u_3, p4, p5) -- name: throttle
	-- upvalues: (copy) v_u_2
	local v6 = v_u_2({
		["leading"] = true,
		["trailing"] = true
	}, p5)
	local v_u_7 = math.max(0, p4)
	local v_u_8 = v6.leading
	local v_u_9 = v6.trailing
	local v_u_10 = (-1 / 0)
	local v_u_11 = nil
	local v_u_12 = {}
	local function v_u_14() -- name: invoke
		-- upvalues: (ref) v_u_10, (ref) v_u_11, (copy) p_u_3, (ref) v_u_12
		v_u_10 = os.clock()
		v_u_11 = nil
		local v13 = v_u_12
		p_u_3(table.unpack(v13))
	end
	return function(...)
		-- upvalues: (ref) v_u_12, (ref) v_u_10, (copy) v_u_8, (copy) v_u_7, (ref) v_u_11, (copy) p_u_3, (copy) v_u_9, (copy) v_u_14
		local v15 = os.clock()
		v_u_12 = { ... }
		if v_u_8 and v_u_7 <= v15 - v_u_10 then
			if v_u_11 then
				task.cancel(v_u_11)
				v_u_11 = nil
			end
			v_u_10 = os.clock()
			v_u_11 = nil
			local v16 = v_u_12
			p_u_3(table.unpack(v16))
		elseif v_u_9 and not v_u_11 then
			local v17 = v_u_7 - (v15 - (v_u_10 == (-1 / 0) and v15 and v15 or v_u_10))
			local v18 = v17 < 0 and 0 or v17
			v_u_11 = task.delay(v18, v_u_14)
		end
	end
end