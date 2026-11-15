-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.Spy
local v_u_1 = require(script.Parent.symbols)
local v_u_2 = require(script.Parent.isAMagicMock)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.__call(p4, ...)
	return p4.inner(...)
end
local v_u_5 = {}
setmetatable(v_u_5, {
	["__mode"] = "kv"
})
function v_u_3.new(p_u_6) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_5
	local v_u_7 = {
		[v_u_1.isSpy] = true,
		[v_u_1.Calls] = {}
	}
	local v8 = v_u_3
	setmetatable(v_u_7, v8)
	local function v12(...)
		-- upvalues: (copy) p_u_6, (copy) v_u_7, (ref) v_u_1
		local v9 = {
			["args"] = table.pack(...),
			["result"] = table.pack(p_u_6(...))
		}
		local v10 = v_u_7[v_u_1.Calls]
		table.insert(v10, v9)
		local v11 = v9.result
		return table.unpack(v11)
	end
	v_u_7.inner = v12
	v_u_5[v12] = v_u_7
	return v_u_7, v12
end
function v_u_3.lookup(p13) -- name: lookup
	-- upvalues: (copy) v_u_5
	return v_u_5[p13]
end
function v_u_3.is(p14) -- name: is
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if v_u_2(p14) then
		return false
	end
	local v15
	if type(p14) == "table" then
		v15 = p14[v_u_1.isSpy] ~= nil
	else
		v15 = false
	end
	return v15
end
return v_u_3