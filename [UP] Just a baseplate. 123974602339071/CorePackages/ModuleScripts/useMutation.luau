-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.useMutation
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.LuauPolyfill).Object
require(script.Parent.Parent.Parent.core)
local v5 = require(v3.React)
local v_u_6 = v5.useContext
local v_u_7 = v5.useState
local v_u_8 = v5.useRef
local v_u_9 = v5.useEffect
require(v3.GraphQL)
require(v2.jsutils.typedDocumentNode)
require(script.Parent.Parent.types.types)
local v_u_10 = require(script.Parent.Parent.data).MutationData
local v_u_11 = require(script.Parent.Parent.context).getApolloContext
function v1.useMutation(p12, p13) -- name: useMutation
	-- upvalues: (copy) v_u_6, (copy) v_u_11, (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
	local v_u_14 = v_u_6(v_u_11())
	local v_u_15, v_u_16 = v_u_7({
		["called"] = false,
		["loading"] = false
	})
	local v_u_17
	if p13 then
		v_u_17 = v_u_4.assign({}, p13, {
			["mutation"] = p12
		})
	else
		v_u_17 = {
			["mutation"] = p12
		}
	end
	local v_u_18 = v_u_8(nil)
	local v_u_21 = (function() -- name: getMutationDataRef
		-- upvalues: (copy) v_u_18, (ref) v_u_10, (copy) v_u_17, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
		if not v_u_18.current then
			local v20 = {
				["options"] = v_u_17,
				["context"] = v_u_14,
				["result"] = v_u_15,
				["setResult"] = function(_, p19) -- name: setResult
					-- upvalues: (ref) v_u_16
					v_u_16(p19)
					return nil
				end
			}
			v_u_18.current = v_u_10.new(v20)
		end
		return v_u_18.current
	end)()
	v_u_21:setOptions(v_u_17)
	v_u_21.context = v_u_14
	v_u_9(function()
		-- upvalues: (copy) v_u_21
		return v_u_21:afterExecute()
	end)
	return v_u_21:execute(v_u_15)
end
return v1