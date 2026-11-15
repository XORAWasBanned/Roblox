-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.context.ApolloContext
local v1 = script.Parent.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).WeakMap
local v_u_3 = require(v1.React)
require(script.Parent.Parent.Parent.core)
local v_u_4 = v_u_2.new()
return {
	["getApolloContext"] = function() -- name: getApolloContext
		-- upvalues: (ref) v_u_4, (copy) v_u_3
		local v5 = v_u_4:get(v_u_3.createContext)
		if v5 == nil then
			v5 = v_u_3.createContext({})
			v5.displayName = "ApolloContext"
			v_u_4:set(v_u_3.createContext, v5)
		end
		return v5
	end,
	["resetApolloContext"] = function() -- name: resetApolloContext
		-- upvalues: (ref) v_u_4, (copy) v_u_2
		v_u_4 = v_u_2.new()
	end
}