-- Path: CorePackages.Packages._Index.ReactIs.ReactIs
local v1 = script.Parent
local v_u_2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.Shared).console
local v4 = {}
local v5 = require(v1.Shared).ReactSymbols
local v_u_6 = v5.REACT_CONTEXT_TYPE
local v_u_7 = v5.REACT_ELEMENT_TYPE
local v_u_8 = v5.REACT_FORWARD_REF_TYPE
local v_u_9 = v5.REACT_FRAGMENT_TYPE
local v_u_10 = v5.REACT_LAZY_TYPE
local v_u_11 = v5.REACT_MEMO_TYPE
local v_u_12 = v5.REACT_PORTAL_TYPE
local v_u_13 = v5.REACT_PROFILER_TYPE
local v_u_14 = v5.REACT_PROVIDER_TYPE
local v_u_15 = v5.REACT_STRICT_MODE_TYPE
local v_u_16 = v5.REACT_SUSPENSE_TYPE
local v_u_17 = v5.REACT_SUSPENSE_LIST_TYPE
local v18 = require(v1.Shared).isValidElementType
local v_u_19 = v5.REACT_BINDING_TYPE
local v_u_20 = require(v1.SafeFlags).createGetFFlag("ReactIsProtectedTypeOf", false)()
local function v_u_25(p_u_21) -- name: typeOf
	-- upvalues: (copy) v_u_20, (copy) v_u_7, (copy) v_u_9, (copy) v_u_13, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_11, (copy) v_u_14, (copy) v_u_12, (copy) v_u_19
	if typeof(p_u_21) == "table" and p_u_21 ~= nil then
		local v22
		if v_u_20 then
			local v23
			v23, v22 = pcall(function()
				-- upvalues: (copy) p_u_21
				return p_u_21["$$typeof"]
			end)
			if not v23 then
				return nil
			end
		else
			v22 = p_u_21["$$typeof"]
		end
		if v22 == v_u_7 then
			local v24 = p_u_21.type
			if v24 == v_u_9 or (v24 == v_u_13 or (v24 == v_u_15 or (v24 == v_u_16 or v24 == v_u_17))) then
				return v24
			else
				if v24 then
					if typeof(v24) == "table" then
						v24 = v24["$$typeof"]
					else
						v24 = false
					end
				end
				if v24 == v_u_6 or (v24 == v_u_8 or (v24 == v_u_10 or (v24 == v_u_11 or v24 == v_u_14))) then
					return v24
				else
					return v22
				end
			end
		end
		if v22 == v_u_12 or v22 == v_u_19 then
			return v22
		end
	end
	return nil
end
v4.typeOf = v_u_25
v4.ContextConsumer = v_u_6
v4.ContextProvider = v_u_14
v4.Element = v_u_7
v4.ForwardRef = v_u_8
v4.Fragment = v_u_9
v4.Lazy = v_u_10
v4.Memo = v_u_11
v4.Portal = v_u_12
v4.Profiler = v_u_13
v4.StrictMode = v_u_15
v4.Suspense = v_u_16
v4.Binding = v5.REACT_BINDING_TYPE
v4.isValidElementType = v18
local v_u_26 = false
local v_u_27 = false
function v4.isAsyncMode(_) -- name: isAsyncMode
	-- upvalues: (copy) v_u_2, (ref) v_u_26, (copy) v_u_3
	if v_u_2.__DEV__ and not v_u_26 then
		v_u_26 = true
		v_u_3.warn("The ReactIs.isAsyncMode() alias has been deprecated, and will be removed in React 18+.")
	end
	return false
end
function v4.isConcurrentMode(_) -- name: isConcurrentMode
	-- upvalues: (copy) v_u_2, (ref) v_u_27, (copy) v_u_3
	if v_u_2.__DEV__ and not v_u_27 then
		v_u_27 = true
		v_u_3.warn("The ReactIs.isConcurrentMode() alias has been deprecated, and will be removed in React 18+.")
	end
	return false
end
function v4.isContextConsumer(p28) -- name: isContextConsumer
	-- upvalues: (copy) v_u_25, (copy) v_u_6
	return v_u_25(p28) == v_u_6
end
function v4.isContextProvider(p29) -- name: isContextProvider
	-- upvalues: (copy) v_u_25, (copy) v_u_14
	return v_u_25(p29) == v_u_14
end
function v4.isElement(p30) -- name: isElement
	-- upvalues: (copy) v_u_7
	local v31
	if typeof(p30) == "table" and p30 ~= nil then
		v31 = p30["$$typeof"] == v_u_7
	else
		v31 = false
	end
	return v31
end
function v4.isForwardRef(p32) -- name: isForwardRef
	-- upvalues: (copy) v_u_25, (copy) v_u_8
	return v_u_25(p32) == v_u_8
end
function v4.isFragment(p33) -- name: isFragment
	-- upvalues: (copy) v_u_25, (copy) v_u_9
	return v_u_25(p33) == v_u_9
end
function v4.isLazy(p34) -- name: isLazy
	-- upvalues: (copy) v_u_25, (copy) v_u_10
	return v_u_25(p34) == v_u_10
end
function v4.isMemo(p35) -- name: isMemo
	-- upvalues: (copy) v_u_25, (copy) v_u_11
	return v_u_25(p35) == v_u_11
end
function v4.isPortal(p36) -- name: isPortal
	-- upvalues: (copy) v_u_25, (copy) v_u_12
	return v_u_25(p36) == v_u_12
end
function v4.isProfiler(p37) -- name: isProfiler
	-- upvalues: (copy) v_u_25, (copy) v_u_13
	return v_u_25(p37) == v_u_13
end
function v4.isStrictMode(p38) -- name: isStrictMode
	-- upvalues: (copy) v_u_25, (copy) v_u_15
	return v_u_25(p38) == v_u_15
end
function v4.isSuspense(p39) -- name: isSuspense
	-- upvalues: (copy) v_u_25, (copy) v_u_16
	return v_u_25(p39) == v_u_16
end
function v4.isBinding(p40)
	-- upvalues: (copy) v_u_25, (copy) v_u_19
	return v_u_25(p40) == v_u_19
end
return v4