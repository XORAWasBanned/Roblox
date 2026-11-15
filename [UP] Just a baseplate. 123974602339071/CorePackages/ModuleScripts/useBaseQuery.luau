-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.utils.useBaseQuery
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.Promise)
local v5 = require(v3.LuauPolyfill)
local v_u_6 = v5.Boolean
local v_u_7 = v5.Object
local v8 = require(v3.React)
local v_u_9 = v8.useContext
local v_u_10 = v8.useEffect
local v_u_11 = v8.useReducer
local v_u_12 = v8.useRef
require(v3.GraphQL)
require(v2.jsutils.typedDocumentNode)
require(script.Parent.Parent.Parent.types.types)
local v_u_13 = require(script.Parent.Parent.Parent.data).QueryData
local v_u_14 = require(script.Parent.useDeepMemo).useDeepMemo
require(script.Parent.Parent.Parent.Parent.core)
local v_u_15 = require(script.Parent.Parent.Parent.context).getApolloContext
local v_u_16 = require(script.Parent.useAfterFastRefresh).useAfterFastRefresh
local v_u_17 = {
	["__value"] = "nil placeholder"
}
function v1.useBaseQuery(p18, p19, p_u_20) -- name: useBaseQuery
	-- upvalues: (copy) v_u_9, (copy) v_u_15, (copy) v_u_11, (copy) v_u_6, (copy) v_u_7, (copy) v_u_12, (copy) v_u_13, (copy) v_u_4, (copy) v_u_14, (copy) v_u_16, (copy) v_u_10, (copy) v_u_17
	if p_u_20 == nil then
		p_u_20 = false
	end
	local v21 = v_u_9(v_u_15())
	local v23, v_u_24 = v_u_11(function(p22)
		return p22 + 1
	end, 0)
	local v25 = v_u_6.toJSBoolean(p19) and v_u_7.assign({}, p19, {
		["query"] = p18
	}) or {
		["query"] = p18
	}
	local v_u_26 = v_u_12(nil)
	local v_u_27 = nil
	local v28 = v_u_26.current
	if not v28 then
		local v29 = {
			["options"] = v25,
			["context"] = v21,
			["onNewData"] = function(_) -- name: onNewData
				-- upvalues: (ref) v_u_6, (ref) v_u_27, (ref) v_u_4, (copy) v_u_26, (copy) v_u_24
				if v_u_6.toJSBoolean(v_u_27:ssrInitiated()) then
					v_u_24(nil)
				else
					v_u_4.delay(0):andThen(function()
						-- upvalues: (ref) v_u_26, (ref) v_u_24
						if v_u_26.current ~= nil and v_u_26.current.isMounted then
							return v_u_24(nil)
						end
					end)
				end
			end
		}
		v_u_26.current = v_u_13.new(v29)
		v28 = v_u_26.current
	end
	local v_u_30 = v28
	v_u_30:setOptions(v25)
	v_u_30.context = v21
	local v31 = v_u_14(function()
		-- upvalues: (ref) p_u_20, (ref) v_u_30
		if p_u_20 then
			return v_u_30:executeLazy()
		else
			return v_u_30:execute()
		end
	end, {
		["options"] = v_u_7.assign({}, v25, {
			["onError"] = v_u_7.None,
			["onCompleted"] = v_u_7.None
		}),
		["context"] = v21,
		["tick"] = v23
	})
	local v32
	if p_u_20 then
		v32 = v31[2]
	else
		v32 = v31
	end
	if _G.__DEV__ then
		v_u_16(v_u_24)
	end
	v_u_10(function()
		-- upvalues: (ref) v_u_30, (copy) v_u_26
		return function()
			-- upvalues: (ref) v_u_30, (ref) v_u_26
			v_u_30:cleanup()
			v_u_26.current = nil
		end
	end, {})
	v_u_10(function()
		-- upvalues: (ref) v_u_30, (ref) p_u_20
		return v_u_30:afterExecute({
			["lazy"] = p_u_20
		})
	end, {
		v32.loading ~= nil and v32.loading or v_u_17,
		v32.networkStatus ~= nil and v32.networkStatus or v_u_17,
		v32.error ~= nil and v32.error or v_u_17,
		v32.data ~= nil and v32.data or v_u_17
	})
	return v31
end
return v1