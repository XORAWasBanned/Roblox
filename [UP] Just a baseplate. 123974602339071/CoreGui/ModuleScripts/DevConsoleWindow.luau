-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DevConsoleWindow
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui").RobloxGui
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = require(script.Parent.Parent.Util.setMouseVisibility)
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local v8 = script.Parent.Parent
local v_u_9 = require(v8.Constants)
local v_u_10 = v_u_9.TopBarFormatting.FrameHeight
local v_u_11 = v_u_9.Padding.WindowPadding
local v_u_12 = v_u_9.MainWindowInit.MinSize
local v13 = v8.Components
local v_u_14 = require(v13.DevConsoleTopBar)
local v15 = script.Parent.Parent.Actions
local v_u_16 = require(v15.ChangeDevConsoleSize)
local v_u_17 = require(v15.SetDevConsoleVisibility)
local v_u_18 = require(v15.SetDevConsoleMinimized)
local v19 = v_u_6.PureComponent:extend("DevConsoleWindow")
function v19.onMinimizeClicked(p20) -- name: onMinimizeClicked
	p20.props.dispatchSetDevConsoleMinimized(true)
end
function v19.onMaximizeClicked(p21) -- name: onMaximizeClicked
	p21.props.dispatchSetDevConsoleMinimized(false)
end
function v19.onCloseClicked(p22) -- name: onCloseClicked
	p22.props.onCloseCallback(false)
	p22.props.dispatchSetDevConsolVisibility(false)
end
function v19.init(p_u_23) -- name: init
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (copy) v_u_6
	function p_u_23.setDevConsoleSize(p24, p25, p26)
		-- upvalues: (ref) v_u_12
		local v27 = p26.X - p25.X
		local v28 = p26.Y - p25.Y
		if v27 < v_u_12.X then
			v27 = v_u_12.X or v27
		end
		if v28 < v_u_12.Y then
			v28 = v_u_12.Y or v28
		end
		p24.props.dispatchChangeDevConsoleSize(UDim2.new(0, v27, 0, v28))
	end
	function p_u_23.resizeInputBegan(_, p29)
		-- upvalues: (copy) p_u_23, (ref) v_u_4
		if p29.UserInputType == Enum.UserInputType.MouseButton1 then
			local v_u_30 = nil
			local v_u_31 = nil
			local function v33(p32) -- name: onInputChanged
				-- upvalues: (ref) p_u_23
				p_u_23:setDevConsoleSize(p_u_23.ref.current.AbsolutePosition, p32.Position)
			end
			local function v35(p34) -- name: onInputEnded
				-- upvalues: (ref) v_u_30, (ref) v_u_31
				if p34.UserInputType == Enum.UserInputType.MouseButton1 then
					v_u_30:Disconnect()
					v_u_31:Disconnect()
				end
			end
			v_u_30 = v_u_4.InputChanged:Connect(v33)
			v_u_31 = v_u_4.InputEnded:Connect(v35)
		end
	end
	function p_u_23.doGamepadMenuButton(p36)
		-- upvalues: (copy) p_u_23
		if p_u_23.props.isVisible and (p36.KeyCode == Enum.KeyCode.ButtonStart or p36.KeyCode == Enum.KeyCode.Escape) then
			p_u_23.props.dispatchSetDevConsolVisibility(false)
		end
	end
	p_u_23.ref = v_u_6.createRef()
	p_u_23.state = {
		["resizing"] = false
	}
end
function v19.didMount(p_u_37) -- name: didMount
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	delay(0, function()
		-- upvalues: (copy) p_u_37
		if p_u_37.ref.current then
			p_u_37:setDevConsoleSize(p_u_37.ref.current.AbsolutePosition, p_u_37.ref.current.ResizeButton.AbsolutePosition)
		end
	end)
	v_u_5(p_u_37.props.isVisible)
	p_u_37.gamepadMenuListener = v_u_4.InputBegan:Connect(p_u_37.doGamepadMenuButton)
end
function v19.willUnmount(p38) -- name: willUnmount
	-- upvalues: (copy) v_u_3
	if v_u_3.SelectedCoreObject == p38.ref.current then
		v_u_3.SelectedCoreObject = nil
	end
	p38.gamepadMenuListener:Disconnect()
end
function v19.didUpdate(p39, p40, _) -- name: didUpdate
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	v_u_5(p39.props.isVisible)
	if p39.props.isMinimized and v_u_3.SelectedCoreObject == p39.ref.current then
		v_u_3.SelectedCoreObject = nil
	elseif p39.props.isVisible ~= p40.isVisible or p39.props.currTabIndex ~= p40.currTabIndex then
		if v_u_4:GetLastInputType() == Enum.UserInputType.Gamepad1 and p39.props.isVisible then
			v_u_3.SelectedCoreObject = p39.ref.current
			return
		end
		v_u_3.SelectedCoreObject = nil
	end
end
function v19.render(p_u_41) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_6, (copy) v_u_11, (copy) v_u_14, (copy) v_u_10
	local v42 = p_u_41.props.isVisible
	local v43 = p_u_41.props.formFactor
	local v44 = p_u_41.props.isDeveloperView
	local v45 = p_u_41.props.currTabIndex
	local v46 = p_u_41.props.tabList
	local v47 = p_u_41.props.isMinimized
	local v48 = p_u_41.props.position
	local v49 = p_u_41.props.size
	local _ = p_u_41.state.resizing
	local v50 = UDim2.new()
	local v51 = {}
	local v52, v53
	if v43 == v_u_9.FormFactor.Large then
		v52 = v49
		v53 = 16
	else
		local v54 = v_u_2.AbsoluteSize
		v49 = UDim2.new(0, v54.X, 0, v54.Y)
		v48 = UDim2.new(0, 0, 0, 0)
		v50 = UDim2.new(0, 16, 0, 0)
		v52 = v49 + UDim2.new(0, -32, 0, 0)
		v53 = 0
	end
	v51.UIListLayout = v_u_6.createElement("UIListLayout", {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["Padding"] = UDim.new(0, v_u_11)
	})
	if v47 then
		v51.TopBar = v_u_6.createElement(v_u_14, {
			["LayoutOrder"] = 1,
			["formFactor"] = nil,
			["isMinimized"] = true,
			["onMinimizeClicked"] = nil,
			["onMaximizeClicked"] = nil,
			["onCloseClicked"] = nil,
			["formFactor"] = v43,
			["onMinimizeClicked"] = function() -- name: onMinimizeClicked
				-- upvalues: (copy) p_u_41
				p_u_41:onMinimizeClicked()
			end,
			["onMaximizeClicked"] = function() -- name: onMaximizeClicked
				-- upvalues: (copy) p_u_41
				p_u_41:onMaximizeClicked()
			end,
			["onCloseClicked"] = function() -- name: onCloseClicked
				-- upvalues: (copy) p_u_41
				p_u_41:onCloseClicked()
			end
		})
		return v_u_6.createElement("Frame", {
			["Position"] = UDim2.new(1, -500, 1, -2 * v_u_10),
			["Size"] = UDim2.new(0, 500, 0, 2 * v_u_10),
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["Transparency"] = v_u_9.MainWindowInit.Transparency,
			["Active"] = true,
			["AutoLocalize"] = false,
			["Visible"] = v42,
			["Selectable"] = true,
			["BorderColor3"] = v_u_9.Color.BaseGray,
			[v_u_6.Ref] = p_u_41.ref
		}, v51)
	end
	v51.TopBar = v_u_6.createElement(v_u_14, {
		["LayoutOrder"] = 1,
		["formFactor"] = nil,
		["isMinimized"] = false,
		["onMinimizeClicked"] = nil,
		["onMaximizeClicked"] = nil,
		["onCloseClicked"] = nil,
		["formFactor"] = v43,
		["onMinimizeClicked"] = function() -- name: onMinimizeClicked
			-- upvalues: (copy) p_u_41
			p_u_41:onMinimizeClicked()
		end,
		["onMaximizeClicked"] = function() -- name: onMaximizeClicked
			-- upvalues: (copy) p_u_41
			p_u_41:onMaximizeClicked()
		end,
		["onCloseClicked"] = function() -- name: onCloseClicked
			-- upvalues: (copy) p_u_41
			p_u_41:onCloseClicked()
		end
	})
	local v55 = v_u_10 + 2 * v_u_11
	local v56 = v52 - UDim2.new(0, 0, 0, v55)
	local v57 = p_u_41.ref.current and (v42 and v46) and v46[v45]
	if v57 then
		v51.MainView = v_u_6.createElement(v57.tab, {
			["size"] = v56,
			["formFactor"] = v43,
			["isDeveloperView"] = v44,
			["tabList"] = v46
		})
	end
	return v_u_6.createElement("Frame", {
		["Position"] = v48,
		["Size"] = v49,
		["Visible"] = v42,
		["BackgroundColor3"] = Color3.new(0, 0, 0),
		["Transparency"] = v_u_9.MainWindowInit.Transparency,
		["BorderColor3"] = v_u_9.Color.BaseGray,
		["BorderSizePixel"] = v53,
		["Active"] = true,
		["AutoLocalize"] = false,
		["Selectable"] = false,
		[v_u_6.Ref] = p_u_41.ref
	}, {
		["DevConsoleUI"] = v_u_6.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = v52,
			["Position"] = v50
		}, v51),
		["ResizeButton"] = v_u_6.createElement("ImageButton", {
			["Position"] = UDim2.new(1, 0, 1, 0),
			["Size"] = UDim2.new(0, v53, 0, v53),
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["Modal"] = true,
			[v_u_6.Event.InputBegan] = p_u_41.resizeInputBegan
		})
	})
end
return v7.UNSTABLE_connect2(function(p58, _) -- name: mapStateToProps
	return {
		["isVisible"] = p58.DisplayOptions.isVisible,
		["isMinimized"] = p58.DisplayOptions.isMinimized,
		["position"] = p58.DisplayOptions.position,
		["size"] = p58.DisplayOptions.size,
		["isDeveloperView"] = p58.MainView.isDeveloperView,
		["currTabIndex"] = p58.MainView.currTabIndex,
		["tabList"] = p58.MainView.tabList
	}
end, function(p_u_59) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	return {
		["dispatchChangeDevConsoleSize"] = function(p60) -- name: dispatchChangeDevConsoleSize
			-- upvalues: (copy) p_u_59, (ref) v_u_16
			p_u_59(v_u_16(p60))
		end,
		["dispatchSetDevConsolVisibility"] = function(p61) -- name: dispatchSetDevConsolVisibility
			-- upvalues: (copy) p_u_59, (ref) v_u_17
			p_u_59(v_u_17(p61))
		end,
		["dispatchSetDevConsoleMinimized"] = function(p62) -- name: dispatchSetDevConsoleMinimized
			-- upvalues: (copy) p_u_59, (ref) v_u_18
			p_u_59(v_u_18(p62))
		end
	}
end)(v19)