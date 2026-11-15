-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.inspect
local v_u_1 = game:GetService("HttpService")
local v2 = script.Parent
local v3 = v2.Parent
local v4 = v2.Parent.Parent
local v5 = require(v4.LuauPolyfill)
local v_u_6 = v5.Array
local v_u_7 = v5.Object
local v_u_8 = require(v3.luaUtils.null)
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local function v15(p14) -- name: inspect
	-- upvalues: (ref) v_u_9
	return v_u_9(p14, {})
end
v_u_9 = function(p16, p17) -- name: formatValue
	-- upvalues: (copy) v_u_1, (copy) v_u_8, (ref) v_u_10
	local v18 = typeof(p16)
	if v18 == "string" then
		return v_u_1:JSONEncode(p16)
	elseif v18 == "number" then
		return p16 ~= p16 and "NaN" or (p16 == (1 / 0) and "Infinity" or (p16 == (-1 / 0) and "-Infinity" or tostring(p16)))
	elseif v18 == "function" then
		return "[function]"
	elseif v18 == "table" then
		return p16 == v_u_8 and "null" or v_u_10(p16, p17)
	else
		return tostring(p16)
	end
end
v_u_10 = function(p19, p20) -- name: formatObjectValue
	-- upvalues: (ref) v_u_9, (copy) v_u_6, (ref) v_u_11, (ref) v_u_12
	if table.find(p20, p19) ~= nil then
		return "[Circular]"
	end
	local v21 = { unpack(p20) }
	table.insert(v21, p19)
	local v22 = p19.toJSON
	if typeof(v22) == "function" then
		local v23 = p19:toJSON(p19)
		if v23 ~= p19 then
			if typeof(v23) == "string" then
				return v23
			else
				return v_u_9(v23, v21)
			end
		end
	elseif v_u_6.isArray(p19) then
		return v_u_11(p19, v21)
	end
	return v_u_12(p19, v21)
end
v_u_12 = function(p24, p25) -- name: formatObject
	-- upvalues: (copy) v_u_7, (ref) v_u_13, (ref) v_u_9
	local v26 = v_u_7.keys(p24)
	if #v26 == 0 then
		return "{}"
	end
	if #p25 > 2 then
		return "[" .. v_u_13(p24) .. "]"
	end
	local v27 = {}
	for v28 = 1, #v26 do
		local v29 = v26[v28]
		v27[v28] = v29 .. ": " .. v_u_9(p24[v29], p25)
	end
	return "{ " .. table.concat(v27, ", ") .. " }"
end
v_u_11 = function(p30, p31) -- name: formatArray
	-- upvalues: (ref) v_u_9
	local v32 = #p30
	if v32 == 0 then
		return "[]"
	end
	if #p31 > 2 then
		return "[Array]"
	end
	local v33 = math.min(10, v32)
	local v34 = v32 - v33
	local v35 = {}
	for v36 = 1, v33 do
		v35[v36] = v_u_9(p30[v36], p31)
	end
	if v34 == 1 then
		table.insert(v35, "... 1 more item")
	elseif v34 > 1 then
		table.insert(v35, ("... %d more items"):format(v34))
	end
	return "[" .. table.concat(v35, ", ") .. "]"
end
v_u_13 = function(_) -- name: getObjectTag
	return "Object"
end
return {
	["inspect"] = v15
}