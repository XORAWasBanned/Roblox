-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.coerceToPromise
local v1 = script.Parent.Parent
local v2 = v1.Parent
require(v2.LuauPolyfill)
local v_u_3 = require(v2.Promise)
require(v1.jsutils.PromiseOrValue)
return {
	["coerceToPromise"] = function(p4) -- name: coerceToPromise
		-- upvalues: (copy) v_u_3
		if v_u_3.is(p4) then
			return p4
		else
			return v_u_3.resolve(p4)
		end
	end
}