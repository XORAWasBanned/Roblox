-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.toHaveSameMembers
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).util.inspect
local v_u_3 = require(script.Parent.Parent.luaUtils.arrayContains)
return function(p4, p5, p6) -- name: toHaveSameMembers
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if #p4 == #p5 then
		for _, v7 in ipairs(p5) do
			if v_u_3(p4, v7, p6) then
				continue
			end
			return {
				["pass"] = false,
				["message"] = nil,
				["message"] = ("Expected item %s to be in Array %s"):format(v_u_2(v7), v_u_2(p4))
			}
		end
		return {
			["pass"] = true,
			["message"] = ""
		}
	end
	local v8 = {
		["pass"] = false,
		["message"] = nil
	}
	local v9 = #p4
	local v10 = tostring(v9)
	local v11 = #p5
	v8.message = ("Received array length %s / expected length %s"):format(v10, (tostring(v11)))
	return v8
end