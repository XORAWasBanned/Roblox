-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.utils.toPromise
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.Promise)
require(v3.LuauPolyfill)
local v_u_5 = require(v2.jsutils.invariant).invariant
require(script.Parent.Parent.Parent.utilities)
function v1.toPromise(p_u_6) -- name: toPromise
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v_u_7 = false
	return v_u_4.new(function(p_u_8, p_u_9)
		-- upvalues: (copy) p_u_6, (ref) v_u_7, (ref) v_u_5
		p_u_6:subscribe({
			["next"] = function(_, p10) -- name: next
				-- upvalues: (ref) v_u_7, (ref) v_u_5, (copy) p_u_8
				if v_u_7 then
					v_u_5.warn("Promise Wrapper does not support multiple results from Observable")
				else
					v_u_7 = true
					p_u_8(p10)
				end
			end,
			["error"] = function(_, p11) -- name: error
				-- upvalues: (copy) p_u_9
				p_u_9(p11)
			end
		})
	end):andThen(function(p12)
		-- upvalues: (ref) v_u_4
		return v_u_4.delay(0):andThenReturn(p12)
	end)
end
return v1