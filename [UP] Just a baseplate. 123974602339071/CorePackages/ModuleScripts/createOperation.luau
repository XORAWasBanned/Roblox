-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.utils.createOperation
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v_u_3 = require(v2.LuauPolyfill).Object
require(script.Parent.Parent.core.types)
function v1.createOperation(p4, p5) -- name: createOperation
	-- upvalues: (copy) v_u_3
	local v_u_6 = v_u_3.assign({}, p4)
	local v8 = {
		["__index"] = {
			["setContext"] = function(_, p7) -- name: setContext
				-- upvalues: (ref) v_u_6, (ref) v_u_3
				if typeof(p7) == "function" then
					v_u_6 = v_u_3.assign({}, v_u_6, p7(v_u_6))
				else
					v_u_6 = v_u_3.assign({}, v_u_6, p7)
				end
			end,
			["getContext"] = function(_) -- name: getContext
				-- upvalues: (ref) v_u_3, (ref) v_u_6
				return v_u_3.assign({}, v_u_6)
			end
		}
	}
	return setmetatable(p5, v8)
end
return v1