-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useSelector
local v1 = script:FindFirstAncestor("MomentsCommon").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.useStore)
local function v_u_6(p4, p5)
	return p4 == p5
end
function useSelectorWithStore(p_u_7, p_u_8, p_u_9) -- name: useSelectorWithStore
	-- upvalues: (copy) v_u_2
	local _, v_u_11 = v_u_2.useReducer(function(p10)
		return p10 + 1
	end, 0)
	local v_u_12 = v_u_2.useRef(nil)
	local v_u_13 = v_u_2.useRef(nil)
	local v_u_14 = v_u_2.useRef(nil)
	local v_u_15 = v_u_2.useRef(nil)
	local v_u_16 = p_u_9:getState()
	local v_u_17 = nil
	local function v19()
		-- upvalues: (copy) p_u_7, (copy) v_u_13, (copy) v_u_16, (copy) v_u_14, (copy) v_u_12, (copy) v_u_15, (copy) p_u_8, (ref) v_u_17
		if p_u_7 == v_u_13.current and (v_u_16 == v_u_14.current and not v_u_12.current) then
			v_u_17 = v_u_15.current
			return
		else
			local v18 = p_u_7(v_u_16)
			if v_u_15.current == nil or not p_u_8(v18, v_u_15.current) then
				v_u_17 = v18
			else
				v_u_17 = v_u_15.current
			end
		end
	end
	local v20, v21 = pcall(v19)
	if not v20 then
		if v_u_12.current then
			local v22 = string.format
			local v23 = tostring(v21)
			local v24 = v_u_12.current
			v21 = v22("%s\nThe error may be correlated with this previous error:\n%s\n\n", v23, (tostring(v24)))
		end
		error(v21)
	end
	v_u_2.useLayoutEffect(function()
		-- upvalues: (copy) v_u_13, (copy) p_u_7, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (ref) v_u_17, (copy) v_u_12
		v_u_13.current = p_u_7
		v_u_14.current = v_u_16
		v_u_15.current = v_u_17
		v_u_12.current = nil
	end)
	v_u_2.useLayoutEffect(function()
		-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) p_u_8, (copy) v_u_15, (copy) v_u_12, (copy) v_u_11, (copy) p_u_9
		local function v31(p_u_25) -- name: checkForUpdates
			-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) p_u_8, (ref) v_u_15, (ref) v_u_12, (ref) v_u_11
			local function v28()
				-- upvalues: (copy) p_u_25, (ref) v_u_14, (ref) v_u_13, (ref) p_u_8, (ref) v_u_15
				if p_u_25 == v_u_14.current then
					return false
				end
				local v26 = v_u_13.current
				assert(v26, "latestSelector")
				local v27 = v_u_13.current(p_u_25)
				if p_u_8(v27, v_u_15.current) then
					return false
				end
				v_u_15.current = v27
				v_u_14.current = p_u_25
				return true
			end
			local v29, v30 = pcall(v28)
			if not v29 then
				v30 = v30 or "Error"
				v_u_12.current = v30
			end
			if v30 then
				v_u_11(nil)
			end
		end
		local v_u_32 = p_u_9.changed:connect(v31)
		local v_u_33 = p_u_9:getState()
		local function v36()
			-- upvalues: (copy) v_u_33, (ref) v_u_14, (ref) v_u_13, (ref) p_u_8, (ref) v_u_15
			if v_u_33 == v_u_14.current then
				return false
			end
			local v34 = v_u_13.current
			assert(v34, "latestSelector")
			local v35 = v_u_13.current(v_u_33)
			if p_u_8(v35, v_u_15.current) then
				return false
			end
			v_u_15.current = v35
			v_u_14.current = v_u_33
			return true
		end
		local v37, v38 = pcall(v36)
		if not v37 then
			v38 = v38 or "Error"
			v_u_12.current = v38
		end
		if v38 then
			v_u_11(nil)
		end
		return function()
			-- upvalues: (copy) v_u_32
			v_u_32.disconnect()
		end
	end, { p_u_9 })
	return v_u_17
end
function useSelector(p39, p40) -- name: useSelector
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	local v41 = p40 or v_u_6
	local v42 = v_u_3()
	return useSelectorWithStore(p39, v41, v42)
end
return useSelector