-- Path: CorePackages.Packages._Index.lua-result.lua-result
local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = newproxy(true)
function v_u_1.new(p3, p4) -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v5 = typeof(p3) == "boolean"
	assert(v5)
	local v6 = {
		["_source"] = debug.traceback(),
		[v_u_2] = true,
		["_status"] = p3,
		["_value"] = p4
	}
	local v7 = v_u_1
	setmetatable(v6, v7)
	return v6
end
function v_u_1.success(p8) -- name: success
	-- upvalues: (copy) v_u_1
	return v_u_1.new(true, p8)
end
function v_u_1.error(p9) -- name: error
	-- upvalues: (copy) v_u_1
	return v_u_1.new(false, p9)
end
function v_u_1.is(p10) -- name: is
	-- upvalues: (copy) v_u_2
	if typeof(p10) == "table" then
		return p10[v_u_2]
	else
		return false
	end
end
function v_u_1.match(p11, p12, p13) -- name: match
	-- upvalues: (copy) v_u_1
	local v14 = typeof(p12) == "function" and true or typeof(p12) == "nil"
	local v15 = string.format
	local v16 = typeof(p12)
	assert(v14, v15("Result:match expects successHandler to be a function or nil, got %s", v16))
	local v17 = typeof(p13) == "function" and true or typeof(p13) == "nil"
	local v18 = string.format
	local v19 = typeof(p13)
	assert(v17, v18("Result:match expects errorHandler to be a function or nil, got %s", v19))
	local v20
	if p11._status then
		if p12 == nil then
			return p11
		end
		v20 = p12(p11._value)
	else
		if p13 == nil then
			return p11
		end
		v20 = p13(p11._value)
	end
	if v_u_1.is(v20) then
		return v20
	else
		return v_u_1.success(v20)
	end
end
function v_u_1.matchSuccess(p21, p22) -- name: matchSuccess
	return p21:match(p22, nil)
end
function v_u_1.matchError(p23, p24) -- name: matchError
	return p23:match(nil, p24)
end
function v_u_1.unwrap(p25) -- name: unwrap
	return p25._status, p25._value
end
return v_u_1