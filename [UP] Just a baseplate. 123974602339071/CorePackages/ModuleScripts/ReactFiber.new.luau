-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactFiber.new
local v1 = script.Parent.Parent
local v2 = require(v1.ReactGlobals)
local v3 = require(v1.LuauPolyfill)
local v_u_4 = v3.Object
local v_u_5 = v3.Array
local v_u_6 = v3.util.inspect
local v_u_7 = v2.__DEV__
local v_u_8 = require(v1.Shared).console
require(v1.Shared)
require(script.Parent.ReactInternalTypes)
local v9 = require(script.Parent.ReactRootTags)
local v10 = require(script.Parent.ReactWorkTags)
local v11 = require(script.Parent.ReactTypeOfMode)
local v12 = require(script.Parent.ReactFiberLane)
require(script.Parent.ReactFiberHostConfig)
require(script.Parent.ReactFiberOffscreenComponent)
local v_u_13 = require(v1.Shared).invariant
local v_u_14 = require(v1.Shared).ReactFeatureFlags
local v_u_15 = v_u_14.enableProfilerTimer
local v16 = require(script.Parent.ReactFiberFlags)
local v_u_17 = v16.NoFlags
local v_u_18 = v16.Placement
local v_u_19 = v16.StaticMask
local v_u_20 = v9.ConcurrentRoot
local v_u_21 = v9.BlockingRoot
local v_u_22 = v10.IndeterminateComponent
local v_u_23 = v10.ClassComponent
local v_u_24 = v10.HostRoot
local v_u_25 = v10.HostComponent
local v_u_26 = v10.HostText
local v_u_27 = v10.HostPortal
local v_u_28 = v10.ForwardRef
local v_u_29 = v10.Fragment
local v_u_30 = v10.Mode
local v_u_31 = v10.ContextProvider
local v_u_32 = v10.ContextConsumer
local v_u_33 = v10.Profiler
local v_u_34 = v10.SuspenseComponent
local v_u_35 = v10.SuspenseListComponent
local v_u_36 = v10.DehydratedFragment
local v_u_37 = v10.FunctionComponent
local v_u_38 = v10.MemoComponent
local v_u_39 = v10.SimpleMemoComponent
local v_u_40 = v10.LazyComponent
local v_u_41 = v10.FundamentalComponent
local _ = v10.ScopeComponent
local v_u_42 = v10.OffscreenComponent
local v_u_43 = v10.LegacyHiddenComponent
local v_u_44 = require(v1.Shared).getComponentName
local v_u_45 = require(script.Parent["ReactFiberDevToolsHook.new"]).isDevToolsPresent
local v46 = require(script.Parent["ReactFiberHotReloading.new"])
local v_u_47 = v46.resolveClassForHotReloading
local v_u_48 = v46.resolveFunctionForHotReloading
local v_u_49 = v46.resolveForwardRefForHotReloading
local v_u_50 = v12.NoLanes
local v_u_51 = v11.NoMode
local v_u_52 = v11.ConcurrentMode
local v_u_53 = v11.DebugTracingMode
local v_u_54 = v11.ProfileMode
local v_u_55 = v11.StrictMode
local v_u_56 = v11.BlockingMode
local v57 = require(v1.Shared).ReactSymbols
local v_u_58 = v57.REACT_FORWARD_REF_TYPE
local v_u_59 = v57.REACT_FRAGMENT_TYPE
local v_u_60 = v57.REACT_ELEMENT_TYPE
local v_u_61 = v57.REACT_DEBUG_TRACING_MODE_TYPE
local v_u_62 = v57.REACT_STRICT_MODE_TYPE
local v_u_63 = v57.REACT_PROFILER_TYPE
local v_u_64 = v57.REACT_PROVIDER_TYPE
local v_u_65 = v57.REACT_CONTEXT_TYPE
local v_u_66 = v57.REACT_SUSPENSE_TYPE
local v_u_67 = v57.REACT_SUSPENSE_LIST_TYPE
local v_u_68 = v57.REACT_MEMO_TYPE
local v_u_69 = v57.REACT_LAZY_TYPE
local v_u_70 = v57.REACT_OFFSCREEN_TYPE
local v_u_71 = v57.REACT_LEGACY_HIDDEN_TYPE
local v_u_72 = nil
local v_u_73 = nil
local v_u_74 = nil
local v_u_75 = nil
local v_u_76 = nil
local v_u_77 = 1
local function v_u_87(p78, p79, p80, p81, p82, p83, p84, p85) -- name: createFiber
	-- upvalues: (copy) v_u_17, (copy) v_u_50, (copy) v_u_15, (copy) v_u_7, (ref) v_u_77
	local v86 = {
		["tag"] = nil,
		["key"] = nil,
		["elementType"] = nil,
		["type"] = nil,
		["stateNode"] = nil,
		["index"] = 1,
		["pendingProps"] = nil,
		["mode"] = nil,
		["flags"] = nil,
		["subtreeFlags"] = nil,
		["lanes"] = nil,
		["childLanes"] = nil,
		["tag"] = p78,
		["key"] = p80,
		["elementType"] = p82,
		["type"] = p83,
		["stateNode"] = p84,
		["pendingProps"] = p79,
		["mode"] = p81,
		["flags"] = v_u_17,
		["subtreeFlags"] = v_u_17,
		["lanes"] = p85 or v_u_50,
		["childLanes"] = v_u_50
	}
	if v_u_15 then
		v86.actualDuration = 0
		v86.actualStartTime = -1
		v86.selfBaseDuration = 0
		v86.treeBaseDuration = 0
	end
	if v_u_7 then
		v86._debugID = v_u_77
		v_u_77 = v_u_77 + 1
		v86._debugSource = nil
		v86._debugOwner = nil
		v86._debugNeedsRemount = false
		v86._debugHookTypes = nil
	end
	return v86
end
function _shouldConstruct(p88) -- name: _shouldConstruct
	local v89
	if type(p88) == "function" then
		v89 = false
	else
		v89 = p88.isReactComponent and true or false
	end
	return v89
end
local function v_u_106(p90, p91, p92, p93, p94, p95) -- name: createFiberFromTypeAndProps
	-- upvalues: (copy) v_u_22, (copy) v_u_7, (copy) v_u_48, (copy) v_u_23, (copy) v_u_47, (copy) v_u_25, (copy) v_u_59, (ref) v_u_73, (copy) v_u_61, (copy) v_u_30, (copy) v_u_53, (copy) v_u_62, (copy) v_u_55, (copy) v_u_63, (ref) v_u_72, (copy) v_u_66, (ref) v_u_74, (copy) v_u_70, (ref) v_u_75, (copy) v_u_71, (ref) v_u_76, (copy) v_u_64, (copy) v_u_31, (copy) v_u_65, (copy) v_u_32, (copy) v_u_58, (copy) v_u_28, (copy) v_u_49, (copy) v_u_68, (copy) v_u_38, (copy) v_u_69, (copy) v_u_40, (copy) v_u_4, (copy) v_u_6, (copy) v_u_44, (copy) v_u_5, (copy) v_u_60, (copy) v_u_13, (copy) v_u_87
	local v96 = v_u_22
	local v97 = type(p90)
	local v98
	if v97 == "function" then
		if v_u_7 then
			v98 = v_u_48(p90)
		else
			v98 = p90
		end
	elseif v97 == "table" and p90.isReactComponent then
		v96 = v_u_23
		if v_u_7 then
			v98 = v_u_47(p90)
		else
			v98 = p90
		end
	elseif v97 == "string" then
		v96 = v_u_25
		v98 = p90
	else
		if p90 == v_u_59 then
			return v_u_73(p92.children, p94, p95, p91)
		end
		if p90 == v_u_61 then
			v96 = v_u_30
			local v99 = v_u_53
			p94 = bit32.bor(p94, v99)
			v98 = p90
		elseif p90 == v_u_62 then
			v96 = v_u_30
			local v100 = v_u_55
			p94 = bit32.bor(p94, v100)
			v98 = p90
		else
			if p90 == v_u_63 then
				return v_u_72(p92, p94, p95, p91)
			end
			if p90 == v_u_66 then
				return v_u_74(p92, p94, p95, p91)
			end
			if p90 == v_u_70 then
				return v_u_75(p92, p94, p95, p91)
			end
			if p90 == v_u_71 then
				return v_u_76(p92, p94, p95, p91)
			end
			local v101 = false
			local v102
			if v97 == "table" then
				v102 = p90["$$typeof"]
				if v102 == v_u_64 then
					v96 = v_u_31
					v98 = p90
					v101 = true
				elseif v102 == v_u_65 then
					v96 = v_u_32
					v98 = p90
					v101 = true
				elseif v102 == v_u_58 then
					v96 = v_u_28
					if v_u_7 then
						v98 = v_u_49(p90)
					else
						v98 = p90
					end
					v101 = true
				elseif v102 == v_u_68 then
					v96 = v_u_38
					v98 = p90
					v101 = true
				elseif v102 == v_u_69 then
					v96 = v_u_40
					v101 = true
					v98 = nil
				else
					v98 = p90
				end
			else
				v98 = p90
				v102 = nil
			end
			if not v101 then
				local v103 = ""
				if v_u_7 then
					if p90 == nil or v97 == "table" and #v_u_4.keys(p90) == 0 then
						v103 = v103 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
					elseif p90 ~= nil and v97 == "table" then
						v103 = v103 .. "\n" .. v_u_6(p90)
					end
					local v104
					if p93 then
						v104 = v_u_44(p93.type)
					else
						v104 = nil
					end
					if v104 == nil or v104 == "" then
						if p93 then
							v103 = v103 .. "\n" .. v_u_6(p93)
						end
					else
						v103 = v103 .. "\n\nCheck the render method of `" .. v104 .. "`."
					end
				end
				if p90 == nil then
					v97 = "nil"
				elseif v_u_5.isArray(p90) then
					v97 = "array"
				elseif v97 == "table" and v102 == v_u_60 then
					v97 = string.format("<%s />", v_u_44(p90.type) or "Unknown")
					v103 = " Did you accidentally export a JSX literal or Element instead of a component?"
				end
				v_u_13(false, "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v97, v103)
			end
		end
	end
	local v105 = v_u_87(v96, p92, p91, p94, p90, v98, nil, p95)
	if v_u_7 then
		v105._debugOwner = p93
	end
	return v105
end
v_u_73 = function(p107, p108, p109, p110) -- name: createFiberFromFragment
	-- upvalues: (copy) v_u_87, (copy) v_u_29
	return v_u_87(v_u_29, p107, p110, p108, nil, nil, nil, p109)
end
v_u_72 = function(p111, p112, p113, p114) -- name: createFiberFromProfiler
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_87, (copy) v_u_33, (copy) v_u_54, (copy) v_u_63, (copy) v_u_15
	if v_u_7 then
		local v115 = p111.id
		if typeof(v115) ~= "string" then
			v_u_8.error("Profiler must specify an \"id\" as a prop")
		end
	end
	local v116 = v_u_54
	return v_u_87(v_u_33, p111, p114, bit32.bor(p112, v116), v_u_63, v_u_63, v_u_15 and {
		["effectDuration"] = 0,
		["passiveEffectDuration"] = 0
	} or nil, p113)
end
v_u_74 = function(p117, p118, p119, p120) -- name: createFiberFromSuspense
	-- upvalues: (copy) v_u_87, (copy) v_u_34, (copy) v_u_66
	return v_u_87(v_u_34, p117, p120, p118, v_u_66, v_u_66, nil, p119)
end
v_u_75 = function(p121, p122, p123, p124) -- name: createFiberFromOffscreen
	-- upvalues: (copy) v_u_87, (copy) v_u_42, (copy) v_u_70, (copy) v_u_7
	local v125 = v_u_87
	local v126 = v_u_42
	local v127 = v_u_70
	local v128
	if v_u_7 then
		v128 = v_u_70
	else
		v128 = nil
	end
	return v125(v126, p121, p124, p122, v127, v128, nil, p123)
end
v_u_76 = function(p129, p130, p131, p132) -- name: createFiberFromLegacyHidden
	-- upvalues: (copy) v_u_87, (copy) v_u_43, (copy) v_u_71, (copy) v_u_7
	local v133 = v_u_87
	local v134 = v_u_43
	local v135 = v_u_71
	local v136
	if v_u_7 then
		v136 = v_u_71
	else
		v136 = nil
	end
	return v133(v134, p129, p132, p130, v135, v136, nil, p131)
end
return {
	["isSimpleFunctionComponent"] = function(p137) -- name: isSimpleFunctionComponent
		return type(p137) == "function"
	end,
	["resolveLazyComponentTag"] = function(p138) -- name: resolveLazyComponentTag
		-- upvalues: (copy) v_u_37, (copy) v_u_23, (copy) v_u_58, (copy) v_u_28, (copy) v_u_68, (copy) v_u_38, (copy) v_u_22
		local v139 = typeof(p138)
		if v139 == "function" then
			return v_u_37
		end
		if v139 == "table" then
			if p138.isReactComponent then
				return v_u_23
			end
			local v140 = p138["$$typeof"]
			if v140 == v_u_58 then
				return v_u_28
			end
			if v140 == v_u_68 then
				return v_u_38
			end
		end
		return v_u_22
	end,
	["createWorkInProgress"] = function(p141, p142) -- name: createWorkInProgress
		-- upvalues: (copy) v_u_87, (copy) v_u_7, (copy) v_u_14, (copy) v_u_17, (copy) v_u_15, (copy) v_u_19, (copy) v_u_22, (copy) v_u_37, (copy) v_u_39, (copy) v_u_48, (copy) v_u_23, (copy) v_u_47, (copy) v_u_28, (copy) v_u_49
		local v143 = p141.alternate
		if v143 == nil then
			v143 = v_u_87(p141.tag, p142, p141.key, p141.mode, p141.elementType, p141.type, p141.stateNode)
			if v_u_7 then
				v143._debugID = p141._debugID
				v143._debugSource = p141._debugSource
				v143._debugOwner = p141._debugOwner
				v143._debugHookTypes = p141._debugHookTypes
			end
			v143.alternate = p141
			p141.alternate = v143
		else
			v143.pendingProps = p142
			v143.type = p141.type
			if v_u_14.enableWorkLoopTrims then
				v143.subtreeFlags = v_u_17
				if v143.deletions ~= nil then
					v143.deletions = nil
				end
			else
				v143.flags = v_u_17
				v143.subtreeFlags = v_u_17
				v143.deletions = nil
			end
			if v_u_15 then
				v143.actualDuration = 0
				v143.actualStartTime = -1
			end
		end
		local v144 = p141.flags
		local v145 = v_u_19
		v143.flags = bit32.band(v144, v145)
		v143.childLanes = p141.childLanes
		v143.lanes = p141.lanes
		if v_u_14.enableWorkLoopTrims then
			if p141.child ~= nil or v143.child ~= nil then
				v143.child = p141.child
			end
			v143.memoizedProps = p141.memoizedProps
			if p141.memoizedState ~= nil or v143.memoizedState ~= nil then
				v143.memoizedState = p141.memoizedState
			end
			if p141.updateQueue ~= nil or v143.updateQueue ~= nil then
				v143.updateQueue = p141.updateQueue
			end
			local v146 = p141.dependencies
			if v146 == nil then
				if v143.dependencies ~= nil then
					v143.dependencies = nil
				end
			else
				v143.dependencies = {
					["lanes"] = v146.lanes,
					["firstContext"] = v146.firstContext
				}
			end
			if p141.sibling ~= nil or v143.sibling ~= nil then
				v143.sibling = p141.sibling
			end
			v143.index = p141.index
			if p141.ref ~= nil or v143.ref ~= nil then
				v143.ref = p141.ref
			end
		else
			v143.child = p141.child
			v143.memoizedProps = p141.memoizedProps
			v143.memoizedState = p141.memoizedState
			v143.updateQueue = p141.updateQueue
			local v147 = p141.dependencies
			if v147 == nil then
				v143.dependencies = nil
			else
				v143.dependencies = {
					["lanes"] = v147.lanes,
					["firstContext"] = v147.firstContext
				}
			end
			v143.sibling = p141.sibling
			v143.index = p141.index
			v143.ref = p141.ref
		end
		if v_u_15 then
			v143.selfBaseDuration = p141.selfBaseDuration
			v143.treeBaseDuration = p141.treeBaseDuration
		end
		if v_u_7 then
			v143._debugNeedsRemount = p141._debugNeedsRemount
			if v143.tag == v_u_22 or (v143.tag == v_u_37 or v143.tag == v_u_39) then
				v143.type = v_u_48(p141.type)
				return v143
			end
			if v143.tag == v_u_23 then
				v143.type = v_u_47(p141.type)
				return v143
			end
			if v143.tag == v_u_28 then
				v143.type = v_u_49(p141.type)
			end
		end
		return v143
	end,
	["resetWorkInProgress"] = function(p148, p149) -- name: resetWorkInProgress
		-- upvalues: (copy) v_u_19, (copy) v_u_18, (copy) v_u_50, (copy) v_u_17, (copy) v_u_15
		local v150 = p148.flags
		local v151 = v_u_19
		local v152 = v_u_18
		local v153 = bit32.bor(v151, v152)
		p148.flags = bit32.band(v150, v153)
		local v154 = p148.alternate
		if v154 == nil then
			p148.childLanes = v_u_50
			p148.lanes = p149
			p148.child = nil
			p148.subtreeFlags = v_u_17
			p148.memoizedProps = nil
			p148.memoizedState = nil
			p148.updateQueue = nil
			p148.dependencies = nil
			p148.stateNode = nil
			if v_u_15 then
				p148.selfBaseDuration = 0
				p148.treeBaseDuration = 0
				return p148
			end
		else
			p148.childLanes = v154.childLanes
			p148.lanes = v154.lanes
			p148.child = v154.child
			p148.subtreeFlags = v154.subtreeFlags
			p148.deletions = nil
			p148.memoizedProps = v154.memoizedProps
			p148.memoizedState = v154.memoizedState
			p148.updateQueue = v154.updateQueue
			p148.type = v154.type
			local v155 = v154.dependencies
			if v155 == nil then
				p148.dependencies = nil
			else
				p148.dependencies = {
					["lanes"] = v155.lanes,
					["firstContext"] = v155.firstContext
				}
			end
			if v_u_15 then
				p148.selfBaseDuration = v154.selfBaseDuration
				p148.treeBaseDuration = v154.treeBaseDuration
			end
		end
		return p148
	end,
	["createHostRootFiber"] = function(p156) -- name: createHostRootFiber
		-- upvalues: (copy) v_u_20, (copy) v_u_52, (copy) v_u_56, (copy) v_u_55, (copy) v_u_21, (copy) v_u_51, (copy) v_u_15, (copy) v_u_45, (copy) v_u_54, (copy) v_u_87, (copy) v_u_24
		local v157
		if p156 == v_u_20 then
			local v158 = v_u_52
			local v159 = v_u_56
			local v160 = v_u_55
			v157 = bit32.bor(v158, v159, v160)
		elseif p156 == v_u_21 then
			local v161 = v_u_56
			local v162 = v_u_55
			v157 = bit32.bor(v161, v162)
		else
			v157 = v_u_51
		end
		if v_u_15 and v_u_45() then
			local v163 = v_u_54
			v157 = bit32.bor(v157, v163)
		end
		return v_u_87(v_u_24, nil, nil, v157)
	end,
	["createFiberFromTypeAndProps"] = v_u_106,
	["createFiberFromElement"] = function(p164, p165, p166) -- name: createFiberFromElement
		-- upvalues: (copy) v_u_7, (copy) v_u_106
		local v167
		if v_u_7 then
			v167 = p164._owner
		else
			v167 = nil
		end
		local v168 = v_u_106(p164.type, p164.key, p164.props, v167, p165, p166)
		if v_u_7 then
			v168._debugSource = p164._source
			v168._debugOwner = p164._owner
		end
		return v168
	end,
	["createFiberFromFragment"] = v_u_73,
	["createFiberFromFundamental"] = function(p169, p170, p171, p172, p173) -- name: createFiberFromFundamental
		-- upvalues: (copy) v_u_87, (copy) v_u_41
		return v_u_87(v_u_41, p170, p173, p171, p169, p169, nil, p172)
	end,
	["createFiberFromSuspense"] = v_u_74,
	["createFiberFromSuspenseList"] = function(p174, p175, p176, p177) -- name: createFiberFromSuspenseList
		-- upvalues: (copy) v_u_87, (copy) v_u_35, (copy) v_u_67, (copy) v_u_7
		local v178 = v_u_87
		local v179 = v_u_35
		local v180 = v_u_67
		local v181
		if v_u_7 then
			v181 = v_u_67
		else
			v181 = nil
		end
		return v178(v179, p174, p177, p175, v180, v181, nil, p176)
	end,
	["createFiberFromOffscreen"] = v_u_75,
	["createFiberFromLegacyHidden"] = v_u_76,
	["createFiberFromText"] = function(p182, p183, p184) -- name: createFiberFromText
		-- upvalues: (copy) v_u_87, (copy) v_u_26
		return v_u_87(v_u_26, p182, nil, p183, nil, nil, nil, p184)
	end,
	["createFiberFromHostInstanceForDeletion"] = function() -- name: createFiberFromHostInstanceForDeletion
		-- upvalues: (copy) v_u_87, (copy) v_u_25, (copy) v_u_51
		return v_u_87(v_u_25, nil, nil, v_u_51, "DELETED", "DELETED")
	end,
	["createFiberFromDehydratedFragment"] = function(p185) -- name: createFiberFromDehydratedFragment
		-- upvalues: (copy) v_u_87, (copy) v_u_36, (copy) v_u_51
		return v_u_87(v_u_36, nil, nil, v_u_51, nil, nil, p185)
	end,
	["createFiberFromPortal"] = function(p186, p187, p188) -- name: createFiberFromPortal
		-- upvalues: (copy) v_u_87, (copy) v_u_27
		return v_u_87(v_u_27, p186.children == nil and {} or p186.children, p186.key, p187, nil, nil, {
			["containerInfo"] = nil,
			["pendingChildren"] = nil,
			["implementation"] = nil,
			["containerInfo"] = p186.containerInfo,
			["implementation"] = p186.implementation
		}, p188)
	end,
	["assignFiberPropertiesInDEV"] = function(p189, p190) -- name: assignFiberPropertiesInDEV
		-- upvalues: (copy) v_u_87, (copy) v_u_22, (copy) v_u_51, (copy) v_u_15
		if p189 == nil then
			p189 = v_u_87(v_u_22, nil, nil, v_u_51)
		end
		p189.tag = p190.tag
		p189.key = p190.key
		p189.elementType = p190.elementType
		p189.type = p190.type
		p189.stateNode = p190.stateNode
		p189.return_ = p190.return_
		p189.child = p190.child
		p189.sibling = p190.sibling
		p189.index = p190.index
		p189.ref = p190.ref
		p189.pendingProps = p190.pendingProps
		p189.memoizedProps = p190.memoizedProps
		p189.updateQueue = p190.updateQueue
		p189.memoizedState = p190.memoizedState
		p189.dependencies = p190.dependencies
		p189.mode = p190.mode
		p189.flags = p190.flags
		p189.subtreeFlags = p190.subtreeFlags
		p189.deletions = p190.deletions
		p189.lanes = p190.lanes
		p189.childLanes = p190.childLanes
		p189.alternate = p190.alternate
		if v_u_15 then
			p189.actualDuration = p190.actualDuration
			p189.actualStartTime = p190.actualStartTime
			p189.selfBaseDuration = p190.selfBaseDuration
			p189.treeBaseDuration = p190.treeBaseDuration
		end
		p189._debugID = p190._debugID
		p189._debugSource = p190._debugSource
		p189._debugOwner = p190._debugOwner
		p189._debugNeedsRemount = p190._debugNeedsRemount
		p189._debugHookTypes = p190._debugHookTypes
		return p189
	end
}