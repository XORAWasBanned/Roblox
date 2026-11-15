-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactFiberClassComponent.new
local v1 = script.Parent.Parent
local v2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.LuauPolyfill).Object
local v_u_4 = v2.__DEV__
local v_u_5 = require(v1.Shared).console
require(script.Parent.ReactInternalTypes)
local v6 = require(script.Parent.ReactFiberLane)
local v7 = require(script.Parent["ReactUpdateQueue.new"])
require(v1.Shared)
local v8 = require(v1.React)
local v9 = require(script.Parent.ReactFiberFlags)
local v_u_10 = v9.Update
local v_u_11 = v9.Snapshot
local v_u_12 = v9.MountLayoutDev
local v13 = require(v1.Shared).ReactFeatureFlags
local v_u_14 = v13.debugRenderPhaseSideEffectsForStrictMode
local v_u_15 = v13.disableLegacyContext
local v_u_16 = v13.enableDebugTracing
local v_u_17 = v13.enableSchedulingProfiler
local v_u_18 = v13.warnAboutDeprecatedLifecycles
local v_u_19 = v13.enableDoubleInvokingEffects
local v_u_20 = v13.enableAllocationTrims
local v_u_21 = require(script.Parent["ReactStrictModeWarnings.new"])
local v_u_22 = require(script.Parent.ReactFiberTreeReflection).isMounted
local v23 = require(v1.Shared).ReactInstanceMap
local v_u_24 = v23.get
local v_u_25 = v23.set
local v_u_26 = require(v1.Shared).shallowEqual
local v_u_27 = require(v1.Shared).getComponentName
local v_u_28 = require(v1.Shared).UninitializedState
local v_u_29 = require(v1.Shared).describeError
local v30 = require(v1.Shared).ReactSymbols
local v_u_31 = v30.REACT_CONTEXT_TYPE
local v_u_32 = v30.REACT_PROVIDER_TYPE
local v_u_33 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local v34 = require(script.Parent.ReactTypeOfMode)
local v_u_35 = v34.DebugTracingMode
local v_u_36 = v34.StrictMode
local v_u_37 = v7.enqueueUpdate
local v_u_38 = v7.processUpdateQueue
local v_u_39 = v7.checkHasForceUpdateAfterProcessing
local v_u_40 = v7.resetHasForceUpdateBeforeProcessing
local v_u_41 = v7.createUpdate
local v_u_42 = v7.ReplaceState
local v_u_43 = v7.ForceUpdate
local v_u_44 = v7.initializeUpdateQueue
local v_u_45 = v7.cloneUpdateQueue
local v_u_46 = v6.NoLanes
local v47 = require(script.Parent["ReactFiberContext.new"])
local v_u_48 = v47.cacheContext
local v_u_49 = v47.getMaskedContext
local v_u_50 = v47.getUnmaskedContext
local v_u_51 = v47.hasContextChanged
local v_u_52 = v47.emptyContextObject
local v_u_53 = require(script.Parent["ReactFiberNewContext.new"]).readContext
local v54 = require(script.Parent.DebugTracing)
local v_u_55 = v54.logForceUpdateScheduled
local v_u_56 = v54.logStateUpdateScheduled
local v57 = require(v1.Shared).ConsolePatchingDev
local v_u_58 = v57.disableLogs
local v_u_59 = v57.reenableLogs
local v60 = require(script.Parent.SchedulingProfiler)
local v_u_61 = v60.markForceUpdateScheduled
local v_u_62 = v60.markStateUpdateScheduled
local v_u_63 = {}
local v_u_64 = v8.Component:extend("").__refs
local v_u_65, v_u_66, v_u_67, v_u_68, v_u_69, v_u_70, v_u_71, v_u_72, v_u_73
if v_u_4 then
	local v_u_74 = {}
	v_u_65 = function(_, _) -- name: warnOnUndefinedDerivedState end
	v_u_66 = {}
	v_u_67 = function(p75, p76) -- name: warnOnInvalidCallback
		-- upvalues: (copy) v_u_74, (copy) v_u_5
		if p75 ~= nil and type(p75) ~= "function" then
			local v77 = p76 .. "_" .. tostring(p75)
			if not v_u_74[v77] then
				v_u_74[v77] = true
				v_u_5.error("%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", p76, (tostring(p75)))
			end
		end
	end
	v_u_68 = {}
	v_u_69 = {}
	v_u_70 = {}
	v_u_71 = {}
	v_u_72 = {}
	v_u_73 = {}
else
	v_u_65 = nil
	v_u_66 = nil
	v_u_67 = nil
	v_u_68 = nil
	v_u_69 = nil
	v_u_70 = nil
	v_u_71 = nil
	v_u_72 = nil
	v_u_73 = nil
end
local function v_u_89(p78, p79, p80, p81) -- name: applyDerivedStateFromProps
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_36, (copy) v_u_58, (copy) v_u_29, (copy) v_u_59, (ref) v_u_65, (copy) v_u_20, (copy) v_u_3, (copy) v_u_46
	local v82 = p78.memoizedState
	if v_u_4 and v_u_14 then
		local v83 = p78.mode
		local v84 = v_u_36
		if bit32.band(v83, v84) ~= 0 then
			v_u_58()
			local v85 = v_u_29
			local v86, v87 = xpcall(p80, v85, p81, v82)
			v_u_59()
			if not v86 then
				error(v87)
			end
		end
	end
	local v88 = p80(p81, v82)
	if v_u_4 then
		v_u_65(p79, v88)
	end
	if v_u_20 then
		if v88 ~= nil then
			if type(v82) == "table" and getmetatable(v82) == nil then
				v82 = v_u_3.assign(table.clone(v82), v88)
			else
				v82 = v_u_3.assign({}, v82, v88)
			end
		end
	elseif v88 ~= nil then
		v82 = v_u_3.assign({}, v82, v88)
	end
	p78.memoizedState = v82
	if p78.lanes == v_u_46 then
		p78.updateQueue.baseState = v82
	end
end
local v_u_90 = nil
local function v_u_121() -- name: initializeClassComponentUpdater
	-- upvalues: (ref) v_u_90, (copy) v_u_22, (copy) v_u_24, (copy) v_u_41, (copy) v_u_4, (ref) v_u_67, (copy) v_u_37, (copy) v_u_16, (copy) v_u_35, (copy) v_u_27, (copy) v_u_56, (copy) v_u_17, (copy) v_u_62, (copy) v_u_42, (copy) v_u_43, (copy) v_u_55, (copy) v_u_61
	local v91 = require(script.Parent["ReactFiberWorkLoop.new"])
	local v_u_92 = v91.requestEventTime
	local v_u_93 = v91.requestUpdateLane
	local v_u_94 = v91.scheduleUpdateOnFiber
	v_u_90 = {
		["isMounted"] = v_u_22,
		["enqueueSetState"] = function(p95, p96, p97) -- name: enqueueSetState
			-- upvalues: (ref) v_u_24, (copy) v_u_92, (copy) v_u_93, (ref) v_u_41, (ref) v_u_4, (ref) v_u_67, (ref) v_u_37, (copy) v_u_94, (ref) v_u_16, (ref) v_u_35, (ref) v_u_27, (ref) v_u_56, (ref) v_u_17, (ref) v_u_62
			local v98 = v_u_24(p95)
			local v99 = v_u_92()
			local v100 = v_u_93(v98)
			local v101 = v_u_41(v99, v100, p96, p97)
			if p97 ~= nil and v_u_4 then
				v_u_67(p97, "setState")
			end
			v_u_37(v98, v101)
			v_u_94(v98, v100, v99)
			if v_u_4 and v_u_16 then
				local v102 = v98.mode
				local v103 = v_u_35
				if bit32.band(v102, v103) ~= 0 then
					v_u_56(v_u_27(v98.type) or "Unknown", v100, p96)
				end
			end
			if v_u_17 then
				v_u_62(v98, v100)
			end
		end,
		["enqueueReplaceState"] = function(p104, p105, p106) -- name: enqueueReplaceState
			-- upvalues: (ref) v_u_24, (copy) v_u_92, (copy) v_u_93, (ref) v_u_41, (ref) v_u_42, (ref) v_u_4, (ref) v_u_67, (ref) v_u_37, (copy) v_u_94, (ref) v_u_16, (ref) v_u_35, (ref) v_u_27, (ref) v_u_56, (ref) v_u_17, (ref) v_u_62
			local v107 = v_u_24(p104)
			local v108 = v_u_92()
			local v109 = v_u_93(v107)
			local v110 = v_u_41(v108, v109, p105, p106)
			v110.tag = v_u_42
			if p106 ~= nil and v_u_4 then
				v_u_67(p106, "replaceState")
			end
			v_u_37(v107, v110)
			v_u_94(v107, v109, v108)
			if v_u_4 and v_u_16 then
				local v111 = v107.mode
				local v112 = v_u_35
				if bit32.band(v111, v112) ~= 0 then
					v_u_56(v_u_27(v107.type) or "Unknown", v109, p105)
				end
			end
			if v_u_17 then
				v_u_62(v107, v109)
			end
		end,
		["enqueueForceUpdate"] = function(p113, p114) -- name: enqueueForceUpdate
			-- upvalues: (ref) v_u_24, (copy) v_u_92, (copy) v_u_93, (ref) v_u_41, (ref) v_u_43, (ref) v_u_4, (ref) v_u_67, (ref) v_u_37, (copy) v_u_94, (ref) v_u_16, (ref) v_u_35, (ref) v_u_27, (ref) v_u_55, (ref) v_u_17, (ref) v_u_61
			local v115 = v_u_24(p113)
			local v116 = v_u_92()
			local v117 = v_u_93(v115)
			local v118 = v_u_41(v116, v117, nil, p114)
			v118.tag = v_u_43
			if p114 ~= nil and v_u_4 then
				v_u_67(p114, "forceUpdate")
			end
			v_u_37(v115, v118)
			v_u_94(v115, v117, v116)
			if v_u_4 and v_u_16 then
				local v119 = v115.mode
				local v120 = v_u_35
				if bit32.band(v119, v120) ~= 0 then
					v_u_55(v_u_27(v115.type) or "Unknown", v117)
				end
			end
			if v_u_17 then
				v_u_61(v115, v117)
			end
		end
	}
end
function checkShouldComponentUpdate(p122, p123, p124, p125, p126, p127, p128) -- name: checkShouldComponentUpdate
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_36, (copy) v_u_58, (copy) v_u_29, (copy) v_u_59, (copy) v_u_5, (copy) v_u_27, (copy) v_u_26
	local v129 = p122.stateNode
	if v129.shouldComponentUpdate ~= nil then
		local v130 = v129.shouldComponentUpdate
		if type(v130) == "function" then
			if v_u_4 and v_u_14 then
				local v131 = p122.mode
				local v132 = v_u_36
				if bit32.band(v131, v132) ~= 0 then
					v_u_58()
					local v133 = v129.shouldComponentUpdate
					local v134 = v_u_29
					local v135, v136 = xpcall(v133, v134, v129, p125, p127, p128)
					v_u_59()
					if not v135 then
						error(v136)
					end
				end
			end
			local v137 = v129:shouldComponentUpdate(p125, p127, p128)
			if v_u_4 and v137 == nil then
				v_u_5.error("%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.", v_u_27(p123) or "Component")
			end
			return v137
		end
	end
	return (type(p123) ~= "table" or not p123.isPureReactComponent) and true or not (v_u_26(p124, p125) and v_u_26(p126, p127))
end
local function v_u_155(p138, p139, p140) -- name: checkClassInstance
	-- upvalues: (copy) v_u_4, (copy) v_u_27, (copy) v_u_5, (copy) v_u_15, (ref) v_u_68, (ref) v_u_73
	local v141 = p138.stateNode
	if v_u_4 then
		local v142 = v_u_27(p139) or "Component"
		if not v141.render then
			local v143 = p139.render
			if type(v143) == "function" then
				v_u_5.error("%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?", v142)
			else
				v_u_5.error("%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.", v142)
			end
		end
		if v141.getInitialState and not (v141.getInitialState.isReactClassApproved or v141.state) then
			v_u_5.error("getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?", v142)
		end
		if v141.getDefaultProps and not v141.getDefaultProps.isReactClassApproved then
			v_u_5.error("getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.", v142)
		end
		if v141.propTypes and not p139.propTypes then
			v_u_5.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", v142)
		end
		if v141.contextType and not p139.contextType then
			v_u_5.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", v142)
		end
		if v_u_15 then
			if p139.childContextTypes then
				v_u_5.error("%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.", v142)
			end
			if p139.contextTypes then
				v_u_5.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.", v142)
			end
		else
			if v141.contextTypes and not p139.contextTypes then
				v_u_5.error("contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.", v142)
			end
			if type(p139) == "table" and (p139.contextType and (p139.contextTypes and not v_u_68[p139])) then
				v_u_68[p139] = true
				v_u_5.error("%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.", v142)
			end
		end
		local v144 = v141.componentShouldUpdate
		if type(v144) == "function" then
			v_u_5.error("%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.", v142)
		end
		if type(p139) == "table" and (p139.isPureReactComponent and v141.shouldComponentUpdate ~= nil) then
			v_u_5.error("%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.", v_u_27(p139) or "A pure component")
		end
		local v145 = v141.componentDidUnmount
		if type(v145) == "function" then
			v_u_5.error("%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?", v142)
		end
		local v146 = v141.componentDidReceiveProps
		if type(v146) == "function" then
			v_u_5.error("%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v142)
		end
		local v147 = v141.componentWillRecieveProps
		if type(v147) == "function" then
			v_u_5.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v142)
		end
		local v148 = v141.UNSAFE_componentWillRecieveProps
		if type(v148) == "function" then
			v_u_5.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v142)
		end
		local v149 = v141.props ~= p140
		if v141.props ~= nil and v149 then
			v_u_5.error("%s(...): When calling super() in `%s`, make sure to pass up the same props that your component\'s constructor was passed.", v142, v142)
		end
		if rawget(v141, "defaultProps") then
			v_u_5.error("Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.", v142, v142)
		end
		local v150 = v141.getSnapshotBeforeUpdate
		if type(v150) == "function" then
			local v151 = v141.componentDidUpdate
			if type(v151) ~= "function" and not v_u_73[p139] then
				v_u_73[p139] = true
				v_u_5.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.", v_u_27(p139))
			end
		end
		local v152 = v141.state
		if v152 ~= nil and type(v152) ~= "table" then
			v_u_5.error("%s.state: must be set to an object or nil", v142)
		end
		if type(p139) == "table" then
			local v153 = v141.getChildContext
			if type(v153) == "function" then
				local v154 = p139.childContextTypes
				if type(v154) ~= "table" then
					v_u_5.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", v142)
				end
			end
		end
	end
end
local function v158(p156, p157) -- name: adoptClassInstance
	-- upvalues: (ref) v_u_90, (copy) v_u_121, (copy) v_u_25, (copy) v_u_4, (copy) v_u_63
	if v_u_90 == nil then
		v_u_121()
	end
	p157.__updater = v_u_90
	p156.stateNode = p157
	v_u_25(p157, p156)
	if v_u_4 then
		p157._reactInternalInstance = v_u_63
	end
end
local function v201(p159, p160, p161) -- name: constructClassInstance
	-- upvalues: (copy) v_u_52, (copy) v_u_4, (copy) v_u_31, (ref) v_u_72, (copy) v_u_32, (copy) v_u_5, (copy) v_u_27, (copy) v_u_53, (copy) v_u_15, (copy) v_u_50, (copy) v_u_49, (copy) v_u_14, (copy) v_u_36, (copy) v_u_58, (copy) v_u_29, (copy) v_u_59, (ref) v_u_90, (copy) v_u_121, (copy) v_u_25, (copy) v_u_63, (copy) v_u_28, (ref) v_u_69, (ref) v_u_71, (copy) v_u_48
	local v162 = false
	local v163 = v_u_52
	local v164 = v_u_52
	local v165 = p160.contextType
	if v_u_4 and p160.contextType ~= nil then
		local v166
		if v165 == nil then
			v166 = true
		elseif v165["$$typeof"] == v_u_31 then
			v166 = v165._context == nil
		else
			v166 = false
		end
		if not (v166 or v_u_72[p160]) then
			v_u_72[p160] = true
			local v167 = ""
			local v168
			if v165 == nil then
				v168 = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file."
			elseif type(v165) == "table" then
				if v165["$$typeof"] == v_u_32 then
					v168 = " Did you accidentally pass the Context.Provider instead?"
				elseif v165._context == nil then
					local v169 = v167 .. " However, it is set to an object with keys {"
					for v170, _ in v165 do
						v169 = v169 .. v170 .. ", "
					end
					v168 = v169 .. "}."
				else
					v168 = " Did you accidentally pass the Context.Consumer instead?"
				end
			else
				v168 = " However, it is set to a " .. type(v165) .. "."
			end
			v_u_5.error("%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s", v_u_27(p160) or "Component", v168)
		end
	end
	if v165 == nil or type(v165) ~= "table" then
		if not v_u_15 then
			v163 = v_u_50(p159, p160, true)
			v162 = p160.contextTypes ~= nil
			v164 = v162 and v_u_49(p159, v163) or v_u_52
		end
	else
		v164 = v_u_53(v165)
	end
	if v_u_4 and v_u_14 then
		local v171 = p159.mode
		local v172 = v_u_36
		if bit32.band(v171, v172) ~= 0 then
			v_u_58()
			local v173 = p160.__ctor
			local v174 = v_u_29
			local v175, v176 = xpcall(v173, v174, p161, v164)
			v_u_59()
			if not v175 then
				error(v176)
			end
		end
	end
	local v177 = p160.__ctor(p161, v164)
	p159.memoizedState = v177.state
	local v178 = p159.memoizedState
	if v_u_90 == nil then
		v_u_121()
	end
	v177.__updater = v_u_90
	p159.stateNode = v177
	v_u_25(v177, p159)
	if v_u_4 then
		v177._reactInternalInstance = v_u_63
	end
	if not v_u_4 then
		if v162 then
			v_u_48(p159, v163, v164)
		end
		return v177
	end
	local v179 = p160.getDerivedStateFromProps
	if type(v179) == "function" and v178 == v_u_28 then
		local v180 = v_u_27(p160) or "Component"
		if not v_u_69[v180] then
			v_u_69[v180] = true
			v_u_5.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v180, v180)
		end
	end
	local v181 = p160.getDerivedStateFromProps
	local v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199
	if type(v181) == "function" then
		v182 = nil
		v183 = nil
		v184 = nil
		v185 = v177.componentWillMount
		if type(v185) == "function" then
			v186 = "componentWillMount"
		else
			v187 = v177.UNSAFE_componentWillMount
			v186 = type(v187) == "function" and "UNSAFE_componentWillMount" or v182
		end
		v188 = v177.componentWillReceiveProps
		if type(v188) == "function" then
			v189 = "componentWillReceiveProps"
		else
			v190 = v177.UNSAFE_componentWillReceiveProps
			v189 = type(v190) == "function" and "UNSAFE_componentWillReceiveProps" or v183
		end
		v191 = v177.componentWillUpdate
		if type(v191) == "function" then
			v192 = "componentWillUpdate"
		else
			v193 = v177.UNSAFE_componentWillUpdate
			v192 = type(v193) == "function" and "UNSAFE_componentWillUpdate" or v184
		end
		if v186 ~= nil or (v189 ~= nil or v192 ~= nil) then
			v194 = v_u_27(p160) or "Component"
			v195 = p160.getDerivedStateFromProps
			v196 = type(v195) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()"
			v197 = v186 == nil and "" or "\n  " .. tostring(v186)
			v198 = v189 == nil and "" or "\n  " .. tostring(v189)
			v199 = v192 == nil and "" or "\n  " .. tostring(v192)
			if not v_u_71[v194] then
				v_u_71[v194] = true
				v_u_5.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", v194, v196, v197, v198, v199)
			end
		end
	else
		local v200 = v177.getSnapshotBeforeUpdate
		if type(v200) ~= "function" then
			if v162 then
				v_u_48(p159, v163, v164)
			end
			return v177
		end
		v182 = nil
		v183 = nil
		v184 = nil
		v185 = v177.componentWillMount
		if type(v185) == "function" then
			v186 = "componentWillMount"
		else
			v187 = v177.UNSAFE_componentWillMount
			v186 = type(v187) == "function" and "UNSAFE_componentWillMount" or v182
		end
		v188 = v177.componentWillReceiveProps
		if type(v188) == "function" then
			v189 = "componentWillReceiveProps"
		else
			v190 = v177.UNSAFE_componentWillReceiveProps
			v189 = type(v190) == "function" and "UNSAFE_componentWillReceiveProps" or v183
		end
		v191 = v177.componentWillUpdate
		if type(v191) == "function" then
			v192 = "componentWillUpdate"
		else
			v193 = v177.UNSAFE_componentWillUpdate
			v192 = type(v193) == "function" and "UNSAFE_componentWillUpdate" or v184
		end
		if v186 ~= nil or (v189 ~= nil or v192 ~= nil) then
			v194 = v_u_27(p160) or "Component"
			v195 = p160.getDerivedStateFromProps
			v196 = type(v195) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()"
			v197 = v186 == nil and "" or "\n  " .. tostring(v186)
			v198 = v189 == nil and "" or "\n  " .. tostring(v189)
			v199 = v192 == nil and "" or "\n  " .. tostring(v192)
			if not v_u_71[v194] then
				v_u_71[v194] = true
				v_u_5.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", v194, v196, v197, v198, v199)
			end
		end
	end
	if v162 then
		v_u_48(p159, v163, v164)
	end
	return v177
end
local function v_u_207(p202, p203) -- name: callComponentWillMount
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_27, (ref) v_u_90, (copy) v_u_121
	local v204 = p203.state
	if p203.componentWillMount ~= nil then
		local v205 = p203.componentWillMount
		if type(v205) == "function" then
			p203:componentWillMount()
		end
	end
	if p203.UNSAFE_componentWillMount ~= nil then
		local v206 = p203.UNSAFE_componentWillMount
		if type(v206) == "function" then
			p203:UNSAFE_componentWillMount()
		end
	end
	if v204 ~= p203.state then
		if v_u_4 then
			v_u_5.error("%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component\'s constructor). Use setState instead.", v_u_27(p202.type) or "Component")
		end
		if v_u_90 == nil then
			v_u_121()
		end
		v_u_90.enqueueReplaceState(p203, p203.state)
	end
end
function callComponentWillReceiveProps(p208, p209, p210, p211) -- name: callComponentWillReceiveProps
	-- upvalues: (copy) v_u_4, (copy) v_u_27, (ref) v_u_66, (copy) v_u_5, (ref) v_u_90, (copy) v_u_121
	local v212 = p209.state
	if p209.componentWillReceiveProps ~= nil then
		local v213 = p209.componentWillReceiveProps
		if type(v213) == "function" then
			p209:componentWillReceiveProps(p210, p211)
		end
	end
	if p209.UNSAFE_componentWillReceiveProps ~= nil then
		local v214 = p209.UNSAFE_componentWillReceiveProps
		if type(v214) == "function" then
			p209:UNSAFE_componentWillReceiveProps(p210, p211)
		end
	end
	if p209.state ~= v212 then
		if v_u_4 then
			local v215 = v_u_27(p208.type) or "Component"
			if not v_u_66[v215] then
				v_u_66[v215] = true
				v_u_5.error("%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component\'s constructor). Use setState instead.", v215)
			end
		end
		if v_u_90 == nil then
			v_u_121()
		end
		v_u_90.enqueueReplaceState(p209, p209.state)
	end
end
local function v238(p216, p217, p218, p219) -- name: mountClassInstance
	-- upvalues: (copy) v_u_4, (copy) v_u_155, (copy) v_u_64, (copy) v_u_44, (copy) v_u_53, (copy) v_u_15, (copy) v_u_52, (copy) v_u_50, (copy) v_u_49, (copy) v_u_27, (ref) v_u_70, (copy) v_u_5, (copy) v_u_36, (copy) v_u_21, (copy) v_u_18, (copy) v_u_38, (copy) v_u_89, (copy) v_u_207, (copy) v_u_19, (copy) v_u_12, (copy) v_u_10
	if v_u_4 then
		v_u_155(p216, p217, p218)
	end
	local v220 = p216.stateNode
	v220.props = p218
	v220.state = p216.memoizedState
	v220.__refs = v_u_64
	v_u_44(p216)
	local v221
	if type(p217) == "table" then
		v221 = p217.contextType
	else
		v221 = nil
	end
	if v221 == nil or type(v221) ~= "table" then
		if v_u_15 then
			v220.context = v_u_52
		else
			v220.context = v_u_49(p216, (v_u_50(p216, p217, true)))
		end
	else
		v220.context = v_u_53(v221)
	end
	if v_u_4 then
		if v220.state == p218 then
			local v222 = v_u_27(p217) or "Component"
			if not v_u_70[v222] then
				v_u_70[v222] = true
				v_u_5.error("%s: It is not recommended to assign props directly to state because updates to props won\'t be reflected in state. In most cases, it is better to use props directly.", v222)
			end
		end
		local v223 = p216.mode
		local v224 = v_u_36
		if bit32.band(v223, v224) ~= 0 then
			v_u_21.recordLegacyContextWarning(p216, v220)
		end
		if v_u_18 then
			v_u_21.recordUnsafeLifecycleWarnings(p216, v220)
		end
	end
	v_u_38(p216, p218, v220, p219)
	v220.state = p216.memoizedState
	local v225 = type(p217)
	local v226
	if type(p217) == "table" then
		v226 = p217.getDerivedStateFromProps
	else
		v226 = nil
	end
	if v226 ~= nil and type(v226) == "function" then
		v_u_89(p216, p217, v226, p218)
		v220.state = p216.memoizedState
	end
	local v227, v228, v229, v230, v231, v232, v233
	if v225 == "table" then
		local v234 = p217.getDerivedStateFromProps
		if type(v234) == "function" then
			v227 = v220.componentDidMount
			if type(v227) == "function" then
				if v_u_4 and v_u_19 then
					v228 = p216.flags
					v229 = v_u_12
					v230 = v_u_10
					v231 = bit32.bor(v229, v230)
					p216.flags = bit32.bor(v228, v231)
					return
				end
				v232 = p216.flags
				v233 = v_u_10
				p216.flags = bit32.bor(v232, v233)
			end
			return
		else
			local v235 = v220.getSnapshotBeforeUpdate
			if type(v235) == "function" then
				v227 = v220.componentDidMount
				if type(v227) == "function" then
					if v_u_4 and v_u_19 then
						v228 = p216.flags
						v229 = v_u_12
						v230 = v_u_10
						v231 = bit32.bor(v229, v230)
						p216.flags = bit32.bor(v228, v231)
						return
					end
					v232 = p216.flags
					v233 = v_u_10
					p216.flags = bit32.bor(v232, v233)
				end
			else
				local v236 = v220.UNSAFE_componentWillMount
				if type(v236) == "function" then
					v_u_207(p216, v220)
					v_u_38(p216, p218, v220, p219)
					v220.state = p216.memoizedState
				else
					local v237 = v220.componentWillMount
					if type(v237) ~= "function" then
						v227 = v220.componentDidMount
						if type(v227) == "function" then
							if v_u_4 and v_u_19 then
								v228 = p216.flags
								v229 = v_u_12
								v230 = v_u_10
								v231 = bit32.bor(v229, v230)
								p216.flags = bit32.bor(v228, v231)
								return
							end
							v232 = p216.flags
							v233 = v_u_10
							p216.flags = bit32.bor(v232, v233)
						end
						return
					end
					v_u_207(p216, v220)
					v_u_38(p216, p218, v220, p219)
					v220.state = p216.memoizedState
				end
				v227 = v220.componentDidMount
				if type(v227) == "function" then
					if v_u_4 and v_u_19 then
						v228 = p216.flags
						v229 = v_u_12
						v230 = v_u_10
						v231 = bit32.bor(v229, v230)
						p216.flags = bit32.bor(v228, v231)
						return
					end
					v232 = p216.flags
					v233 = v_u_10
					p216.flags = bit32.bor(v232, v233)
				end
			end
		end
	else
		v227 = v220.componentDidMount
		if type(v227) == "function" then
			if v_u_4 and v_u_19 then
				v228 = p216.flags
				v229 = v_u_12
				v230 = v_u_10
				v231 = bit32.bor(v229, v230)
				p216.flags = bit32.bor(v228, v231)
				return
			end
			v232 = p216.flags
			v233 = v_u_10
			p216.flags = bit32.bor(v232, v233)
		end
		return
	end
end
function resumeMountClassInstance(p239, p240, p241, p242) -- name: resumeMountClassInstance
	-- upvalues: (copy) v_u_52, (copy) v_u_53, (copy) v_u_15, (copy) v_u_50, (copy) v_u_49, (copy) v_u_40, (copy) v_u_38, (copy) v_u_51, (copy) v_u_39, (copy) v_u_4, (copy) v_u_19, (copy) v_u_12, (copy) v_u_10, (copy) v_u_89
	local v243 = p239.stateNode
	local v244 = p239.memoizedProps
	v243.props = v244
	local v245 = v243.context
	local v246 = p240.contextType
	local v247 = v_u_52
	if v246 == nil or type(v246) ~= "table" then
		if not v_u_15 then
			v247 = v_u_49(p239, (v_u_50(p239, p240, true)))
		end
	else
		v247 = v_u_53(v246)
	end
	local v248 = p240.getDerivedStateFromProps
	local v249
	if type(v248) == "function" then
		v249 = true
	else
		local v250 = v243.getSnapshotBeforeUpdate
		v249 = type(v250) == "function"
	end
	if not v249 then
		local v251 = v243.UNSAFE_componentWillReceiveProps
		if type(v251) == "function" then
			if v244 ~= p241 or v245 ~= v247 then
				callComponentWillReceiveProps(p239, v243, p241, v247)
			end
		else
			local v252 = v243.componentWillReceiveProps
			if type(v252) == "function" then
				if v244 ~= p241 or v245 ~= v247 then
					callComponentWillReceiveProps(p239, v243, p241, v247)
				end
			end
		end
	end
	v_u_40()
	local v253 = p239.memoizedState
	v243.state = v253
	v_u_38(p239, p241, v243, p242)
	local v254 = p239.memoizedState
	if v244 == p241 and (v253 == v254 and not (v_u_51() or v_u_39())) then
		local v255 = v243.componentDidMount
		if type(v255) == "function" then
			if v_u_4 and v_u_19 then
				local v256 = p239.flags
				local v257 = v_u_12
				local v258 = v_u_10
				p239.flags = bit32.bor(v256, v257, v258)
			else
				local v259 = p239.flags
				local v260 = v_u_10
				p239.flags = bit32.bor(v259, v260)
			end
		end
		return false
	end
	if v248 ~= nil and type(v248) == "function" then
		v_u_89(p239, p240, v248, p241)
		v254 = p239.memoizedState
	end
	local v261 = v_u_39() or checkShouldComponentUpdate(p239, p240, v244, p241, v253, v254, v247)
	if not v261 then
		local v262 = v243.componentDidMount
		if type(v262) == "function" then
			if v_u_4 and v_u_19 then
				local v263 = p239.flags
				local v264 = v_u_12
				local v265 = v_u_10
				p239.flags = bit32.bor(v263, v264, v265)
			else
				local v266 = p239.flags
				local v267 = v_u_10
				p239.flags = bit32.bor(v266, v267)
			end
		end
		p239.memoizedProps = p241
		p239.memoizedState = v254
		v243.props = p241
		v243.state = v254
		v243.context = v247
		return v261
	end
	local v268, v269, v270, v271, v272
	if v249 then
		v277 = v243.componentDidMount
		if type(v277) == "function" then
			if v_u_4 and v_u_19 then
				v268 = p239.flags
				v269 = v_u_12
				v270 = v_u_10
				p239.flags = bit32.bor(v268, v269, v270)
			else
				v271 = p239.flags
				v272 = v_u_10
				p239.flags = bit32.bor(v271, v272)
			end
		end
		v243.props = p241
		v243.state = v254
		v243.context = v247
		return v261
	end
	local v273 = v243.UNSAFE_componentWillMount
	local v274, v275
	if type(v273) == "function" then
		v274 = v243.componentWillMount
		if type(v274) == "function" then
			v243:componentWillMount()
		end
		v275 = v243.UNSAFE_componentWillMount
		if type(v275) == "function" then
			v243:UNSAFE_componentWillMount()
		end
	else
		local v276 = v243.componentWillMount
		if type(v276) ~= "function" then
			v277 = v243.componentDidMount
			if type(v277) == "function" then
				if v_u_4 and v_u_19 then
					v268 = p239.flags
					v269 = v_u_12
					v270 = v_u_10
					p239.flags = bit32.bor(v268, v269, v270)
				else
					v271 = p239.flags
					v272 = v_u_10
					p239.flags = bit32.bor(v271, v272)
				end
			end
			v243.props = p241
			v243.state = v254
			v243.context = v247
			return v261
		end
		v274 = v243.componentWillMount
		if type(v274) == "function" then
			v243:componentWillMount()
		end
		v275 = v243.UNSAFE_componentWillMount
		if type(v275) == "function" then
			v243:UNSAFE_componentWillMount()
		end
	end
	local v277 = v243.componentDidMount
	if type(v277) == "function" then
		if v_u_4 and v_u_19 then
			v268 = p239.flags
			v269 = v_u_12
			v270 = v_u_10
			p239.flags = bit32.bor(v268, v269, v270)
		else
			v271 = p239.flags
			v272 = v_u_10
			p239.flags = bit32.bor(v271, v272)
		end
	end
	v243.props = p241
	v243.state = v254
	v243.context = v247
	return v261
end
return {
	["adoptClassInstance"] = v158,
	["constructClassInstance"] = v201,
	["mountClassInstance"] = v238,
	["resumeMountClassInstance"] = resumeMountClassInstance,
	["updateClassInstance"] = function(p278, p279, p280, p281, p282) -- name: updateClassInstance
		-- upvalues: (copy) v_u_45, (copy) v_u_33, (copy) v_u_52, (copy) v_u_53, (copy) v_u_15, (copy) v_u_50, (copy) v_u_49, (copy) v_u_40, (copy) v_u_38, (copy) v_u_51, (copy) v_u_39, (copy) v_u_10, (copy) v_u_11, (copy) v_u_89
		local v283 = p279.stateNode
		v_u_45(p278, p279)
		local v284 = p279.memoizedProps
		local v285
		if p279.type == p279.elementType then
			v285 = v284
		else
			v285 = v_u_33(p279.type, v284)
		end
		v283.props = v285
		local v286 = p279.pendingProps
		local v287 = v283.context
		local v288, v289
		if type(p280) == "table" then
			v288 = p280.contextType
			v289 = p280.getDerivedStateFromProps
		else
			v288 = nil
			v289 = nil
		end
		local v290 = v_u_52
		if type(v288) == "table" then
			v290 = v_u_53(v288)
		elseif not v_u_15 then
			v290 = v_u_49(p279, (v_u_50(p279, p280, true)))
		end
		local v291
		if v289 == nil or type(v289) ~= "function" then
			if v283.getSnapshotBeforeUpdate == nil then
				v291 = false
			else
				local v292 = v283.getSnapshotBeforeUpdate
				v291 = type(v292) == "function"
			end
		else
			v291 = true
		end
		if not v291 then
			local v293
			if v283.UNSAFE_componentWillReceiveProps == nil then
				if v283.componentWillReceiveProps ~= nil then
					v293 = v283.componentWillReceiveProps
					if type(v293) == "function" then
						if v284 ~= v286 or v287 ~= v290 then
							callComponentWillReceiveProps(p279, v283, p281, v290)
						end
					end
				end
			else
				local v294 = v283.UNSAFE_componentWillReceiveProps
				if type(v294) == "function" then
					if v284 ~= v286 or v287 ~= v290 then
						callComponentWillReceiveProps(p279, v283, p281, v290)
					end
				elseif v283.componentWillReceiveProps ~= nil then
					v293 = v283.componentWillReceiveProps
					if type(v293) == "function" then
						if v284 ~= v286 or v287 ~= v290 then
							callComponentWillReceiveProps(p279, v283, p281, v290)
						end
					end
				end
			end
		end
		v_u_40()
		local v295 = p279.memoizedState
		v283.state = v295
		local _ = v283.state
		v_u_38(p279, p281, v283, p282)
		local v296 = p279.memoizedState
		if v284 == v286 and (v295 == v296 and not (v_u_51() or v_u_39())) then
			if v283.componentDidUpdate ~= nil then
				local v297 = v283.componentDidUpdate
				if type(v297) == "function" and (v284 ~= p278.memoizedProps or v295 ~= p278.memoizedState) then
					local v298 = p279.flags
					local v299 = v_u_10
					p279.flags = bit32.bor(v298, v299)
				end
			end
			if v283.getSnapshotBeforeUpdate ~= nil then
				local v300 = v283.getSnapshotBeforeUpdate
				if type(v300) == "function" and (v284 ~= p278.memoizedProps or v295 ~= p278.memoizedState) then
					local v301 = p279.flags
					local v302 = v_u_11
					p279.flags = bit32.bor(v301, v302)
				end
			end
			return false
		end
		if v289 ~= nil and type(v289) == "function" then
			v_u_89(p279, p280, v289, p281)
			v296 = p279.memoizedState
		end
		local v303 = v_u_39() or checkShouldComponentUpdate(p279, p280, v285, p281, v295, v296, v290)
		if not v303 then
			if v283.componentDidUpdate ~= nil then
				local v304 = v283.componentDidUpdate
				if type(v304) == "function" and (v284 ~= p278.memoizedProps or v295 ~= p278.memoizedState) then
					local v305 = p279.flags
					local v306 = v_u_10
					p279.flags = bit32.bor(v305, v306)
				end
			end
			if v283.getSnapshotBeforeUpdate ~= nil then
				local v307 = v283.getSnapshotBeforeUpdate
				if type(v307) == "function" and (v284 ~= p278.memoizedProps or v295 ~= p278.memoizedState) then
					local v308 = p279.flags
					local v309 = v_u_11
					p279.flags = bit32.bor(v308, v309)
				end
			end
			p279.memoizedProps = p281
			p279.memoizedState = v296
			v283.props = p281
			v283.state = v296
			v283.context = v290
			return v303
		end
		local v310, v311, v312, v313, v314, v315
		if v291 then
			if v283.componentDidUpdate ~= nil then
				v310 = v283.componentDidUpdate
				if type(v310) == "function" then
					v311 = p279.flags
					v312 = v_u_10
					p279.flags = bit32.bor(v311, v312)
				end
			end
			if v283.getSnapshotBeforeUpdate ~= nil then
				v313 = v283.getSnapshotBeforeUpdate
				if type(v313) == "function" then
					v314 = p279.flags
					v315 = v_u_11
					p279.flags = bit32.bor(v314, v315)
				end
			end
			v283.props = p281
			v283.state = v296
			v283.context = v290
			return v303
		end
		local v316, v317, v318
		if v283.UNSAFE_componentWillUpdate == nil then
			if v283.componentWillUpdate == nil then
				if v283.componentDidUpdate ~= nil then
					v310 = v283.componentDidUpdate
					if type(v310) == "function" then
						v311 = p279.flags
						v312 = v_u_10
						p279.flags = bit32.bor(v311, v312)
					end
				end
				if v283.getSnapshotBeforeUpdate ~= nil then
					v313 = v283.getSnapshotBeforeUpdate
					if type(v313) == "function" then
						v314 = p279.flags
						v315 = v_u_11
						p279.flags = bit32.bor(v314, v315)
					end
				end
				v283.props = p281
				v283.state = v296
				v283.context = v290
				return v303
			end
			v316 = v283.componentWillUpdate
			if type(v316) ~= "function" then
				if v283.componentDidUpdate ~= nil then
					v310 = v283.componentDidUpdate
					if type(v310) == "function" then
						v311 = p279.flags
						v312 = v_u_10
						p279.flags = bit32.bor(v311, v312)
					end
				end
				if v283.getSnapshotBeforeUpdate ~= nil then
					v313 = v283.getSnapshotBeforeUpdate
					if type(v313) == "function" then
						v314 = p279.flags
						v315 = v_u_11
						p279.flags = bit32.bor(v314, v315)
					end
				end
				v283.props = p281
				v283.state = v296
				v283.context = v290
				return v303
			end
			if v283.componentWillUpdate ~= nil then
				v317 = v283.componentWillUpdate
				if type(v317) == "function" then
					v283:componentWillUpdate(p281, v296, v290)
				end
			end
			if v283.UNSAFE_componentWillUpdate ~= nil then
				v318 = v283.UNSAFE_componentWillUpdate
				if type(v318) == "function" then
					v283:UNSAFE_componentWillUpdate(p281, v296, v290)
				end
			end
		else
			local v319 = v283.UNSAFE_componentWillUpdate
			if type(v319) == "function" then
				if v283.componentWillUpdate ~= nil then
					v317 = v283.componentWillUpdate
					if type(v317) == "function" then
						v283:componentWillUpdate(p281, v296, v290)
					end
				end
				if v283.UNSAFE_componentWillUpdate ~= nil then
					v318 = v283.UNSAFE_componentWillUpdate
					if type(v318) == "function" then
						v283:UNSAFE_componentWillUpdate(p281, v296, v290)
					end
				end
				if v283.componentDidUpdate ~= nil then
					v310 = v283.componentDidUpdate
					if type(v310) == "function" then
						v311 = p279.flags
						v312 = v_u_10
						p279.flags = bit32.bor(v311, v312)
					end
				end
				if v283.getSnapshotBeforeUpdate ~= nil then
					v313 = v283.getSnapshotBeforeUpdate
					if type(v313) == "function" then
						v314 = p279.flags
						v315 = v_u_11
						p279.flags = bit32.bor(v314, v315)
					end
				end
				v283.props = p281
				v283.state = v296
				v283.context = v290
				return v303
			end
			if v283.componentWillUpdate == nil then
				if v283.componentDidUpdate ~= nil then
					v310 = v283.componentDidUpdate
					if type(v310) == "function" then
						v311 = p279.flags
						v312 = v_u_10
						p279.flags = bit32.bor(v311, v312)
					end
				end
				if v283.getSnapshotBeforeUpdate ~= nil then
					v313 = v283.getSnapshotBeforeUpdate
					if type(v313) == "function" then
						v314 = p279.flags
						v315 = v_u_11
						p279.flags = bit32.bor(v314, v315)
					end
				end
				v283.props = p281
				v283.state = v296
				v283.context = v290
				return v303
			end
			v316 = v283.componentWillUpdate
			if type(v316) ~= "function" then
				if v283.componentDidUpdate ~= nil then
					v310 = v283.componentDidUpdate
					if type(v310) == "function" then
						v311 = p279.flags
						v312 = v_u_10
						p279.flags = bit32.bor(v311, v312)
					end
				end
				if v283.getSnapshotBeforeUpdate ~= nil then
					v313 = v283.getSnapshotBeforeUpdate
					if type(v313) == "function" then
						v314 = p279.flags
						v315 = v_u_11
						p279.flags = bit32.bor(v314, v315)
					end
				end
				v283.props = p281
				v283.state = v296
				v283.context = v290
				return v303
			end
			if v283.componentWillUpdate ~= nil then
				v317 = v283.componentWillUpdate
				if type(v317) == "function" then
					v283:componentWillUpdate(p281, v296, v290)
				end
			end
			if v283.UNSAFE_componentWillUpdate ~= nil then
				v318 = v283.UNSAFE_componentWillUpdate
				if type(v318) == "function" then
					v283:UNSAFE_componentWillUpdate(p281, v296, v290)
				end
			end
		end
		if v283.componentDidUpdate ~= nil then
			v310 = v283.componentDidUpdate
			if type(v310) == "function" then
				v311 = p279.flags
				v312 = v_u_10
				p279.flags = bit32.bor(v311, v312)
			end
		end
		if v283.getSnapshotBeforeUpdate ~= nil then
			v313 = v283.getSnapshotBeforeUpdate
			if type(v313) == "function" then
				v314 = p279.flags
				v315 = v_u_11
				p279.flags = bit32.bor(v314, v315)
			end
		end
		v283.props = p281
		v283.state = v296
		v283.context = v290
		return v303
	end,
	["applyDerivedStateFromProps"] = v_u_89,
	["emptyRefsObject"] = v_u_64
}