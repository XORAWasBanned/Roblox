-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.promiseForObject
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.Promise)
local v3 = require(v1.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Object
require(script.Parent.ObjMap)
return {
	["promiseForObject"] = function(p_u_6) -- name: promiseForObject
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2
		local v_u_7 = v_u_5.keys(p_u_6)
		local v10 = v_u_4.map(v_u_7, function(p8)
			-- upvalues: (copy) p_u_6, (ref) v_u_2
			local v9 = p_u_6[p8]
			if v_u_2.is(v9) then
				return v9
			else
				return v_u_2.resolve(v9)
			end
		end)
		return v_u_2.all(v10):andThen(function(p11)
			-- upvalues: (ref) v_u_4, (copy) v_u_7
			return v_u_4.reduce(p11, function(p12, p13, p14)
				-- upvalues: (ref) v_u_7
				p12[v_u_7[p14]] = p13
				return p12
			end, {})
		end)
	end
}