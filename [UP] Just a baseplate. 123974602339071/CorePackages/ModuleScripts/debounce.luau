-- Path: CorePackages.Packages._Index.Dash.Dash.debounce
local v1 = script.Parent
local v_u_2 = require(v1.assign)
return function(p_u_3, p_u_4, p5) -- name: debounce
	-- upvalues: (copy) v_u_2
	local v_u_6 = v_u_2({
		["leading"] = false,
		["trailing"] = true
	}, p5)
	local v_u_7 = 0
	local v_u_8 = nil
	local v_u_9 = false
	local v_u_13 = v_u_6.trailing and function(p10, p11, ...)
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (copy) p_u_3
		if v_u_7 == p10 then
			v_u_9 = false
			if not p11 then
				p_u_3(...)
			end
		end
	end or (v_u_6.leading and function(p12)
		-- upvalues: (ref) v_u_7, (ref) v_u_9
		if v_u_7 == p12 then
			v_u_9 = false
		end
	end or function() end)
	return function(...)
		-- upvalues: (ref) v_u_7, (copy) v_u_6, (ref) v_u_9, (ref) v_u_8, (copy) p_u_3, (copy) p_u_4, (ref) v_u_13
		v_u_7 = v_u_7 + 1
		local v14 = v_u_7
		local v15 = v_u_6.leading
		if v15 then
			v15 = not v_u_9
		end
		if v_u_8 then
			task.cancel(v_u_8)
			v_u_8 = nil
		end
		if v15 then
			v_u_9 = true
			p_u_3(...)
		end
		v_u_8 = task.delay(p_u_4, v_u_13, v14, v15, ...)
	end
end