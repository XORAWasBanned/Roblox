-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.utils.fromPromise
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
require(v2.LuauPolyfill)
local v_u_3 = require(script.Parent.Parent.Parent.utilities).Observable
function v1.fromPromise(p_u_4) -- name: fromPromise
	-- upvalues: (copy) v_u_3
	return v_u_3.new(function(p_u_5)
		-- upvalues: (copy) p_u_4
		p_u_4:andThen(function(p6)
			-- upvalues: (copy) p_u_5
			p_u_5:next(p6)
			p_u_5:complete()
		end):catch(function(p7)
			-- upvalues: (copy) p_u_5
			p_u_5.error(p_u_5, p7)
		end)
	end)
end
return v1