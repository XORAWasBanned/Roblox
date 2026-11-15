-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.isPromise
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.Promise)
return {
	["isPromise"] = function(p3) -- name: isPromise
		-- upvalues: (copy) v_u_2
		return v_u_2.is(p3)
	end
}