-- Path: CorePackages.Packages._Index.FocusNavigationUtils.FocusNavigationUtils.createSignal
return function(p1) -- name: createSignal
	local v_u_2 = {}
	local v_u_3 = {}
	local v_u_4 = p1
	local v_u_5 = false
	return {
		["subscribe"] = function(_, p_u_6) -- name: subscribe
			-- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_3
			local v_u_7 = {
				["callback"] = nil,
				["unsubscribed"] = false,
				["callback"] = p_u_6
			}
			if v_u_5 and not v_u_2[p_u_6] then
				v_u_3[p_u_6] = v_u_7
			else
				v_u_2[p_u_6] = v_u_7
			end
			return {
				["unsubscribe"] = function(_) -- name: unsubscribe
					-- upvalues: (copy) v_u_7, (ref) v_u_2, (copy) p_u_6, (ref) v_u_3
					v_u_7.unsubscribed = true
					v_u_2[p_u_6] = nil
					v_u_3[p_u_6] = nil
				end
			}
		end,
		["getValue"] = function(_) -- name: getValue
			-- upvalues: (ref) v_u_4
			return v_u_4
		end
	}, function(p8) -- name: fire
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) v_u_2, (copy) v_u_3
		v_u_4 = p8
		v_u_5 = true
		for v9, v10 in v_u_2 do
			if v10.unsubscribed or v_u_3[v9] then
				continue
			end
			v9(p8)
		end
		v_u_5 = false
		for v11, v12 in v_u_3 do
			v_u_2[v11] = v12
		end
		table.clear(v_u_3)
	end
end