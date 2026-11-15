-- Path: CorePackages.Packages._Index.React.React.React
local v1 = script.Parent
local v2 = v1.Parent
local v3 = require(v2.ReactGlobals)
require(v2.LuauPolyfill)
local v4 = require(v1.ReactMutableSource)
local v5 = require(v2.Shared).ReactSharedInternals
local v6 = require(v1.ReactBaseClasses)
local v7 = require(v1.ReactChildren)
local v8 = require(v1.ReactElementValidator)
local v9 = require(v1.ReactElement)
local v10 = require(v1.ReactCreateRef)
local v11 = require(v1.ReactForwardRef)
local v12 = require(v1.ReactHooks)
local v13 = require(v1.ReactMemo)
local v14 = require(v1.ReactContext)
local v15 = require(v1.ReactLazy)
local v16 = require(v1["ReactBinding.roblox"])
local v17 = require(v1["None.roblox"])
local v18 = require(v2.Shared).ReactSymbols
local v19 = v3.__DEV__ or v3.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
require(v2.Shared)
local v20
if v19 then
	v20 = v8.createElementWithValidation
else
	v20 = v9.createElement
end
local v21
if v19 then
	v21 = v8.cloneElementWithValidation
else
	v21 = v9.cloneElement
end
return {
	["Children"] = v7,
	["createMutableSource"] = v4,
	["createRef"] = v10.createRef,
	["Component"] = v6.Component,
	["PureComponent"] = v6.PureComponent,
	["createContext"] = v14.createContext,
	["forwardRef"] = v11.forwardRef,
	["lazy"] = v15.lazy,
	["memo"] = v13.memo,
	["useCallback"] = v12.useCallback,
	["useContext"] = v12.useContext,
	["useEffect"] = v12.useEffect,
	["useImperativeHandle"] = v12.useImperativeHandle,
	["useDebugValue"] = v12.useDebugValue,
	["useLayoutEffect"] = v12.useLayoutEffect,
	["useMemo"] = v12.useMemo,
	["useMutableSource"] = v12.useMutableSource,
	["useReducer"] = v12.useReducer,
	["useRef"] = v12.useRef,
	["useBinding"] = v12.useBinding,
	["useState"] = v12.useState,
	["Fragment"] = v18.REACT_FRAGMENT_TYPE,
	["Profiler"] = v18.REACT_PROFILER_TYPE,
	["StrictMode"] = v18.REACT_STRICT_MODE_TYPE,
	["unstable_DebugTracingMode"] = v18.REACT_DEBUG_TRACING_MODE_TYPE,
	["Suspense"] = v18.REACT_SUSPENSE_TYPE,
	["createElement"] = v20,
	["cloneElement"] = v21,
	["isValidElement"] = v9.isValidElement,
	["__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED"] = v5,
	["unstable_LegacyHidden"] = v18.REACT_LEGACY_HIDDEN_TYPE,
	["createBinding"] = v16.create,
	["joinBindings"] = v16.join,
	["None"] = v17,
	["__subscribeToBinding"] = v16.subscribe,
	["Event"] = require(v2.Shared).Event,
	["Change"] = require(v2.Shared).Change,
	["Tag"] = require(v2.Shared).Tag,
	["unstable_parseReactError"] = require(v2.Shared).parseReactError
}