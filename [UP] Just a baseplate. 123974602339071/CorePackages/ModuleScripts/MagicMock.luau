-- Path: CorePackages.Packages._Index.mock-31ab8d40-0.1.0.mock.MagicMock
local v_u_1 = require(script.Parent.symbols)
local v_u_2 = require(script.Parent.Spy)
local v_u_3 = {}
local v_u_19 = {
	["__index"] = function(p4, p5) -- name: __index
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		local v6 = getmetatable(p4)
		local v7 = v6[v_u_1.Children][p5]
		if v7 == nil then
			local v8 = v_u_3.new()
			v6[v_u_1.Children][p5] = v8
			return v8
		elseif v7 == v_u_1.None then
			return nil
		else
			return v7
		end
	end,
	["__newindex"] = function(p9, p10, p11) -- name: __newindex
		-- upvalues: (copy) v_u_2, (copy) v_u_1
		local v12 = getmetatable(p9)
		if type(p11) == "function" then
			local v13
			v13, p11 = v_u_2.new(p11)
		elseif p11 == nil then
			p11 = v_u_1.None
		end
		if p10 == v_u_1.ReturnValue then
			v12[v_u_1.ReturnValue] = {
				p11,
				["n"] = 1
			}
		else
			v12[v_u_1.Children][p10] = p11
		end
	end,
	["__call"] = function(p14, ...) -- name: __call
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		local v15 = getmetatable(p14)
		local v16 = {
			["args"] = table.pack(...),
			["result"] = v15[v_u_1.ReturnValue]
		}
		if v16.result == nil then
			v16.result = {
				v_u_3.new(),
				["n"] = 1
			}
			v15[v_u_1.ReturnValue] = v16.result
		elseif v16.result == v_u_1.None then
			v16.result = {
				["n"] = 1
			}
		end
		local v17 = v15[v_u_1.Calls]
		table.insert(v17, v16)
		local v18 = v16.result
		return table.unpack(v18)
	end
}
function v_u_3.new(p20) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_19
	local v21 = {
		[v_u_1.Calls] = {},
		[v_u_1.Children] = {},
		[v_u_1.Lock] = p20,
		[v_u_1.ReturnValue] = nil
	}
	for v22, v23 in pairs(v_u_19) do
		v21[v22] = v23
	end
	return setmetatable({}, v21)
end
return v_u_3