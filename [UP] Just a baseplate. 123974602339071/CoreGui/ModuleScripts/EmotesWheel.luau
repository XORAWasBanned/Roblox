-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.EmotesWheel
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("GamepadService")
local v_u_5 = game:GetService("VRService")
local v_u_6 = require(v2.Packages.Roact)
local v7 = require(v2.Packages.RoactRodux)
local v_u_8 = require(v2.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v9 = script.Parent
local v10 = v9.Parent
local v11 = v10.Actions
local v12 = v10.Thunks
local v13 = v10.Utility
local v_u_14 = require(v10.Constants)
local v_u_15 = require(v13.GetSegmentFromPosition)
local v_u_16 = require(v9.EmotesButtons)
local v_u_17 = require(v9.SlotNumbers)
local v_u_18 = require(v9.WheelBackground)
local v_u_19 = require(v11.FocusSegment)
local v_u_20 = require(v11.HideMenu)
local v_u_21 = require(v12.PlayEmote)
local v_u_22 = Enum.ContextActionPriority.High.Value
local v23 = v_u_6.PureComponent:extend("EmotesWheel")
function v23.bindActions(p_u_24) -- name: bindActions
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_1, (copy) v_u_22
	if not p_u_24.actionsBound then
		local function v28(_, _, p25) -- name: selectEmote
			-- upvalues: (ref) v_u_14, (ref) v_u_15, (copy) p_u_24
			local v26 = Vector2.new(p25.Position.X, p25.Position.Y)
			if v26.Magnitude < v_u_14.ThumbstickThreshold then
				return
			else
				local v27 = v_u_15(v26)
				if v27 == p_u_24.props.emotesWheel.focusedSegmentIndex then
					return
				elseif p_u_24.props.emotesPage.currentEmotes[v27] then
					p_u_24.props.focusSegment(v27)
				else
					p_u_24.props.focusSegment(0)
				end
			end
		end
		v_u_1:BindActionAtPriority(v_u_14.EmoteSelectionAction, v28, false, v_u_22, v_u_14.SelectionThumbstick)
		v_u_1:BindActionAtPriority(v_u_14.PlaySelectedAction, function(_, p29, _) -- name: playSelected
			-- upvalues: (copy) p_u_24
			if p29 == Enum.UserInputState.Begin then
				local v30 = p_u_24.props.emotesWheel.focusedSegmentIndex
				local v31 = p_u_24.props.emotesPage.currentEmotes[v30]
				if not v31 then
					return
				end
				local v32 = p_u_24.props.emotesPage.emotesInfo[v31]
				if not v32 then
					return
				end
				local v33
				if #v32 == 0 then
					v33 = nil
				else
					v33 = v32[math.random(1, #v32)]
				end
				p_u_24.props.playEmote(v31, v30, v33)
			end
		end, false, v_u_22, v_u_14.PlayEmoteButton)
		local v34 = { v_u_14.EmoteMenuCloseKey, v_u_14.EmoteMenuCloseButton, v_u_14.EmoteMenuCloseButtonSecondary }
		v_u_1:BindActionAtPriority(v_u_14.CloseMenuAction, function(_, p35, _) -- name: closeMenu
			-- upvalues: (copy) p_u_24
			if p35 == Enum.UserInputState.Begin then
				p_u_24.props.hideMenu()
			end
		end, false, v_u_22, unpack(v34))
		local v36 = v_u_1
		local v37 = v_u_14.LeaveMenuDontSinkInputAction
		local v38 = v_u_22
		local v39 = v_u_14.LeaveMenuNoSinkInputs
		v36:BindActionAtPriority(v37, function(_, p40, _) -- name: closeMenuNoSink
			-- upvalues: (copy) p_u_24
			if p40 == Enum.UserInputState.Begin then
				p_u_24.props.hideMenu()
			end
			return Enum.ContextActionResult.Pass
		end, false, v38, unpack(v39))
		local function v49(_, p41, p42) -- name: activateEmoteByNumber
			-- upvalues: (ref) v_u_14, (copy) p_u_24
			if p41 == Enum.UserInputState.Begin then
				local v43 = nil
				for v44, v45 in ipairs(v_u_14.EmoteSlotKeys) do
					if v45 ~= p42.KeyCode then
						continue
					end
					v43 = v44
				end
				if v43 then
					local v46 = p_u_24.props.emotesPage.currentEmotes[v43]
					if v46 then
						local v47 = p_u_24.props.emotesPage.emotesInfo[v46]
						if v47 then
							local v48
							if #v47 == 0 then
								v48 = nil
							else
								v48 = v47[math.random(1, #v47)]
							end
							p_u_24.props.playEmote(v46, v43, v48)
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		end
		local v50 = v_u_1
		local v51 = v_u_14.ActivateEmoteSlotAction
		local v52 = v_u_22
		local v53 = v_u_14.EmoteSlotKeys
		v50:BindActionAtPriority(v51, v49, false, v52, unpack(v53))
		v_u_1:BindCoreActionAtPriority(v_u_14.VirtualCursorSinkAction, function(_, _, _) -- name: sinkInput
			return Enum.ContextActionResult.Sink
		end, false, v_u_22, Enum.KeyCode.ButtonSelect)
		p_u_24.actionsBound = true
	end
end
function v23.unbindActions(p54) -- name: unbindActions
	-- upvalues: (copy) v_u_1, (copy) v_u_14
	if p54.actionsBound then
		v_u_1:UnbindAction(v_u_14.CloseMenuAction)
		v_u_1:UnbindAction(v_u_14.EmoteSelectionAction)
		v_u_1:UnbindAction(v_u_14.PlaySelectedAction)
		v_u_1:UnbindAction(v_u_14.LeaveMenuDontSinkInputAction)
		v_u_1:UnbindAction(v_u_14.ActivateEmoteSlotAction)
		v_u_1:UnbindCoreAction(v_u_14.VirtualCursorSinkAction)
		p54.actionsBound = false
	end
end
function v23.addCursorOverride(p55) -- name: addCursorOverride
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_14, (copy) v_u_4
	if not v_u_5.VREnabled then
		if p55.isUsingGamepad and not p55.isCursorHidden then
			v_u_8.push(v_u_14.CursorOverrideName, Enum.OverrideMouseIconBehavior.ForceHide)
			v_u_4.GamepadCursorEnabled = false
			p55.isCursorHidden = true
		end
	end
end
function v23.removeCursorOverride(p56) -- name: removeCursorOverride
	-- upvalues: (copy) v_u_8, (copy) v_u_14
	if p56.isCursorHidden then
		v_u_8.pop(v_u_14.CursorOverrideName)
		p56.isCursorHidden = false
	end
end
function v23.connectListeners(p_u_57) -- name: connectListeners
	-- upvalues: (copy) v_u_3, (copy) v_u_14
	p_u_57.inputTypeChangedListener = v_u_3.LastInputTypeChanged:Connect(function(p58)
		-- upvalues: (ref) v_u_14, (copy) p_u_57
		if v_u_14.GamepadInputTypes[p58] then
			p_u_57.isUsingGamepad = true
			if p_u_57.props.displayOptions.menuVisible then
				p_u_57:addCursorOverride()
				return
			end
		else
			p_u_57.isUsingGamepad = false
			p_u_57:removeCursorOverride()
		end
	end)
end
function v23.disconnectListeners(p59) -- name: disconnectListeners
	p59.inputTypeChangedListener:Disconnect()
end
function v23.didUpdate(p60) -- name: didUpdate
	if p60.props.displayOptions.menuVisible then
		p60:bindActions()
		p60:addCursorOverride()
	else
		p60:unbindActions()
		p60:removeCursorOverride()
	end
end
function v23.didMount(p61) -- name: didMount
	if p61.props.displayOptions.menuVisible then
		p61:bindActions()
	end
	p61:connectListeners()
end
function v23.willUnmount(p62) -- name: willUnmount
	p62:unbindActions()
	p62:disconnectListeners()
end
function v23.render(p63) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_18, (copy) v_u_16, (copy) v_u_17
	local v64 = v_u_6.createElement
	local v65 = {
		["Active"] = true,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Visible"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Visible"] = p63.props.displayOptions.menuVisible
	}
	local v66 = {
		["MouseUnlock"] = v_u_6.createElement("TextButton", {
			["Modal"] = true,
			["Size"] = nil,
			["Text"] = "",
			["Transparency"] = 1,
			["Size"] = UDim2.new(0, 0, 0, 0)
		}),
		["Back"] = v_u_6.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, {
			["Background"] = v_u_6.createElement(v_u_18)
		}),
		["Front"] = v_u_6.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, {
			["EmotesButtons"] = v_u_6.createElement(v_u_16),
			["SlotNumbers"] = v_u_6.createElement(v_u_17)
		})
	}
	return v64("Frame", v65, v66)
end
return v7.connect(function(p67) -- name: mapStateToProps
	return {
		["displayOptions"] = p67.displayOptions,
		["emotesWheel"] = p67.emotesWheel,
		["emotesPage"] = p67.emotesPage
	}
end, function(p_u_68) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_21, (copy) v_u_19, (copy) v_u_20
	return {
		["playEmote"] = function(p69, p70, p71) -- name: playEmote
			-- upvalues: (copy) p_u_68, (ref) v_u_21
			return p_u_68(v_u_21(p69, p70, p71))
		end,
		["focusSegment"] = function(p72) -- name: focusSegment
			-- upvalues: (copy) p_u_68, (ref) v_u_19
			return p_u_68(v_u_19(p72))
		end,
		["hideMenu"] = function() -- name: hideMenu
			-- upvalues: (copy) p_u_68, (ref) v_u_20
			return p_u_68(v_u_20())
		end
	}
end)(v23)