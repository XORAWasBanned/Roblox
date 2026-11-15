-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactFiberBeginWork.new
local v_u_1 = script.Parent.Parent
local v_u_2 = require(v_u_1.Shared).console
local v3 = require(v_u_1.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Object
local v_u_6 = v3.util.inspect
local v_u_7 = require(v_u_1.ReactGlobals).__DEV__
local v_u_8 = require(v_u_1.ReactGlobals).__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local v_u_9 = require(v_u_1.ReactGlobals).__COMPAT_WARNINGS__
require(v_u_1.Shared)
require(v_u_1.React)
require(script.Parent.ReactInternalTypes)
local v_u_10 = require(script.Parent.ReactFiberLane)
require(script.Parent["ReactFiberSuspenseComponent.new"])
local v11 = require(script.Parent["ReactFiberSuspenseContext.new"])
require(script.Parent.ReactFiberOffscreenComponent)
local v_u_12 = require(v_u_1.Shared).checkPropTypes
local v_u_13 = require(script.Parent.ReactWorkTags)
local v_u_14 = v_u_13.FunctionComponent
local v_u_15 = v_u_13.ClassComponent
local v_u_16 = v_u_13.HostRoot
local v_u_17 = v_u_13.HostComponent
local v_u_18 = v_u_13.HostText
local v_u_19 = v_u_13.HostPortal
local v_u_20 = v_u_13.ForwardRef
local v_u_21 = v_u_13.Fragment
local v_u_22 = v_u_13.Mode
local v_u_23 = v_u_13.ContextProvider
local v_u_24 = v_u_13.ContextConsumer
local v_u_25 = v_u_13.Profiler
local v_u_26 = v_u_13.SuspenseComponent
local v_u_27 = v_u_13.SuspenseListComponent
local v_u_28 = v_u_13.MemoComponent
local v_u_29 = v_u_13.SimpleMemoComponent
local v_u_30 = v_u_13.LazyComponent
local v_u_31 = v_u_13.IncompleteClassComponent
local v_u_32 = v_u_13.OffscreenComponent
local v_u_33 = v_u_13.LegacyHiddenComponent
local v34 = require(script.Parent.ReactFiberFlags)
local v_u_35 = v34.NoFlags
local v_u_36 = v34.StaticMask
local v_u_37 = v34.PerformedWork
local v_u_38 = v34.Placement
local v_u_39 = v34.Hydrating
local v_u_40 = v34.ContentReset
local v_u_41 = v34.DidCapture
local v_u_42 = v34.Ref
local v_u_43 = v34.Deletion
local v_u_44 = v34.ForceUpdateForLegacySuspense
local v45 = require(v_u_1.Shared).ReactSharedInternals
local v_u_46 = require(v_u_1.Shared).ReactFeatureFlags
local v_u_47 = v_u_46.debugRenderPhaseSideEffectsForStrictMode
local v_u_48 = v_u_46.disableLegacyContext
local v_u_49 = v_u_46.disableModulePatternComponents
local v_u_50 = v_u_46.enableProfilerTimer
local v_u_51 = v_u_46.enableSchedulerTracing
local v_u_52 = v_u_46.enableSuspenseServerRenderer
local v_u_53 = v_u_46.warnAboutDefaultPropsOnFunctionComponents
local v_u_54 = require(v_u_1.Shared).invariant
local v_u_55 = require(v_u_1.Shared).describeError
local v_u_56 = require(v_u_1.Shared).shallowEqual
local v_u_57 = require(v_u_1.Shared).getComponentName
local v58 = require(v_u_1.Shared).ReactSymbols
local v_u_59 = v58.REACT_LAZY_TYPE
local _ = v58.getIteratorFn
local v_u_60 = require(script.Parent["ReactStrictModeWarnings.new"])
local v61 = require(script.Parent.ReactCurrentFiber)
local v_u_62 = v61.getCurrentFiberOwnerNameInDevOrNull
local v_u_63 = v61.setIsRendering
local v64 = require(script.Parent["ReactFiberHotReloading.new"])
local v_u_65 = v64.resolveFunctionForHotReloading
local v_u_66 = v64.resolveForwardRefForHotReloading
local v_u_67 = v64.resolveClassForHotReloading
local v68 = require(script.Parent["ReactChildFiber.new"])
local v_u_69 = v68.mountChildFibers
local v_u_70 = v68.reconcileChildFibers
local v_u_71 = v68.cloneChildFibers
local v72 = require(script.Parent["ReactUpdateQueue.new"])
local v_u_73 = v72.processUpdateQueue
local v_u_74 = v72.cloneUpdateQueue
local v_u_75 = v72.initializeUpdateQueue
local v76 = require(script.Parent.ReactTypeOfMode)
local v_u_77 = v76.ConcurrentMode
local v_u_78 = v76.NoMode
local v_u_79 = v76.ProfileMode
local v_u_80 = v76.StrictMode
local v_u_81 = v76.BlockingMode
local v82 = require(script.Parent.ReactFiberHostConfig)
local v_u_83 = v82.shouldSetTextContent
local v_u_84 = v82.isSuspenseInstancePending
local v_u_85 = v82.isSuspenseInstanceFallback
local v_u_86 = v82.registerSuspenseInstanceRetry
local v_u_87 = v82.supportsHydration
local v88 = require(script.Parent["ReactFiberHostContext.new"])
local v_u_89 = v88.pushHostContext
local v_u_90 = v88.pushHostContainer
local v_u_91 = v11.suspenseStackCursor
local v_u_92 = v11.hasSuspenseContext
local v_u_93 = v11.ForceSuspenseFallback
local v_u_94 = v11.addSubtreeSuspenseContext
local v_u_95 = v11.InvisibleParentSuspenseContext
local v_u_96 = v11.pushSuspenseContext
local v_u_97 = v11.setDefaultShallowSuspenseContext
local v98 = require(script.Parent["ReactFiberNewContext.new"])
local v_u_99 = v98.propagateContextChange
local v_u_100 = v98.readContext
local v_u_101 = v98.calculateChangedBits
local v_u_102 = v98.prepareToReadContext
local v_u_103 = v98.pushProvider
local v_u_104 = {
	["renderWithHooksRef"] = nil,
	["bailoutHooksRef"] = nil,
	["shouldSuspendRef"] = nil
}
local function v_u_106(...) -- name: renderWithHooks
	-- upvalues: (copy) v_u_104
	if not v_u_104.renderWithHooksRef then
		local v105 = require(script.Parent["ReactFiberHooks.new"])
		v_u_104.renderWithHooksRef = v105.renderWithHooks
		v_u_104.bailoutHooksRef = v105.bailoutHooks
	end
	return v_u_104.renderWithHooksRef(...)
end
local function v_u_108(...) -- name: bailoutHooks
	-- upvalues: (copy) v_u_104
	if not v_u_104.bailoutHooksRef then
		local v107 = require(script.Parent["ReactFiberHooks.new"])
		v_u_104.renderWithHooksRef = v107.renderWithHooks
		v_u_104.bailoutHooksRef = v107.bailoutHooks
	end
	return v_u_104.bailoutHooksRef(...)
end
local v_u_109 = require(script.Parent["ReactProfilerTimer.new"]).stopProfilerTimerIfRunning
local v110 = require(script.Parent["ReactFiberContext.new"])
local v_u_111 = v110.getMaskedContext
local v_u_112 = v110.getUnmaskedContext
local v_u_113 = v110.hasContextChanged
local v_u_114 = v110.pushContextProvider
local v_u_115 = v110.isContextProvider
local v_u_116 = v110.pushTopLevelContextObject
local v_u_117 = v110.invalidateContextProvider
local v118 = require(script.Parent["ReactFiberHydrationContext.new"])
local v_u_119 = v118.resetHydrationState
local v_u_120 = v118.enterHydrationState
local v_u_121 = v118.reenterHydrationStateFromDehydratedSuspenseInstance
local v_u_122 = v118.tryToClaimNextHydratableInstance
local v_u_123 = v118.warnIfHydrating
local v124 = require(script.Parent["ReactFiberClassComponent.new"])
local v_u_125 = v124.adoptClassInstance
local v_u_126 = v124.applyDerivedStateFromProps
local v_u_127 = v124.constructClassInstance
local v_u_128 = v124.mountClassInstance
local v_u_129 = v124.resumeMountClassInstance
local v_u_130 = v124.updateClassInstance
local v_u_131 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local v132 = require(script.Parent["ReactFiber.new"])
local v_u_133 = v132.resolveLazyComponentTag
local v_u_134 = v132.createFiberFromFragment
local v_u_135 = v132.createFiberFromOffscreen
local v_u_136 = v132.createFiberFromTypeAndProps
local v_u_137 = v132.isSimpleFunctionComponent
local v_u_138 = v132.createWorkInProgress
local v139 = require(script.Parent["ReactFiberWorkLoop.new"])
local v_u_140 = v139.pushRenderLanes
local v_u_141 = v139.markSpawnedWork
local v_u_142 = v139.retryDehydratedSuspenseBoundary
local v_u_143 = v139.scheduleUpdateOnFiber
local v_u_144 = v139.renderDidSuspendDelayIfPossible
local v_u_145 = v139.getWorkInProgressRoot
local v_u_146 = v139.getExecutionContext
local v_u_147 = v139.RetryAfterError
local v_u_148 = v139.NoContext
local v_u_149 = nil
local v_u_150 = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion
local v_u_151 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes
local v152 = require(v_u_1.Shared).ConsolePatchingDev
local v_u_153 = v152.disableLogs
local v_u_154 = v152.reenableLogs
local v_u_155 = v45.ReactCurrentOwner
local v_u_156 = {}
local v_u_157 = nil
local v_u_158 = nil
local v_u_159 = false
local v_u_160 = {
	["didWarnAboutBadClass"] = {},
	["didWarnAboutModulePatternComponent"] = {},
	["didWarnAboutContextTypeOnFunctionComponent"] = {},
	["didWarnAboutGetDerivedStateOnFunctionComponent"] = {},
	["didWarnAboutFunctionRefs"] = {},
	["didWarnAboutDefaultPropsOnFunctionComponent"] = {}
}
local v_u_161 = nil
if v_u_7 then
	v_u_160.didWarnAboutBadClass = {}
	v_u_160.didWarnAboutModulePatternComponent = {}
	v_u_160.didWarnAboutContextTypeOnFunctionComponent = {}
	v_u_160.didWarnAboutGetDerivedStateOnFunctionComponent = {}
	v_u_160.didWarnAboutFunctionRefs = {}
	v_u_156.didWarnAboutReassigningProps = false
	v_u_160.didWarnAboutDefaultPropsOnFunctionComponent = {}
end
local function v_u_167(p162, p163, p164, p165) -- name: reconcileChildren
	-- upvalues: (copy) v_u_69, (copy) v_u_46, (copy) v_u_70
	if p162 == nil then
		p163.child = v_u_69(p163, nil, p164, p165)
	elseif v_u_46.enableWorkLoopTrims then
		local v166 = v_u_70(p163, p162.child, p164, p165)
		if v166 ~= nil or p163.child ~= nil then
			p163.child = v166
			return
		end
	else
		p163.child = v_u_70(p163, p162.child, p164, p165)
	end
end
local function v_u_186(p168, p169, p170, p171, p172) -- name: updateForwardRef
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_12, (copy) v_u_57, (copy) v_u_102, (copy) v_u_156, (copy) v_u_155, (copy) v_u_63, (copy) v_u_106, (copy) v_u_47, (copy) v_u_80, (copy) v_u_153, (copy) v_u_55, (copy) v_u_154, (ref) v_u_159, (copy) v_u_108, (ref) v_u_157, (copy) v_u_37, (copy) v_u_167
	if (v_u_7 or v_u_8) and p169.type ~= p169.elementType then
		local v173 = p170.propTypes
		local v174 = p170.validateProps
		if v173 or v174 then
			v_u_12(v173, v174, p171, "prop", v_u_57(p170))
		end
	end
	local v175 = p170.render
	local v176 = p169.ref
	v_u_102(p169, p172, v_u_156.markWorkInProgressReceivedUpdate)
	local v177
	if v_u_7 then
		v_u_155.current = p169
		v_u_63(true)
		v177 = v_u_106(p168, p169, v175, p171, v176, p172)
		if v_u_47 then
			local v178 = p169.mode
			local v179 = v_u_80
			if bit32.band(v178, v179) ~= 0 then
				v_u_153()
				local v180 = v_u_106
				local v181 = v_u_55
				local v182, v183 = xpcall(v180, v181, p168, p169, v175, p171, v176, p172)
				if v182 then
					v177 = v183
				end
				v_u_154()
				if not v182 then
					error(v183)
				end
			end
		end
		v_u_63(false)
	else
		v177 = v_u_106(p168, p169, v175, p171, v176, p172)
	end
	if p168 ~= nil and not v_u_159 then
		v_u_108(p168, p169, p172)
		return v_u_157(p168, p169, p172)
	end
	local v184 = p169.flags
	local v185 = v_u_37
	p169.flags = bit32.bor(v184, v185)
	v_u_167(p168, p169, v177, p172)
	return p169.child
end
local function v_u_207(p187, p188, p189, p190, p191, p192) -- name: updateMemoComponent
	-- upvalues: (copy) v_u_137, (copy) v_u_7, (copy) v_u_65, (copy) v_u_29, (ref) v_u_161, (copy) v_u_8, (copy) v_u_12, (copy) v_u_57, (copy) v_u_136, (copy) v_u_10, (copy) v_u_56, (ref) v_u_157, (copy) v_u_37, (copy) v_u_138
	if p187 == nil then
		local v193 = p189.type
		if v_u_137(v193) and (p189.compare == nil and p189.defaultProps == nil) then
			local v194
			if v_u_7 then
				v194 = v_u_65(v193)
			else
				v194 = v193
			end
			p188.tag = v_u_29
			p188.type = v194
			if v_u_7 then
				validateFunctionComponentInDev(p188, v193)
			end
			return v_u_161(p187, p188, v194, p190, p191, p192)
		end
		if v_u_7 or v_u_8 then
			local v195, v196
			if type(v193) == "table" then
				v195 = v193.propTypes
				v196 = v193.validateProps
			else
				v195 = nil
				v196 = nil
			end
			if v195 or v196 then
				v_u_12(v195, v196, p190, "prop", v_u_57(v193))
			end
		end
		local v197 = v_u_136(p189.type, nil, p190, p188, p188.mode, p192)
		v197.ref = p188.ref
		v197.return_ = p188
		p188.child = v197
		return v197
	end
	if v_u_7 or v_u_8 then
		local v198 = p189.type
		local v199, v200
		if type(v198) == "table" then
			v199 = v198.propTypes
			v200 = v198.validateProps
		else
			v199 = nil
			v200 = nil
		end
		if v199 or v200 then
			v_u_12(v199, v200, p190, "prop", v_u_57(v198))
		end
	end
	local v201 = p187.child
	if not v_u_10.includesSomeLane(p191, p192) then
		local v202 = v201.memoizedProps
		local v203 = p189.compare
		if v203 == nil then
			v203 = v_u_56
		end
		if v203(v202, p190) and p187.ref == p188.ref then
			return v_u_157(p187, p188, p192)
		end
	end
	local v204 = p188.flags
	local v205 = v_u_37
	p188.flags = bit32.bor(v204, v205)
	local v206 = v_u_138(v201, p190)
	v206.ref = p188.ref
	v206.return_ = p188
	p188.child = v206
	return v206
end
local function v_u_226(p208, p209, p210, p211, p212, p213) -- name: updateSimpleMemoComponent
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_59, (copy) v_u_55, (copy) v_u_12, (copy) v_u_57, (copy) v_u_56, (ref) v_u_159, (copy) v_u_10, (ref) v_u_157, (copy) v_u_44, (copy) v_u_35, (ref) v_u_158
	if (v_u_7 or v_u_8) and p209.type ~= p209.elementType then
		local v214 = p209.elementType
		if v214["$$typeof"] == v_u_59 then
			local v215 = v214._payload
			local v216 = v214._init
			local v217 = v_u_55
			local v218, v219 = xpcall(v216, v217, v215)
			if not v218 then
				v219 = nil
			end
			local v220, v221
			if v219 == nil or type(v219) ~= "table" then
				v220 = nil
				v221 = nil
			else
				v220 = v219.propTypes
				v221 = v219.validateProps
			end
			if v220 or v221 then
				v_u_12(v220, v221, p211, "prop", v_u_57(v219))
			end
		end
	end
	if p208 ~= nil then
		local v222 = p208.memoizedProps
		local v223 = not v_u_7 and true or p209.type == p208.type
		if v_u_56(v222, p211) and (p208.ref == p209.ref and v223) then
			v_u_159 = false
			if not v_u_10.includesSomeLane(p213, p212) then
				p209.lanes = p208.lanes
				return v_u_157(p208, p209, p213)
			end
			local v224 = p208.flags
			local v225 = v_u_44
			if bit32.band(v224, v225) ~= v_u_35 then
				v_u_159 = true
			end
		end
	end
	return v_u_158(p208, p209, p210, p211, p213)
end
local function v_u_238(p227, p228, p229) -- name: updateOffscreenComponent
	-- upvalues: (copy) v_u_77, (copy) v_u_78, (copy) v_u_10, (copy) v_u_140, (copy) v_u_51, (copy) v_u_141, (copy) v_u_167
	local v230 = p228.pendingProps
	local v231 = v230.children
	local v232
	if p227 == nil then
		v232 = nil
	else
		v232 = p227.memoizedState
	end
	if v230.mode == "hidden" or v230.mode == "unstable-defer-without-hiding" then
		local v233 = p228.mode
		local v234 = v_u_77
		if bit32.band(v233, v234) == v_u_78 then
			p228.memoizedState = {
				["baseLanes"] = v_u_10.NoLanes
			}
			v_u_140(p228, p229)
		else
			if not v_u_10.includesSomeLane(p229, v_u_10.OffscreenLane) then
				if v232 ~= nil then
					local v235 = v232.baseLanes
					p229 = v_u_10.mergeLanes(v235, p229)
				end
				if v_u_51 then
					v_u_141(v_u_10.OffscreenLane)
				end
				p228.childLanes = v_u_10.laneToLanes(v_u_10.OffscreenLane)
				p228.lanes = p228.childLanes
				p228.memoizedState = {
					["baseLanes"] = p229
				}
				v_u_140(p228, p229)
				return nil
			end
			p228.memoizedState = {
				["baseLanes"] = v_u_10.NoLanes
			}
			local v236
			if v232 == nil then
				v236 = p229
			else
				v236 = v232.baseLanes
			end
			v_u_140(p228, v236)
		end
	else
		local v237
		if v232 == nil then
			v237 = p229
		else
			v237 = v_u_10.mergeLanes(v232.baseLanes, p229)
			p228.memoizedState = nil
		end
		v_u_140(p228, v237)
	end
	v_u_167(p227, p228, v231, p229)
	return p228.child
end
function updateFragment(p239, p240, p241) -- name: updateFragment
	-- upvalues: (copy) v_u_167
	v_u_167(p239, p240, p240.pendingProps, p241)
	return p240.child
end
function updateMode(p242, p243, p244) -- name: updateMode
	-- upvalues: (copy) v_u_167
	v_u_167(p242, p243, p243.pendingProps.children, p244)
	return p243.child
end
function updateProfiler(p245, p246, p247) -- name: updateProfiler
	-- upvalues: (copy) v_u_50, (copy) v_u_167
	if v_u_50 then
		local v248 = p246.stateNode
		v248.effectDuration = 0
		v248.passiveEffectDuration = 0
	end
	v_u_167(p245, p246, p246.pendingProps.children, p247)
	return p246.child
end
local function v_u_266(p249, p250, p251, p252, p253) -- name: updateFunctionComponent
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_12, (copy) v_u_57, (copy) v_u_48, (copy) v_u_112, (copy) v_u_111, (copy) v_u_102, (copy) v_u_156, (copy) v_u_155, (copy) v_u_63, (copy) v_u_106, (copy) v_u_47, (copy) v_u_80, (copy) v_u_153, (copy) v_u_55, (copy) v_u_154, (ref) v_u_159, (copy) v_u_108, (ref) v_u_157, (copy) v_u_37, (copy) v_u_167
	if (v_u_7 or v_u_8) and (type(p251) ~= "function" and p250.type ~= p250.elementType) then
		local v254, v255
		if type(p251) == "table" then
			v254 = p251.propTypes
			v255 = p251.validateProps
		else
			v254 = nil
			v255 = nil
		end
		if v254 or v255 then
			v_u_12(v254, v255, p252, "prop", v_u_57(p251))
		end
	end
	local v256
	if v_u_48 then
		v256 = nil
	else
		v256 = v_u_111(p250, (v_u_112(p250, p251, true)))
	end
	v_u_102(p250, p253, v_u_156.markWorkInProgressReceivedUpdate)
	local v257
	if v_u_7 then
		v_u_155.current = p250
		v_u_63(true)
		v257 = v_u_106(p249, p250, p251, p252, v256, p253)
		if v_u_47 then
			local v258 = p250.mode
			local v259 = v_u_80
			if bit32.band(v258, v259) ~= 0 then
				v_u_153()
				local v260 = v_u_106
				local v261 = v_u_55
				local v262, v263 = xpcall(v260, v261, p249, p250, p251, p252, v256, p253)
				v_u_154()
				if v262 then
					v257 = v263
				else
					error(v263)
				end
			end
		end
		v_u_63(false)
	else
		v257 = v_u_106(p249, p250, p251, p252, v256, p253)
	end
	if p249 ~= nil and not v_u_159 then
		v_u_108(p249, p250, p253)
		return v_u_157(p249, p250, p253)
	end
	local v264 = p250.flags
	local v265 = v_u_37
	p250.flags = bit32.bor(v264, v265)
	v_u_167(p249, p250, v257, p253)
	return p250.child
end
local function v_u_279(p267, p268, p269, p270, p271) -- name: updateClassComponent
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_12, (copy) v_u_57, (copy) v_u_115, (copy) v_u_114, (copy) v_u_102, (copy) v_u_156, (copy) v_u_38, (copy) v_u_127, (copy) v_u_128, (copy) v_u_129, (copy) v_u_130, (copy) v_u_2
	if (v_u_7 or v_u_8) and p268.type ~= p268.elementType then
		local v272 = p269.propTypes
		local v273 = p269.validateProps
		if v272 or v273 then
			v_u_12(v272, v273, p270, "prop", v_u_57(p269))
		end
	end
	local v274
	if v_u_115(p269) then
		v_u_114(p268)
		v274 = true
	else
		v274 = false
	end
	v_u_102(p268, p271, v_u_156.markWorkInProgressReceivedUpdate)
	local v275
	if p268.stateNode == nil then
		if p267 ~= nil then
			p267.alternate = nil
			p268.alternate = nil
			local v276 = p268.flags
			local v277 = v_u_38
			p268.flags = bit32.bor(v276, v277)
		end
		v_u_127(p268, p269, p270)
		v_u_128(p268, p269, p270, p271)
		v275 = true
	elseif p267 == nil then
		v275 = v_u_129(p268, p269, p270, p271)
	else
		v275 = v_u_130(p267, p268, p269, p270, p271)
	end
	local v278 = finishClassComponent(p267, p268, p269, v275, v274, p271)
	if v_u_7 and (v275 and p268.stateNode.props ~= p270) then
		if not v_u_156.didWarnAboutReassigningProps then
			v_u_2.error("It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.", v_u_57(p268.type) or "a component")
		end
		v_u_156.didWarnAboutReassigningProps = true
	end
	return v278
end
function finishClassComponent(p280, p281, p282, p283, p284, p285) -- name: finishClassComponent
	-- upvalues: (copy) v_u_42, (copy) v_u_41, (copy) v_u_35, (copy) v_u_117, (ref) v_u_157, (copy) v_u_155, (copy) v_u_50, (copy) v_u_109, (copy) v_u_7, (copy) v_u_63, (copy) v_u_47, (copy) v_u_80, (copy) v_u_153, (copy) v_u_55, (copy) v_u_154, (copy) v_u_37, (copy) v_u_70, (copy) v_u_167
	local v286 = p281.ref
	if p280 == nil and v286 ~= nil or p280 ~= nil and p280.ref ~= v286 then
		local v287 = p281.flags
		local v288 = v_u_42
		p281.flags = bit32.bor(v287, v288)
	end
	local v289 = p281.flags
	local v290 = v_u_41
	local v291 = bit32.band(v289, v290) ~= v_u_35
	if not (p283 or v291) then
		if p284 then
			v_u_117(p281, p282, false)
		end
		return v_u_157(p280, p281, p285)
	end
	local v292 = p281.stateNode
	v_u_155.current = p281
	local v293, v294, v295, v296, v297, v298
	if not v291 then
		if v_u_7 then
			v_u_63(true)
			v300 = v292:render()
			if v_u_47 then
				v293 = p281.mode
				v294 = v_u_80
				if bit32.band(v293, v294) ~= 0 then
					v_u_153()
					v295 = v292.render
					v296 = v_u_55
					v297, v298 = xpcall(v295, v296, v292)
					v_u_154()
					if not v297 then
						error(v298)
					end
				end
			end
			v_u_63(false)
		else
			v300 = v292:render()
		end
		v301 = p281.flags
		v302 = v_u_37
		p281.flags = bit32.bor(v301, v302)
		if p280 == nil or not v291 then
			v_u_167(p280, p281, v300, p285)
		else
			p281.child = v_u_70(p281, p280.child, nil, p285)
			p281.child = v_u_70(p281, nil, v300, p285)
		end
		p281.memoizedState = v292.state
		if p284 then
			v_u_117(p281, p282, true)
		end
		return p281.child
	end
	if p282.getDerivedStateFromError == nil then
		v300 = nil
		if v_u_50 then
			v_u_109(p281)
		end
		v301 = p281.flags
		v302 = v_u_37
		p281.flags = bit32.bor(v301, v302)
		if p280 == nil or not v291 then
			v_u_167(p280, p281, v300, p285)
		else
			p281.child = v_u_70(p281, p280.child, nil, p285)
			p281.child = v_u_70(p281, nil, v300, p285)
		end
		p281.memoizedState = v292.state
		if p284 then
			v_u_117(p281, p282, true)
		end
		return p281.child
	end
	local v299 = p282.getDerivedStateFromError
	if type(v299) == "function" then
		if v_u_7 then
			v_u_63(true)
			v300 = v292:render()
			if v_u_47 then
				v293 = p281.mode
				v294 = v_u_80
				if bit32.band(v293, v294) ~= 0 then
					v_u_153()
					v295 = v292.render
					v296 = v_u_55
					v297, v298 = xpcall(v295, v296, v292)
					v_u_154()
					if not v297 then
						error(v298)
					end
				end
			end
			v_u_63(false)
		else
			v300 = v292:render()
		end
		v301 = p281.flags
		v302 = v_u_37
		p281.flags = bit32.bor(v301, v302)
		if p280 == nil or not v291 then
			v_u_167(p280, p281, v300, p285)
		else
			p281.child = v_u_70(p281, p280.child, nil, p285)
			p281.child = v_u_70(p281, nil, v300, p285)
		end
		p281.memoizedState = v292.state
		if p284 then
			v_u_117(p281, p282, true)
		end
		return p281.child
	end
	local v300 = nil
	if v_u_50 then
		v_u_109(p281)
	end
	local v301 = p281.flags
	local v302 = v_u_37
	p281.flags = bit32.bor(v301, v302)
	if p280 == nil or not v291 then
		v_u_167(p280, p281, v300, p285)
	else
		p281.child = v_u_70(p281, p280.child, nil, p285)
		p281.child = v_u_70(p281, nil, v300, p285)
	end
	p281.memoizedState = v292.state
	if p284 then
		v_u_117(p281, p282, true)
	end
	return p281.child
end
local function v_u_323(p303, p304, p305) -- name: updateHostRoot
	-- upvalues: (copy) v_u_116, (copy) v_u_90, (copy) v_u_54, (copy) v_u_74, (copy) v_u_73, (copy) v_u_119, (ref) v_u_157, (copy) v_u_120, (copy) v_u_87, (copy) v_u_150, (copy) v_u_69, (copy) v_u_38, (copy) v_u_39, (copy) v_u_167
	local v306 = p304.stateNode
	if v306.pendingContext then
		v_u_116(p304, v306.pendingContext, v306.pendingContext ~= v306.context)
	elseif v306.context then
		v_u_116(p304, v306.context, false)
	end
	v_u_90(p304, v306.containerInfo)
	local v307 = p304.updateQueue
	local v308 = v_u_54
	local v309
	if p303 == nil then
		v309 = false
	else
		v309 = v307 ~= nil
	end
	v308(v309, "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.")
	local v310 = p304.pendingProps
	local v311 = p304.memoizedState
	local v312
	if v311 == nil then
		v312 = nil
	else
		v312 = v311.element
	end
	v_u_74(p303, p304)
	v_u_73(p304, v310, nil, p305)
	local v313 = p304.memoizedState.element
	if v313 == v312 then
		v_u_119()
		return v_u_157(p303, p304, p305)
	end
	local v314 = p304.stateNode
	if v314.hydrate and v_u_120(p304) then
		if v_u_87 then
			local v315 = v314.mutableSourceEagerHydrationData
			if v315 ~= nil then
				for v316 = 1, #v315, 2 do
					v_u_150(v315[v316], v315[v316 + 1])
				end
			end
		end
		local v317 = v_u_69(p304, nil, v313, p305)
		p304.child = v317
		while v317 do
			local v318 = v317.flags
			local v319 = v_u_38
			local v320 = bit32.bnot(v319)
			local v321 = bit32.band(v318, v320)
			local v322 = v_u_39
			v317.flags = bit32.bor(v321, v322)
			v317 = v317.sibling
		end
	else
		v_u_167(p303, p304, v313, p305)
		v_u_119()
	end
	return p304.child
end
local function v_u_338(p324, p325, p326) -- name: updateHostComponent
	-- upvalues: (copy) v_u_89, (copy) v_u_122, (copy) v_u_83, (copy) v_u_40, (copy) v_u_37, (copy) v_u_42, (copy) v_u_167
	v_u_89(p325)
	if p324 == nil then
		v_u_122(p325)
	end
	local v327 = p325.type
	local v328 = p325.pendingProps
	local v329
	if p324 == nil then
		v329 = nil
	else
		v329 = p324.memoizedProps
	end
	local v330 = v328.children
	if v_u_83(v327, v328) then
		v330 = nil
	elseif v329 ~= nil and v_u_83(v327, v329) then
		local v331 = p325.flags
		local v332 = v_u_40
		p325.flags = bit32.bor(v331, v332)
	end
	local v333 = p325.flags
	local v334 = v_u_37
	p325.flags = bit32.bor(v333, v334)
	local v335 = p325.ref
	if p324 == nil and v335 ~= nil or p324 ~= nil and p324.ref ~= v335 then
		local v336 = p325.flags
		local v337 = v_u_42
		p325.flags = bit32.bor(v336, v337)
	end
	v_u_167(p324, p325, v330, p326)
	return p325.child
end
local function v_u_354(p339, p340, p341, p342, p343) -- name: mountLazyComponent
	-- upvalues: (copy) v_u_38, (copy) v_u_133, (copy) v_u_131, (copy) v_u_14, (copy) v_u_7, (copy) v_u_65, (ref) v_u_266, (copy) v_u_15, (copy) v_u_67, (copy) v_u_279, (copy) v_u_20, (copy) v_u_66, (copy) v_u_186, (copy) v_u_28, (copy) v_u_8, (copy) v_u_12, (copy) v_u_57, (copy) v_u_207, (copy) v_u_59, (copy) v_u_6, (copy) v_u_54
	if p339 ~= nil then
		p339.alternate = nil
		p340.alternate = nil
		local v344 = p340.flags
		local v345 = v_u_38
		p340.flags = bit32.bor(v344, v345)
	end
	local v346 = p340.pendingProps
	local v347 = p341._payload
	local v348 = p341._init(v347)
	p340.type = v348
	p340.tag = v_u_133(v348)
	local v349 = p340.tag
	local v350 = v_u_131(v348, v346)
	if v349 == v_u_14 then
		if v_u_7 then
			validateFunctionComponentInDev(p340, v348)
			v348 = v_u_65(v348)
			p340.type = v348
		end
		return v_u_266(nil, p340, v348, v350, p343)
	end
	if v349 == v_u_15 then
		if v_u_7 then
			v348 = v_u_67(v348)
			p340.type = v348
		end
		return v_u_279(nil, p340, v348, v350, p343)
	end
	if v349 == v_u_20 then
		if v_u_7 then
			v348 = v_u_66(v348)
			p340.type = v348
		end
		return v_u_186(nil, p340, v348, v350, p343)
	end
	if v349 == v_u_28 then
		if (v_u_7 or v_u_8) and p340.type ~= p340.elementType then
			local v351 = v348.propTypes
			local v352 = v348.validateProps
			if v351 or v352 then
				v_u_12(v351, v352, v350, "prop", v_u_57(v348))
			end
		end
		return v_u_207(nil, p340, v348, v_u_131(v348.type, v350), p342, p343)
	end
	local v353 = ""
	if v_u_7 then
		if v348 == nil or (type(v348) ~= "table" or v348["$$typeof"] ~= v_u_59) then
			if type(v348) == "table" and v348["$$typeof"] == nil then
				v353 = "\n" .. v_u_6(v348)
			end
		else
			v353 = " Did you wrap a component in React.lazy() more than once?"
		end
	end
	v_u_54(false, "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s", tostring(v348), v353)
	return nil
end
function mountIncompleteClassComponent(p355, p356, p357, p358, p359) -- name: mountIncompleteClassComponent
	-- upvalues: (copy) v_u_38, (copy) v_u_15, (copy) v_u_115, (copy) v_u_114, (copy) v_u_102, (copy) v_u_156, (copy) v_u_127, (copy) v_u_128
	if p355 ~= nil then
		p355.alternate = nil
		p356.alternate = nil
		local v360 = p356.flags
		local v361 = v_u_38
		p356.flags = bit32.bor(v360, v361)
	end
	p356.tag = v_u_15
	local v362
	if v_u_115(p357) then
		v_u_114(p356)
		v362 = true
	else
		v362 = false
	end
	v_u_102(p356, p359, v_u_156.markWorkInProgressReceivedUpdate)
	v_u_127(p356, p357, p358)
	v_u_128(p356, p357, p358, p359)
	return finishClassComponent(nil, p356, p357, true, v362, p359)
end
local function v_u_391(p363, p364, p365, p366) -- name: mountIndeterminateComponent
	-- upvalues: (copy) v_u_38, (copy) v_u_48, (copy) v_u_112, (copy) v_u_111, (copy) v_u_102, (copy) v_u_156, (copy) v_u_7, (copy) v_u_57, (copy) v_u_160, (copy) v_u_2, (copy) v_u_80, (copy) v_u_60, (copy) v_u_63, (copy) v_u_155, (copy) v_u_106, (copy) v_u_37, (copy) v_u_49, (copy) v_u_15, (copy) v_u_115, (copy) v_u_114, (copy) v_u_75, (copy) v_u_126, (copy) v_u_125, (copy) v_u_128, (copy) v_u_14, (copy) v_u_47, (copy) v_u_153, (copy) v_u_55, (copy) v_u_154, (copy) v_u_69
	if p363 ~= nil then
		p363.alternate = nil
		p364.alternate = nil
		local v367 = p364.flags
		local v368 = v_u_38
		p364.flags = bit32.bor(v367, v368)
	end
	local v369 = p364.pendingProps
	local v370
	if v_u_48 then
		v370 = nil
	else
		v370 = v_u_111(p364, (v_u_112(p364, p365, false)))
	end
	v_u_102(p364, p366, v_u_156.markWorkInProgressReceivedUpdate)
	local v371
	if v_u_7 then
		if type(p365) == "table" then
			local v372 = p365.render
			if type(v372) == "function" then
				local v373 = v_u_57(p365) or "Unknown"
				if not v_u_160.didWarnAboutBadClass[v373] then
					v_u_2.error("The <%s /> component appears to have a render method, but doesn\'t extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.", v373, v373)
					v_u_160.didWarnAboutBadClass[v373] = true
				end
			end
		end
		local v374 = p364.mode
		local v375 = v_u_80
		if bit32.band(v374, v375) ~= 0 then
			v_u_60.recordLegacyContextWarning(p364)
		end
		v_u_63(true)
		v_u_155.current = p364
		v371 = v_u_106(nil, p364, p365, v369, v370, p366)
		v_u_63(false)
	else
		v371 = v_u_106(nil, p364, p365, v369, v370, p366)
	end
	local v376 = p364.flags
	local v377 = v_u_37
	p364.flags = bit32.bor(v376, v377)
	local v378 = type(v371)
	if v_u_7 and (v371 ~= nil and v378 == "table") then
		local v379 = v371.render
		if type(v379) == "function" and v371["$$typeof"] == nil then
			local v380 = v_u_57(p365) or "Unknown"
			if not v_u_160.didWarnAboutModulePatternComponent[v380] then
				v_u_2.error("The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ", v380, v380)
				v_u_160.didWarnAboutModulePatternComponent[v380] = true
			end
		end
	end
	if not v_u_49 and (v371 ~= nil and v378 == "table") then
		local v381 = v371.render
		if type(v381) == "function" and v371["$$typeof"] == nil then
			if v_u_7 then
				local v382 = v_u_57(p365) or "Unknown"
				if not v_u_160.didWarnAboutModulePatternComponent[v382] then
					v_u_2.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v382, v382)
					v_u_160.didWarnAboutModulePatternComponent[v382] = true
				end
			end
			p364.tag = v_u_15
			p364.memoizedState = nil
			p364.updateQueue = nil
			local v383
			if v_u_115(p365) then
				v_u_114(p364)
				v383 = true
			else
				v383 = false
			end
			p364.memoizedState = v371.state
			v_u_75(p364)
			local v384
			if type(p365) == "function" then
				v384 = nil
			else
				v384 = p365.getDerivedStateFromProps
			end
			if v384 ~= nil and type(v384) == "function" then
				v_u_126(p364, p365, v384, v369)
			end
			v_u_125(p364, v371)
			v_u_128(p364, p365, v369, p366)
			return finishClassComponent(nil, p364, p365, true, v383, p366)
		end
	end
	p364.tag = v_u_14
	if v_u_7 then
		if v_u_48 and p365.contextTypes then
			v_u_2.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.", v_u_57(p365) or "Unknown")
		end
		if v_u_47 then
			local v385 = p364.mode
			local v386 = v_u_80
			if bit32.band(v385, v386) ~= 0 then
				v_u_153()
				local v387 = v_u_106
				local v388 = v_u_55
				local v389, v390 = xpcall(v387, v388, nil, p364, p365, v369, v370, p366)
				v_u_154()
				if v389 then
					v371 = v390
				else
					error(v390)
				end
			end
		end
	end
	p364.child = v_u_69(p364, nil, v371, p366)
	if v_u_7 then
		validateFunctionComponentInDev(p364, p365)
	end
	return p364.child
end
function validateFunctionComponentInDev(p392, p393) -- name: validateFunctionComponentInDev
	-- upvalues: (copy) v_u_7, (copy) v_u_62, (copy) v_u_160, (copy) v_u_2, (copy) v_u_53, (copy) v_u_57
	if v_u_7 then
		if p392.ref ~= nil then
			local v394 = ""
			local v395 = v_u_62()
			if v395 then
				v394 = v394 .. "\n\nCheck the render method of `" .. v395 .. "`."
			end
			local v396 = v395 or (p392._debugID or "")
			local v397 = p392._debugSource
			if v397 then
				v396 = v397.fileName .. ":" .. v397.lineNumber
			end
			if not v_u_160.didWarnAboutFunctionRefs[v396] then
				v_u_160.didWarnAboutFunctionRefs[v396] = true
				v_u_2.error("Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s", v394)
			end
		end
		if v_u_53 and (type(p393) ~= "function" and p393.defaultProps ~= nil) then
			local v398 = v_u_57(p393) or "Unknown"
			if not v_u_160.didWarnAboutDefaultPropsOnFunctionComponent[v398] then
				v_u_2.error("%s: Support for defaultProps will be removed from function components in a future major release.", v398)
				v_u_160.didWarnAboutDefaultPropsOnFunctionComponent[v398] = true
			end
		end
		if type(p393) ~= "function" and p393.getDerivedStateFromProps ~= nil then
			local v399 = p393.getDerivedStateFromProps
			if type(v399) == "function" then
				local v400 = v_u_57(p393) or "Unknown"
				if not v_u_160.didWarnAboutGetDerivedStateOnFunctionComponent[v400] then
					v_u_2.error("%s: Function components do not support getDerivedStateFromProps.", v400)
					v_u_160.didWarnAboutGetDerivedStateOnFunctionComponent[v400] = true
				end
			end
		end
		if type(p393) ~= "function" and p393.contextType ~= nil then
			local v401 = p393.contextType
			if type(v401) == "table" then
				local v402 = v_u_57(p393) or "Unknown"
				if not v_u_160.didWarnAboutContextTypeOnFunctionComponent[v402] then
					v_u_2.error("%s: Function components do not support contextType.", v402)
					v_u_160.didWarnAboutContextTypeOnFunctionComponent[v402] = true
				end
			end
		end
	end
end
local v_u_403 = {
	["dehydrated"] = nil,
	["retryLane"] = nil,
	["retryLane"] = v_u_10.NoLane
}
local v_u_404 = nil
local v_u_405 = nil
local v_u_406 = nil
local v_u_407 = nil
local v_u_408 = nil
local function v_u_448(p409, p410, p411) -- name: updateSuspenseComponent
	-- upvalues: (copy) v_u_7, (copy) v_u_104, (copy) v_u_41, (copy) v_u_91, (copy) v_u_35, (copy) v_u_92, (copy) v_u_93, (copy) v_u_94, (copy) v_u_95, (copy) v_u_97, (copy) v_u_96, (copy) v_u_122, (copy) v_u_52, (ref) v_u_405, (copy) v_u_403, (copy) v_u_10, (copy) v_u_51, (copy) v_u_141, (ref) v_u_406, (ref) v_u_408, (ref) v_u_407, (ref) v_u_404
	local v412 = p410.pendingProps
	if v_u_7 then
		if not v_u_104.shouldSuspendRef then
			v_u_104.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend
		end
		if v_u_104.shouldSuspendRef(p410) then
			local v413 = p410.flags
			local v414 = v_u_41
			p410.flags = bit32.bor(v413, v414)
		end
	end
	local v415 = v_u_91.current
	local v416 = false
	local v417 = p410.flags
	local v418 = v_u_41
	local v419 = bit32.band(v417, v418) ~= v_u_35
	local v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v438
	if v419 then
		v440 = p410.flags
		v441 = v_u_41
		v442 = bit32.bnot(v441)
		p410.flags = bit32.band(v440, v442)
		v416 = true
		v_u_96(p410, (v_u_97(v415)))
		if p409 == nil then
			if v412.fallback ~= nil then
				v_u_122(p410)
				if v_u_52 then
					v420 = p410.memoizedState
					if v420 ~= nil then
						v421 = v420.dehydrated
						if v421 ~= nil then
							return v_u_405(p410, v421, p411)
						end
					end
				end
			end
			v422 = v412.children
			v423 = v412.fallback
			if not v416 then
				if v412.unstable_expectedLoadTime ~= nil then
					v424 = v412.unstable_expectedLoadTime
					if type(v424) == "number" then
						v425 = mountSuspenseFallbackChildren(p410, v422, v423, p411)
						p410.child.memoizedState = {
							["baseLanes"] = p411
						}
						p410.memoizedState = v_u_403
						p410.lanes = v_u_10.SomeRetryLane
						if v_u_51 then
							v_u_141(v_u_10.SomeRetryLane)
						end
						return v425
					end
				end
				return v_u_406(p410, v422, p411)
			end
			v426 = mountSuspenseFallbackChildren(p410, v422, v423, p411)
			p410.child.memoizedState = {
				["baseLanes"] = p411
			}
			p410.memoizedState = v_u_403
			return v426
		end
		v443 = p409.memoizedState
		if v443 == nil then
			if not v416 then
				v427 = v_u_404(p409, p410, v412.children, p411)
				p410.memoizedState = nil
				return v427
			end
			v428 = v412.fallback
			v429 = v_u_407(p409, p410, v412.children, v428, p411)
			v430 = p410.child
			v431 = p409.child.memoizedState
			if v431 == nil then
				v430.memoizedState = {
					["baseLanes"] = p411
				}
			else
				v430.memoizedState = {
					["baseLanes"] = v_u_10.mergeLanes(v431.baseLanes, p411)
				}
			end
			v430.childLanes = v_u_10.removeLanes(p409.childLanes, p411)
			p410.memoizedState = v_u_403
			return v429
		end
		if v_u_52 then
			v432 = v443.dehydrated
			if v432 ~= nil then
				if not v419 then
					return v_u_408(p409, p410, v432, v443, p411)
				end
				if p410.memoizedState ~= nil then
					p410.child = p409.child
					v433 = p410.flags
					v434 = v_u_41
					p410.flags = bit32.bor(v433, v434)
					return nil
				end
				v435 = v412.children
				v436 = v412.fallback
				v437 = mountSuspenseFallbackAfterRetryWithoutHydrating(p409, p410, v435, v436, p411)
				p410.child.memoizedState = {
					["baseLanes"] = p411
				}
				p410.memoizedState = v_u_403
				return v437
			end
		end
		if not v416 then
			v438 = v_u_404(p409, p410, v412.children, p411)
			p410.memoizedState = nil
			return v438
		end
		v444 = v412.fallback
		v445 = v_u_407(p409, p410, v412.children, v444, p411)
		v446 = p410.child
		v447 = p409.child.memoizedState
		if v447 == nil then
			v446.memoizedState = {
				["baseLanes"] = p411
			}
		else
			v446.memoizedState = {
				["baseLanes"] = v_u_10.mergeLanes(v447.baseLanes, p411)
			}
		end
		v446.childLanes = v_u_10.removeLanes(p409.childLanes, p411)
		p410.memoizedState = v_u_403
		return v445
	end
	local v439
	if p409 == nil or p409.memoizedState ~= nil then
		v439 = v_u_92(v415, v_u_93)
	else
		v439 = false
	end
	if not v439 then
		if (p409 == nil or p409.memoizedState ~= nil) and (v412.fallback ~= nil and v412.unstable_avoidThisFallback ~= true) then
			v415 = v_u_94(v415, v_u_95)
		end
		v_u_96(p410, (v_u_97(v415)))
		if p409 == nil then
			if v412.fallback ~= nil then
				v_u_122(p410)
				if v_u_52 then
					v420 = p410.memoizedState
					if v420 ~= nil then
						v421 = v420.dehydrated
						if v421 ~= nil then
							return v_u_405(p410, v421, p411)
						end
					end
				end
			end
			v422 = v412.children
			v423 = v412.fallback
			if not v416 then
				if v412.unstable_expectedLoadTime ~= nil then
					v424 = v412.unstable_expectedLoadTime
					if type(v424) == "number" then
						v425 = mountSuspenseFallbackChildren(p410, v422, v423, p411)
						p410.child.memoizedState = {
							["baseLanes"] = p411
						}
						p410.memoizedState = v_u_403
						p410.lanes = v_u_10.SomeRetryLane
						if v_u_51 then
							v_u_141(v_u_10.SomeRetryLane)
						end
						return v425
					end
				end
				return v_u_406(p410, v422, p411)
			end
			v426 = mountSuspenseFallbackChildren(p410, v422, v423, p411)
			p410.child.memoizedState = {
				["baseLanes"] = p411
			}
			p410.memoizedState = v_u_403
			return v426
		end
		v443 = p409.memoizedState
		if v443 == nil then
			if not v416 then
				v427 = v_u_404(p409, p410, v412.children, p411)
				p410.memoizedState = nil
				return v427
			end
			v428 = v412.fallback
			v429 = v_u_407(p409, p410, v412.children, v428, p411)
			v430 = p410.child
			v431 = p409.child.memoizedState
			if v431 == nil then
				v430.memoizedState = {
					["baseLanes"] = p411
				}
			else
				v430.memoizedState = {
					["baseLanes"] = v_u_10.mergeLanes(v431.baseLanes, p411)
				}
			end
			v430.childLanes = v_u_10.removeLanes(p409.childLanes, p411)
			p410.memoizedState = v_u_403
			return v429
		end
		if v_u_52 then
			v432 = v443.dehydrated
			if v432 ~= nil then
				if not v419 then
					return v_u_408(p409, p410, v432, v443, p411)
				end
				if p410.memoizedState ~= nil then
					p410.child = p409.child
					v433 = p410.flags
					v434 = v_u_41
					p410.flags = bit32.bor(v433, v434)
					return nil
				end
				v435 = v412.children
				v436 = v412.fallback
				v437 = mountSuspenseFallbackAfterRetryWithoutHydrating(p409, p410, v435, v436, p411)
				p410.child.memoizedState = {
					["baseLanes"] = p411
				}
				p410.memoizedState = v_u_403
				return v437
			end
		end
		if not v416 then
			v438 = v_u_404(p409, p410, v412.children, p411)
			p410.memoizedState = nil
			return v438
		end
		v444 = v412.fallback
		v445 = v_u_407(p409, p410, v412.children, v444, p411)
		v446 = p410.child
		v447 = p409.child.memoizedState
		if v447 == nil then
			v446.memoizedState = {
				["baseLanes"] = p411
			}
		else
			v446.memoizedState = {
				["baseLanes"] = v_u_10.mergeLanes(v447.baseLanes, p411)
			}
		end
		v446.childLanes = v_u_10.removeLanes(p409.childLanes, p411)
		p410.memoizedState = v_u_403
		return v445
	end
	local v440 = p410.flags
	local v441 = v_u_41
	local v442 = bit32.bnot(v441)
	p410.flags = bit32.band(v440, v442)
	v416 = true
	v_u_96(p410, (v_u_97(v415)))
	if p409 == nil then
		if v412.fallback ~= nil then
			v_u_122(p410)
			if v_u_52 then
				v420 = p410.memoizedState
				if v420 ~= nil then
					v421 = v420.dehydrated
					if v421 ~= nil then
						return v_u_405(p410, v421, p411)
					end
				end
			end
		end
		v422 = v412.children
		v423 = v412.fallback
		if not v416 then
			if v412.unstable_expectedLoadTime ~= nil then
				v424 = v412.unstable_expectedLoadTime
				if type(v424) == "number" then
					v425 = mountSuspenseFallbackChildren(p410, v422, v423, p411)
					p410.child.memoizedState = {
						["baseLanes"] = p411
					}
					p410.memoizedState = v_u_403
					p410.lanes = v_u_10.SomeRetryLane
					if v_u_51 then
						v_u_141(v_u_10.SomeRetryLane)
					end
					return v425
				end
			end
			return v_u_406(p410, v422, p411)
		end
		v426 = mountSuspenseFallbackChildren(p410, v422, v423, p411)
		p410.child.memoizedState = {
			["baseLanes"] = p411
		}
		p410.memoizedState = v_u_403
		return v426
	end
	local v443 = p409.memoizedState
	if v443 == nil then
		if not v416 then
			v427 = v_u_404(p409, p410, v412.children, p411)
			p410.memoizedState = nil
			return v427
		end
		v428 = v412.fallback
		v429 = v_u_407(p409, p410, v412.children, v428, p411)
		v430 = p410.child
		v431 = p409.child.memoizedState
		if v431 == nil then
			v430.memoizedState = {
				["baseLanes"] = p411
			}
		else
			v430.memoizedState = {
				["baseLanes"] = v_u_10.mergeLanes(v431.baseLanes, p411)
			}
		end
		v430.childLanes = v_u_10.removeLanes(p409.childLanes, p411)
		p410.memoizedState = v_u_403
		return v429
	end
	if v_u_52 then
		v432 = v443.dehydrated
		if v432 ~= nil then
			if not v419 then
				return v_u_408(p409, p410, v432, v443, p411)
			end
			if p410.memoizedState ~= nil then
				p410.child = p409.child
				v433 = p410.flags
				v434 = v_u_41
				p410.flags = bit32.bor(v433, v434)
				return nil
			end
			v435 = v412.children
			v436 = v412.fallback
			v437 = mountSuspenseFallbackAfterRetryWithoutHydrating(p409, p410, v435, v436, p411)
			p410.child.memoizedState = {
				["baseLanes"] = p411
			}
			p410.memoizedState = v_u_403
			return v437
		end
	end
	if not v416 then
		v438 = v_u_404(p409, p410, v412.children, p411)
		p410.memoizedState = nil
		return v438
	end
	local v444 = v412.fallback
	local v445 = v_u_407(p409, p410, v412.children, v444, p411)
	local v446 = p410.child
	local v447 = p409.child.memoizedState
	if v447 == nil then
		v446.memoizedState = {
			["baseLanes"] = p411
		}
	else
		v446.memoizedState = {
			["baseLanes"] = v_u_10.mergeLanes(v447.baseLanes, p411)
		}
	end
	v446.childLanes = v_u_10.removeLanes(p409.childLanes, p411)
	p410.memoizedState = v_u_403
	return v445
end
v_u_406 = function(p449, p450, p451) -- name: mountSuspensePrimaryChildren
	-- upvalues: (copy) v_u_135
	local v452 = v_u_135({
		["mode"] = "visible",
		["children"] = nil,
		["children"] = p450
	}, p449.mode, p451, nil)
	v452.return_ = p449
	p449.child = v452
	return v452
end
function mountSuspenseFallbackChildren(p453, p454, p455, p456) -- name: mountSuspenseFallbackChildren
	-- upvalues: (copy) v_u_81, (copy) v_u_78, (copy) v_u_10, (copy) v_u_50, (copy) v_u_79, (copy) v_u_134, (copy) v_u_135
	local v457 = p453.mode
	local v458 = p453.child
	local v459 = {
		["mode"] = "hidden",
		["children"] = nil,
		["children"] = p454
	}
	local v460 = v_u_81
	local v461
	if bit32.band(v457, v460) == v_u_78 and v458 ~= nil then
		v458.childLanes = v_u_10.NoLanes
		v458.pendingProps = v459
		if v_u_50 then
			local v462 = p453.mode
			local v463 = v_u_79
			if bit32.band(v462, v463) ~= 0 then
				v458.actualDuration = 0
				v458.actualStartTime = -1
				v458.selfBaseDuration = 0
				v458.treeBaseDuration = 0
			end
		end
		v461 = v_u_134(p455, v457, p456, nil)
	else
		v458 = v_u_135(v459, v457, v_u_10.NoLanes, nil)
		v461 = v_u_134(p455, v457, p456, nil)
	end
	v458.return_ = p453
	v461.return_ = p453
	v458.sibling = v461
	p453.child = v458
	return v461
end
v_u_404 = function(p464, p465, p466, p467) -- name: updateSuspensePrimaryChildren
	-- upvalues: (copy) v_u_138, (copy) v_u_81, (copy) v_u_78, (copy) v_u_43
	local v468 = p464.child
	local v469 = v468.sibling
	local v470 = v_u_138(v468, {
		["mode"] = "visible",
		["children"] = nil,
		["children"] = p466
	})
	local v471 = p465.mode
	local v472 = v_u_81
	if bit32.band(v471, v472) == v_u_78 then
		v470.lanes = p467
	end
	v470.return_ = p465
	v470.sibling = nil
	if v469 ~= nil then
		local v473 = p465.deletions
		if v473 == nil then
			p465.deletions = { v469 }
			local v474 = p465.flags
			local v475 = v_u_43
			p465.flags = bit32.bor(v474, v475)
		else
			table.insert(v473, v469)
		end
	end
	p465.child = v470
	return v470
end
v_u_407 = function(p476, p477, p478, p479, p480) -- name: updateSuspenseFallbackChildren
	-- upvalues: (copy) v_u_81, (copy) v_u_78, (copy) v_u_10, (copy) v_u_50, (copy) v_u_79, (copy) v_u_138, (copy) v_u_36, (copy) v_u_134, (copy) v_u_38
	local v481 = p477.mode
	local v482 = p476.child
	local v483 = v482.sibling
	local v484 = {
		["mode"] = "hidden",
		["children"] = nil,
		["children"] = p478
	}
	local v485 = v_u_81
	local v486
	if bit32.band(v481, v485) == v_u_78 and p477.child ~= v482 then
		v486 = p477.child
		v486.childLanes = v_u_10.NoLanes
		v486.pendingProps = v484
		if v_u_50 then
			local v487 = p477.mode
			local v488 = v_u_79
			if bit32.band(v487, v488) ~= 0 then
				v486.actualDuration = 0
				v486.actualStartTime = -1
				v486.selfBaseDuration = v482.selfBaseDuration
				v486.treeBaseDuration = v482.treeBaseDuration
			end
		end
		p477.deletions = nil
	else
		v486 = v_u_138(v482, v484)
		local v489 = v482.subtreeFlags
		local v490 = v_u_36
		v486.subtreeFlags = bit32.band(v489, v490)
	end
	local v491
	if v483 == nil then
		v491 = v_u_134(p479, v481, p480, nil)
		local v492 = v491.flags
		local v493 = v_u_38
		v491.flags = bit32.bor(v492, v493)
	else
		v491 = v_u_138(v483, p479)
	end
	v491.return_ = p477
	v486.return_ = p477
	v486.sibling = v491
	p477.child = v486
	return v491
end
function mountSuspenseFallbackAfterRetryWithoutHydrating(p494, p495, p496, p497, p498) -- name: mountSuspenseFallbackAfterRetryWithoutHydrating
	-- upvalues: (copy) v_u_135, (copy) v_u_10, (copy) v_u_134, (copy) v_u_38, (copy) v_u_81, (copy) v_u_78, (copy) v_u_70
	local v499 = p495.mode
	local v500 = v_u_135(p496, v499, v_u_10.NoLanes, nil)
	local v501 = v_u_134(p497, v499, p498, nil)
	local v502 = v501.flags
	local v503 = v_u_38
	v501.flags = bit32.bor(v502, v503)
	v500.return_ = p495
	v501.return_ = p495
	v500.sibling = v501
	p495.child = v500
	local v504 = p495.mode
	local v505 = v_u_81
	if bit32.band(v504, v505) ~= v_u_78 then
		v_u_70(p495, p494.child, nil, p498)
	end
	return v501
end
v_u_405 = function(p506, p507, _) -- name: mountDehydratedSuspenseComponent
	-- upvalues: (copy) v_u_81, (copy) v_u_78, (copy) v_u_7, (copy) v_u_2, (copy) v_u_10, (copy) v_u_85, (copy) v_u_51, (copy) v_u_141
	local v508 = p506.mode
	local v509 = v_u_81
	if bit32.band(v508, v509) == v_u_78 then
		if v_u_7 then
			v_u_2.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.")
		end
		p506.lanes = v_u_10.laneToLanes(v_u_10.SyncLane)
	elseif v_u_85(p507) then
		if v_u_51 then
			v_u_141(v_u_10.DefaultHydrationLane)
		end
		p506.lanes = v_u_10.laneToLanes(v_u_10.DefaultHydrationLane)
	else
		p506.lanes = v_u_10.laneToLanes(v_u_10.OffscreenLane)
		if v_u_51 then
			v_u_141(v_u_10.OffscreenLane)
		end
	end
	return nil
end
v_u_408 = function(p_u_510, p511, p512, p513, p514) -- name: updateDehydratedSuspenseComponent
	-- upvalues: (copy) v_u_123, (copy) v_u_146, (copy) v_u_147, (copy) v_u_148, (copy) v_u_70, (ref) v_u_406, (copy) v_u_38, (copy) v_u_81, (copy) v_u_78, (copy) v_u_85, (copy) v_u_10, (ref) v_u_159, (copy) v_u_145, (copy) v_u_143, (copy) v_u_144, (copy) v_u_84, (copy) v_u_41, (copy) v_u_142, (copy) v_u_51, (ref) v_u_149, (copy) v_u_1, (copy) v_u_86, (copy) v_u_121, (copy) v_u_39
	v_u_123()
	local v515 = v_u_146()
	local v516 = v_u_147
	if bit32.band(v515, v516) ~= v_u_148 then
		v_u_70(p511, p_u_510.child, nil, p514)
		local v517 = v_u_406(p511, p511.pendingProps.children, p514)
		local v518 = v517.flags
		local v519 = v_u_38
		v517.flags = bit32.bor(v518, v519)
		p511.memoizedState = nil
		return v517
	end
	local v520 = p511.mode
	local v521 = v_u_81
	if bit32.band(v520, v521) == v_u_78 then
		v_u_70(p511, p_u_510.child, nil, p514)
		local v522 = v_u_406(p511, p511.pendingProps.children, p514)
		local v523 = v522.flags
		local v524 = v_u_38
		v522.flags = bit32.bor(v523, v524)
		p511.memoizedState = nil
		return v522
	end
	if v_u_85(p512) then
		v_u_70(p511, p_u_510.child, nil, p514)
		local v525 = v_u_406(p511, p511.pendingProps.children, p514)
		local v526 = v525.flags
		local v527 = v_u_38
		v525.flags = bit32.bor(v526, v527)
		p511.memoizedState = nil
		return v525
	end
	if not (v_u_159 or v_u_10.includesSomeLane(p514, p_u_510.childLanes)) then
		if not v_u_84(p512) then
			v_u_121(p511, p512)
			local v528 = v_u_406(p511, p511.pendingProps.children, p514)
			local v529 = v528.flags
			local v530 = v_u_39
			v528.flags = bit32.bor(v529, v530)
			return v528
		end
		local v531 = p511.flags
		local v532 = v_u_41
		p511.flags = bit32.bor(v531, v532)
		p511.child = p_u_510.child
		local function v533()
			-- upvalues: (ref) v_u_142, (copy) p_u_510
			return v_u_142(p_u_510)
		end
		if v_u_51 then
			if v_u_149 == nil then
				v_u_149 = require(v_u_1.Scheduler).tracing.unstable_wrap
			end
			v533 = v_u_149(v533)
		end
		v_u_86(p512, v533)
		return nil
	end
	local v534 = v_u_145()
	if v534 ~= nil then
		local v535 = v_u_10.getBumpedLaneForHydration(v534, p514)
		if v535 ~= v_u_10.NoLane and v535 ~= p513.retryLane then
			p513.retryLane = v535
			v_u_143(p_u_510, v535, v_u_10.NoTimestamp)
		end
	end
	v_u_144()
	v_u_70(p511, p_u_510.child, nil, p514)
	local v536 = v_u_406(p511, p511.pendingProps.children, p514)
	local v537 = v536.flags
	local v538 = v_u_38
	v536.flags = bit32.bor(v537, v538)
	p511.memoizedState = nil
	return v536
end
function updatePortalComponent(p539, p540, p541) -- name: updatePortalComponent
	-- upvalues: (copy) v_u_90, (copy) v_u_70, (copy) v_u_167
	v_u_90(p540, p540.stateNode.containerInfo)
	local v542 = p540.pendingProps
	if p539 == nil then
		p540.child = v_u_70(p540, nil, v542, p541)
	else
		v_u_167(p539, p540, v542, p541)
	end
	return p540.child
end
local v_u_543 = false
local function v_u_554(p544, p545, p546) -- name: updateContextProvider
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (ref) v_u_543, (copy) v_u_2, (copy) v_u_12, (copy) v_u_103, (copy) v_u_101, (copy) v_u_113, (ref) v_u_157, (copy) v_u_99, (copy) v_u_167
	local v547 = p545.type._context
	local v548 = p545.pendingProps
	local v549 = p545.memoizedProps
	local v550 = v548.value
	if v_u_7 or v_u_8 then
		if v_u_4.indexOf(v_u_5.keys(v548), "value") < 1 and not v_u_543 then
			v_u_543 = true
			v_u_2.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?")
		end
		local v551 = p545.type.propTypes
		local v552 = p545.type.validateProps
		if v551 or v552 then
			v_u_12(v551, v552, v548, "prop", "Context.Provider")
		end
	end
	v_u_103(p545, v550)
	if v549 ~= nil then
		local v553 = v_u_101(v547, v550, v549.value)
		if v553 == 0 then
			if v549.children == v548.children and not v_u_113() then
				return v_u_157(p544, p545, p546)
			end
		else
			v_u_99(p545, v547, v553, p546)
		end
	end
	v_u_167(p544, p545, v548.children, p546)
	return p545.child
end
local v_u_555 = {
	["usingContextAsConsumer"] = false,
	["usingLegacyConsumer"] = false
}
function updateContextConsumer(p556, p557, p558) -- name: updateContextConsumer
	-- upvalues: (copy) v_u_7, (copy) v_u_555, (copy) v_u_2, (copy) v_u_9, (copy) v_u_102, (copy) v_u_156, (copy) v_u_100, (copy) v_u_155, (copy) v_u_63, (copy) v_u_37, (copy) v_u_167
	local v559 = p557.type
	if v_u_7 then
		if v559._context == nil then
			if v559 ~= v559.Consumer and not v_u_555.usingContextAsConsumer then
				v_u_555.usingContextAsConsumer = true
				v_u_2.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?")
			end
		else
			v559 = v559._context
		end
	end
	local v560 = p557.pendingProps
	local v561
	if v560.render then
		if v_u_7 and (v_u_9 and not v_u_555.usingLegacyConsumer) then
			v_u_555.usingLegacyConsumer = true
			v_u_2.warn("Your Context.Consumer component is using legacy Roact syntax, which won\'t be supported in future versions of Roact. \nPlease provide no props and supply the \'render\' function as a child (the 3rd argument of createElement). For example: \n       createElement(ContextConsumer, {render = function(...) end})\nbecomes:\n       createElement(ContextConsumer, nil, function(...) end)\nFor more info, reference the React documentation here: \nhttps://reactjs.org/docs/context.html#contextconsumer")
		end
		v561 = v560.render
	else
		v561 = v560.children
	end
	if v_u_7 and type(v561) ~= "function" then
		v_u_2.error("A context consumer was rendered with multiple children, or a child that isn\'t a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.")
	end
	v_u_102(p557, p558, v_u_156.markWorkInProgressReceivedUpdate)
	local v562 = v_u_100(v559, v560.unstable_observedBits)
	local v563
	if v_u_7 then
		v_u_155.current = p557
		v_u_63(true)
		v563 = v561(v562)
		v_u_63(false)
	else
		v563 = v561(v562)
	end
	local v564 = p557.flags
	local v565 = v_u_37
	p557.flags = bit32.bor(v564, v565)
	v_u_167(p556, p557, v563, p558)
	return p557.child
end
function v_u_156.markWorkInProgressReceivedUpdate()
	-- upvalues: (ref) v_u_159
	v_u_159 = true
end
local function v_u_569(p566, p567, p568) -- name: bailoutOnAlreadyFinishedWork
	-- upvalues: (copy) v_u_50, (copy) v_u_109, (copy) v_u_151, (copy) v_u_10, (copy) v_u_71
	if p566 then
		p567.dependencies = p566.dependencies
	end
	if v_u_50 then
		v_u_109(p567)
	end
	v_u_151(p567.lanes)
	if not v_u_10.includesSomeLane(p568, p567.childLanes) then
		return nil
	end
	v_u_71(p566, p567)
	return p567.child
end
function remountFiber(p570, p571, p572) -- name: remountFiber
	-- upvalues: (copy) v_u_7, (copy) v_u_43, (copy) v_u_38
	if v_u_7 then
		local v573 = p571.return_
		if v573 == nil then
			error("Cannot swap the root fiber.")
		end
		local v574 = v573 ~= nil
		assert(v574, "returnFiber was nil in remountFiber")
		p570.alternate = nil
		p571.alternate = nil
		p572.index = p571.index
		p572.sibling = p571.sibling
		p572.return_ = p571.return_
		p572.ref = p571.ref
		if p571 == v573.child then
			v573.child = p572
		else
			local v575 = v573.child
			if v575 == nil then
				error("Expected parent to have a child.")
			end
			local v576 = v575 ~= nil
			assert(v576, "prevSibling was nil in remountFiber")
			while v575.sibling ~= p571 do
				v575 = v575.sibling
				if v575 ~= nil then
					continue
				end
				error("Expected to find the previous sibling.")
			end
			v575.sibling = p572
		end
		local v577 = v573.deletions
		if v577 == nil then
			v573.deletions = { p570 }
			local v578 = v573.flags
			local v579 = v_u_43
			v573.flags = bit32.bor(v578, v579)
		else
			table.insert(v577, p570)
		end
		local v580 = p572.flags
		local v581 = v_u_38
		p572.flags = bit32.bor(v580, v581)
		return p572
	end
	error("Did not expect this call in production. This is a bug in React. Please file an issue.")
end
function v_u_156.beginWork(p582, p583, p584) -- name: beginWork
	-- upvalues: (copy) v_u_7, (copy) v_u_136, (copy) v_u_113, (ref) v_u_159, (copy) v_u_10, (copy) v_u_16, (copy) v_u_116, (copy) v_u_90, (copy) v_u_119, (copy) v_u_17, (copy) v_u_89, (copy) v_u_15, (copy) v_u_115, (copy) v_u_114, (copy) v_u_19, (copy) v_u_23, (copy) v_u_103, (copy) v_u_25, (copy) v_u_50, (copy) v_u_26, (copy) v_u_52, (copy) v_u_96, (copy) v_u_97, (copy) v_u_91, (copy) v_u_41, (copy) v_u_448, (ref) v_u_569, (copy) v_u_27, (copy) v_u_32, (copy) v_u_33, (copy) v_u_238, (copy) v_u_44, (copy) v_u_35, (copy) v_u_13, (copy) v_u_391, (copy) v_u_30, (copy) v_u_354, (copy) v_u_14, (copy) v_u_131, (ref) v_u_266, (copy) v_u_279, (copy) v_u_323, (copy) v_u_338, (copy) v_u_18, (copy) v_u_122, (copy) v_u_20, (copy) v_u_186, (copy) v_u_21, (copy) v_u_22, (copy) v_u_554, (copy) v_u_24, (copy) v_u_28, (copy) v_u_8, (copy) v_u_12, (copy) v_u_57, (copy) v_u_207, (copy) v_u_29, (ref) v_u_226, (copy) v_u_31, (copy) v_u_238, (copy) v_u_54
	local v585 = p583.lanes
	if v_u_7 and (p583._debugNeedsRemount and p582 ~= nil) then
		return remountFiber(p582, p583, v_u_136(p583.type, p583.key, p583.pendingProps, p583._debugOwner or nil, p583.mode, p583.lanes))
	end
	local v586, v587, v588, v589, v590, v591, v592, v593, v594, v595, v596, v597, v598
	if p582 == nil then
		v_u_159 = false
		p583.lanes = v_u_10.NoLanes
		if p583.tag == v_u_13.IndeterminateComponent then
			return v_u_391(p582, p583, p583.type, p584)
		end
		if p583.tag == v_u_30 then
			return v_u_354(p582, p583, p583.elementType, v585, p584)
		end
		if p583.tag == v_u_14 then
			v586 = p583.type
			v587 = p583.pendingProps
			if p583.elementType ~= v586 then
				v587 = v_u_131(v586, v587)
			end
			return v_u_266(p582, p583, v586, v587, p584)
		end
		if p583.tag == v_u_15 then
			v588 = p583.type
			v589 = p583.pendingProps
			return v_u_279(p582, p583, v588, p583.elementType == v588 and v589 and v589 or v_u_131(v588, v589), p584)
		end
		if p583.tag == v_u_16 then
			return v_u_323(p582, p583, p584)
		end
		if p583.tag == v_u_17 then
			return v_u_338(p582, p583, p584)
		end
		if p583.tag == v_u_18 then
			if p582 == nil then
				v_u_122(p583)
			end
			return nil
		end
		if p583.tag == v_u_26 then
			return v_u_448(p582, p583, p584)
		end
		if p583.tag == v_u_19 then
			return updatePortalComponent(p582, p583, p584)
		end
		if p583.tag == v_u_20 then
			v590 = p583.type
			v591 = p583.pendingProps
			if p583.elementType ~= v590 then
				v591 = v_u_131(v590, v591)
			end
			return v_u_186(p582, p583, v590, v591, p584)
		end
		if p583.tag == v_u_21 then
			return updateFragment(p582, p583, p584)
		end
		if p583.tag == v_u_22 then
			return updateMode(p582, p583, p584)
		end
		if p583.tag == v_u_25 then
			return updateProfiler(p582, p583, p584)
		end
		if p583.tag == v_u_23 then
			return v_u_554(p582, p583, p584)
		end
		if p583.tag == v_u_24 then
			return updateContextConsumer(p582, p583, p584)
		end
		if p583.tag == v_u_28 then
			v592 = p583.type
			v593 = v_u_131(v592, p583.pendingProps)
			if (v_u_7 or v_u_8) and p583.type ~= p583.elementType then
				if type(v592) == "table" then
					v594 = v592.propTypes
					v595 = v592.validateProps
				else
					v594 = nil
					v595 = nil
				end
				if v594 or v595 then
					v_u_12(v594, v595, v593, "prop", v_u_57(v592))
				end
			end
			return v_u_207(p582, p583, v592, v_u_131(v592.type, v593), v585, p584)
		end
		if p583.tag == v_u_29 then
			return v_u_226(p582, p583, p583.type, p583.pendingProps, v585, p584)
		end
		if p583.tag == v_u_31 then
			v596 = p583.type
			v597 = p583.pendingProps
			v598 = p583.elementType == v596 and v597 and v597 or v_u_131(v596, v597)
			return mountIncompleteClassComponent(p582, p583, v596, v598, p584)
		end
		if p583.tag == v_u_32 then
			return v_u_238(p582, p583, p584)
		end
		if p583.tag == v_u_33 then
			return v_u_238(p582, p583, p584)
		end
		v609 = v_u_54
		v610 = p583.tag
		v609(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v610)))
		return nil
	end
	if p582.memoizedProps ~= p583.pendingProps or v_u_113() then
		v_u_159 = true
		p583.lanes = v_u_10.NoLanes
		if p583.tag == v_u_13.IndeterminateComponent then
			return v_u_391(p582, p583, p583.type, p584)
		end
		if p583.tag == v_u_30 then
			return v_u_354(p582, p583, p583.elementType, v585, p584)
		end
		if p583.tag == v_u_14 then
			v586 = p583.type
			v587 = p583.pendingProps
			if p583.elementType ~= v586 then
				v587 = v_u_131(v586, v587)
			end
			return v_u_266(p582, p583, v586, v587, p584)
		end
		if p583.tag == v_u_15 then
			v588 = p583.type
			v589 = p583.pendingProps
			return v_u_279(p582, p583, v588, p583.elementType == v588 and v589 and v589 or v_u_131(v588, v589), p584)
		end
		if p583.tag == v_u_16 then
			return v_u_323(p582, p583, p584)
		end
		if p583.tag == v_u_17 then
			return v_u_338(p582, p583, p584)
		end
		if p583.tag == v_u_18 then
			if p582 == nil then
				v_u_122(p583)
			end
			return nil
		end
		if p583.tag == v_u_26 then
			return v_u_448(p582, p583, p584)
		end
		if p583.tag == v_u_19 then
			return updatePortalComponent(p582, p583, p584)
		end
		if p583.tag == v_u_20 then
			v590 = p583.type
			v591 = p583.pendingProps
			if p583.elementType ~= v590 then
				v591 = v_u_131(v590, v591)
			end
			return v_u_186(p582, p583, v590, v591, p584)
		end
		if p583.tag == v_u_21 then
			return updateFragment(p582, p583, p584)
		end
		if p583.tag == v_u_22 then
			return updateMode(p582, p583, p584)
		end
		if p583.tag == v_u_25 then
			return updateProfiler(p582, p583, p584)
		end
		if p583.tag == v_u_23 then
			return v_u_554(p582, p583, p584)
		end
		if p583.tag == v_u_24 then
			return updateContextConsumer(p582, p583, p584)
		end
		if p583.tag == v_u_28 then
			v592 = p583.type
			v593 = v_u_131(v592, p583.pendingProps)
			if (v_u_7 or v_u_8) and p583.type ~= p583.elementType then
				if type(v592) == "table" then
					v594 = v592.propTypes
					v595 = v592.validateProps
				else
					v594 = nil
					v595 = nil
				end
				if v594 or v595 then
					v_u_12(v594, v595, v593, "prop", v_u_57(v592))
				end
			end
			return v_u_207(p582, p583, v592, v_u_131(v592.type, v593), v585, p584)
		end
		if p583.tag == v_u_29 then
			return v_u_226(p582, p583, p583.type, p583.pendingProps, v585, p584)
		end
		if p583.tag == v_u_31 then
			v596 = p583.type
			v597 = p583.pendingProps
			v598 = p583.elementType == v596 and v597 and v597 or v_u_131(v596, v597)
			return mountIncompleteClassComponent(p582, p583, v596, v598, p584)
		end
		if p583.tag == v_u_32 then
			return v_u_238(p582, p583, p584)
		end
		if p583.tag == v_u_33 then
			return v_u_238(p582, p583, p584)
		end
		v609 = v_u_54
		v610 = p583.tag
		v609(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v610)))
		return nil
	end
	local v599
	if v_u_7 then
		v599 = p583.type ~= p582.type
	else
		v599 = false
	end
	if v599 then
		v_u_159 = true
		p583.lanes = v_u_10.NoLanes
		if p583.tag == v_u_13.IndeterminateComponent then
			return v_u_391(p582, p583, p583.type, p584)
		end
		if p583.tag == v_u_30 then
			return v_u_354(p582, p583, p583.elementType, v585, p584)
		end
		if p583.tag == v_u_14 then
			v586 = p583.type
			v587 = p583.pendingProps
			if p583.elementType ~= v586 then
				v587 = v_u_131(v586, v587)
			end
			return v_u_266(p582, p583, v586, v587, p584)
		end
		if p583.tag == v_u_15 then
			v588 = p583.type
			v589 = p583.pendingProps
			return v_u_279(p582, p583, v588, p583.elementType == v588 and v589 and v589 or v_u_131(v588, v589), p584)
		end
		if p583.tag == v_u_16 then
			return v_u_323(p582, p583, p584)
		end
		if p583.tag == v_u_17 then
			return v_u_338(p582, p583, p584)
		end
		if p583.tag == v_u_18 then
			if p582 == nil then
				v_u_122(p583)
			end
			return nil
		end
		if p583.tag == v_u_26 then
			return v_u_448(p582, p583, p584)
		end
		if p583.tag == v_u_19 then
			return updatePortalComponent(p582, p583, p584)
		end
		if p583.tag == v_u_20 then
			v590 = p583.type
			v591 = p583.pendingProps
			if p583.elementType ~= v590 then
				v591 = v_u_131(v590, v591)
			end
			return v_u_186(p582, p583, v590, v591, p584)
		end
		if p583.tag == v_u_21 then
			return updateFragment(p582, p583, p584)
		end
		if p583.tag == v_u_22 then
			return updateMode(p582, p583, p584)
		end
		if p583.tag == v_u_25 then
			return updateProfiler(p582, p583, p584)
		end
		if p583.tag == v_u_23 then
			return v_u_554(p582, p583, p584)
		end
		if p583.tag == v_u_24 then
			return updateContextConsumer(p582, p583, p584)
		end
		if p583.tag == v_u_28 then
			v592 = p583.type
			v593 = v_u_131(v592, p583.pendingProps)
			if (v_u_7 or v_u_8) and p583.type ~= p583.elementType then
				if type(v592) == "table" then
					v594 = v592.propTypes
					v595 = v592.validateProps
				else
					v594 = nil
					v595 = nil
				end
				if v594 or v595 then
					v_u_12(v594, v595, v593, "prop", v_u_57(v592))
				end
			end
			return v_u_207(p582, p583, v592, v_u_131(v592.type, v593), v585, p584)
		end
		if p583.tag == v_u_29 then
			return v_u_226(p582, p583, p583.type, p583.pendingProps, v585, p584)
		end
		if p583.tag == v_u_31 then
			v596 = p583.type
			v597 = p583.pendingProps
			v598 = p583.elementType == v596 and v597 and v597 or v_u_131(v596, v597)
			return mountIncompleteClassComponent(p582, p583, v596, v598, p584)
		end
		if p583.tag == v_u_32 then
			return v_u_238(p582, p583, p584)
		end
		if p583.tag == v_u_33 then
			return v_u_238(p582, p583, p584)
		end
		v609 = v_u_54
		v610 = p583.tag
		v609(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v610)))
		return nil
	end
	if not v_u_10.includesSomeLane(p584, v585) then
		v_u_159 = false
		if p583.tag == v_u_16 then
			local v600 = p583.stateNode
			if v600.pendingContext then
				v_u_116(p583, v600.pendingContext, v600.pendingContext ~= v600.context)
			elseif v600.context then
				v_u_116(p583, v600.context, false)
			end
			v_u_90(p583, v600.containerInfo)
			v_u_119()
		elseif p583.tag == v_u_17 then
			v_u_89(p583)
		elseif p583.tag == v_u_15 then
			if v_u_115(p583.type) then
				v_u_114(p583)
			end
		elseif p583.tag == v_u_19 then
			v_u_90(p583, p583.stateNode.containerInfo)
		elseif p583.tag == v_u_23 then
			v_u_103(p583, p583.memoizedProps.value)
		elseif p583.tag == v_u_25 then
			if v_u_50 then
				local v601 = p583.stateNode
				v601.effectDuration = 0
				v601.passiveEffectDuration = 0
			end
		elseif p583.tag == v_u_26 then
			local v602 = p583.memoizedState
			if v602 ~= nil then
				if v_u_52 and v602.dehydrated ~= nil then
					v_u_96(p583, v_u_97(v_u_91.current))
					local v603 = p583.flags
					local v604 = v_u_41
					p583.flags = bit32.bor(v603, v604)
					return nil
				else
					local v605 = p583.child.childLanes
					if v_u_10.includesSomeLane(p584, v605) then
						return v_u_448(p582, p583, p584)
					else
						v_u_96(p583, v_u_97(v_u_91.current))
						local v606 = v_u_569(p582, p583, p584)
						if v606 == nil then
							return nil
						else
							return v606.sibling
						end
					end
				end
			end
			v_u_96(p583, v_u_97(v_u_91.current))
		elseif p583.tag == v_u_27 then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"))
			error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2)
		elseif p583.tag == v_u_32 or p583.tag == v_u_33 then
			p583.lanes = v_u_10.NoLanes
			return v_u_238(p582, p583, p584)
		end
		return v_u_569(p582, p583, p584)
	end
	local v607 = p582.flags
	local v608 = v_u_44
	if bit32.band(v607, v608) == v_u_35 then
		v_u_159 = false
	else
		v_u_159 = true
	end
	p583.lanes = v_u_10.NoLanes
	if p583.tag == v_u_13.IndeterminateComponent then
		return v_u_391(p582, p583, p583.type, p584)
	end
	if p583.tag == v_u_30 then
		return v_u_354(p582, p583, p583.elementType, v585, p584)
	end
	if p583.tag == v_u_14 then
		v586 = p583.type
		v587 = p583.pendingProps
		if p583.elementType ~= v586 then
			v587 = v_u_131(v586, v587)
		end
		return v_u_266(p582, p583, v586, v587, p584)
	end
	if p583.tag == v_u_15 then
		v588 = p583.type
		v589 = p583.pendingProps
		return v_u_279(p582, p583, v588, p583.elementType == v588 and v589 and v589 or v_u_131(v588, v589), p584)
	end
	if p583.tag == v_u_16 then
		return v_u_323(p582, p583, p584)
	end
	if p583.tag == v_u_17 then
		return v_u_338(p582, p583, p584)
	end
	if p583.tag == v_u_18 then
		if p582 == nil then
			v_u_122(p583)
		end
		return nil
	end
	if p583.tag == v_u_26 then
		return v_u_448(p582, p583, p584)
	end
	if p583.tag == v_u_19 then
		return updatePortalComponent(p582, p583, p584)
	end
	if p583.tag == v_u_20 then
		v590 = p583.type
		v591 = p583.pendingProps
		if p583.elementType ~= v590 then
			v591 = v_u_131(v590, v591)
		end
		return v_u_186(p582, p583, v590, v591, p584)
	end
	if p583.tag == v_u_21 then
		return updateFragment(p582, p583, p584)
	end
	if p583.tag == v_u_22 then
		return updateMode(p582, p583, p584)
	end
	if p583.tag == v_u_25 then
		return updateProfiler(p582, p583, p584)
	end
	if p583.tag == v_u_23 then
		return v_u_554(p582, p583, p584)
	end
	if p583.tag == v_u_24 then
		return updateContextConsumer(p582, p583, p584)
	end
	if p583.tag == v_u_28 then
		v592 = p583.type
		v593 = v_u_131(v592, p583.pendingProps)
		if (v_u_7 or v_u_8) and p583.type ~= p583.elementType then
			if type(v592) == "table" then
				v594 = v592.propTypes
				v595 = v592.validateProps
			else
				v594 = nil
				v595 = nil
			end
			if v594 or v595 then
				v_u_12(v594, v595, v593, "prop", v_u_57(v592))
			end
		end
		return v_u_207(p582, p583, v592, v_u_131(v592.type, v593), v585, p584)
	end
	if p583.tag == v_u_29 then
		return v_u_226(p582, p583, p583.type, p583.pendingProps, v585, p584)
	end
	if p583.tag == v_u_31 then
		v596 = p583.type
		v597 = p583.pendingProps
		v598 = p583.elementType == v596 and v597 and v597 or v_u_131(v596, v597)
		return mountIncompleteClassComponent(p582, p583, v596, v598, p584)
	end
	if p583.tag == v_u_32 then
		return v_u_238(p582, p583, p584)
	end
	if p583.tag == v_u_33 then
		return v_u_238(p582, p583, p584)
	end
	local v609 = v_u_54
	local v610 = p583.tag
	v609(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v610)))
	return nil
end
return v_u_156