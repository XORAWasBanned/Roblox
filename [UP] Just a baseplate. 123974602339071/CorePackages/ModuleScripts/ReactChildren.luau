-- Path: CorePackages.Packages._Index.React.React.ReactChildren
local v1 = script.Parent.Parent
require(v1.Shared)
local v_u_2 = require(v1.Shared).invariant
local v3 = require(v1.Shared).ReactSymbols
local v_u_4 = v3.getIteratorFn
local v_u_5 = v3.REACT_ELEMENT_TYPE
local v_u_6 = v3.REACT_PORTAL_TYPE
local v_u_7 = require(v1.LuauPolyfill).Array
local v8 = require(script.Parent.ReactElement)
local v_u_9 = v8.isValidElement
local v_u_10 = v8.cloneAndReplaceKey
local function v_u_45(p11, p12, p13, p14, p15) -- name: mapIntoArray
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_45, (copy) v_u_9, (copy) v_u_10, (copy) v_u_4
	local v16 = typeof(p11)
	if v16 == "nil" or (v16 == "boolean" or v16 == "userdata") then
		p11 = nil
	end
	local v17 = false
	if p11 == nil or (v16 == "string" or v16 == "number") then
		v17 = true
	elseif v16 == "table" then
		local v18 = p11["$$typeof"]
		v17 = (v18 == v_u_5 or v18 == v_u_6) and true or v17
	end
	if v17 then
		local v19 = p15(p11)
		if p14 == "" then
			local v20 = "."
			local v21
			if typeof(p11) == "table" and (p11 ~= nil and p11.key ~= nil) then
				local v22 = p11.key
				local v23 = tostring(v22)
				local v24 = string.gsub(v23, "=", "=0")
				v21 = "$" .. string.gsub(v24, ":", "=2")
			else
				v21 = tostring(1)
			end
			p14 = v20 .. v21
		end
		if v_u_7.isArray(v19) then
			v_u_45(v19, p12, p14 == nil and "" or p14 .. "/", "", function(p25)
				return p25
			end)
		elseif v19 ~= nil then
			if v_u_9(v19) then
				local v26 = v19.key
				v19 = v_u_10(v19, p13 .. ((not v26 or p11 and p11.key == v26) and "" or tostring(v26) .. "/") .. p14)
			end
			table.insert(p12, v19)
		end
		return 1
	end
	local v27 = 0
	local v28 = p14 == "" and "." or p14 .. ":"
	if v_u_7.isArray(p11) then
		for v29 = 1, #p11 do
			local v30 = p11[v29]
			local v31
			if typeof(v30) == "table" and (v30 ~= nil and v30.key ~= nil) then
				local v32 = v30.key
				local v33 = tostring(v32)
				local v34 = string.gsub(v33, "=", "=0")
				v31 = "$" .. string.gsub(v34, ":", "=2")
			else
				v31 = tostring(v29)
			end
			v27 = v27 + v_u_45(v30, p12, p13, v28 .. v31, p15)
		end
		return v27
	end
	local v35 = v_u_4(p11)
	if typeof(v35) == "function" then
		local v36 = v35(p11)
		local v37 = v36.next()
		local v38 = 1
		while not v37.done do
			local v39 = v37.value
			local v40
			if typeof(v39) == "table" and (v39 ~= nil and v39.key ~= nil) then
				local v41 = v39.key
				local v42 = tostring(v41)
				local v43 = string.gsub(v42, "=", "=0")
				v40 = "$" .. string.gsub(v43, ":", "=2")
			else
				v40 = tostring(v38)
			end
			local v44 = v28 .. v40
			v38 = v38 + 1
			v27 = v27 + v_u_45(v39, p12, p13, v44, p15)
			v37 = v36.next()
		end
	end
	return v27
end
local function v_u_52(p46, p_u_47, _) -- name: mapChildren
	-- upvalues: (copy) v_u_45
	if p46 == nil then
		return nil
	end
	local v48 = {}
	local v_u_49 = 1
	v_u_45(p46, v48, "", "", function(p50)
		-- upvalues: (copy) p_u_47, (ref) v_u_49
		local v51 = p_u_47(p50, v_u_49)
		v_u_49 = v_u_49 + 1
		return v51
	end)
	return v48
end
return {
	["forEach"] = function(p53, p_u_54, p55) -- name: forEachChildren
		-- upvalues: (copy) v_u_52
		v_u_52(p53, function(...)
			-- upvalues: (copy) p_u_54
			p_u_54(...)
		end, p55)
	end,
	["map"] = v_u_52,
	["count"] = function(p56) -- name: countChildren
		-- upvalues: (copy) v_u_52
		local v_u_57 = 0
		v_u_52(p56, function()
			-- upvalues: (ref) v_u_57
			v_u_57 = v_u_57 + 1
		end)
		return v_u_57
	end,
	["only"] = function(p58) -- name: onlyChild
		-- upvalues: (copy) v_u_2, (copy) v_u_9
		v_u_2(v_u_9(p58), "React.Children.only expected to receive a single React element child.")
		return p58
	end,
	["toArray"] = function(p59) -- name: toArray
		-- upvalues: (copy) v_u_52
		return v_u_52(p59, function(p60)
			return p60
		end) or {}
	end
}