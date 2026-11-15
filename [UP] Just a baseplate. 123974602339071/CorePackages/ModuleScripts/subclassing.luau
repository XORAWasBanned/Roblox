-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.observables.subclassing
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
require(v2.LuauPolyfill)
local v_u_3 = require(script.Parent.Observable).Observable
function v1.fixObservableSubclass(p4) -- name: fixObservableSubclass
	-- upvalues: (copy) v_u_3
	p4["@@species"] = v_u_3
	return p4
end
return v1