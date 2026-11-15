-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactFiberCompleteWork.new
local v1 = script.Parent.Parent
require(script.Parent.ReactInternalTypes)
local v2 = require(script.Parent.ReactFiberLane)
local v_u_3 = v2.OffscreenLane
local v4 = require(script.Parent.ReactFiberHostConfig)
require(script.Parent.ReactFiberOffscreenComponent)
local v_u_5 = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions
local v6 = require(script.Parent.ReactWorkTags)
local v_u_7 = v6.IndeterminateComponent
local v_u_8 = v6.FunctionComponent
local v_u_9 = v6.ClassComponent
local v_u_10 = v6.HostRoot
local v_u_11 = v6.HostComponent
local v_u_12 = v6.HostText
local v_u_13 = v6.HostPortal
local v_u_14 = v6.ContextProvider
local v_u_15 = v6.ContextConsumer
local v_u_16 = v6.ForwardRef
local v_u_17 = v6.Fragment
local v_u_18 = v6.Mode
local v_u_19 = v6.Profiler
local v_u_20 = v6.SuspenseComponent
local v_u_21 = v6.SuspenseListComponent
local v_u_22 = v6.MemoComponent
local v_u_23 = v6.SimpleMemoComponent
local v_u_24 = v6.LazyComponent
local v_u_25 = v6.IncompleteClassComponent
local v_u_26 = v6.FundamentalComponent
local v_u_27 = v6.ScopeComponent
local v_u_28 = v6.Block
local v_u_29 = v6.OffscreenComponent
local v_u_30 = v6.LegacyHiddenComponent
require(script.Parent["ReactFiberSuspenseComponent.new"])
local v31 = require(script.Parent.ReactTypeOfMode)
local v_u_32 = v31.NoMode
local v_u_33 = v31.ConcurrentMode
local v_u_34 = v31.BlockingMode
local v_u_35 = v31.ProfileMode
local v36 = require(script.Parent.ReactFiberFlags)
local v_u_37 = v36.Ref
local v_u_38 = v36.Update
local v_u_39 = v36.HostUpdate
local v_u_40 = v36.Callback
local v_u_41 = v36.Passive
local v_u_42 = v36.Deletion
local v_u_43 = v36.NoFlags
local v_u_44 = v36.DidCapture
local v_u_45 = v36.Snapshot
local v_u_46 = v36.MutationMask
local v_u_47 = v36.LayoutMask
local v_u_48 = v36.PassiveMask
local v_u_49 = v36.StaticMask
local v_u_50 = v36.PerformedWork
local v_u_51 = require(v1.Shared).invariant
local v_u_52 = v4.createInstance
local v_u_53 = v4.createTextInstance
local v_u_54 = v4.appendInitialChild
local v_u_55 = v4.finalizeInitialChildren
local v_u_56 = v4.prepareUpdate
local v_u_57 = v4.supportsMutation
local v_u_58 = v4.supportsPersistence
local v_u_59 = v4.createContainerChildSet
local v_u_60 = v4.finalizeContainerChildren
local v_u_61 = v4.preparePortalMount
local v62 = require(script.Parent["ReactFiberHostContext.new"])
local v_u_63 = v62.getRootHostContainer
local v_u_64 = v62.popHostContext
local v_u_65 = v62.getHostContext
local v_u_66 = v62.popHostContainer
local v67 = require(script.Parent["ReactFiberSuspenseContext.new"])
local v_u_68 = v67.popSuspenseContext
local v_u_69 = v67.suspenseStackCursor
local v_u_70 = v67.InvisibleParentSuspenseContext
local v_u_71 = v67.hasSuspenseContext
local v72 = require(script.Parent["ReactFiberContext.new"])
local v_u_73 = v72.isContextProvider
local v_u_74 = v72.popContext
local v_u_75 = v72.popTopLevelContextObject
local v_u_76 = require(script.Parent["ReactFiberNewContext.new"]).popProvider
local v77 = require(script.Parent["ReactFiberHydrationContext.new"])
local v_u_78 = v77.prepareToHydrateHostSuspenseInstance
local v_u_79 = v77.popHydrationState
local v_u_80 = v77.resetHydrationState
local v_u_81 = v77.prepareToHydrateHostInstance
local v_u_82 = v77.prepareToHydrateHostTextInstance
local v_u_83 = require(v1.Shared).ReactFeatureFlags
local v_u_84 = v_u_83.enableSchedulerTracing
local v_u_85 = v_u_83.enableSuspenseCallback
local v_u_86 = v_u_83.enableSuspenseServerRenderer
local v_u_87 = v_u_83.enableFundamentalAPI
local v_u_88 = v_u_83.enableProfilerTimer
local v_u_89 = require(script.Parent["ReactFiberWorkLoop.new"])
local v_u_90 = v_u_89.popRenderLanes
local v_u_91 = v_u_89.markSpawnedWork
local v_u_92 = v_u_89.renderDidSuspend
local v_u_93 = v_u_89.renderDidSuspendDelayIfPossible
local v_u_94 = v2.NoLanes
local v_u_95 = v2.includesSomeLane
local v_u_96 = v2.mergeLanes
local v_u_97 = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration
local function v_u_106(p98, p99) -- name: hadNoMutationsEffects
	-- upvalues: (copy) v_u_46, (copy) v_u_43
	local v100
	if p98 == nil then
		v100 = false
	else
		v100 = p98.child == p99.child
	end
	if v100 then
		return true
	end
	local v101 = p99.child
	while v101 ~= nil do
		local v102 = v101.flags
		local v103 = v_u_46
		if bit32.band(v102, v103) ~= v_u_43 then
			return false
		end
		local v104 = v101.subtreeFlags
		local v105 = v_u_46
		if bit32.band(v104, v105) ~= v_u_43 then
			return false
		end
		v101 = v101.sibling
	end
	return true
end
local v_u_107 = nil
local v_u_108 = nil
local v_u_109 = nil
local v_u_110
if v_u_57 then
	v_u_110 = function(_, _) end
	v_u_107 = function(p111, p112, _, _)
		-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_54, (copy) v_u_87, (copy) v_u_26, (copy) v_u_13
		local v113 = p112.child
		while true do
			while true do
				if v113 == nil then
					return
				end
				if v113.tag == v_u_11 or v113.tag == v_u_12 then
					break
				end
				if v_u_87 and v113.tag == v_u_26 then
					v_u_54(p111, v113.stateNode.instance)
					if v113 == p112 then
						return
					end
					while v113.sibling == nil do
						if v113.return_ == nil or v113.return_ == p112 then
							return
						end
						v113 = v113.return_
					end
					v113.sibling.return_ = v113.return_
					v113 = v113.sibling
				elseif v113.tag == v_u_13 or v113.child == nil then
					if v113 == p112 then
						return
					end
					while v113.sibling == nil do
						if v113.return_ == nil or v113.return_ == p112 then
							return
						end
						v113 = v113.return_
					end
					v113.sibling.return_ = v113.return_
					v113 = v113.sibling
				else
					v113.child.return_ = v113
					v113 = v113.child
				end
			end
			v_u_54(p111, v113.stateNode)
			if v113 == p112 then
				return
			end
			while v113.sibling == nil do
				if v113.return_ == nil or v113.return_ == p112 then
					return
				end
				v113 = v113.return_
			end
			v113.sibling.return_ = v113.return_
			v113 = v113.sibling
		end
	end
	v_u_109 = function(_, p114, p115, p116) -- name: updateHostText
		-- upvalues: (copy) v_u_38
		if p115 ~= p116 then
			local v117 = p114.flags
			local v118 = v_u_38
			p114.flags = bit32.bor(v117, v118)
		end
	end
	v_u_108 = function(p119, p120, p121, p122, p123) -- name: updateHostComponent
		-- upvalues: (copy) v_u_65, (copy) v_u_56, (copy) v_u_83, (copy) v_u_39, (copy) v_u_38
		local v124 = p119.memoizedProps
		if v124 ~= p122 then
			local v125 = v_u_56(p120.stateNode, p121, v124, p122, p123, (v_u_65()))
			if v_u_83.enableWorkLoopTrims then
				if v125 ~= nil or p120.updateQueue ~= nil then
					p120.updateQueue = v125
				end
			else
				p120.updateQueue = v125
			end
			if v125 then
				if v_u_83.enableCommitTraversalTrims then
					local v126 = p120.flags
					local v127 = v_u_39
					p120.flags = bit32.bor(v126, v127)
					return
				end
				local v128 = p120.flags
				local v129 = v_u_38
				p120.flags = bit32.bor(v128, v129)
			end
		end
	end
elseif v_u_58 then
	v_u_110 = function(p130, p131) -- name: updateHostContainer
		-- upvalues: (copy) v_u_106, (copy) v_u_59, (copy) v_u_38, (copy) v_u_60
		local v132 = p131.stateNode
		if not v_u_106(p130, p131) then
			local v133 = v132.containerInfo
			local v134 = v_u_59(v133)
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
			error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
			v132.pendingChildren = v134
			local v135 = p131.flags
			local v136 = v_u_38
			p131.flags = bit32.bor(v135, v136)
			v_u_60(v133, v134)
		end
	end
	v_u_107 = function(_, _, _, _)
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"))
		error("FIXME (roblox): appendAllChildren is unimplemented", 2)
	end
else
	v_u_110 = function(_, _) end
end
local function v_u_180(p137) -- name: bubbleProperties
	-- upvalues: (copy) v_u_94, (copy) v_u_43, (copy) v_u_88, (copy) v_u_35, (copy) v_u_32, (copy) v_u_96, (copy) v_u_49
	local v138
	if p137.alternate == nil then
		v138 = false
	else
		v138 = p137.alternate.child == p137.child
	end
	local v139 = v_u_94
	local v140 = v_u_43
	if v138 then
		local v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152
		if v_u_88 then
			local v153 = p137.mode
			local v154 = v_u_35
			if bit32.band(v153, v154) == v_u_32 then
				v141 = p137.child
				while v141 ~= nil do
					v142 = v141.lanes
					v143 = v141.childLanes
					v144 = bit32.bor(v142, v143)
					v139 = bit32.bor(v139, v144)
					v145 = v141.subtreeFlags
					v146 = v_u_49
					v147 = bit32.band(v145, v146)
					v148 = bit32.bor(v140, v147)
					v149 = v141.flags
					v150 = v_u_49
					v151 = bit32.band(v149, v150)
					v140 = bit32.bor(v148, v151)
					v141.return_ = p137
					v141 = v141.sibling
				end
				v152 = p137.subtreeFlags
				p137.subtreeFlags = bit32.bor(v152, v140)
			else
				local v155 = p137.selfBaseDuration
				local v156 = p137.child
				while v156 ~= nil do
					v139 = v_u_96(v139, v_u_96(v156.lanes, v156.childLanes))
					local v157 = v156.subtreeFlags
					local v158 = v_u_49
					local v159 = bit32.band(v157, v158)
					local v160 = bit32.bor(v140, v159)
					local v161 = v156.flags
					local v162 = v_u_49
					local v163 = bit32.band(v161, v162)
					v140 = bit32.bor(v160, v163)
					v155 = v155 + v156.treeBaseDuration
					v156 = v156.sibling
				end
				p137.treeBaseDuration = v155
				v152 = p137.subtreeFlags
				p137.subtreeFlags = bit32.bor(v152, v140)
			end
		else
			v141 = p137.child
			while v141 ~= nil do
				v142 = v141.lanes
				v143 = v141.childLanes
				v144 = bit32.bor(v142, v143)
				v139 = bit32.bor(v139, v144)
				v145 = v141.subtreeFlags
				v146 = v_u_49
				v147 = bit32.band(v145, v146)
				v148 = bit32.bor(v140, v147)
				v149 = v141.flags
				v150 = v_u_49
				v151 = bit32.band(v149, v150)
				v140 = bit32.bor(v148, v151)
				v141.return_ = p137
				v141 = v141.sibling
			end
			v152 = p137.subtreeFlags
			p137.subtreeFlags = bit32.bor(v152, v140)
		end
		p137.childLanes = v139
		return v138
	end
	local v164, v165, v166, v167, v168, v169, v170
	if not v_u_88 then
		v164 = p137.child
		while v164 ~= nil do
			v165 = v164.lanes
			v166 = v164.childLanes
			v167 = bit32.bor(v165, v166)
			v139 = bit32.bor(v139, v167)
			v168 = v164.subtreeFlags
			v169 = bit32.bor(v140, v168)
			v170 = v164.flags
			v140 = bit32.bor(v169, v170)
			v164.return_ = p137
			v164 = v164.sibling
		end
		v179 = p137.subtreeFlags
		p137.subtreeFlags = bit32.bor(v179, v140)
		p137.childLanes = v139
		return v138
	end
	local v171 = p137.mode
	local v172 = v_u_35
	if bit32.band(v171, v172) == v_u_32 then
		v164 = p137.child
		while v164 ~= nil do
			v165 = v164.lanes
			v166 = v164.childLanes
			v167 = bit32.bor(v165, v166)
			v139 = bit32.bor(v139, v167)
			v168 = v164.subtreeFlags
			v169 = bit32.bor(v140, v168)
			v170 = v164.flags
			v140 = bit32.bor(v169, v170)
			v164.return_ = p137
			v164 = v164.sibling
		end
		v179 = p137.subtreeFlags
		p137.subtreeFlags = bit32.bor(v179, v140)
		p137.childLanes = v139
		return v138
	end
	local v173 = p137.actualDuration
	local v174 = p137.selfBaseDuration
	local v175 = p137.child
	while v175 ~= nil do
		v139 = v_u_96(v139, v_u_96(v175.lanes, v175.childLanes))
		local v176 = v175.subtreeFlags
		local v177 = bit32.bor(v140, v176)
		local v178 = v175.flags
		v140 = bit32.bor(v177, v178)
		v173 = v173 + v175.actualDuration
		v174 = v174 + v175.treeBaseDuration
		v175 = v175.sibling
	end
	p137.actualDuration = v173
	p137.treeBaseDuration = v174
	local v179 = p137.subtreeFlags
	p137.subtreeFlags = bit32.bor(v179, v140)
	p137.childLanes = v139
	return v138
end
return {
	["completeWork"] = function(p181, p182, p183) -- name: completeWork
		-- upvalues: (copy) v_u_7, (copy) v_u_24, (copy) v_u_23, (copy) v_u_8, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_15, (copy) v_u_22, (copy) v_u_180, (copy) v_u_9, (copy) v_u_73, (copy) v_u_74, (copy) v_u_10, (copy) v_u_66, (copy) v_u_75, (copy) v_u_5, (copy) v_u_79, (copy) v_u_38, (copy) v_u_45, (ref) v_u_110, (copy) v_u_11, (copy) v_u_64, (copy) v_u_63, (ref) v_u_108, (copy) v_u_37, (copy) v_u_51, (copy) v_u_65, (copy) v_u_81, (copy) v_u_52, (ref) v_u_107, (copy) v_u_55, (copy) v_u_12, (ref) v_u_109, (copy) v_u_82, (copy) v_u_53, (copy) v_u_19, (copy) v_u_40, (copy) v_u_41, (copy) v_u_50, (copy) v_u_43, (copy) v_u_83, (copy) v_u_47, (copy) v_u_42, (copy) v_u_39, (copy) v_u_48, (copy) v_u_20, (copy) v_u_68, (copy) v_u_86, (copy) v_u_78, (copy) v_u_84, (copy) v_u_91, (copy) v_u_3, (copy) v_u_88, (copy) v_u_35, (copy) v_u_32, (copy) v_u_80, (copy) v_u_44, (copy) v_u_97, (copy) v_u_34, (copy) v_u_71, (copy) v_u_69, (copy) v_u_70, (copy) v_u_92, (copy) v_u_93, (copy) v_u_58, (copy) v_u_57, (copy) v_u_85, (copy) v_u_13, (copy) v_u_61, (copy) v_u_14, (copy) v_u_76, (copy) v_u_25, (copy) v_u_21, (copy) v_u_26, (copy) v_u_27, (copy) v_u_28, (copy) v_u_29, (copy) v_u_30, (copy) v_u_90, (copy) v_u_95, (copy) v_u_89, (copy) v_u_33
		-- control flow flattened: this region could not be structured without a goto (unsupported in Luau), so it was lowered to the state-machine dispatch loop below to keep the output runnable.
		local v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265
		local v266 = 28
		while true do
			if v266 == 1 then
				v235 = bit32.bor(v256, v255)
				if v_u_83.enableCommitTraversalTrims then
					v266 = 2
				else
					v266 = 27
				end
			elseif v266 == 2 then
				v262 = v_u_47
				v200 = v_u_42
				v212 = v_u_39
				v229 = bit32.bor(v262, v200, v212)
				if bit32.band(v256, v229) == v_u_43 then
					v266 = 13
				else
					v266 = 4
				end
			elseif v266 == 3 then
				v213 = v_u_48
				if bit32.band(v256, v213) ~= v_u_43 then
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				v187 = v_u_48
				if bit32.band(v218, v187) == v_u_43 then
					p182.flags = v235
				else
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
				end
				return nil
			elseif v266 == 4 then
				v235 = bit32.bor(v235, v196)
				v213 = v_u_48
				if bit32.band(v256, v213) ~= v_u_43 then
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				v187 = v_u_48
				if bit32.band(v218, v187) == v_u_43 then
					p182.flags = v235
				else
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
				end
				v266 = 23
			elseif v266 == 5 then
				v262 = v_u_47
				v200 = v_u_42
				v212 = v_u_39
				v229 = bit32.bor(v262, v200, v212)
				if bit32.band(v256, v229) == v_u_43 then
					v266 = 16
				else
					v266 = 17
				end
			elseif v266 == 6 then
				v235 = bit32.bor(v235, v196)
				v213 = v_u_48
				if bit32.band(v256, v213) ~= v_u_43 then
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				v187 = v_u_48
				if bit32.band(v218, v187) == v_u_43 then
					p182.flags = v235
				else
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
				end
				v266 = 23
			elseif v266 == 7 then
				v235 = bit32.bor(v235, v196)
				v213 = v_u_48
				if bit32.band(v256, v213) == v_u_43 then
					v187 = v_u_48
					if bit32.band(v218, v187) == v_u_43 then
						p182.flags = v235
					else
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
					end
					return nil
				else
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				break
			elseif v266 == 8 then
				return nil
			elseif v266 == 9 then
				v235 = bit32.bor(v235, v196)
				v213 = v_u_48
				if bit32.band(v256, v213) ~= v_u_43 then
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				v266 = 20
			elseif v266 == 10 then
				v188 = v_u_47
				v232 = v_u_42
				v233 = v_u_39
				v234 = bit32.bor(v188, v232, v233)
				if bit32.band(v218, v234) == v_u_43 then
					v213 = v_u_48
					if bit32.band(v256, v213) ~= v_u_43 then
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
						return nil
					end
					v187 = v_u_48
					if bit32.band(v218, v187) == v_u_43 then
						p182.flags = v235
					else
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
					end
				else
					v235 = bit32.bor(v235, v196)
					v213 = v_u_48
					if bit32.band(v256, v213) ~= v_u_43 then
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
						return nil
					end
					v187 = v_u_48
					if bit32.band(v218, v187) == v_u_43 then
						p182.flags = v235
					else
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
					end
				end
				v266 = 8
			elseif v266 == 11 then
				v261 = v_u_50
				if bit32.band(v218, v261) == v_u_43 then
					v266 = 26
				else
					v266 = 1
				end
			elseif v266 == 12 then
				v235 = bit32.bor(v256, v255)
				if v_u_83.enableCommitTraversalTrims then
					v266 = 14
				else
					v266 = 15
				end
			elseif v266 == 13 then
				v188 = v_u_47
				v232 = v_u_42
				v233 = v_u_39
				v234 = bit32.bor(v188, v232, v233)
				if bit32.band(v218, v234) == v_u_43 then
					v213 = v_u_48
					if bit32.band(v256, v213) ~= v_u_43 then
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
						return nil
					end
					v187 = v_u_48
					if bit32.band(v218, v187) == v_u_43 then
						p182.flags = v235
					else
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
					end
				else
					v235 = bit32.bor(v235, v196)
					v213 = v_u_48
					if bit32.band(v256, v213) ~= v_u_43 then
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
						return nil
					end
					v187 = v_u_48
					if bit32.band(v218, v187) == v_u_43 then
						p182.flags = v235
					else
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
					end
				end
				v266 = 8
			elseif v266 == 14 then
				v262 = v_u_47
				v200 = v_u_42
				v212 = v_u_39
				v229 = bit32.bor(v262, v200, v212)
				if bit32.band(v256, v229) == v_u_43 then
					v266 = 10
				else
					v266 = 6
				end
			elseif v266 == 15 then
				v199 = v_u_47
				v186 = v_u_42
				v245 = bit32.bor(v199, v186)
				if bit32.band(v256, v245) == v_u_43 then
					v266 = 21
				else
					v266 = 22
				end
			elseif v266 == 16 then
				v188 = v_u_47
				v232 = v_u_42
				v233 = v_u_39
				v234 = bit32.bor(v188, v232, v233)
				if bit32.band(v218, v234) == v_u_43 then
					v213 = v_u_48
					if bit32.band(v256, v213) ~= v_u_43 then
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
						return nil
					end
					v187 = v_u_48
					if bit32.band(v218, v187) == v_u_43 then
						p182.flags = v235
					else
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
					end
				else
					v235 = bit32.bor(v235, v196)
					v213 = v_u_48
					if bit32.band(v256, v213) ~= v_u_43 then
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
						return nil
					end
					v187 = v_u_48
					if bit32.band(v218, v187) == v_u_43 then
						p182.flags = v235
					else
						v235 = bit32.bor(v235, v185)
						p182.flags = v235
					end
				end
				v266 = 8
			elseif v266 == 17 then
				v235 = bit32.bor(v235, v196)
				v213 = v_u_48
				if bit32.band(v256, v213) ~= v_u_43 then
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				v187 = v_u_48
				if bit32.band(v218, v187) == v_u_43 then
					p182.flags = v235
				else
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
				end
				v266 = 23
			elseif v266 == 18 then
				v197 = v_u_47
				v189 = v_u_42
				v246 = bit32.bor(v197, v189)
				if bit32.band(v218, v246) == v_u_43 then
					v266 = 3
				else
					v266 = 7
				end
			elseif v266 == 19 then
				v235 = bit32.bor(v235, v196)
				v213 = v_u_48
				if bit32.band(v256, v213) ~= v_u_43 then
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				v266 = 20
			elseif v266 == 20 then
				v187 = v_u_48
				if bit32.band(v218, v187) == v_u_43 then
					p182.flags = v235
				else
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
				end
				return nil
			elseif v266 == 21 then
				v197 = v_u_47
				v189 = v_u_42
				v246 = bit32.bor(v197, v189)
				if bit32.band(v218, v246) == v_u_43 then
					v266 = 3
				else
					v266 = 7
				end
			elseif v266 == 22 then
				v235 = bit32.bor(v235, v196)
				v213 = v_u_48
				if bit32.band(v256, v213) ~= v_u_43 then
					v235 = bit32.bor(v235, v185)
					p182.flags = v235
					return nil
				end
				v266 = 20
			elseif v266 == 23 then
				return nil
			elseif v266 == 24 then
				v199 = v_u_47
				v186 = v_u_42
				v245 = bit32.bor(v199, v186)
				if bit32.band(v256, v245) == v_u_43 then
					v266 = 18
				else
					v266 = 19
				end
			elseif v266 == 25 then
				v197 = v_u_47
				v189 = v_u_42
				v246 = bit32.bor(v197, v189)
				if bit32.band(v218, v246) == v_u_43 then
					v266 = 3
				else
					v266 = 7
				end
			elseif v266 == 26 then
				v235 = v256
				if v_u_83.enableCommitTraversalTrims then
					v266 = 5
				else
					v266 = 24
				end
			elseif v266 == 27 then
				v199 = v_u_47
				v186 = v_u_42
				v245 = bit32.bor(v199, v186)
				if bit32.band(v256, v245) == v_u_43 then
					v266 = 25
				else
					v266 = 9
				end
			else
				v247 = p182.pendingProps
				if p182.tag == v_u_7 or (p182.tag == v_u_24 or (p182.tag == v_u_23 or (p182.tag == v_u_8 or (p182.tag == v_u_16 or (p182.tag == v_u_17 or (p182.tag == v_u_18 or (p182.tag == v_u_15 or p182.tag == v_u_22))))))) then
					v_u_180(p182)
					return nil
				end
				if p182.tag == v_u_9 then
					if v_u_73(p182.type) then
						v_u_74(p182)
					end
					v_u_180(p182)
					return nil
				end
				if p182.tag == v_u_10 then
					v_u_66(p182)
					v_u_75(p182)
					v_u_5()
					v260 = p182.stateNode
					if v260.pendingContext then
						v260.context = v260.pendingContext
						v260.pendingContext = nil
					end
					if p181 == nil or p181.child == nil then
						if v_u_79(p182) then
							v214 = p182.flags
							v206 = v_u_38
							p182.flags = bit32.bor(v214, v206)
						elseif not v260.hydrate then
							v248 = p182.flags
							v230 = v_u_45
							p182.flags = bit32.bor(v248, v230)
						end
					end
					v_u_110(p181, p182)
					v_u_180(p182)
					return nil
				end
				if p182.tag == v_u_11 then
					v_u_64(p182)
					v198 = v_u_63()
					v190 = p182.type
					if p181 == nil or p182.stateNode == nil then
						if not v247 then
							v_u_51(p182.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
							v_u_180(p182)
							return nil
						end
						v249 = v_u_65()
						if v_u_79(p182) then
							if v_u_81(p182, v198, v249) then
								v231 = p182.flags
								v219 = v_u_38
								p182.flags = bit32.bor(v231, v219)
							end
						else
							v215 = v_u_52(v190, v247, v198, v249, p182)
							v_u_107(v215, p182, false, false)
							p182.stateNode = v215
							if v_u_55(v215, v190, v247, v198, v249) then
								v250 = p182.flags
								v236 = v_u_38
								p182.flags = bit32.bor(v250, v236)
							end
						end
						if p182.ref ~= nil then
							v237 = p182.flags
							v220 = v_u_37
							p182.flags = bit32.bor(v237, v220)
						end
					else
						v_u_108(p181, p182, v190, v247, v198)
						if p181.ref ~= p182.ref then
							v201 = p182.flags
							v191 = v_u_37
							p182.flags = bit32.bor(v201, v191)
						end
					end
					v_u_180(p182)
					return nil
				end
				if p182.tag == v_u_12 then
					if p181 and p182.stateNode ~= nil then
						v_u_109(p181, p182, p181.memoizedProps, v247)
					else
						if typeof(v247) ~= "string" then
							v_u_51(p182.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
						end
						v251 = v_u_63()
						v221 = v_u_65()
						if v_u_79(p182) then
							if v_u_82(p182) then
								v238 = p182.flags
								v222 = v_u_38
								p182.flags = bit32.bor(v238, v222)
							end
						else
							p182.stateNode = v_u_53(v247, v251, v221, p182)
						end
					end
					v_u_180(p182)
					return nil
				end
				if p182.tag ~= v_u_19 then
					if p182.tag == v_u_20 then
						v_u_68(p182)
						v263 = p182.memoizedState
						if v_u_86 and (v263 ~= nil and v263.dehydrated ~= nil) then
							if p181 == nil then
								v_u_51(v_u_79(p182), "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.")
								v_u_78(p182)
								if v_u_84 then
									v_u_91(v_u_3)
								end
								v_u_180(p182)
								if v_u_88 then
									v239 = p182.mode
									v223 = v_u_35
									if bit32.band(v239, v223) ~= v_u_32 and v263 ~= nil then
										v240 = p182.child
										if v240 ~= nil then
											p182.treeBaseDuration = v240.treeBaseDuration
										end
									end
								end
								return nil
							end
							v_u_80()
							v241 = p182.flags
							v224 = v_u_44
							if bit32.band(v241, v224) == v_u_43 then
								p182.memoizedState = nil
							end
							v258 = p182.flags
							v252 = v_u_38
							p182.flags = bit32.bor(v258, v252)
							v_u_180(p182)
							if v_u_88 then
								v192 = p182.mode
								v259 = v_u_35
								if bit32.band(v192, v259) ~= v_u_32 and v263 ~= nil then
									v193 = p182.child
									if v193 ~= nil then
										p182.treeBaseDuration = p182.treeBaseDuration - v193.treeBaseDuration
									end
								end
							end
							return nil
						end
						v242 = p182.flags
						v225 = v_u_44
						if bit32.band(v242, v225) ~= v_u_43 then
							p182.lanes = p183
							if v_u_88 then
								v253 = p182.mode
								v243 = v_u_35
								if bit32.band(v253, v243) ~= v_u_32 then
									v_u_97(p182)
								end
							end
							return p182
						end
						v211 = v263 ~= nil
						v264 = false
						if p181 == nil then
							if p182.memoizedProps.fallback ~= nil then
								v_u_79(p182)
							end
						else
							v264 = p181.memoizedState ~= nil
						end
						if v211 and not v264 then
							v202 = p182.mode
							v194 = v_u_34
							if bit32.band(v202, v194) ~= v_u_32 then
								if p181 == nil then
									v207 = p182.memoizedProps.unstable_avoidThisFallback ~= true
								else
									v207 = false
								end
								if v207 or v_u_71(v_u_69.current, v_u_70) then
									v_u_92()
								else
									v_u_93()
								end
							end
						end
						if v_u_58 and v211 then
							v216 = p182.flags
							v208 = v_u_38
							p182.flags = bit32.bor(v216, v208)
						end
						if v_u_57 and (v211 or v264) then
							v244 = p182.flags
							v226 = v_u_38
							p182.flags = bit32.bor(v244, v226)
						end
						if v_u_85 and (p182.updateQueue ~= nil and p182.memoizedProps.suspenseCallback ~= nil) then
							v195 = p182.flags
							v265 = v_u_38
							p182.flags = bit32.bor(v195, v265)
						end
						v_u_180(p182)
						if v_u_88 then
							v227 = p182.mode
							v217 = v_u_35
							if bit32.band(v227, v217) ~= v_u_32 and v211 then
								v254 = p182.child
								if v254 ~= nil then
									p182.treeBaseDuration = p182.treeBaseDuration - v254.treeBaseDuration
								end
							end
						end
						return nil
					end
					if p182.tag == v_u_13 then
						v_u_66(p182)
						v_u_110(p181, p182)
						if p181 == nil then
							v_u_61(p182.stateNode.containerInfo)
						end
						v_u_180(p182)
						return nil
					end
					if p182.tag == v_u_14 then
						v_u_76(p182)
						v_u_180(p182)
						return nil
					end
					if p182.tag == v_u_25 then
						if v_u_73(p182.type) then
							v_u_74(p182)
						end
						v_u_180(p182)
						return nil
					end
					if p182.tag == v_u_21 then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"))
						error("FIXME (roblox): SuspenseListComponent is unimplemented", 2)
						v228 = v_u_51
						v203 = p182.tag
						v228(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v203)))
						return nil
					end
					if p182.tag == v_u_26 then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"))
						error("FIXME (roblox): FundamentalComponent is unimplemented", 2)
						v228 = v_u_51
						v203 = p182.tag
						v228(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v203)))
						return nil
					end
					if p182.tag == v_u_27 then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"))
						error("FIXME (roblox): ScopeComponent is unimplemented", 2)
						v228 = v_u_51
						v203 = p182.tag
						v228(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v203)))
						return nil
					end
					if p182.tag == v_u_28 then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("UNIMPLEMENTED ERROR: " .. tostring("Block"))
						error("FIXME (roblox): Block is unimplemented", 2)
						v228 = v_u_51
						v203 = p182.tag
						v228(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v203)))
						return nil
					end
					if p182.tag ~= v_u_29 and p182.tag ~= v_u_30 then
						v228 = v_u_51
						v203 = p182.tag
						v228(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v203)))
						return nil
					end
					v_u_90(p182)
					v184 = p182.memoizedState ~= nil
					if p181 ~= nil and (p181.memoizedState ~= nil ~= v184 and v247.mode ~= "unstable-defer-without-hiding") then
						v209 = p182.flags
						v204 = v_u_38
						p182.flags = bit32.bor(v209, v204)
					end
					if not v184 or v_u_95(v_u_89.subtreeRenderLanes, v_u_3) then
						v_u_180(p182)
						return nil
					end
					v210 = p182.mode
					v205 = v_u_33
					if bit32.band(v210, v205) ~= v_u_32 then
						return nil
					end
					v_u_180(p182)
					return nil
				end
				if v_u_180(p182) then
					return nil
				end
				v255 = v_u_38
				v196 = v_u_40
				v185 = v_u_41
				v218 = p182.subtreeFlags
				v256 = p182.flags
				v257 = v_u_50
				if bit32.band(v256, v257) == v_u_43 then
					v266 = 11
				else
					v266 = 12
				end
			end
		end
	end
}