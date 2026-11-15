-- Path: CorePackages.Packages._Index.mock-31ab8d40-0.1.0.mock.Spy
local v_u_1 = require(script.Parent.symbols)
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = {}
setmetatable(v_u_3, {
	["__mode"] = "kv"
})
function v_u_2.new(p_u_4) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3
	local v_u_5 = {
		[v_u_1.Calls] = {}
	}
	local v6 = v_u_2
	setmetatable(v_u_5, v6)
	local function v10(...)
		-- upvalues: (copy) p_u_4, (copy) v_u_5, (ref) v_u_1
		local v7 = {
			["args"] = table.pack(...),
			["result"] = table.pack(p_u_4(...))
		}
		local v8 = v_u_5[v_u_1.Calls]
		table.insert(v8, v7)
		local v9 = v7.result
		return table.unpack(v9)
	end
	v_u_5.inner = v10
	v_u_3[v10] = v_u_5
	return v_u_5, v10
end
function v_u_2.lookup(p11) -- name: lookup
	-- upvalues: (copy) v_u_3
	return v_u_3[p11]
end
return v_u_2