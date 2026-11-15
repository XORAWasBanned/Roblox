-- Path: CorePackages.Packages._Index.FocusNavigation.FocusNavigation.FocusNavigationService
local v1 = script.Parent.Parent
local v_u_2 = require(v1.EventPropagation)
local v3 = require(v1.FocusNavigationUtils)
local v_u_4 = require(v1.SafeFlags).createGetFFlag("FocusNavigationRefocusSuppression")
local v_u_5 = v3.createSignal
local v_u_6 = v3.shallowEqual
local v_u_7 = v3.getAncestors
local v_u_8 = v3.mockableWarn
local v_u_9 = require(script.Parent.isValidFocusTarget)
require(script.Parent.types)
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11, p12) -- name: new
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_10
	local v13, v14 = v_u_5({})
	local v15, v16 = v_u_5(p11.getSelection())
	local v17, v18 = v_u_5(nil)
	local v19 = {
		["_eventPropagationService"] = nil,
		["_engineInterface"] = nil,
		["_eventMapByInstance"] = nil,
		["_focusBehaviorByInstance"] = nil,
		["_engineEventConnections"] = nil,
		["_silentFocusTarget"] = nil,
		["_silentBlurTarget"] = nil,
		["_shouldSuppressContainerRefocus"] = nil,
		["_fireActiveEventMapSignal"] = nil,
		["_fireFocusedGuiObjectSignal"] = nil,
		["_fireEventDispatchedSignal"] = nil,
		["activeEventMap"] = nil,
		["focusedGuiObject"] = nil,
		["eventDispatched"] = nil,
		["_eventPropagationService"] = v_u_2.new(),
		["_engineInterface"] = p11,
		["_eventMapByInstance"] = setmetatable({}, {
			["__mode"] = "k"
		}),
		["_focusBehaviorByInstance"] = setmetatable({}, {
			["__mode"] = "k"
		}),
		["_engineEventConnections"] = {}
	}
	local v20
	if p12 then
		v20 = p12.shouldSuppressContainerRefocus
	else
		v20 = nil
	end
	v19._shouldSuppressContainerRefocus = v20
	v19._fireActiveEventMapSignal = v14
	v19._fireFocusedGuiObjectSignal = v16
	v19._fireEventDispatchedSignal = v18
	v19.activeEventMap = v13
	v19.focusedGuiObject = v15
	v19.eventDispatched = v17
	local v21 = v_u_10
	local v22 = setmetatable(v19, v21)
	v22:_connectToInputEvents()
	return v22
end
function v_u_10._fireInputEvent(p23, p24, p25, p26) -- name: _fireInputEvent
	local v27 = p23.activeEventMap:getValue()[p25.KeyCode]
	if v27 then
		local v28 = {
			["Delta"] = p25.Delta,
			["KeyCode"] = p25.KeyCode,
			["Position"] = p25.Position,
			["UserInputState"] = p25.UserInputState,
			["UserInputType"] = p25.UserInputType,
			["wasProcessed"] = p26
		}
		p23._eventPropagationService:propagateEvent(p24, v27, v28, {
			["synthetic"] = false,
			["silent"] = false
		})
		p23._fireEventDispatchedSignal({
			["eventName"] = nil,
			["target"] = nil,
			["eventData"] = nil,
			["synthetic"] = false,
			["eventName"] = v27,
			["target"] = p24,
			["eventData"] = v28
		})
	end
end
function v_u_10._connectToInputEvents(p_u_29) -- name: _connectToInputEvents
	local function v33(p30, p31) -- name: forwardInputEvent
		-- upvalues: (copy) p_u_29
		local v32 = p_u_29._engineInterface.getSelection()
		if v32 then
			p_u_29:_fireInputEvent(v32, p30, p31)
		end
	end
	local v34 = p_u_29._engineEventConnections
	local v35 = p_u_29._engineInterface.InputBegan
	table.insert(v34, v35:Connect(v33))
	local v36 = p_u_29._engineEventConnections
	local v37 = p_u_29._engineInterface.InputChanged
	table.insert(v36, v37:Connect(v33))
	local v38 = p_u_29._engineEventConnections
	local v39 = p_u_29._engineInterface.InputEnded
	table.insert(v38, v39:Connect(v33))
	local v40 = p_u_29._engineEventConnections
	local v41 = p_u_29._engineInterface.SelectionChanged
	table.insert(v40, v41:Connect(function() -- name: onFocusChanged
		-- upvalues: (copy) p_u_29
		local v42 = p_u_29.focusedGuiObject:getValue()
		local v43 = p_u_29._engineInterface.getSelection()
		if v42 then
			local v44 = p_u_29._silentBlurTarget == v42
			p_u_29._eventPropagationService:propagateEvent(v42, "blur", nil, {
				["synthetic"] = false,
				["silent"] = nil,
				["silent"] = v44
			})
			p_u_29._silentBlurTarget = nil
		end
		p_u_29._fireFocusedGuiObjectSignal(v43)
		if v43 then
			local v45 = v43 == p_u_29._silentFocusTarget
			p_u_29._eventPropagationService:propagateEvent(v43, "focus", nil, {
				["synthetic"] = false,
				["silent"] = nil,
				["silent"] = v45
			})
			p_u_29._silentFocusTarget = nil
		end
		p_u_29:_updateActiveEventMap(v42)
	end))
end
function v_u_10._cancelHandler(p46, p47, p48) -- name: _cancelHandler
	if p48 ~= "blur" and p48 ~= "focus" then
		p46._eventPropagationService:propagateEvent(p47, p48, {
			["KeyCode"] = Enum.KeyCode.None,
			["UserInputType"] = Enum.UserInputType.None,
			["UserInputState"] = Enum.UserInputState.Cancel
		}, {
			["synthetic"] = false,
			["silent"] = false
		})
	end
end
function v_u_10._updateActiveEventMap(p49, p50) -- name: _updateActiveEventMap
	-- upvalues: (copy) v_u_7, (copy) v_u_6
	local v51 = {}
	local v52 = p49._engineInterface.getSelection()
	if v52 then
		local v53 = v_u_7(v52)
		local v54 = {}
		for v55 = #v53, 1, -1 do
			local v56 = v53[v55]
			local v57 = p49._eventMapByInstance[v56]
			if v57 then
				for v58, v59 in v57 do
					v54[v58] = v59
					v51[v58] = nil
				end
			end
			local v60 = p49._eventPropagationService:getRegisteredEventHandlers(v56)
			if not v60 then
				continue
			end
			for v61, v62 in v54 do
				if not v60[v62] then
					continue
				end
				v51[v61] = v62
			end
		end
	end
	local v63 = p49.activeEventMap:getValue()
	if not v_u_6(v63, v51) then
		if p50 then
			for v64, v65 in v63 do
				if v51[v64] then
					continue
				end
				p49:_cancelHandler(p50, v65)
			end
		end
		p49._fireActiveEventMapSignal(v51)
	end
end
function v_u_10.registerEventMap(p66, p67, p68) -- name: registerEventMap
	-- upvalues: (copy) v_u_8
	local v69 = p66._eventMapByInstance[p67] or {}
	for v70, v71 in p68 do
		if v69[v70] and (v69[v70] ~= v71 and _G.__DEV__) then
			v_u_8(string.format("New event will replace existing registered event mapped to %s:\n\t     new event: %s\n\texisting event: %s", tostring(v70), v71, v69[v70]))
		end
		v69[v70] = v71
	end
	p66._eventMapByInstance[p67] = v69
	p66:_updateActiveEventMap()
end
function v_u_10.deregisterEventMap(p72, p73, p74) -- name: deregisterEventMap
	-- upvalues: (copy) v_u_8
	local v75 = p72._eventMapByInstance[p73] or {}
	for v76, v77 in p74 do
		if v75[v76] == v77 then
			v75[v76] = nil
		else
			if not _G.__DEV__ then
				continue
			end
			v_u_8(string.format("Cannot deregister non-matching event input %s:\n\t  provided event: %s\n\tregistered event: %s", tostring(v76), v77, v75[v76]))
		end
	end
	p72._eventMapByInstance[p73] = v75
	p72:_updateActiveEventMap(p72.focusedGuiObject:getValue())
end
function v_u_10.registerEventHandler(p78, p79, p80, p81, p82) -- name: registerEventHandler
	p78._eventPropagationService:registerEventHandler(p79, p80, p81, p82)
	p78:_updateActiveEventMap()
end
function v_u_10.deregisterEventHandler(p83, p84, p85, p86, p87) -- name: deregisterEventHandler
	p83:_cancelHandler(p84, p85)
	p83._eventPropagationService:deregisterEventHandler(p84, p85, p86, p87)
	p83:_updateActiveEventMap(p83.focusedGuiObject:getValue())
end
function v_u_10.registerEventHandlers(p88, p89, p90) -- name: registerEventHandlers
	p88._eventPropagationService:registerEventHandlers(p89, p90)
	p88:_updateActiveEventMap()
end
function v_u_10.deregisterEventHandlers(p91, p92, p93) -- name: deregisterEventHandlers
	for v94, _ in p93 do
		p91:_cancelHandler(p92, v94)
	end
	p91._eventPropagationService:deregisterEventHandlers(p92, p93)
	p91:_updateActiveEventMap(p91.focusedGuiObject:getValue())
end
function v_u_10.registerFocusBehavior(p_u_95, p_u_96, p_u_97) -- name: registerFocusBehavior
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_9
	if _G.__DEV__ then
		local v98 = p_u_95._focusBehaviorByInstance[p_u_96]
		if v98 ~= nil then
			local v99 = v_u_8
			local v100 = string.format
			local v101 = tostring(p_u_97)
			local v102 = v98.behavior
			v99(v100("New focus behavior will replace existing registered focus behavior:\n\t     new behavior: %s\n\texisting behavior: %s", v101, (tostring(v102))))
		end
	end
	local v109 = {
		["behavior"] = p_u_97,
		["connection"] = p_u_96.SelectionChanged:Connect(function(p103, p104, p105)
			-- upvalues: (copy) p_u_96, (ref) v_u_4, (copy) p_u_95, (copy) p_u_97, (ref) v_u_9
			if p105 and (p103 or p105:IsDescendantOf(p_u_96)) then
				if p104 and p104:IsDescendantOf(p_u_96) then
					if p_u_97.onDescendantFocusChanged then
						p_u_97.onDescendantFocusChanged(p105)
					end
				else
					local v106 = false
					local v107 = v_u_4() and p_u_95._shouldSuppressContainerRefocus
					if v107 then
						v107 = p_u_95._shouldSuppressContainerRefocus()
					end
					if not v107 then
						for _, v108 in p_u_97.getTargets() do
							if not v_u_9(v108) then
								continue
							end
							p_u_95:focusGuiObject(v108, false)
							v106 = true
						end
					end
					if not v106 and p_u_97.onDescendantFocusChanged then
						p_u_97.onDescendantFocusChanged(p105)
						return
					end
				end
			end
		end)
	}
	p_u_95._focusBehaviorByInstance[p_u_96] = v109
end
function v_u_10.deregisterFocusBehavior(p110, p111, p112) -- name: deregisterFocusBehavior
	-- upvalues: (copy) v_u_8
	local v113 = p110._focusBehaviorByInstance[p111]
	if _G.__DEV__ then
		if not v113 then
			v_u_8(string.format("Cannot deregister an unregistered focus behavior:\n\t  provided behavior: %s", (tostring(p112))))
		end
		if v113 and v113.behavior ~= p112 then
			local v114 = v_u_8
			local v115 = string.format
			local v116 = tostring(p112)
			local v117 = v113.behavior
			v114(v115("Cannot deregister non-matching focus behavior:\n\t  provided behavior: %s\n\tregistered behavior: %s", v116, (tostring(v117))))
		end
	end
	if v113 then
		v113.connection:Disconnect()
		p110._focusBehaviorByInstance[p111] = nil
	end
end
function v_u_10.focusGuiObject(p118, p119, p120) -- name: focusGuiObject
	if p120 then
		p118._silentBlurTarget = p118._engineInterface.getSelection()
		p118._silentFocusTarget = p119
	else
		p118._silentBlurTarget = nil
		p118._silentFocusTarget = nil
	end
	p118._engineInterface.setSelection(p119)
end
function v_u_10.teardown(p121) -- name: teardown
	for _, v122 in p121._engineEventConnections do
		v122:Disconnect()
	end
	for _, v123 in p121._focusBehaviorByInstance do
		v123.connection:Disconnect()
	end
end
function v_u_10.canDispatchEvent(p124, p125, p126) -- name: canDispatchEvent
	-- upvalues: (copy) v_u_7
	if not p126 then
		return false
	end
	for _, v127 in v_u_7(p126) do
		local v128 = p124._eventMapByInstance[v127]
		if not v128 then
			continue
		end
		for _, v129 in v128 do
			if v129 ~= p125 then
				continue
			end
			local v130 = p124._eventPropagationService:getRegisteredEventHandlers(v127)
			if not (v130 and v130[p125]) then
				continue
			end
			return true
		end
	end
	return false
end
function v_u_10.dispatchSyntheticEvent(p131, p132, p133, p134) -- name: dispatchSyntheticEvent
	-- upvalues: (copy) v_u_8
	if not p133 then
		if _G.__DEV__ then
			v_u_8("dispatchSyntheticEvent: No target object")
		end
		return false
	end
	if not p131:canDispatchEvent(p132, p133) then
		if _G.__DEV__ then
			v_u_8("dispatchSyntheticEvent: Cannot dispatch event \"" .. p132 .. "\" on target")
		end
		return false
	end
	p131._eventPropagationService:propagateEvent(p133, p132, p134, {
		["synthetic"] = true,
		["silent"] = false
	})
	p131._fireEventDispatchedSignal({
		["eventName"] = nil,
		["target"] = nil,
		["eventData"] = nil,
		["synthetic"] = true,
		["eventName"] = p132,
		["target"] = p133,
		["eventData"] = p134
	})
	return true
end
return v_u_10