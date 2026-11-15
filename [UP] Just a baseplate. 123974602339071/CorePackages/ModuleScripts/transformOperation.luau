-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.utils.transformOperation
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v_u_3 = require(v2.LuauPolyfill).Boolean
require(script.Parent.Parent.core.types)
local v_u_4 = require(script.Parent.Parent.Parent.utilities).getOperationName
function v1.transformOperation(p5) -- name: transformOperation
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v6 = {
		["variables"] = v_u_3.toJSBoolean(p5.variables) and (p5.variables or {}) or {},
		["extensions"] = v_u_3.toJSBoolean(p5.extensions) and (p5.extensions or {}) or {},
		["operationName"] = p5.operationName,
		["query"] = p5.query
	}
	if not v_u_3.toJSBoolean(v6.operationName) then
		local v7 = v6.query
		if typeof(v7) ~= "string" then
			local v8
			if v_u_3.toJSBoolean(v_u_4(v6.query)) then
				v8 = v_u_4(v6.query) or nil
			else
				v8 = nil
			end
			v6.operationName = v8
			return v6
		end
		v6.operationName = ""
	end
	return v6
end
return v1