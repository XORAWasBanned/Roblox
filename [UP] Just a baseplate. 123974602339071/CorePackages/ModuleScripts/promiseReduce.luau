-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.promiseReduce
local v1 = script.Parent
local v2 = v1.Parent.Parent
local v_u_3 = require(v2.LuauPolyfill).Array
require(v1.PromiseOrValue)
local v_u_4 = require(v1.isPromise).isPromise
return {
	["promiseReduce"] = function(p5, p_u_6, p7) -- name: promiseReduce
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		return v_u_3.reduce(p5, function(p8, p_u_9)
			-- upvalues: (ref) v_u_4, (copy) p_u_6
			if v_u_4(p8) then
				return p8:andThen(function(p10)
					-- upvalues: (ref) p_u_6, (copy) p_u_9
					return p_u_6(p10, p_u_9)
				end)
			else
				return p_u_6(p8, p_u_9)
			end
		end, p7)
	end
}