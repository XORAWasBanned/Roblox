-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.utils.validateOperation
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Object
local v_u_7 = require(v2.jsutils.invariant).InvariantError
require(script.Parent.Parent.core.types)
function v1.validateOperation(p8) -- name: validateOperation
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	local v9 = {
		"query",
		"operationName",
		"variables",
		"extensions",
		"context"
	}
	for _, v10 in ipairs(v_u_6.keys(p8)) do
		if v_u_5.indexOf(v9, v10) >= 0 then
			continue
		end
		error(v_u_7.new(("illegal argument: %s"):format(v10)))
	end
	return p8
end
return v1