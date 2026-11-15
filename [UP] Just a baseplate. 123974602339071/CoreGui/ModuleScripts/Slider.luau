-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Slider
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("ContextActionService")
local v_u_5 = game:GetService("RunService")
local v6 = require(v2.Packages.InGameMenuDependencies)
local v_u_7 = v6.Roact
local v8 = v6.UIBlox
local v9 = v6.t
local v_u_10 = v6.Otter
local v_u_11 = require(script.Parent.Connection.FocusHandler)
local v_u_12 = require(v2.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v13 = require(v2.Packages.Foundation)
local v14 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_15
if v14 then
	v_u_15 = v13.UNSTABLE.withCursorMigration
else
	v_u_15 = v8.App.SelectionImage.withSelectionCursorProvider
end
local v_u_16
if v14 then
	v_u_16 = v13.Enums.CursorType
else
	v_u_16 = v8.App.SelectionImage.CursorKind
end
local v17 = script.Parent.Parent
local v_u_18 = require(v17.Utility.divideTransparency)
local v_u_19 = require(script.Parent.AssetImage)
local v_u_20 = v8.Core.ImageSet.ImageSetButton
local v_u_21 = {
	["frequency"] = 5
}
local function v_u_23(p22) -- name: isGamepad
	return (p22 == Enum.UserInputType.Gamepad1 or (p22 == Enum.UserInputType.Gamepad2 or (p22 == Enum.UserInputType.Gamepad3 or (p22 == Enum.UserInputType.Gamepad4 or (p22 == Enum.UserInputType.Gamepad5 or (p22 == Enum.UserInputType.Gamepad6 or p22 == Enum.UserInputType.Gamepad7)))))) and true or p22 == Enum.UserInputType.Gamepad8
end
local v_u_24 = {}
local function v_u_29() -- name: getInputObjects
	-- upvalues: (copy) v_u_1, (copy) v_u_23, (copy) v_u_24
	local v25 = v_u_1:GetLastInputType()
	if not v_u_23(v25) then
		return nil
	end
	if v_u_24[v25] == nil then
		local v26 = v_u_1:GetGamepadState(v25)
		local v27 = {}
		for _, v28 in ipairs(v26) do
			v27[v28.KeyCode] = v28
		end
		v_u_24[v25] = v27
	end
	return v_u_24[v25]
end
local v30 = v_u_7.PureComponent:extend("Slider")
v30.validateProps = v9.intersection(v9.strictInterface({
	["min"] = v9.number,
	["max"] = v9.number,
	["stepInterval"] = v9.numberPositive,
	["value"] = v9.number,
	["valueChanged"] = v9.callback,
	["disabled"] = v9.optional(v9.boolean),
	["width"] = v9.optional(v9.UDim),
	["AnchorPoint"] = v9.optional(v9.Vector2),
	["LayoutOrder"] = v9.optional(v9.integer),
	["Position"] = v9.optional(v9.UDim2),
	["canCaptureFocus"] = v9.optional(v9.boolean),
	["isMenuOpen"] = v9.optional(v9.boolean),
	["onSelectionLost"] = v9.optional(v9.callback),
	["onSelectionGained"] = v9.optional(v9.callback),
	["NextSelectionRight"] = v9.optional(v9.table),
	["sliderDotRef"] = v9.optional(v9.union(v9.callback, v9.table))
}), function(p31)
	if p31.min > p31.max then
		return false, "min must be less than or equal to max"
	elseif p31.value > p31.max or p31.value < p31.min then
		return false, "value must be within min and max"
	else
		return true
	end
end)
v30.defaultProps = {
	["width"] = nil,
	["disabled"] = false,
	["width"] = UDim.new(1, 0)
}
function v30.init(p_u_32) -- name: init
	-- upvalues: (copy) v_u_7, (copy) v_u_10
	p_u_32.state = {
		["dragging"] = false,
		["hovering"] = false,
		["entryMode"] = false
	}
	p_u_32.totalMoveTime = 0
	p_u_32.isFirstMove = true
	p_u_32.unhandledTime = 0
	p_u_32.rootButtonRef = v_u_7.createRef()
	p_u_32.hoverRef = v_u_7.createRef()
	p_u_32.hoverMotor = v_u_10.createSingleMotor(0)
	p_u_32.hoverMotor:onStep(function(p33)
		-- upvalues: (copy) p_u_32
		local v34 = p_u_32.hoverRef.current
		if v34 ~= nil then
			v34.Size = UDim2.new(0, p33, 0, p33)
		end
	end)
	function p_u_32.onInputBegan(_, p35) -- name: onInputBegan
		-- upvalues: (copy) p_u_32
		if p_u_32.props.disabled then
			return
		else
			local v36 = p35.UserInputType
			if v36 == Enum.UserInputType.MouseButton1 or v36 == Enum.UserInputType.Touch then
				p_u_32:processDrag(p35.Position.X)
				p_u_32:startListeningForDrag()
			end
		end
	end
end
function v30.renderFocusHandler(p_u_37) -- name: renderFocusHandler
	-- upvalues: (copy) v_u_7, (copy) v_u_11, (copy) v_u_3, (copy) v_u_5, (copy) v_u_29, (copy) v_u_4
	local v38 = v_u_7.createElement
	local v39 = v_u_11
	local v40 = {}
	local v41 = p_u_37.state.entryMode
	if v41 then
		v41 = p_u_37.props.canCaptureFocus
	end
	v40.isFocused = v41
	function v40.didFocus() -- name: didFocus
		-- upvalues: (ref) v_u_3, (copy) p_u_37, (ref) v_u_5, (ref) v_u_29, (ref) v_u_4
		v_u_3.CoreGuiNavigationEnabled = false
		p_u_37.joystickListener = v_u_5.Heartbeat:Connect(function(p42)
			-- upvalues: (ref) p_u_37, (ref) v_u_29
			p_u_37:onMoveStep(p42, (v_u_29()))
		end)
		local v_u_43 = p_u_37.props.value
		v_u_4:BindCoreAction("LeaveEntryMode", function(_, p44)
			-- upvalues: (ref) p_u_37, (copy) v_u_43
			if p44 ~= Enum.UserInputState.End then
				return Enum.ContextActionResult.Pass
			end
			p_u_37:setState({
				["entryMode"] = false
			})
			p_u_37.props.valueChanged(v_u_43)
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB)
	end
	function v40.didBlur() -- name: didBlur
		-- upvalues: (copy) p_u_37, (ref) v_u_3, (ref) v_u_4
		p_u_37.joystickListener:Disconnect()
		v_u_3.CoreGuiNavigationEnabled = true
		v_u_4:UnbindCoreAction("LeaveEntryMode")
		p_u_37:setState({
			["entryMode"] = false
		})
	end
	return v38(v39, v40) or nil
end
function v30.renderWithSelectionCursor(p_u_45, p_u_46) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_12, (copy) v_u_7, (copy) v_u_20, (copy) v_u_19, (copy) v_u_18, (copy) v_u_16
	local v47 = p_u_45.props.min
	local v48 = p_u_45.props.max - v47
	local v_u_49 = (p_u_45.props.value - v47) / v48
	local v_u_50 = math.abs(v_u_49)
	local v_u_51 = v_u_49 / 2
	local v_u_52 = p_u_45.state.entryMode
	if v_u_52 then
		v_u_52 = p_u_45.props.canCaptureFocus
	end
	return v_u_12(function(p53)
		local v54 = {}
		local v55 = {
			["UIMuted"] = {
				["Color"] = p53.Color.Shift.Shift_100.Color3,
				["Transparency"] = p53.Color.Shift.Shift_100.Transparency
			},
			["ContextualPrimaryDefault"] = {
				["Color"] = p53.Color.ActionEmphasis.Background.Color3,
				["Transparency"] = p53.Color.ActionEmphasis.Background.Transparency
			}
		}
		v54.Theme = v55
		return v54
	end, function(p56)
		-- upvalues: (ref) v_u_7, (ref) v_u_20, (copy) p_u_45, (ref) v_u_19, (ref) v_u_18, (copy) v_u_51, (copy) v_u_50, (copy) v_u_49, (copy) p_u_46, (copy) v_u_52, (ref) v_u_16
		local v57 = v_u_7.createElement
		local v58 = v_u_20
		local v59 = {
			["AnchorPoint"] = p_u_45.props.AnchorPoint,
			["BackgroundTransparency"] = 1,
			["Image"] = "",
			["LayoutOrder"] = p_u_45.props.LayoutOrder,
			["Position"] = p_u_45.props.Position,
			["Size"] = UDim2.new(p_u_45.props.width.Scale, p_u_45.props.width.Offset, 0, 36),
			[v_u_7.Ref] = p_u_45.rootButtonRef,
			[v_u_7.Event.InputBegan] = p_u_45.onInputBegan,
			["Selectable"] = false
		}
		local v60 = {
			["FocusHandler"] = p_u_45:renderFocusHandler(),
			["Gutter"] = v_u_7.createElement(v_u_19.Label, {
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["imageKey"] = "SliderCircle",
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["ImageColor3"] = p56.Theme.UIMuted.Color,
				["ImageTransparency"] = p56.Theme.UIMuted.Transparency,
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["Size"] = UDim2.new(1, 0, 0, 4)
			}, {
				["FilledGutter"] = v_u_7.createElement(v_u_19.Label, {
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = 1,
					["imageKey"] = "SliderCircle",
					["ImageColor3"] = nil,
					["ImageTransparency"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["ImageColor3"] = p56.Theme.ContextualPrimaryDefault.Color,
					["ImageTransparency"] = v_u_18(p56.Theme.ContextualPrimaryDefault.Transparency, p_u_45.props.disabled and 2 or 1),
					["Position"] = UDim2.new(v_u_51, 0, 0.5, 0),
					["Size"] = UDim2.new(v_u_50, 0, 1, 0)
				})
			})
		}
		local v61 = v_u_7.createElement
		local v62 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["ZIndex"] = 4,
			["Selectable"] = false,
			["Size"] = UDim2.new(1, -12, 1, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0)
		}
		local v67 = {
			["Dot"] = v_u_7.createElement(v_u_19.Button, {
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["BackgroundTransparency"] = 1,
				["imageKey"] = "SliderButton",
				["Position"] = UDim2.new(v_u_49, 0, 0.5, 0),
				["Size"] = UDim2.new(0, 42, 0, 42),
				["ImageTransparency"] = p_u_45.props.disabled and 0.5 or 0,
				["ZIndex"] = 2,
				["SelectionImageObject"] = p_u_46(v_u_52 and v_u_16.SelectedKnob or v_u_16.UnselectedKnob),
				[v_u_7.Event.Activated] = function(_, p63)
					-- upvalues: (ref) p_u_45
					if p63.KeyCode == Enum.KeyCode.ButtonA then
						p_u_45:setState({
							["entryMode"] = not p_u_45.state.entryMode
						})
					end
				end,
				[v_u_7.Event.InputBegan] = function(p64, p65)
					-- upvalues: (ref) p_u_45
					if p_u_45.props.disabled then
						return
					elseif p65.UserInputType == Enum.UserInputType.MouseMovement then
						p_u_45:setState({
							["hovering"] = true
						})
					else
						p_u_45.onInputBegan(p64, p65)
					end
				end,
				[v_u_7.Event.InputEnded] = function(_, p66)
					-- upvalues: (ref) p_u_45
					if not p_u_45.props.disabled then
						if p66.UserInputType == Enum.UserInputType.MouseMovement then
							p_u_45:setState({
								["hovering"] = false
							})
						end
					end
				end,
				[v_u_7.Ref] = p_u_45.props.sliderDotRef,
				[v_u_7.Event.SelectionLost] = p_u_45.props.onSelectionLost,
				[v_u_7.Event.SelectionGained] = p_u_45.props.onSelectionGained,
				["NextSelectionRight"] = p_u_45.props.NextSelectionRight
			}),
			["HoverOverlay"] = v_u_7.createElement(v_u_19.Label, {
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["BackgroundTransparency"] = 1,
				["imageKey"] = "SliderHover",
				["Position"] = UDim2.new(v_u_49, 0, 0.5, 0),
				["Size"] = UDim2.new(0, 0, 0, 0),
				[v_u_7.Ref] = p_u_45.hoverRef
			})
		}
		v60.DotTrack = v61("Frame", v62, v67)
		return v57(v58, v59, v60)
	end)
end
function v30.render(p_u_68) -- name: render
	-- upvalues: (copy) v_u_15
	return v_u_15(function(p69)
		-- upvalues: (copy) p_u_68
		return p_u_68:renderWithSelectionCursor(p69)
	end)
end
function v30.didMount(p_u_70) -- name: didMount
	local v_u_71 = p_u_70.rootButtonRef.current
	local v_u_72 = nil
	v_u_72 = v_u_71.AncestryChanged:Connect(function()
		-- upvalues: (copy) v_u_71, (ref) v_u_72, (copy) p_u_70
		if v_u_71:IsDescendantOf(game) then
			v_u_72:Disconnect()
			p_u_70.canUseUserInputService = v_u_71:FindFirstAncestorWhichIsA("PluginGui") == nil
		end
	end)
	p_u_70.hoverMotor:start()
end
function v30.didUpdate(p73) -- name: didUpdate
	-- upvalues: (copy) v_u_10, (copy) v_u_21
	if p73.props.disabled then
		p73:stopListeningForDrag()
	end
	local v74 = (p73.props.disabled or not (p73.state.dragging or p73.state.hovering)) and 0 or 42
	p73.hoverMotor:setGoal(v_u_10.spring(v74, v_u_21))
end
function v30.willUnmount(p75) -- name: willUnmount
	p75.hoverMotor:stop()
	p75:disconnectDragEvents()
end
function v30.startListeningForDrag(p_u_76) -- name: startListeningForDrag
	-- upvalues: (copy) v_u_1
	local v77 = p_u_76.rootButtonRef.current
	if v77 == nil then
		return
	elseif not p_u_76.state.dragging then
		if p_u_76.canUseUserInputService then
			p_u_76.moveConnection = v_u_1.InputChanged:Connect(function(p78)
				-- upvalues: (copy) p_u_76
				if p_u_76.state.dragging then
					local v79 = p78.UserInputType
					if v79 == Enum.UserInputType.MouseMovement or v79 == Enum.UserInputType.Touch then
						if p78.UserInputState == Enum.UserInputState.Change then
							p_u_76:processDrag(p78.Position.X)
						end
					else
						return
					end
				else
					return
				end
			end)
			p_u_76.releaseConnection = v_u_1.InputEnded:Connect(function(p80)
				-- upvalues: (copy) p_u_76
				local v81 = p80.UserInputType
				if v81 == Enum.UserInputType.MouseButton1 or v81 == Enum.UserInputType.Touch then
					p_u_76:stopListeningForDrag()
					p_u_76:processDrag(p80.Position.X)
				end
			end)
			p_u_76.focusLostConnection = v_u_1.WindowFocusReleased:Connect(function()
				-- upvalues: (copy) p_u_76
				p_u_76:stopListeningForDrag()
			end)
		else
			local v82 = v77:FindFirstAncestorWhichIsA("PluginGui")
			local v83 = Instance.new("ImageButton")
			v83.BackgroundTransparency = 1
			v83.Image = ""
			v83.Name = "SliderPluginGuiInputCapturer"
			v83.Size = UDim2.new(1, 0, 1, 0)
			v83.ZIndex = 100000
			p_u_76.moveConnection = v83.MouseMoved:Connect(function(p84)
				-- upvalues: (copy) p_u_76
				p_u_76:processDrag(p84)
			end)
			p_u_76.releaseConnection = v83.MouseButton1Up:Connect(function(p85)
				-- upvalues: (copy) p_u_76
				p_u_76:stopListeningForDrag()
				p_u_76:processDrag(p85)
			end)
			p_u_76.focusLostConnection = v83.MouseLeave:Connect(function(p86)
				-- upvalues: (copy) p_u_76
				p_u_76:stopListeningForDrag()
				p_u_76:processDrag(p86)
			end)
			v83.Parent = v82
			p_u_76.inputCapturerButton = v83
		end
		p_u_76:setState({
			["dragging"] = true
		})
	end
end
function v30.processDrag(p87, p88) -- name: processDrag
	local v89 = p87.rootButtonRef.current
	if v89 ~= nil then
		local v90 = p87.props.min
		local v91 = p87.props.max
		local v92 = p87.props.stepInterval
		local v93 = v89.AbsoluteSize.X
		local v94 = p88 - v89.AbsolutePosition.X
		local v95 = (math.clamp(v94, 0, v93) / v93 * (v91 - v90) + v90) / v92 + 0.5
		local v96 = math.floor(v95) * v92
		if v96 ~= p87.props.value then
			p87.props.valueChanged(v96)
		end
	end
end
function v30.disconnectDragEvents(p97) -- name: disconnectDragEvents
	if p97.moveConnection ~= nil then
		p97.moveConnection:Disconnect()
		p97.moveConnection = nil
	end
	if p97.releaseConnection ~= nil then
		p97.releaseConnection:Disconnect()
		p97.releaseConnection = nil
	end
	if p97.focusLostConnection ~= nil then
		p97.focusLostConnection:Disconnect()
		p97.focusLostConnection = nil
	end
	if p97.inputCapturerButton ~= nil then
		p97.inputCapturerButton:Destroy()
		p97.inputCapturerButton = nil
	end
end
function v30.stopListeningForDrag(p98) -- name: stopListeningForDrag
	if p98.state.dragging then
		p98:disconnectDragEvents()
		p98:setState({
			["dragging"] = false
		})
	end
end
function v30.processGamepadInput(p99, p100, p101) -- name: processGamepadInput
	local v102 = p99.props.stepInterval * p100
	local v103 = p99.props.value + v102 * p101
	local v104 = p99.props.max
	local v105 = math.min(v103, v104)
	local v106 = p99.props.min
	local v107 = math.max(v105, v106)
	if v107 ~= p99.props.value then
		p99.props.valueChanged(v107)
	end
end
function v30.onMoveStep(p108, p109, p110) -- name: onMoveStep
	local v111 = p110[Enum.KeyCode.Thumbstick1].Position
	local v112 = v111.Magnitude > 0.2
	local v113 = 0
	p108.totalMoveTime = p108.totalMoveTime + p109
	local v114, v115, v116
	if v112 then
		v114 = v111.x > 0 and 1 or -1
		v115 = 0.2
		v116 = 12
	else
		v114 = (p110[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin and -1 or 0) + (p110[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin and 1 or 0)
		v115 = 0.5
		v116 = 8
	end
	if v114 == 0 then
		p108.totalMoveTime = 0
		p108.isFirstMove = true
	elseif p108.isFirstMove then
		p108.isFirstMove = false
		p108.totalMoveTime = 0
		p108.unhandledTime = 0
		v113 = 1
	elseif v115 < p108.totalMoveTime then
		local v117 = v115 - p108.totalMoveTime - p109
		local v118 = p109 - math.max(v117, 0) + p108.unhandledTime
		local v119 = v116 * v118
		v113 = math.floor(v119)
		p108.unhandledTime = v118 - v113 / v116
	else
		p108.unhandledTime = 0
		v113 = 0
	end
	if v113 > 0 then
		p108:processGamepadInput(v114, v113)
	end
end
function v30.getDerivedStateFromProps(p120) -- name: getDerivedStateFromProps
	return not p120.isMenuOpen and {
		["entryMode"] = false
	} or nil
end
return v30