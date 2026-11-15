-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactFiberCommitWork.new
local function v_u_2(p1) -- name: unimplemented
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p1))
	error("FIXME (roblox): " .. p1 .. " is unimplemented", 2)
end
local v_u_3 = 0
local v4 = script.Parent.Parent
local v5 = require(v4.ReactGlobals)
local v_u_6 = require(v4.Shared).console
local v7 = require(v4.LuauPolyfill)
local v_u_8 = v7.Error
local v_u_9 = v7.Set
local v_u_10 = v5.__DEV__
local v_u_11 = v5.__YOLO__
local v12 = require(script.Parent.ReactFiberHostConfig)
require(script.Parent.ReactInternalTypes)
require(script.Parent["ReactFiberSuspenseComponent.new"])
local v13 = require(script.Parent["ReactUpdateQueue.new"])
require(v4.Shared)
require(script.Parent.ReactFiberOffscreenComponent)
local v14 = require(script.Parent.ReactHookEffectTags)
local v_u_15 = require(v4.Scheduler).tracing.unstable_wrap
local v_u_16 = require(v4.Shared).ReactFeatureFlags
local v_u_17 = v_u_16.enableSchedulerTracing
local v_u_18 = v_u_16.enableProfilerTimer
local v_u_19 = v_u_16.enableProfilerCommitHooks
local v_u_20 = v_u_16.enableSuspenseCallback
local v_u_21 = v_u_16.enableDoubleInvokingEffects
local v_u_22 = v_u_16.enableNewTreeCleanupPath
local v23 = require(script.Parent.ReactWorkTags)
local v_u_24 = v23.FunctionComponent
local v_u_25 = v23.ForwardRef
local v_u_26 = v23.ClassComponent
local v_u_27 = v23.HostRoot
local v_u_28 = v23.HostComponent
local v_u_29 = v23.HostText
local v_u_30 = v23.HostPortal
local v_u_31 = v23.Profiler
local v_u_32 = v23.SuspenseComponent
local v_u_33 = v23.DehydratedFragment
local v_u_34 = v23.IncompleteClassComponent
local v_u_35 = v23.MemoComponent
local v_u_36 = v23.SimpleMemoComponent
local v_u_37 = v23.SuspenseListComponent
local v_u_38 = v23.FundamentalComponent
local v_u_39 = v23.ScopeComponent
local v_u_40 = v23.Block
local v_u_41 = v23.OffscreenComponent
local v_u_42 = v23.LegacyHiddenComponent
local v43 = require(v4.Shared).ReactErrorUtils
local v_u_44 = v43.invokeGuardedCallback
local v_u_45 = v43.hasCaughtError
local v_u_46 = v43.clearCaughtError
local v47 = require(script.Parent.ReactFiberFlags)
local v_u_48 = v47.NoFlags
local v_u_49 = v47.ContentReset
local v_u_50 = v47.Placement
local v_u_51 = v47.Snapshot
local v_u_52 = v47.Update
local v_u_53 = v47.Callback
local v_u_54 = v47.LayoutMask
local v_u_55 = v47.PassiveMask
local v_u_56 = v47.Ref
local v_u_57 = require(v4.Shared).getComponentName
local v_u_58 = require(v4.Shared).invariant
local v_u_59 = require(v4.Shared).describeError
local v_u_60 = require(script.Parent.ReactCurrentFiber)
local v_u_61 = v_u_60.current
local v_u_62 = v_u_60.resetCurrentFiber
local v_u_63 = v_u_60.setCurrentFiber
local v_u_64 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount
local v_u_65 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local v66 = require(script.Parent["ReactProfilerTimer.new"])
local v_u_67 = v66.startLayoutEffectTimer
local v_u_68 = v66.recordPassiveEffectDuration
local v_u_69 = v66.recordLayoutEffectDuration
local v_u_70 = v66.startPassiveEffectTimer
local v_u_71 = v66.getCommitTime
local v_u_72 = require(script.Parent.ReactTypeOfMode).ProfileMode
local v_u_73 = v13.commitUpdateQueue
local v_u_74 = v12.getPublicInstance
local v_u_75 = v12.supportsMutation
local v_u_76 = v_u_16.enableSkipHostSiblingLookup
if v_u_76 then
	v_u_76 = v12.supportsChildOrdering == false
end
local v_u_77 = v12.supportsPersistence
local v_u_78 = v12.supportsHydration
local v_u_79 = v12.commitMount
local v_u_80 = v12.commitUpdate
local v_u_81 = v12.resetTextContent
local v_u_82 = v12.commitTextUpdate
local v_u_83 = v12.appendChild
local v_u_84 = v12.appendChildToContainer
local v_u_85 = v12.insertBefore
local v_u_86 = v12.insertInContainerBefore
local v_u_87 = v12.removeChild
local v_u_88 = v12.removeChildFromContainer
local v_u_89 = v12.hideInstance
local v_u_90 = v12.hideTextInstance
local v_u_91 = v12.unhideInstance
local v_u_92 = v12.unhideTextInstance
local v_u_93 = v12.commitHydratedSuspenseInstance
local v_u_94 = v12.clearContainer
local v_u_95 = nil
local function v_u_98(p96, p97) -- name: resolveRetryWakeable
	-- upvalues: (ref) v_u_95
	if not v_u_95 then
		v_u_95 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	v_u_95.resolveRetryWakeable(p96, p97)
end
local function v_u_99() -- name: schedulePassiveEffectCallback
	-- upvalues: (copy) v_u_6
	v_u_6.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback())
end
local function v_u_101(_, _, p100) -- name: captureCommitPhaseError
	-- upvalues: (copy) v_u_6
	v_u_6.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle")
	error(p100)
end
local v_u_102 = v14.NoFlags
local v_u_103 = v14.HasEffect
local v_u_104 = v14.Layout
local v_u_105 = v14.Passive
local v_u_106 = nil
local function v_u_107()
	-- upvalues: (ref) v_u_106
	if not v_u_106 then
		v_u_106 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps
	end
	return v_u_106
end
local v_u_108 = nil
local v_u_109 = nil
local v_u_110 = nil
local v_u_111 = nil
local v_u_112 = nil
local v_u_113 = nil
local v_u_114 = nil
local v_u_115 = nil
local function v_u_124(p116, p_u_117) -- name: callComponentWillUnmountWithTimer
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_72, (copy) v_u_67, (copy) v_u_59, (copy) v_u_69
	p_u_117.props = p116.memoizedProps
	p_u_117.state = p116.memoizedState
	if v_u_18 and v_u_19 then
		local v118 = p116.mode
		local v119 = v_u_72
		if bit32.band(v118, v119) == 0 then
			p_u_117:componentWillUnmount()
		else
			local function v120()
				-- upvalues: (ref) v_u_67, (copy) p_u_117
				v_u_67()
				p_u_117:componentWillUnmount()
			end
			local v121 = v_u_59
			local v122, v123 = xpcall(v120, v121)
			v_u_69(p116)
			if not v122 then
				error(v123)
				return
			end
		end
	else
		p_u_117:componentWillUnmount()
		return
	end
end
function safelyCallComponentWillUnmount(p125, p126, p127) -- name: safelyCallComponentWillUnmount
	-- upvalues: (copy) v_u_124, (copy) v_u_59, (ref) v_u_101
	local v128 = v_u_124
	local v129 = v_u_59
	local v130, v131 = xpcall(v128, v129, p125, p126)
	if not v130 then
		v_u_101(p125, p127, v131)
	end
end
local function v138(p132, p133, p134) -- name: safelyCallDestroy
	-- upvalues: (copy) v_u_59, (ref) v_u_101
	local v135 = v_u_59
	local v136, v137 = xpcall(p134, v135)
	if not v136 then
		v_u_101(p132, p133, v137)
	end
end
local function v_u_151(p139, p140, p141) -- name: commitHookEffectListUnmount
	-- upvalues: (copy) v_u_16, (copy) v_u_59, (ref) v_u_101
	local v142 = p140.updateQueue
	local v143
	if v142 == nil then
		v143 = nil
	else
		v143 = v142.lastEffect
	end
	if v143 ~= nil then
		local v144 = v143.next
		local v145 = v144
		local v146 = v144.tag
		if bit32.band(v146, p139) == p139 then
			local v147 = v144.destroy
			if v_u_16.enableWorkLoopTrims then
				if v147 ~= nil then
					v144.destroy = nil
				end
			else
				v144.destroy = nil
			end
			if v147 ~= nil then
				local v148 = v_u_59
				local v149, v150 = xpcall(v147, v148)
				if not v149 then
					v_u_101(p140, p141, v150)
				end
			end
		end
		v144 = v144.next
		if v144 ~= v145 then
			continue
		end
	end
end
local function v_u_164(p152, p153) -- name: commitHookEffectListMount
	-- upvalues: (copy) v_u_16, (copy) v_u_10, (copy) v_u_6
	local v154 = p153.updateQueue
	local v155
	if v154 == nil then
		v155 = nil
	else
		v155 = v154.lastEffect
	end
	if v155 ~= nil then
		local v156 = v155.next
		local v157 = v156
		local v158 = v156.tag
		if bit32.band(v158, p152) == p152 then
			local v159 = v156.create
			if v_u_16.enableWorkLoopTrims then
				local v160 = v159()
				if v160 ~= nil or v156.destroy ~= nil then
					v156.destroy = v160
				end
			else
				v156.destroy = v159()
			end
			if v_u_10 then
				local v161 = v156.destroy
				if v161 ~= nil and typeof(v161) ~= "function" then
					local v162
					if v161 == nil then
						v162 = " You returned nil. If your effect does not require clean up, return nil (or nothing)."
					else
						local v163 = v161.andThen
						v162 = typeof(v163) == "function" and "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn\'t need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" or " You returned: " .. v161
					end
					v_u_6.error("An effect function must not return anything besides a function, which is used for clean-up.%s", v162)
				end
			end
		end
		v156 = v156.next
		if v156 ~= v157 then
			continue
		end
	end
end
function commitProfilerPassiveEffect(p165, p166) -- name: commitProfilerPassiveEffect
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_31, (copy) v_u_71, (copy) v_u_17
	if v_u_18 and (v_u_19 and p166.tag == v_u_31) then
		local v167 = p166.stateNode.passiveEffectDuration
		local v168 = p166.memoizedProps.id
		local v169 = p166.memoizedProps.onPostCommit
		local v170 = v_u_71()
		if typeof(v169) == "function" then
			if v_u_17 then
				v169(v168, p166.alternate == nil and "mount" or "update", v167, v170, p165.memoizedInteractions)
				return
			end
			v169(v168, p166.alternate == nil and "mount" or "update", v167, v170)
		end
	end
end
local function v_u_252(p_u_171, p172, p173, p174) -- name: recursivelyCommitLayoutEffects
	-- upvalues: (ref) v_u_101, (ref) v_u_99, (copy) v_u_31, (copy) v_u_18, (copy) v_u_19, (ref) v_u_115, (copy) v_u_16, (copy) v_u_54, (copy) v_u_48, (copy) v_u_10, (copy) v_u_61, (copy) v_u_63, (copy) v_u_44, (copy) v_u_252, (copy) v_u_45, (copy) v_u_46, (copy) v_u_62, (copy) v_u_59, (copy) v_u_52, (copy) v_u_53, (copy) v_u_60, (ref) v_u_3, (copy) v_u_11, (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_72, (copy) v_u_67, (copy) v_u_164, (copy) v_u_104, (copy) v_u_103, (copy) v_u_69, (copy) v_u_55, (copy) v_u_26, (ref) v_u_113, (copy) v_u_27, (ref) v_u_111, (copy) v_u_28, (ref) v_u_112, (copy) v_u_32, (copy) v_u_38, (copy) v_u_30, (copy) v_u_29, (copy) v_u_34, (copy) v_u_42, (copy) v_u_41, (copy) v_u_39, (copy) v_u_37, (copy) v_u_58, (copy) v_u_56
	if p173 ~= nil then
		v_u_101 = p173
	end
	if p174 ~= nil then
		v_u_99 = p174
	end
	local v175 = p_u_171.flags
	local v176 = p_u_171.tag
	if v176 == v_u_31 then
		local v177
		if v_u_18 and v_u_19 then
			v177 = v_u_115
			v_u_115 = p_u_171
		else
			v177 = nil
		end
		if v_u_16.enableCommitTraversalTrims then
			local v178 = p_u_171.subtreeFlags
			local v179 = v_u_54
			local v180
			if bit32.band(v178, v179) == v_u_48 then
				v180 = nil
			else
				v180 = p_u_171.child
			end
			while v180 ~= nil do
				local v181 = v180.flags
				local v182 = v180.subtreeFlags
				local v183 = bit32.bor(v181, v182)
				local v184 = v_u_54
				if bit32.band(v183, v184) ~= v_u_48 or v180.tag == v_u_31 then
					if v_u_10 then
						local v185 = v_u_61
						v_u_63(v180)
						v_u_44(nil, v_u_252, nil, v180, p172, v_u_101, v_u_99)
						if v_u_45() then
							v_u_101(v180, p_u_171, (v_u_46()))
						end
						if v185 == nil then
							v_u_62()
						else
							v_u_63(v185)
						end
					else
						local v186 = v_u_252
						local v187 = v_u_59
						local v188 = v_u_101
						local v189 = v_u_99
						local v190, v191 = xpcall(v186, v187, v180, p172, v188, v189)
						if not v190 then
							v_u_101(v180, p_u_171, v191)
						end
					end
				end
				v180 = v180.sibling
			end
		else
			local v192 = p_u_171.child
			while v192 ~= nil do
				local v193 = p_u_171.subtreeFlags
				local v194 = v_u_54
				if bit32.band(v193, v194) ~= v_u_48 then
					if v_u_10 then
						local v195 = v_u_61
						v_u_63(v192)
						v_u_44(nil, v_u_252, nil, v192, p172, v_u_101, v_u_99)
						if v_u_45() then
							v_u_101(v192, p_u_171, (v_u_46()))
						end
						if v195 == nil then
							v_u_62()
						else
							v_u_63(v195)
						end
					else
						local v196 = v_u_252
						local v197 = v_u_59
						local v198 = v_u_101
						local v199 = v_u_99
						local v200, v201 = xpcall(v196, v197, v192, p172, v198, v199)
						if not v200 then
							v_u_101(v192, p_u_171, v201)
						end
					end
				end
				v192 = v192.sibling
			end
		end
		local v202 = v_u_52
		local v203 = v_u_53
		local v204 = bit32.bor(v202, v203)
		if bit32.band(v175, v204) ~= v_u_48 and v_u_18 then
			if v_u_10 then
				local v205 = v_u_61
				v_u_63(p_u_171)
				v_u_44(nil, commitLayoutEffectsForProfiler, nil, p_u_171, p172)
				if v_u_45() then
					local v206 = v_u_46()
					v_u_101(p_u_171, p_u_171.return_, v206)
				end
				if v205 == nil then
					v_u_62()
				else
					v_u_63(v205)
				end
			else
				local v207 = commitLayoutEffectsForProfiler
				local v208 = v_u_59
				local v209, v210 = xpcall(v207, v208, p_u_171, p172)
				if not v209 then
					v_u_101(p_u_171, p_u_171.return_, v210)
				end
			end
		end
		if v_u_18 and v_u_19 then
			if v177 ~= nil then
				local v211 = v177.stateNode
				v211.effectDuration = v211.effectDuration + p_u_171.stateNode.effectDuration
			end
			v_u_115 = v177
			return
		end
	else
		if v_u_16.enableCommitTraversalTrims then
			local v212 = p_u_171.subtreeFlags
			local v213 = v_u_54
			local v214
			if bit32.band(v212, v213) == v_u_48 then
				v214 = nil
			else
				v214 = p_u_171.child
			end
			while v214 ~= nil do
				local v215 = v214.flags
				local v216 = v214.subtreeFlags
				local v217 = bit32.bor(v215, v216)
				local v218 = v_u_54
				if bit32.band(v217, v218) ~= v_u_48 or v214.tag == v_u_31 then
					if v_u_10 then
						local v219 = v_u_60.current
						v_u_63(v214)
						if v_u_3 < 20 then
							v_u_3 = v_u_3 + 1
							v_u_44(nil, v_u_252, nil, v214, p172, v_u_101, v_u_99)
							v_u_3 = v_u_3 - 1
							if v_u_45() then
								v_u_101(v214, p_u_171, (v_u_46()))
							end
						else
							v_u_252(v214, p172, v_u_101, v_u_99)
						end
						if v219 == nil then
							v_u_62()
						else
							v_u_63(v219)
						end
					else
						local v220 = nil
						local v221
						if v_u_11 or v_u_3 >= 20 then
							v_u_252(v214, p172, v_u_101, v_u_99)
							v221 = true
						else
							v_u_3 = v_u_3 + 1
							local v222 = v_u_252
							local v223 = v_u_59
							local v224 = v_u_101
							local v225 = v_u_99
							v221, v220 = xpcall(v222, v223, v214, p172, v224, v225)
							v_u_3 = v_u_3 - 1
						end
						if not v221 then
							v_u_101(v214, p_u_171, v220)
						end
					end
				end
				v214 = v214.sibling
			end
		else
			local v226 = p_u_171.child
			while v226 ~= nil do
				local v227 = p_u_171.subtreeFlags
				local v228 = v_u_54
				if bit32.band(v227, v228) ~= v_u_48 then
					if v_u_10 then
						local v229 = v_u_60.current
						v_u_63(v226)
						if v_u_3 < 20 then
							v_u_3 = v_u_3 + 1
							v_u_44(nil, v_u_252, nil, v226, p172, v_u_101, v_u_99)
							v_u_3 = v_u_3 - 1
							if v_u_45() then
								v_u_101(v226, p_u_171, (v_u_46()))
							end
						else
							v_u_252(v226, p172, v_u_101, v_u_99)
						end
						if v229 == nil then
							v_u_62()
						else
							v_u_63(v229)
						end
					else
						local v230 = nil
						local v231
						if v_u_11 or v_u_3 >= 20 then
							v_u_252(v226, p172, v_u_101, v_u_99)
							v231 = true
						else
							v_u_3 = v_u_3 + 1
							local v232 = v_u_252
							local v233 = v_u_59
							local v234 = v_u_101
							local v235 = v_u_99
							v231, v230 = xpcall(v232, v233, v226, p172, v234, v235)
							v_u_3 = v_u_3 - 1
						end
						if not v231 then
							v_u_101(v226, p_u_171, v230)
						end
					end
				end
				v226 = v226.sibling
			end
		end
		local v236 = v_u_52
		local v237 = v_u_53
		local v238 = bit32.bor(v236, v237)
		local v239
		if bit32.band(v175, v238) == v_u_48 then
			v239 = v_u_56
			if bit32.band(v175, v239) ~= 0 then
				commitAttachRef(p_u_171)
			end
		elseif v176 == v_u_24 or (v176 == v_u_25 or (v176 == v_u_36 or v176 == v_u_40)) then
			local v240, v241, v242, v243
			if v_u_18 and v_u_19 then
				local v244 = p_u_171.mode
				local v245 = v_u_72
				if bit32.band(v244, v245) == 0 then
					v240 = v_u_104
					v241 = v_u_103
					v_u_164(bit32.bor(v240, v241), p_u_171)
					v242 = p_u_171.subtreeFlags
					v243 = v_u_55
					if bit32.band(v242, v243) ~= v_u_48 then
						v_u_99()
					end
				else
					local function v248()
						-- upvalues: (ref) v_u_67, (ref) v_u_164, (ref) v_u_104, (ref) v_u_103, (copy) p_u_171
						v_u_67()
						local v246 = v_u_104
						local v247 = v_u_103
						v_u_164(bit32.bor(v246, v247), p_u_171)
					end
					local v249 = v_u_59
					local v250, v251 = xpcall(v248, v249)
					v_u_69(p_u_171)
					if not v250 then
						error(v251)
					end
					v242 = p_u_171.subtreeFlags
					v243 = v_u_55
					if bit32.band(v242, v243) ~= v_u_48 then
						v_u_99()
					end
				end
			else
				v240 = v_u_104
				v241 = v_u_103
				v_u_164(bit32.bor(v240, v241), p_u_171)
				v242 = p_u_171.subtreeFlags
				v243 = v_u_55
				if bit32.band(v242, v243) ~= v_u_48 then
					v_u_99()
				end
			end
			v239 = v_u_56
			if bit32.band(v175, v239) ~= 0 then
				commitAttachRef(p_u_171)
			end
		else
			if v176 == v_u_26 then
				v_u_113(p_u_171)
			elseif v176 == v_u_27 then
				v_u_111(p_u_171)
			elseif v176 == v_u_28 then
				v_u_112(p_u_171)
			elseif v176 == v_u_32 then
				commitSuspenseHydrationCallbacks(p172, p_u_171)
			elseif v176 ~= v_u_38 and (v176 ~= v_u_30 and (v176 ~= v_u_29 and (v176 ~= v_u_34 and (v176 ~= v_u_42 and (v176 ~= v_u_41 and (v176 ~= v_u_39 and v176 ~= v_u_37)))))) then
				v_u_58(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
			end
			v239 = v_u_56
			if bit32.band(v175, v239) ~= 0 then
				commitAttachRef(p_u_171)
			end
		end
	end
end
function commitLayoutEffectsForProfiler(p253, p254) -- name: commitLayoutEffectsForProfiler
	-- upvalues: (copy) v_u_18, (copy) v_u_71, (copy) v_u_52, (copy) v_u_53, (copy) v_u_48, (copy) v_u_17, (copy) v_u_19
	if v_u_18 then
		local v255 = p253.flags
		local v256 = p253.alternate
		local v257 = p253.memoizedProps.onCommit
		local v258 = p253.memoizedProps.onRender
		local v259 = p253.stateNode.effectDuration
		local v260 = v_u_71()
		local v261 = v_u_52
		local v262 = v_u_53
		if bit32.band(v255, v261) ~= v_u_48 then
			local v263
			if typeof(v258) == "function" then
				v263 = true
			elseif typeof(v258) == "table" then
				local v264 = getmetatable(v258)
				v263 = v264 and rawget(v264, "__call") and true or (v258._isMockFunction and true or false)
			else
				v263 = false
			end
			if v263 then
				if v_u_17 then
					v258(p253.memoizedProps.id, v256 == nil and "mount" or "update", p253.actualDuration, p253.treeBaseDuration, p253.actualStartTime, v260, p254.memoizedInteractions)
				else
					v258(p253.memoizedProps.id, v256 == nil and "mount" or "update", p253.actualDuration, p253.treeBaseDuration, p253.actualStartTime, v260)
				end
			end
		end
		if v_u_19 and bit32.band(v255, v262) ~= v_u_48 then
			local v265
			if typeof(v257) == "function" then
				v265 = true
			elseif typeof(v257) == "table" then
				local v266 = getmetatable(v257)
				v265 = v266 and rawget(v266, "__call") and true or (v257._isMockFunction and true or false)
			else
				v265 = false
			end
			if v265 then
				if v_u_17 then
					v257(p253.memoizedProps.id, v256 == nil and "mount" or "update", v259, v260, p254.memoizedInteractions)
					return
				end
				v257(p253.memoizedProps.id, v256 == nil and "mount" or "update", v259, v260)
			end
		end
	end
end
v_u_113 = function(p267) -- name: commitLayoutEffectsForClassComponent
	-- upvalues: (copy) v_u_52, (copy) v_u_10, (copy) v_u_107, (copy) v_u_6, (copy) v_u_57, (copy) v_u_18, (copy) v_u_19, (copy) v_u_72, (copy) v_u_67, (copy) v_u_59, (copy) v_u_69, (copy) v_u_65, (copy) v_u_73
	local v_u_268 = p267.stateNode
	local v269 = p267.alternate
	local v270 = p267.flags
	local v271 = v_u_52
	local v272
	if bit32.band(v270, v271) == 0 then
		v272 = p267.updateQueue
		if v272 ~= nil then
			if v_u_10 and (p267.type == p267.elementType and not v_u_107) then
				if v_u_268.props ~= p267.memoizedProps then
					v_u_6.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p267.type) or "instance")
				end
				if v_u_268.state ~= p267.memoizedState then
					v_u_6.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p267.type) or "instance")
				end
			end
			v_u_73(p267, v272, v_u_268)
		end
		return
	elseif v269 == nil then
		if v_u_10 and (p267.type == p267.elementType and not v_u_107) then
			if v_u_268.props ~= p267.memoizedProps then
				v_u_6.error("Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p267.type) or "instance")
			end
			if v_u_268.state ~= p267.memoizedState then
				v_u_6.error("Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p267.type) or "instance")
			end
		end
		if v_u_18 and v_u_19 then
			local v273 = p267.mode
			local v274 = v_u_72
			if bit32.band(v273, v274) ~= 0 then
				local function v275()
					-- upvalues: (ref) v_u_67, (copy) v_u_268
					v_u_67()
					v_u_268:componentDidMount()
				end
				local v276 = v_u_59
				local v277, v278 = xpcall(v275, v276)
				v_u_69(p267)
				if not v277 then
					error(v278)
				end
				v272 = p267.updateQueue
				if v272 ~= nil then
					if v_u_10 and (p267.type == p267.elementType and not v_u_107) then
						if v_u_268.props ~= p267.memoizedProps then
							v_u_6.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p267.type) or "instance")
						end
						if v_u_268.state ~= p267.memoizedState then
							v_u_6.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p267.type) or "instance")
						end
					end
					v_u_73(p267, v272, v_u_268)
				end
				return
			end
			v_u_268:componentDidMount()
		else
			v_u_268:componentDidMount()
		end
		v272 = p267.updateQueue
		if v272 ~= nil then
			if v_u_10 and (p267.type == p267.elementType and not v_u_107) then
				if v_u_268.props ~= p267.memoizedProps then
					v_u_6.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p267.type) or "instance")
				end
				if v_u_268.state ~= p267.memoizedState then
					v_u_6.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p267.type) or "instance")
				end
			end
			v_u_73(p267, v272, v_u_268)
		end
	else
		local v_u_279 = p267.elementType == p267.type and v269.memoizedProps or v_u_65(p267.type, v269.memoizedProps)
		local v_u_280 = v269.memoizedState
		if v_u_10 and (p267.type == p267.elementType and not v_u_107) then
			if v_u_268.props ~= p267.memoizedProps then
				v_u_6.error("Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p267.type) or "instance")
			end
			if v_u_268.state ~= p267.memoizedState then
				v_u_6.error("Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p267.type) or "instance")
			end
		end
		if v_u_18 and v_u_19 then
			local v281 = p267.mode
			local v282 = v_u_72
			if bit32.band(v281, v282) ~= 0 then
				local function v283()
					-- upvalues: (ref) v_u_67, (copy) v_u_268, (copy) v_u_279, (copy) v_u_280
					v_u_67()
					v_u_268:componentDidUpdate(v_u_279, v_u_280, v_u_268.__reactInternalSnapshotBeforeUpdate)
				end
				local v284 = v_u_59
				local v285, v286 = xpcall(v283, v284)
				v_u_69(p267)
				if not v285 then
					error(v286)
				end
				v272 = p267.updateQueue
				if v272 ~= nil then
					if v_u_10 and (p267.type == p267.elementType and not v_u_107) then
						if v_u_268.props ~= p267.memoizedProps then
							v_u_6.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p267.type) or "instance")
						end
						if v_u_268.state ~= p267.memoizedState then
							v_u_6.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p267.type) or "instance")
						end
					end
					v_u_73(p267, v272, v_u_268)
				end
				return
			end
			v_u_268:componentDidUpdate(v_u_279, v_u_280, v_u_268.__reactInternalSnapshotBeforeUpdate)
		else
			v_u_268:componentDidUpdate(v_u_279, v_u_280, v_u_268.__reactInternalSnapshotBeforeUpdate)
		end
		v272 = p267.updateQueue
		if v272 ~= nil then
			if v_u_10 and (p267.type == p267.elementType and not v_u_107) then
				if v_u_268.props ~= p267.memoizedProps then
					v_u_6.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p267.type) or "instance")
				end
				if v_u_268.state ~= p267.memoizedState then
					v_u_6.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p267.type) or "instance")
				end
			end
			v_u_73(p267, v272, v_u_268)
		end
	end
end
v_u_111 = function(p287) -- name: commitLayoutEffectsForHostRoot
	-- upvalues: (copy) v_u_28, (copy) v_u_74, (copy) v_u_26, (copy) v_u_73
	local v288 = p287.updateQueue
	if v288 ~= nil then
		local v289 = nil
		if p287.child ~= nil then
			local v290 = p287.child
			if v290.tag == v_u_28 then
				v289 = v_u_74(v290.stateNode)
			elseif v290.tag == v_u_26 then
				v289 = v290.stateNode
			end
		end
		v_u_73(p287, v288, v289)
	end
end
v_u_112 = function(p291) -- name: commitLayoutEffectsForHostComponent
	-- upvalues: (copy) v_u_52, (copy) v_u_79
	local v292 = p291.stateNode
	if p291.alternate == nil then
		local v293 = p291.flags
		local v294 = v_u_52
		if bit32.band(v293, v294) ~= 0 then
			v_u_79(v292, p291.type, p291.memoizedProps, p291)
		end
	end
end
local function v_u_300(p295, p296) -- name: hideOrUnhideAllChildren
	-- upvalues: (copy) v_u_75, (copy) v_u_28, (copy) v_u_89, (copy) v_u_91, (copy) v_u_29, (copy) v_u_90, (copy) v_u_92, (copy) v_u_41, (copy) v_u_42
	if not v_u_75 then
		return
	end
	local v297 = p295
	while true do
		while p295.tag == v_u_28 do
			local v298 = p295.stateNode
			if p296 then
				v_u_89(v298)
			else
				v_u_91(p295.stateNode, p295.memoizedProps)
			end
			if p295 == v297 then
				return
			end
			while p295.sibling == nil do
				if p295.return_ == nil or p295.return_ == v297 then
					return
				end
				p295 = p295.return_
			end
			p295.sibling.return_ = p295.return_
			p295 = p295.sibling
		end
		if p295.tag == v_u_29 then
			local v299 = p295.stateNode
			if p296 then
				v_u_90(v299)
			else
				v_u_92(v299, p295.memoizedProps)
			end
			if p295 == v297 then
				return
			end
			while p295.sibling == nil do
				if p295.return_ == nil or p295.return_ == v297 then
					return
				end
				p295 = p295.return_
			end
			p295.sibling.return_ = p295.return_
			p295 = p295.sibling
		elseif (p295.tag == v_u_41 or p295.tag == v_u_42) and (p295.memoizedState ~= nil and p295 ~= v297) or p295.child == nil then
			if p295 == v297 then
				return
			end
			while p295.sibling == nil do
				if p295.return_ == nil or p295.return_ == v297 then
					return
				end
				p295 = p295.return_
			end
			p295.sibling.return_ = p295.return_
			p295 = p295.sibling
		else
			p295.child.return_ = p295
			p295 = p295.child
		end
	end
end
function commitAttachRef(p301) -- name: commitAttachRef
	-- upvalues: (copy) v_u_28, (copy) v_u_74, (copy) v_u_10, (copy) v_u_6, (copy) v_u_57
	local v302 = p301.ref
	if v302 ~= nil then
		local v303 = p301.stateNode
		if p301.tag == v_u_28 then
			v303 = v_u_74(v303)
		end
		if typeof(v302) == "function" then
			v302(v303)
			return
		end
		if v_u_10 and typeof(v302) ~= "table" then
			v_u_6.error("Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().", v_u_57(p301.type) or "instance")
			return
		end
		v302.current = v303
	end
end
function commitDetachRef(p304) -- name: commitDetachRef
	local v305 = p304.ref
	if v305 ~= nil then
		if typeof(v305) == "function" then
			v305(nil)
			return
		end
		v305.current = nil
	end
end
local function v_u_336(p306, p307, p308, p309) -- name: commitUnmount
	-- upvalues: (copy) v_u_64, (copy) v_u_24, (copy) v_u_25, (copy) v_u_35, (copy) v_u_36, (copy) v_u_40, (copy) v_u_104, (copy) v_u_102, (copy) v_u_18, (copy) v_u_19, (copy) v_u_72, (copy) v_u_67, (copy) v_u_59, (ref) v_u_101, (copy) v_u_69, (copy) v_u_26, (copy) v_u_28, (copy) v_u_30, (copy) v_u_75, (ref) v_u_114, (copy) v_u_77, (copy) v_u_2
	v_u_64(p307)
	if p307.tag ~= v_u_24 and (p307.tag ~= v_u_25 and (p307.tag ~= v_u_35 and (p307.tag ~= v_u_36 and p307.tag ~= v_u_40))) then
		if p307.tag == v_u_26 then
			local v310 = p307.ref
			if v310 ~= nil then
				if typeof(v310) == "function" then
					local v311 = v_u_59
					local v312, v313 = xpcall(v310, v311)
					if not v312 then
						v_u_101(p307, p308, v313)
					end
				else
					v310.current = nil
				end
			end
			local v314 = p307.stateNode
			local v315 = v314.componentWillUnmount
			if typeof(v315) == "function" then
				safelyCallComponentWillUnmount(p307, v314, p308)
			end
			return
		elseif p307.tag == v_u_28 then
			local v316 = p307.ref
			if v316 ~= nil then
				if typeof(v316) == "function" then
					local v317 = v_u_59
					local v318, v319 = xpcall(v316, v317)
					if not v318 then
						v_u_101(p307, p308, v319)
						return
					end
				else
					v316.current = nil
				end
			end
			return
		elseif p307.tag == v_u_30 then
			if v_u_75 then
				v_u_114(p306, p307, p308, p309)
			elseif v_u_77 then
				v_u_2("emptyPortalContainer")
			end
		else
			return
		end
	end
	local v320 = p307.updateQueue
	if v320 == nil then
		return
	end
	local v321 = v320.lastEffect
	if v321 == nil then
		return
	end
	local v322 = v321.next
	local v323 = v322
	if v322.destroy == nil then
		v322 = v322.next
		if v322 ~= v323 then
			continue
		end
	else
		local v324 = v322.tag
		local v325 = v_u_104
		if bit32.band(v324, v325) == v_u_102 then
			v322 = v322.next
			if v322 ~= v323 then
				continue
			end
		else
			local v326, v327, v328, v329
			if v_u_18 and v_u_19 then
				local v330 = p307.mode
				local v331 = v_u_72
				if bit32.band(v330, v331) == 0 then
					v326 = v322.destroy
					v327 = v_u_59
					v328, v329 = xpcall(v326, v327)
					if not v328 then
						v_u_101(p307, p308, v329)
					end
					goto l22
				end
				v_u_67()
				local v332 = v322.destroy
				local v333 = v_u_59
				local v334, v335 = xpcall(v332, v333)
				if not v334 then
					v_u_101(p307, p308, v335)
				end
				v_u_69(p307)
				v322 = v322.next
				if v322 ~= v323 then
					continue
				end
			else
				v326 = v322.destroy
				v327 = v_u_59
				v328, v329 = xpcall(v326, v327)
				if not v328 then
					v_u_101(p307, p308, v329)
				end
				::l22::
				v322 = v322.next
				if v322 ~= v323 then
					continue
				end
			end
		end
	end
end
local function v_u_342(p337, p338, p339, p340) -- name: commitNestedUnmounts
	-- upvalues: (ref) v_u_336, (copy) v_u_75, (copy) v_u_30
	local v341 = p338
	while true do
		while true do
			v_u_336(p337, p338, p339, p340)
			if p338.child ~= nil and (not v_u_75 or p338.tag ~= v_u_30) then
				break
			end
			if p338 == v341 then
				return
			end
			while p338.sibling == nil do
				if p338.return_ == nil or p338.return_ == v341 then
					return
				end
				p338 = p338.return_
			end
			p338.sibling.return_ = p338.return_
			p338 = p338.sibling
		end
		p338.child.return_ = p338
		p338 = p338.child
	end
end
local function v_u_345(p343) -- name: getHostParentFiber
	-- upvalues: (ref) v_u_108, (copy) v_u_8
	local v344 = p343.return_
	while v344 ~= nil do
		if v_u_108(v344) then
			return v344
		end
		v344 = v344.return_
	end
	error(v_u_8.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
end
v_u_108 = function(p346) -- name: isHostParent
	-- upvalues: (copy) v_u_28, (copy) v_u_27, (copy) v_u_30
	return (p346.tag == v_u_28 or p346.tag == v_u_27) and true or p346.tag == v_u_30
end
local function v_u_353(p347) -- name: getHostSibling
	-- upvalues: (ref) v_u_108, (copy) v_u_28, (copy) v_u_29, (copy) v_u_33, (copy) v_u_50, (copy) v_u_30
	local v348 = false
	while p347.sibling == nil do
		if p347.return_ == nil or v_u_108(p347.return_) then
			return nil
		end
		p347 = p347.return_
	end
	p347.sibling.return_ = p347.return_
	p347 = p347.sibling
	while p347.tag ~= v_u_28 and (p347.tag ~= v_u_29 and p347.tag ~= v_u_33) do
		local v349 = p347.flags
		local v350 = v_u_50
		if bit32.band(v349, v350) ~= 0 or (p347.child == nil or p347.tag == v_u_30) then
			v348 = true
			break
		end
		p347.child.return_ = p347
		p347 = p347.child
	end
	if v348 then
		break
	end
	local v351 = p347.flags
	local v352 = v_u_50
	if bit32.band(v351, v352) ~= 0 then
		break
	end
	return p347.stateNode
end
local function v365(p354) -- name: commitPlacement
	-- upvalues: (copy) v_u_75, (copy) v_u_345, (copy) v_u_28, (copy) v_u_27, (copy) v_u_30, (copy) v_u_58, (copy) v_u_49, (copy) v_u_81, (copy) v_u_76, (ref) v_u_353, (ref) v_u_110, (ref) v_u_109
	if v_u_75 then
		local v355 = v_u_345(p354)
		local v356 = nil
		local v357 = nil
		local v358 = v355.stateNode
		if v355.tag == v_u_28 then
			v356 = v358
			v357 = false
		elseif v355.tag == v_u_27 then
			v356 = v358.containerInfo
			v357 = true
		elseif v355.tag == v_u_30 then
			v356 = v358.containerInfo
			v357 = true
		else
			v_u_58(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.")
		end
		local v359 = v355.flags
		local v360 = v_u_49
		if bit32.band(v359, v360) ~= 0 then
			v_u_81(v356)
			local v361 = v355.flags
			local v362 = v_u_49
			local v363 = bit32.bnot(v362)
			v355.flags = bit32.band(v361, v363)
		end
		local v364
		if v_u_76 then
			v364 = nil
		else
			v364 = v_u_353(p354)
		end
		if v357 then
			v_u_110(p354, v364, v356)
		else
			v_u_109(p354, v364, v356)
		end
	else
		return
	end
end
v_u_110 = function(p366, p367, p368) -- name: insertOrAppendPlacementNodeIntoContainer
	-- upvalues: (copy) v_u_28, (copy) v_u_29, (copy) v_u_86, (copy) v_u_84, (copy) v_u_30, (ref) v_u_110
	local v369 = p366.tag
	if v369 == v_u_28 and true or v369 == v_u_29 then
		local v370 = p366.stateNode
		if p367 then
			v_u_86(p368, v370, p367)
		else
			v_u_84(p368, v370)
		end
	elseif v369 ~= v_u_30 then
		local v371 = p366.child
		if v371 ~= nil then
			v_u_110(v371, p367, p368)
			local v372 = v371.sibling
			while v372 ~= nil do
				v_u_110(v372, p367, p368)
				v372 = v372.sibling
			end
		end
	end
end
v_u_109 = function(p373, p374, p375) -- name: insertOrAppendPlacementNode
	-- upvalues: (copy) v_u_28, (copy) v_u_29, (copy) v_u_85, (copy) v_u_83, (copy) v_u_30, (ref) v_u_109
	local v376 = p373.tag
	if v376 == v_u_28 and true or v376 == v_u_29 then
		local v377 = p373.stateNode
		if p374 then
			v_u_85(p375, v377, p374)
		else
			v_u_83(p375, v377)
		end
	elseif v376 ~= v_u_30 then
		local v378 = p373.child
		if v378 ~= nil then
			v_u_109(v378, p374, p375)
			local v379 = v378.sibling
			while v379 ~= nil do
				v_u_109(v379, p374, p375)
				v379 = v379.sibling
			end
		end
	end
end
v_u_114 = function() -- name: unmountHostComponents
	-- upvalues: (copy) v_u_8, (copy) v_u_28, (copy) v_u_27, (copy) v_u_30, (copy) v_u_29, (ref) v_u_342, (copy) v_u_88, (copy) v_u_87, (ref) v_u_336
	-- failed to decompile function 36: called `Option::unwrap()` on a `None` value
end
local function v387(p380, p381, p382, p383) -- name: commitDeletion
	-- upvalues: (ref) v_u_114, (copy) v_u_22
	v_u_114(p380, p381, p382, p383)
	local v384
	if v_u_22 then
		v384 = nil
	else
		v384 = p381.alternate
	end
	local v385 = p381.alternate
	if v385 ~= nil then
		v385.return_ = nil
		if not v_u_22 then
			p381.alternate = nil
		end
	end
	p381.return_ = nil
	if not v_u_22 and v384 ~= nil then
		local v386 = v384.alternate
		if v386 ~= nil then
			v386.return_ = nil
			if not v_u_22 then
				v384.alternate = nil
			end
		end
		v384.return_ = nil
	end
end
function commitSuspenseComponent(p388) -- name: commitSuspenseComponent
	-- upvalues: (ref) v_u_95, (copy) v_u_75, (copy) v_u_300, (copy) v_u_20, (copy) v_u_10, (copy) v_u_6
	local v389 = p388.memoizedState
	if v389 ~= nil then
		if not v_u_95 then
			v_u_95 = require(script.Parent["ReactFiberWorkLoop.new"])
		end
		v_u_95.markCommitTimeOfFallback()
		if v_u_75 then
			v_u_300(p388.child, true)
		end
	end
	if v_u_20 and v389 ~= nil then
		local v390 = p388.memoizedProps.suspenseCallback
		if typeof(v390) == "function" then
			local v391 = p388.updateQueue
			if v391 ~= nil then
				v390(table.clone(v391))
				return
			end
		elseif v_u_10 and v390 ~= nil then
			v_u_6.error("Unexpected type for suspenseCallback: %s", (tostring(v390)))
		end
	end
end
function commitSuspenseHydrationCallbacks(p392, p393) -- name: commitSuspenseHydrationCallbacks
	-- upvalues: (copy) v_u_78, (copy) v_u_93, (copy) v_u_20
	if v_u_78 then
		if p393.memoizedState == nil then
			local v394 = p393.alternate
			if v394 ~= nil then
				local v395 = v394.memoizedState
				if v395 ~= nil then
					local v396 = v395.dehydrated
					if v396 ~= nil then
						v_u_93(v396)
						if v_u_20 then
							local v397 = p392.hydrationCallbacks
							local v398 = v397 ~= nil and v397.onHydrated
							if v398 then
								v398(v396)
							end
						end
					end
				end
			end
		end
	end
end
function attachSuspenseRetryListeners(p_u_399) -- name: attachSuspenseRetryListeners
	-- upvalues: (copy) v_u_9, (copy) v_u_98, (copy) v_u_17, (copy) v_u_15
	local v400 = p_u_399.updateQueue
	if v400 ~= nil then
		p_u_399.updateQueue = nil
		local v401 = p_u_399.stateNode
		if v401 == nil then
			p_u_399.stateNode = v_u_9.new()
			v401 = p_u_399.stateNode
		end
		for v_u_402, _ in v400 do
			local function v_u_403()
				-- upvalues: (ref) v_u_98, (copy) p_u_399, (copy) v_u_402
				return v_u_98(p_u_399, v_u_402)
			end
			if v401:has(v_u_402) then
				continue
			end
			if v_u_17 and v_u_402.__reactDoNotTraceInteractions ~= true then
				v_u_403 = v_u_15(v_u_403)
			end
			v401:add(v_u_402)
			v_u_402:andThen(function()
				-- upvalues: (ref) v_u_403
				return v_u_403()
			end, function()
				-- upvalues: (ref) v_u_403
				return v_u_403()
			end)
		end
	end
end
function isSuspenseBoundaryBeingHidden(p404, p405) -- name: isSuspenseBoundaryBeingHidden
	if p404 ~= nil then
		local v406 = p404.memoizedState
		if v406 == nil or v406.dehydrated ~= nil then
			local v407 = p405.memoizedState
			local v408
			if v407 == nil then
				v408 = false
			else
				v408 = v407.dehydrated == nil
			end
			return v408
		end
	end
	return false
end
function commitResetTextContent(p409) -- name: commitResetTextContent
	-- upvalues: (copy) v_u_75, (copy) v_u_81
	if v_u_75 then
		v_u_81(p409.stateNode)
	end
end
function invokeLayoutEffectMountInDEV(p410) -- name: invokeLayoutEffectMountInDEV
	-- upvalues: (copy) v_u_10, (copy) v_u_21, (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_44, (copy) v_u_164, (copy) v_u_104, (copy) v_u_103, (copy) v_u_45, (copy) v_u_46, (ref) v_u_101, (copy) v_u_26
	if v_u_10 and v_u_21 then
		if p410.tag == v_u_24 or (p410.tag == v_u_25 or (p410.tag == v_u_36 or p410.tag == v_u_40)) then
			local v411 = v_u_104
			local v412 = v_u_103
			v_u_44(nil, v_u_164, nil, bit32.bor(v411, v412), p410)
			if v_u_45() then
				local v413 = v_u_46()
				v_u_101(p410, p410.return_, v413)
			end
			return
		end
	elseif p410.tag == v_u_26 then
		local v414 = p410.stateNode
		v_u_44(nil, v414.componentDidMount, v414)
		if v_u_45() then
			local v415 = v_u_46()
			v_u_101(p410, p410.return_, v415)
		end
		return
	end
end
function invokePassiveEffectMountInDEV(p416) -- name: invokePassiveEffectMountInDEV
	-- upvalues: (copy) v_u_10, (copy) v_u_21, (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_44, (copy) v_u_164, (copy) v_u_105, (copy) v_u_103, (copy) v_u_45, (copy) v_u_46, (ref) v_u_101
	if v_u_10 and (v_u_21 and (p416.tag == v_u_24 or (p416.tag == v_u_25 or (p416.tag == v_u_36 or p416.tag == v_u_40)))) then
		local v417 = v_u_105
		local v418 = v_u_103
		v_u_44(nil, v_u_164, nil, bit32.bor(v417, v418), p416)
		if v_u_45() then
			local v419 = v_u_46()
			v_u_101(p416, p416.return_, v419)
		end
	end
end
function invokeLayoutEffectUnmountInDEV(p420) -- name: invokeLayoutEffectUnmountInDEV
	-- upvalues: (copy) v_u_10, (copy) v_u_21, (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_44, (copy) v_u_151, (copy) v_u_104, (copy) v_u_103, (copy) v_u_45, (copy) v_u_46, (ref) v_u_101, (copy) v_u_26
	if v_u_10 and v_u_21 then
		if p420.tag == v_u_24 or (p420.tag == v_u_25 or (p420.tag == v_u_36 or p420.tag == v_u_40)) then
			local v421 = v_u_104
			local v422 = v_u_103
			v_u_44(nil, v_u_151, nil, bit32.bor(v421, v422), p420, p420.return_)
			if v_u_45() then
				local v423 = v_u_46()
				v_u_101(p420, p420.return_, v423)
			end
			return
		end
	elseif p420.tag == v_u_26 then
		local v424 = p420.stateNode
		local v425 = v424.componentWillUnmount
		if typeof(v425) == "function" then
			safelyCallComponentWillUnmount(p420, v424, p420.return_)
		end
		return
	end
end
function invokePassiveEffectUnmountInDEV(p426) -- name: invokePassiveEffectUnmountInDEV
	-- upvalues: (copy) v_u_10, (copy) v_u_21, (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_44, (copy) v_u_151, (copy) v_u_105, (copy) v_u_103, (copy) v_u_45, (copy) v_u_46, (ref) v_u_101
	if v_u_10 and (v_u_21 and (p426.tag == v_u_24 or (p426.tag == v_u_25 or (p426.tag == v_u_36 or p426.tag == v_u_40)))) then
		local v427 = v_u_105
		local v428 = v_u_103
		v_u_44(nil, v_u_151, nil, bit32.bor(v427, v428), p426, p426.return_)
		if v_u_45() then
			local v429 = v_u_46()
			v_u_101(p426, p426.return_, v429)
		end
	end
end
return {
	["safelyCallDestroy"] = v138,
	["commitBeforeMutationLifeCycles"] = function(p430, p431) -- name: commitBeforeMutationLifeCycles
		-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_26, (copy) v_u_51, (copy) v_u_10, (copy) v_u_107, (copy) v_u_6, (copy) v_u_57, (copy) v_u_65, (copy) v_u_27, (copy) v_u_75, (copy) v_u_94, (copy) v_u_28, (copy) v_u_29, (copy) v_u_30, (copy) v_u_34, (copy) v_u_58
		if p431.tag == v_u_24 or (p431.tag == v_u_25 or (p431.tag == v_u_36 or p431.tag == v_u_40)) then
			return
		elseif p431.tag == v_u_26 then
			local v432 = p431.flags
			local v433 = v_u_51
			if bit32.band(v432, v433) ~= 0 and p430 ~= nil then
				local v434 = p430.memoizedProps
				local v435 = p430.memoizedState
				local v436 = p431.stateNode
				if v_u_10 and (p431.type == p431.elementType and not v_u_107) then
					if v436.props ~= p431.memoizedProps then
						v_u_6.error("Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_57(p431.type) or "instance")
					end
					if v436.state ~= p431.memoizedState then
						v_u_6.error("Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_57(p431.type) or "instance")
					end
				end
				v436.__reactInternalSnapshotBeforeUpdate = v436:getSnapshotBeforeUpdate(p431.elementType == p431.type and v434 and v434 or v_u_65(p431.type, v434), v435)
			end
			return
		elseif p431.tag == v_u_27 then
			if v_u_75 then
				local v437 = p431.flags
				local v438 = v_u_51
				if bit32.band(v437, v438) ~= 0 then
					v_u_94(p431.stateNode.containerInfo)
				end
			end
			return
		elseif p431.tag ~= v_u_28 and (p431.tag ~= v_u_29 and (p431.tag ~= v_u_30 and p431.tag ~= v_u_34)) then
			v_u_58(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
		end
	end,
	["commitResetTextContent"] = commitResetTextContent,
	["commitPlacement"] = v365,
	["commitDeletion"] = v387,
	["commitWork"] = function(p439, p_u_440) -- name: commitWork
		-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_35, (copy) v_u_36, (copy) v_u_40, (copy) v_u_18, (copy) v_u_19, (copy) v_u_72, (copy) v_u_67, (copy) v_u_151, (copy) v_u_104, (copy) v_u_103, (copy) v_u_59, (copy) v_u_69, (copy) v_u_26, (copy) v_u_28, (copy) v_u_80, (copy) v_u_29, (copy) v_u_58, (copy) v_u_82, (copy) v_u_27, (copy) v_u_78, (copy) v_u_2, (copy) v_u_31, (copy) v_u_32, (copy) v_u_37, (copy) v_u_34, (copy) v_u_41, (copy) v_u_42, (copy) v_u_300
		if p_u_440.tag ~= v_u_24 and (p_u_440.tag ~= v_u_25 and (p_u_440.tag ~= v_u_35 and (p_u_440.tag ~= v_u_36 and p_u_440.tag ~= v_u_40))) then
			if p_u_440.tag == v_u_26 then
				return
			elseif p_u_440.tag == v_u_28 then
				local v441 = p_u_440.stateNode
				if v441 ~= nil then
					local v442 = p_u_440.memoizedProps
					local v443
					if p439 then
						v443 = p439.memoizedProps
					else
						v443 = v442
					end
					local v444 = p_u_440.type
					local v445 = p_u_440.updateQueue
					p_u_440.updateQueue = nil
					if v445 ~= nil then
						v_u_80(v441, v445, v444, v443, v442, p_u_440)
					end
				end
				return
			elseif p_u_440.tag == v_u_29 then
				v_u_58(p_u_440.stateNode ~= nil, "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.")
				local v446 = p_u_440.stateNode
				local v447 = p_u_440.memoizedProps
				local v448
				if p439 == nil then
					v448 = nil
				else
					local _ = p439.memoizedProps
					v448 = v447
				end
				v_u_82(v446, v448, v447)
				return
			elseif p_u_440.tag == v_u_27 then
				if v_u_78 then
					local v449 = p_u_440.stateNode
					if v449.hydrate then
						v449.hydrate = false
						v_u_2("commitWork: HostRoot: commitHydratedContainer")
					end
				end
				return
			elseif p_u_440.tag == v_u_31 then
				return
			elseif p_u_440.tag == v_u_32 then
				commitSuspenseComponent(p_u_440)
				attachSuspenseRetryListeners(p_u_440)
			else
				if p_u_440.tag == v_u_37 then
					v_u_2("commitWork: SuspenseListComponent")
				else
					if p_u_440.tag == v_u_34 then
						return
					end
					if p_u_440.tag == v_u_41 or p_u_440.tag == v_u_42 then
						v_u_300(p_u_440, p_u_440.memoizedState ~= nil)
						return
					end
				end
				v_u_58(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
			end
		end
		local v450, v451
		if v_u_18 and v_u_19 then
			local v452 = p_u_440.mode
			local v453 = v_u_72
			if bit32.band(v452, v453) == 0 then
				v450 = v_u_104
				v451 = v_u_103
				v_u_151(bit32.bor(v450, v451), p_u_440, p_u_440.return_)
			else
				local function v456()
					-- upvalues: (ref) v_u_67, (ref) v_u_151, (ref) v_u_104, (ref) v_u_103, (copy) p_u_440
					v_u_67()
					local v454 = v_u_104
					local v455 = v_u_103
					v_u_151(bit32.bor(v454, v455), p_u_440, p_u_440.return_)
				end
				local v457 = v_u_59
				local v458, v459 = xpcall(v456, v457)
				v_u_69(p_u_440)
				if not v458 then
					error(v459)
					return
				end
			end
		else
			v450 = v_u_104
			v451 = v_u_103
			v_u_151(bit32.bor(v450, v451), p_u_440, p_u_440.return_)
			return
		end
	end,
	["commitAttachRef"] = commitAttachRef,
	["commitDetachRef"] = commitDetachRef,
	["commitPassiveUnmount"] = function(p460) -- name: commitPassiveUnmount
		-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_18, (copy) v_u_19, (copy) v_u_72, (copy) v_u_70, (copy) v_u_151, (copy) v_u_105, (copy) v_u_103, (copy) v_u_68
		if p460.tag == v_u_24 or (p460.tag == v_u_25 or (p460.tag == v_u_36 or p460.tag == v_u_40)) then
			if v_u_18 and v_u_19 then
				local v461 = p460.mode
				local v462 = v_u_72
				if bit32.band(v461, v462) ~= 0 then
					v_u_70()
					local v463 = v_u_105
					local v464 = v_u_103
					v_u_151(bit32.bor(v463, v464), p460, p460.return_)
					v_u_68(p460)
					return
				end
			end
			local v465 = v_u_105
			local v466 = v_u_103
			v_u_151(bit32.bor(v465, v466), p460, p460.return_)
		end
	end,
	["commitPassiveUnmountInsideDeletedTree"] = function(p467, p468) -- name: commitPassiveUnmountInsideDeletedTree
		-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_18, (copy) v_u_19, (copy) v_u_72, (copy) v_u_70, (copy) v_u_151, (copy) v_u_105, (copy) v_u_68
		if p467.tag == v_u_24 or (p467.tag == v_u_25 or (p467.tag == v_u_36 or p467.tag == v_u_40)) then
			if v_u_18 and v_u_19 then
				local v469 = p467.mode
				local v470 = v_u_72
				if bit32.band(v469, v470) ~= 0 then
					v_u_70()
					v_u_151(v_u_105, p467, p468)
					v_u_68(p467)
					return
				end
			end
			v_u_151(v_u_105, p467, p468)
		end
	end,
	["commitPassiveMount"] = function(p471, p472) -- name: commitPassiveMount
		-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_36, (copy) v_u_40, (copy) v_u_18, (copy) v_u_19, (copy) v_u_72, (copy) v_u_70, (copy) v_u_164, (copy) v_u_59, (copy) v_u_105, (copy) v_u_103, (copy) v_u_68, (copy) v_u_31
		if p472.tag == v_u_24 or (p472.tag == v_u_25 or (p472.tag == v_u_36 or p472.tag == v_u_40)) then
			local v473, v474
			if v_u_18 and v_u_19 then
				local v475 = p472.mode
				local v476 = v_u_72
				if bit32.band(v475, v476) == 0 then
					v473 = v_u_105
					v474 = v_u_103
					v_u_164(bit32.bor(v473, v474), p472)
				else
					v_u_70()
					local v477 = v_u_164
					local v478 = v_u_59
					local v479 = v_u_105
					local v480 = v_u_103
					local v481 = bit32.bor(v479, v480)
					local v482, v483 = xpcall(v477, v478, v481, p472)
					v_u_68(p472)
					if not v482 then
						error(v483)
						return
					end
				end
			else
				v473 = v_u_105
				v474 = v_u_103
				v_u_164(bit32.bor(v473, v474), p472)
				return
			end
		else
			if p472.tag == v_u_31 then
				commitProfilerPassiveEffect(p471, p472)
			end
			return
		end
	end,
	["invokeLayoutEffectMountInDEV"] = invokeLayoutEffectMountInDEV,
	["invokeLayoutEffectUnmountInDEV"] = invokeLayoutEffectUnmountInDEV,
	["invokePassiveEffectMountInDEV"] = invokePassiveEffectMountInDEV,
	["invokePassiveEffectUnmountInDEV"] = invokePassiveEffectUnmountInDEV,
	["isSuspenseBoundaryBeingHidden"] = isSuspenseBoundaryBeingHidden,
	["recursivelyCommitLayoutEffects"] = v_u_252
}