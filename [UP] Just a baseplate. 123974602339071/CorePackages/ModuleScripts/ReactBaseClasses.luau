-- Path: CorePackages.Packages._Index.React.React.ReactBaseClasses
local v1 = script.Parent.Parent
local v2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.LuauPolyfill).Object
local v_u_4 = require(v1.Shared).console
local v_u_5 = require(v1.Shared).ReactFeatureFlags.enableAllocationTrims
local v_u_6 = require(script.Parent.ReactNoopUpdateQueue)
local v_u_7 = {}
local v_u_8 = v2.__DEV__
local v_u_9 = v2.__COMPAT_WARNINGS__
if v_u_8 then
	v_u_3.freeze(v_u_7)
end
local v_u_10 = require(v1.Shared).UninitializedState
local v_u_11 = {
	["didMount"] = "componentDidMount",
	["shouldUpdate"] = "shouldComponentUpdate",
	["willUpdate"] = "UNSAFE_componentWillUpdate",
	["didUpdate"] = "componentDidUpdate",
	["willUnmount"] = "componentWillUnmount"
}
local function v25(p12, p13, p14) -- name: handleNewLifecycle
	-- upvalues: (copy) v_u_11, (copy) v_u_4, (copy) v_u_8, (copy) v_u_9
	if v_u_11[p13] ~= nil then
		if p12[v_u_11[p13]] == nil then
			if p13 == "willUpdate" and p12.componentWillUpdate then
				local v15 = p12.__componentName
				v_u_4.warn("%s already defined \'%s\', but it also defining the deprecated Roact method \'%s\'. %s should only implement one of these methods, preferably using the non-deprecated name.", v15, "UNSAFE_componentWillUpdate", p13, v15)
			else
				local v16 = p12.__componentName
				local v17 = v_u_11[p13]
				if v_u_8 and v_u_9 then
					local v18, v19 = debug.info(3, "sln")
					local v20 = v_u_4.warn
					local v21 = "%s is using method \'%s\', which is no longer supported and should be updated to \'%s\'\nFile: %s:%s"
					local v22 = string.match(v18, "%.%u[%.%w]-$")
					if v22 then
						v18 = string.gsub(v22, "^%.", "")
					end
					v20(v21, v16, p13, v17, v18, (tostring(v19)))
				end
			end
		else
			local v23 = p12.__componentName
			local v24 = v_u_11[p13]
			v_u_4.warn("%s already defined \'%s\', but it also defining the deprecated Roact method \'%s\'. %s should only implement one of these methods, preferably using the non-deprecated name.", v23, v24, p13, v23)
		end
		p13 = v_u_11[p13]
	end
	rawset(p12, p13, p14)
end
local v27 = setmetatable({
	["__componentName"] = "Component"
}, {
	["__newindex"] = v25,
	["__index"] = {
		["isReactComponent"] = true
	},
	["__tostring"] = function(p26) -- name: __tostring
		return p26.__componentName
	end
})
local v_u_28 = v2.__TESTEZ_RUNNING_TEST__ and 0 or 900
local v_u_29 = table.create(v_u_28)
local v_u_30 = 1
for _ = 1, v_u_28 do
	table.insert(v_u_29, {
		["props"] = nil,
		["context"] = nil,
		["state"] = nil,
		["__refs"] = nil,
		["__updater"] = nil,
		["state"] = v_u_10,
		["__refs"] = v_u_7,
		["__updater"] = v_u_6
	})
end
local function v_u_37(p31, p32, p33) -- name: setStateInInit
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
	if v_u_8 and p33 ~= nil then
		v_u_4.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", p31.__componentName)
	end
	local v34
	if p32 then
		v34 = type(p32)
	else
		v34 = p32
	end
	if p32 == nil or v34 ~= "table" and v34 ~= "function" then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	local v35 = p31.state
	if v34 == "function" then
		p32 = p32(v35, p31.props)
	end
	if v_u_5 then
		local v36
		if type(v35) == "table" and getmetatable(v35) == nil then
			v36 = v_u_3.assign(table.clone(v35), p32)
		else
			v36 = v_u_3.assign({}, v35, p32)
		end
		p31.state = v36
	else
		p31.state = v_u_3.assign({}, v35, p32)
	end
end
function v27.extend(p38, p39) -- name: extend
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (ref) v_u_30, (copy) v_u_28, (copy) v_u_29, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6, (copy) v_u_37
	if p39 == nil then
		if v_u_9 then
			v_u_4.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.")
			p39 = ""
		else
			p39 = ""
		end
	elseif type(p39) ~= "string" then
		error("Component class name must be a string")
	end
	local v_u_40 = {
		["__componentName"] = nil,
		["setState"] = nil,
		["forceUpdate"] = nil,
		["init"] = nil,
		["__componentName"] = p39,
		["setState"] = p38.setState,
		["forceUpdate"] = p38.forceUpdate
	}
	v_u_40.__index = v_u_40
	function v_u_40.__ctor(p41, p42, p43) -- name: __ctor
		-- upvalues: (ref) v_u_30, (ref) v_u_28, (ref) v_u_29, (ref) v_u_10, (ref) v_u_7, (ref) v_u_6, (copy) v_u_40, (ref) v_u_37
		local v44
		if v_u_30 <= v_u_28 then
			v44 = v_u_29[v_u_30]
			v44.props = p41
			v44.context = p42
			v_u_29[v_u_30] = nil
			v_u_30 = v_u_30 + 1
		else
			v44 = {
				["props"] = p41,
				["context"] = p42,
				["state"] = v_u_10,
				["__refs"] = v_u_7,
				["__updater"] = p43 or v_u_6
			}
		end
		local v45 = v_u_40
		local v46 = setmetatable(v44, v45)
		if v_u_40.init then
			local v47 = v_u_40.init
			if type(v47) == "function" then
				v46.setState = v_u_37
				v_u_40.init(v46, p41, p42)
				v46.setState = nil
			end
		end
		return v46
	end
	local v48 = getmetatable(p38)
	setmetatable(v_u_40, v48)
	return v_u_40
end
function v27.setState(p49, p50, p51) -- name: setState
	if p50 ~= nil and (type(p50) ~= "table" and type(p50) ~= "function") then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	p49.__updater.enqueueSetState(p49, p50, p51, "setState")
end
function v27.forceUpdate(p52, p53) -- name: forceUpdate
	p52.__updater.enqueueForceUpdate(p52, p53, "forceUpdate")
end
if v_u_8 then
	local v54 = {
		["isMounted"] = { "isMounted", "Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks." },
		["replaceState"] = { "replaceState", "Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236)." }
	}
	for v55, _ in v54 do
		if v54[v55] == nil then
			continue
		end
		local v_u_56 = v54[v55]
		v27[v55] = function()
			-- upvalues: (copy) v_u_4, (copy) v_u_56
			v_u_4.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v_u_56[1], v_u_56[2])
			return nil
		end
	end
end
local v57 = v27:extend("PureComponent")
v57.extend = v27.extend
setmetatable(v57, {
	["__newindex"] = v25,
	["__index"] = {
		["isReactComponent"] = true,
		["isPureReactComponent"] = true
	},
	["__tostring"] = function(p58) -- name: __tostring
		return p58.__componentName
	end
})
return {
	["Component"] = v27,
	["PureComponent"] = v57
}