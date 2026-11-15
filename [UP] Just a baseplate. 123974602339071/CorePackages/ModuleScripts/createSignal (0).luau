-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.createSignal
return function() -- name: createSignal
	local v_u_1 = {}
	return {
		["subscribe"] = function(_, p_u_2) -- name: subscribe
			-- upvalues: (ref) v_u_1
			local v3 = typeof(p_u_2) == "function"
			assert(v3, "Can only subscribe to signals with a function.")
			local v4 = v_u_1
			local v5 = {}
			local v_u_6 = {
				["callback"] = p_u_2
			}
			for v7, v8 in pairs(v4) do
				v5[v7] = v8
			end
			v5[p_u_2] = v_u_6
			v_u_1 = v5
			return function() -- name: disconnect
				-- upvalues: (copy) v_u_6, (ref) v_u_1, (copy) p_u_2
				local v9 = not v_u_6.disconnected
				assert(v9, "Listeners can only be disconnected once.")
				v_u_6.disconnected = true
				local v10 = v_u_1
				local v11 = p_u_2
				local v12 = {}
				for v13, v14 in pairs(v10) do
					if v13 == v11 then
						continue
					end
					v12[v13] = v14
				end
				v_u_1 = v12
			end
		end,
		["fire"] = function(_, ...) -- name: fire
			-- upvalues: (ref) v_u_1
			for v15, v16 in pairs(v_u_1) do
				if v16.disconnected then
					continue
				end
				v15(...)
			end
		end
	}
end