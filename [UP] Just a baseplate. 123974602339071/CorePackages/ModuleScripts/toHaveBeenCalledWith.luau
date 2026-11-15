-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.Matchers.toHaveBeenCalledWith
local v1 = script.Parent.Parent
local v_u_2 = require(v1.MagicMock)
local v_u_3 = require(v1.Spy)
local v_u_4 = require(v1.AnyCallMatches)
local v_u_5 = require(v1.fmtArgs)
local v_u_6 = require(v1.symbols)
return function(p7, ...)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	if not (v_u_2.is(p7) or v_u_3.is(p7)) then
		return {
			["pass"] = false,
			["message"] = nil,
			["message"] = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalledWith is used. Given %s instead", (tostring(p7)))
		}
	end
	local v8 = table.pack(...)
	local v9 = {}
	for _, v_u_10 in ipairs(v8) do
		local v11
		if type(v_u_10) == "table" and v_u_10[v_u_6.isPredicate] then
			v11 = not v_u_2.is(v_u_10)
		else
			v11 = nil
		end
		if v11 then
			local v12 = v_u_10.predicate
			table.insert(v9, v12)
		else
			table.insert(v9, function(p13)
				-- upvalues: (copy) v_u_10
				return p13 == v_u_10
			end)
		end
	end
	local v14, v15 = v_u_4.predicates(p7, table.unpack(v9))
	return {
		["pass"] = v14,
		["message"] = v14 and string.format("Expected %s to never have been called with args: %s", tostring(p7), v_u_5(v8)) or string.format("Expected %s to have been called with args: %s", tostring(p7), v15)
	}
end