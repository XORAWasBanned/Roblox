-- Path: CorePackages.Packages._Index.enumerate.enumerate.enumerate
local function v_u_8(p1, p2) -- name: strict
	local v_u_3 = p2 or tostring(p1)
	return setmetatable(p1, {
		["__index"] = function(_, p4) -- name: __index
			-- upvalues: (copy) v_u_3
			local v5 = ("%q (%s) is not a valid member of %s"):format(tostring(p4), typeof(p4), v_u_3)
			error(v5, 2)
		end,
		["__newindex"] = function(_, p6, _) -- name: __newindex
			-- upvalues: (copy) v_u_3
			local v7 = ("%q (%s) is not a valid member of %s"):format(tostring(p6), typeof(p6), v_u_3)
			error(v7, 2)
		end
	})
end
local function v_u_22(p9, p10, p_u_11, p_u_12, p_u_13) -- name: addEnumValue
	-- upvalues: (copy) v_u_8
	local v14 = typeof(p_u_12) == "string"
	assert(v14, "Only string names are supported for enums!")
	if v14 then
		local v15 = p_u_12 ~= "fromRawValue"
		assert(v15, "fromRawValue is reserved")
		local v16 = p_u_12 ~= "isEnumValue"
		assert(v16, "isEnumValue is reserved")
		local v17 = p_u_12 ~= "allValues"
		assert(v17, "allValues is reserved")
	end
	local v18 = p9[p_u_12] == nil
	assert(v18, "Enum value names can only be used once!")
	local v19 = p10[p_u_12] == nil
	assert(v19, "Enum values can only be used once!")
	local v20 = newproxy(true)
	local v21 = getmetatable(v20)
	function v21.__tostring()
		-- upvalues: (copy) p_u_11, (copy) p_u_12
		return ("%s.%s"):format(p_u_11, p_u_12)
	end
	v21.__index = v_u_8({
		["rawValue"] = function() -- name: rawValue
			-- upvalues: (copy) p_u_13
			return p_u_13
		end
	})
	p9[p_u_12] = v20
	p10[p_u_13] = v20
end
return function(p_u_23, p24) -- name: enumerate
	-- upvalues: (copy) v_u_22, (copy) v_u_8
	local v25 = typeof(p_u_23) == "string"
	assert(v25, "Bad argument #1 - enums must be created using a string name!")
	local v26 = typeof(p24) == "table"
	assert(v26, "Bad argument #2 - enums must be created using a table!")
	local v_u_27 = {}
	local v_u_28 = {}
	if p24[1] == nil then
		for v29, v30 in pairs(p24) do
			v_u_22(v_u_27, v_u_28, p_u_23, v29, v30)
		end
	else
		for _, v31 in ipairs(p24) do
			v_u_22(v_u_27, v_u_28, p_u_23, v31, v31)
		end
	end
	function v_u_27.fromRawValue(p32) -- name: fromRawValue
		-- upvalues: (copy) v_u_28
		return v_u_28[p32]
	end
	function v_u_27.isEnumValue(p33) -- name: isEnumValue
		-- upvalues: (copy) v_u_27
		if typeof(p33) ~= "userdata" then
			return false
		end
		for _, v34 in pairs(v_u_27) do
			if v34 ~= p33 then
				continue
			end
			return true
		end
		return false
	end
	function v_u_27.allValues() -- name: allValues
		-- upvalues: (copy) v_u_28
		local v35 = {}
		for _, v36 in pairs(v_u_28) do
			table.insert(v35, v36)
		end
		return v35
	end
	local v37 = newproxy(true)
	local v38 = getmetatable(v37)
	v38.__index = v_u_8(v_u_27, p_u_23)
	function v38.__tostring()
		-- upvalues: (copy) p_u_23
		return p_u_23
	end
	return v37
end