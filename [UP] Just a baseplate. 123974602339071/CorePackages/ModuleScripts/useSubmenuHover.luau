-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.useSubmenuHover
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Providers.Style.useTokens)
return function() -- name: useSubmenuHover
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v5 = v_u_4()
	local v_u_6 = v5.Time.Time_100
	local v_u_7 = v5.Time.Time_300
	local v8, v_u_9 = v_u_3.useState({})
	local v_u_10 = v_u_3.useRef({})
	local v_u_11 = v_u_3.useRef(nil)
	local v_u_12 = v_u_3.useRef(nil)
	v_u_10.current = v8
	local v_u_13 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_11, (copy) v_u_12
		if v_u_11.current then
			task.cancel(v_u_11.current)
			v_u_11.current = nil
		end
		if v_u_12.current then
			task.cancel(v_u_12.current)
			v_u_12.current = nil
		end
	end, {})
	local v27 = v_u_3.useCallback(function(p_u_14, p_u_15, p16)
		-- upvalues: (copy) v_u_13, (copy) v_u_10, (copy) v_u_9, (copy) v_u_11, (copy) v_u_6
		v_u_13()
		if v_u_10.current[p_u_14] == p_u_15 then
			return
		elseif p16 then
			v_u_9(function(p17)
				-- upvalues: (copy) p_u_14, (copy) p_u_15
				local v18 = p_u_14
				local v19 = p_u_15
				local v20 = {}
				for v21 = 1, v18 - 1 do
					if not p17[v21] then
						continue
					end
					v20[v21] = p17[v21]
				end
				v20[v18] = v19
				return v20
			end)
		else
			v_u_11.current = task.delay(v_u_6, function()
				-- upvalues: (ref) v_u_9, (copy) p_u_14, (copy) p_u_15, (ref) v_u_11
				v_u_9(function(p22)
					-- upvalues: (ref) p_u_14, (ref) p_u_15
					local v23 = p_u_14
					local v24 = p_u_15
					local v25 = {}
					for v26 = 1, v23 - 1 do
						if not p22[v26] then
							continue
						end
						v25[v26] = p22[v26]
					end
					v25[v23] = v24
					return v25
				end)
				v_u_11.current = nil
			end)
		end
	end, { v_u_13, v_u_6 })
	local v32 = v_u_3.useCallback(function(p_u_28)
		-- upvalues: (copy) v_u_13, (copy) v_u_10, (copy) v_u_12, (copy) v_u_7, (copy) v_u_9
		v_u_13()
		if #v_u_10.current >= p_u_28 then
			v_u_12.current = task.delay(v_u_7, function()
				-- upvalues: (ref) v_u_9, (copy) p_u_28, (ref) v_u_12
				v_u_9(function(p29)
					-- upvalues: (ref) p_u_28
					if #p29 < p_u_28 then
						return p29
					end
					local v30 = {}
					for v31 = 1, p_u_28 - 1 do
						if not p29[v31] then
							continue
						end
						v30[v31] = p29[v31]
					end
					return v30
				end)
				v_u_12.current = nil
			end)
		end
	end, { v_u_13, v_u_7 })
	local v33 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_9
		v_u_13()
		v_u_9({})
	end, { v_u_13 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_11, (copy) v_u_12
		return function()
			-- upvalues: (ref) v_u_11, (ref) v_u_12
			if v_u_11.current then
				task.cancel(v_u_11.current)
			end
			if v_u_12.current then
				task.cancel(v_u_12.current)
			end
		end
	end, {})
	return {
		["openPath"] = v8,
		["openAtDepth"] = v27,
		["closeAtDepth"] = v32,
		["reset"] = v33
	}
end