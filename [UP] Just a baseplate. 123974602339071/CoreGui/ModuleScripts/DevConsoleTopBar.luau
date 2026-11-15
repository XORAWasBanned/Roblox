-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DevConsoleTopBar
local v1 = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui
local v2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(script.Parent.Parent.Constants)
local v_u_6 = v_u_5.TopBarFormatting.FrameHeight
local v_u_7 = 0.5 * v_u_6
local v_u_8 = (v_u_6 - v_u_7) / 2
local v_u_9 = game:GetService("UserInputService")
local v_u_10 = v2:GetTextSize("Developer Console", v_u_5.DefaultFontSize.TopBar, v_u_5.Font.TopBar, Vector2.new(0, 0))
local v_u_11 = require(script.Parent.Parent.Components.LiveUpdateElement)
local v_u_12 = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local v13 = v_u_3.Component:extend("DevConsoleTopBar")
function v13.init(p_u_14) -- name: init
	-- upvalues: (copy) v_u_9, (copy) v_u_3
	p_u_14.inputChangedConnection = nil
	p_u_14.inputChangedDisconnectRetries = 0
	function p_u_14.inputBegan(_, p15)
		-- upvalues: (copy) p_u_14, (ref) v_u_9
		if not p_u_14.props.isMinimized then
			if p15.UserInputType == Enum.UserInputType.MouseButton1 then
				local v16 = p_u_14.ref.current.AbsolutePosition
				local v17 = v16.X
				local v18 = v16.Y
				local v19 = Vector3.new(v17, v18, 0)
				if p_u_14.inputChangedConnection then
					p_u_14.inputChangedConnection:Disconnect()
					p_u_14.inputChangedConnection = nil
				end
				p_u_14.inputChangedConnection = v_u_9.InputChanged:Connect(function(p20)
					-- upvalues: (ref) p_u_14
					p_u_14.inputChanged(nil, p20)
				end)
				p_u_14:setState({
					["startPos"] = nil,
					["startOffset"] = nil,
					["moving"] = true,
					["startPos"] = v19,
					["startOffset"] = p15.Position
				})
				p_u_14.inputChangedDisconnectRetries = 1
			end
		end
	end
	function p_u_14.inputChanged(_, p21)
		-- upvalues: (copy) p_u_14
		if p_u_14.state.moving then
			if p21.UserInputType == Enum.UserInputType.MouseMovement then
				local v22 = p_u_14.state.startPos - p_u_14.state.startOffset + p21.Position
				local v23 = UDim2.new(0, v22.X, 0, v22.Y)
				p_u_14.props.dispatchSetDevConsolePosition(v23)
				return
			end
		elseif p_u_14.inputChangedConnection then
			if p_u_14.inputChangedDisconnectRetries > 0 then
				p_u_14.inputChangedDisconnectRetries = p_u_14.inputChangedDisconnectRetries - 1
				return
			end
			p_u_14.inputChangedConnection:Disconnect()
			p_u_14.inputChangedConnection = nil
		end
	end
	function p_u_14.inputEnded(_, p24)
		-- upvalues: (copy) p_u_14
		if p24.UserInputType == Enum.UserInputType.MouseButton1 and p24.UserInputState == Enum.UserInputState.End then
			if p_u_14.inputChangedConnection then
				p_u_14.inputChangedConnection:Disconnect()
				p_u_14.inputChangedConnection = nil
			end
			p_u_14:setState({
				["moving"] = false
			})
		end
	end
	p_u_14.ref = v_u_3.createRef()
end
function v13.render(p25) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_10, (copy) v_u_6, (copy) v_u_11, (copy) v_u_7, (copy) v_u_8
	local v26 = p25.props.isMinimized
	local v27 = p25.props.formFactor
	local v28 = p25.props.onMinimizeClicked
	local v29 = p25.props.onMaximizeClicked
	local v30 = p25.props.onCloseClicked
	local _ = p25.state.moving
	local v31 = {
		["WindowTitle"] = v_u_3.createElement("TextLabel", {
			["Text"] = "Developer Console",
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["Font"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = nil,
			["TextSize"] = v_u_5.DefaultFontSize.TopBar,
			["TextColor3"] = Color3.new(1, 1, 1),
			["Font"] = v_u_5.Font.TopBar,
			["Size"] = UDim2.new(0, v_u_10.X, 0, v_u_6),
			["Position"] = UDim2.new(0, 4, 0, 0),
			["BackgroundColor3"] = v_u_5.Color.BaseGray,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		})
	}
	local v32 = v_u_10.X + 8
	local v33 = UDim2.new(0, v32, 0, 0)
	local v34 = UDim2.new(1, -2 * v32, 0, v_u_6)
	if v26 then
		v33 = UDim2.new(0, 0, 1, 0)
		v34 = UDim2.new(1, 0, 1, 0)
	elseif p25.ref.current then
		v34 = UDim2.new(0, p25.ref.current.AbsoluteSize.X - 2 * v_u_10.X, 0, v_u_6)
	end
	local v35 = {
		["topBarLiveUpdate"] = p25.props.topBarLiveUpdate,
		["size"] = v34,
		["position"] = v33
	}
	v31.LiveStatsModule = v_u_3.createElement(v_u_11, v35)
	if v27 == v_u_5.FormFactor.Large then
		if v26 then
			v31.MaxButton = v_u_3.createElement("ImageButton", {
				["Size"] = UDim2.new(0, v_u_7, 0, v_u_7),
				["Position"] = UDim2.new(1, -2 * v_u_6 + v_u_8, 0, v_u_8),
				["BorderColor3"] = Color3.new(0, 0, 1),
				["BackgroundColor3"] = v_u_5.Color.BaseGray,
				["BackgroundTransparency"] = 1,
				["Image"] = v_u_5.Image.Maximize,
				[v_u_3.Event.Activated] = v29
			})
		else
			v31.MinButton = v_u_3.createElement("ImageButton", {
				["Size"] = UDim2.new(0, v_u_7, 0, v_u_7),
				["Position"] = UDim2.new(1, -2 * v_u_6 + v_u_8, 0, v_u_8),
				["BorderColor3"] = Color3.new(1, 0, 0),
				["BackgroundColor3"] = v_u_5.Color.BaseGray,
				["BackgroundTransparency"] = 1,
				["Image"] = v_u_5.Image.Minimize,
				[v_u_3.Event.Activated] = v28
			})
		end
	end
	v31.CloseButton = v_u_3.createElement("ImageButton", {
		["Size"] = UDim2.new(0, v_u_7, 0, v_u_7),
		["Position"] = UDim2.new(1, -v_u_6 + v_u_8, 0, v_u_8),
		["BorderColor3"] = Color3.new(0, 1, 0),
		["BackgroundColor3"] = v_u_5.Color.BaseGray,
		["BackgroundTransparency"] = 1,
		["ZIndex"] = 2,
		["Image"] = v_u_5.Image.Close,
		[v_u_3.Event.Activated] = v30
	})
	return v_u_3.createElement("ImageButton", {
		["Size"] = UDim2.new(1, 0, 0, v_u_6),
		["BackgroundColor3"] = v_u_5.Color.Black,
		["BackgroundTransparency"] = 0.5,
		["AutoButtonColor"] = false,
		["LayoutOrder"] = 1,
		[v_u_3.Ref] = p25.ref,
		[v_u_3.Event.InputBegan] = p25.inputBegan,
		[v_u_3.Event.InputEnded] = p25.inputEnded
	}, v31)
end
return v4.UNSTABLE_connect2(nil, function(p_u_36) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_12
	return {
		["dispatchSetDevConsolePosition"] = function(p37) -- name: dispatchSetDevConsolePosition
			-- upvalues: (copy) p_u_36, (ref) v_u_12
			p_u_36(v_u_12(p37))
		end
	}
end)(v13)