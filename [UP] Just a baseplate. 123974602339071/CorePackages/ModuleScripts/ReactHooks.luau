-- Path: CorePackages.Packages._Index.React.React.ReactHooks
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.LuauPolyfill).Array
local v_u_4 = require(v1.Shared).console
require(v1.Shared)
require(v1.Shared)
local v_u_5 = require(v1.Shared).ReactSharedInternals.ReactCurrentDispatcher
return {
	["useContext"] = function(p6, p7, ...) -- name: useContext
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
		local v8 = v_u_5.current
		if v_u_2.__DEV__ and v8 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		if v_u_2.__DEV__ then
			if p7 ~= nil then
				v_u_4.error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", p7, typeof(p7) == "number" and v_u_3.isArray({ ... }) and "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks" or "")
			end
			if p6._context ~= nil then
				local v9 = p6._context
				if v9.Consumer == p6 then
					v_u_4.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?")
				elseif v9.Provider == p6 then
					v_u_4.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?")
				end
			end
		end
		return v8.useContext(p6, p7)
	end,
	["useState"] = function(p10, ...) -- name: useState
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v11 = v_u_5.current
		if v_u_2.__DEV__ and v11 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v11.useState(p10, ...)
	end,
	["useReducer"] = function(p12, p13, p14) -- name: useReducer
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v15 = v_u_5.current
		if v_u_2.__DEV__ and v15 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v15.useReducer(p12, p13, p14)
	end,
	["useRef"] = function(p16) -- name: useRef
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v17 = v_u_5.current
		if v_u_2.__DEV__ and v17 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v17.useRef(p16)
	end,
	["useBinding"] = function(p18) -- name: useBinding
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v19 = v_u_5.current
		if v_u_2.__DEV__ and v19 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v19.useBinding(p18)
	end,
	["useEffect"] = function(p20, p21) -- name: useEffect
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v22 = v_u_5.current
		if v_u_2.__DEV__ and v22 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v22.useEffect(p20, p21)
	end,
	["useLayoutEffect"] = function(p23, p24) -- name: useLayoutEffect
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v25 = v_u_5.current
		if v_u_2.__DEV__ and v25 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v25.useLayoutEffect(p23, p24)
	end,
	["useCallback"] = function(p26, p27) -- name: useCallback
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v28 = v_u_5.current
		if v_u_2.__DEV__ and v28 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v28.useCallback(p26, p27)
	end,
	["useMemo"] = function(p29, p30) -- name: useMemo
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v31 = v_u_5.current
		if v_u_2.__DEV__ and v31 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v31.useMemo(p29, p30)
	end,
	["useImperativeHandle"] = function(p32, p33, p34) -- name: useImperativeHandle
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v35 = v_u_5.current
		if v_u_2.__DEV__ and v35 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v35.useImperativeHandle(p32, p33, p34)
	end,
	["useDebugValue"] = function(p36, p37) -- name: useDebugValue
		-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
		if not v_u_2.__DEV__ then
			return nil
		end
		local v38 = v_u_5.current
		if v_u_2.__DEV__ and v38 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v38.useDebugValue(p36, p37)
	end,
	["emptyObject"] = {},
	["useOpaqueIdentifier"] = function()
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v39 = v_u_5.current
		if v_u_2.__DEV__ and v39 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v39.useOpaqueIdentifier()
	end,
	["useMutableSource"] = function(p40, p41, p42)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v43 = v_u_5.current
		if v_u_2.__DEV__ and v43 == nil then
			v_u_4.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return v43.useMutableSource(p40, p41, p42)
	end
}