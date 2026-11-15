-- Path: CorePackages.Packages._Index.ReactGlobals.ReactGlobals.ReactGlobals.global
local v1 = script.Parent.Parent
if not require(v1.SafeFlags).createGetFFlag("ReactIsolatedGlobalsEnabled")() then
	return _G
end
local v2 = {}
local v3 = _G.__DEV__
if v3 == nil then
	v3 = false
end
v2.__DEV__ = v3
local v4 = _G.__PROFILE__
if v4 == nil then
	v4 = false
end
v2.__PROFILE__ = v4
local v5 = _G.__EXPERIMENTAL__
if v5 == nil then
	v5 = false
end
v2.__EXPERIMENTAL__ = v5
local v6 = _G.__DEBUG__
if v6 == nil then
	v6 = false
end
v2.__DEBUG__ = v6
local v7 = _G.__YOLO__
if v7 == nil then
	v7 = false
end
v2.__YOLO__ = v7
local v8 = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
if v8 == nil then
	v8 = false
end
v2.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = v8
local v9 = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__
if v9 == nil then
	v9 = nil
end
v2.__REACT_DEVTOOLS_GLOBAL_HOOK__ = v9
local v10 = _G.__REACT_DEVTOOLS_ATTACH__
if v10 == nil then
	v10 = nil
end
v2.__REACT_DEVTOOLS_ATTACH__ = v10
local v11 = _G.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__
if v11 == nil then
	v11 = false
end
v2.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__ = v11
local v12 = _G.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__
if v12 == nil then
	v12 = false
end
v2.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__ = v12
local v13 = _G.__REACT_DEVTOOLS_COMPONENT_FILTERS__
if v13 == nil then
	v13 = nil
end
v2.__REACT_DEVTOOLS_COMPONENT_FILTERS__ = v13
local v14 = _G.__LOCALSTORAGE__
if v14 == nil then
	v14 = nil
end
v2.__LOCALSTORAGE__ = v14
local v15 = _G.__SESSIONSTORAGE__
if v15 == nil then
	v15 = nil
end
v2.__SESSIONSTORAGE__ = v15
local v16 = _G.__COMPAT_WARNINGS__
if v16 == nil then
	v16 = false
end
v2.__COMPAT_WARNINGS__ = v16
local v17 = _G.__TESTEZ_RUNNING_TEST__
if v17 == nil then
	v17 = false
end
v2.__TESTEZ_RUNNING_TEST__ = v17
local v18 = _G.__ROACT_17_MOCK_SCHEDULER__
if v18 == nil then
	v18 = false
end
v2.__ROACT_17_MOCK_SCHEDULER__ = v18
local v19 = _G.__ROACT_17_INLINE_ACT__
if v19 == nil then
	v19 = false
end
v2.__ROACT_17_INLINE_ACT__ = v19
return v2