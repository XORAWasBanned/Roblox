-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScrollingTextBox
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("TextService")
local v_u_4 = require(v1.Packages.Cryo)
local v_u_5 = require(v1.Packages.Roact)
local v_u_6 = v_u_5.Component:extend("ScrollingTextBox")
function v_u_6.init(p_u_7, p8) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	local v9 = v_u_3:GetTextSize("A", p8.TextSize, p8.Font, Vector2.new(0, 0))
	function p_u_7.adjustOffset()
		-- upvalues: (copy) p_u_7
		if p_u_7.clipBox.current and p_u_7.textboxRef.current then
			local v10 = p_u_7.state.fontDims
			local v11 = p_u_7.textboxRef.current.CursorPosition - 1
			local v12 = p_u_7.state.innerXOffset / v10.X
			local v13 = v11 - math.ceil(v12)
			local v14 = p_u_7.clipBox.current.AbsoluteSize.X * 0.9 / v10.X
			local v15 = math.floor(v14)
			if v15 < v13 then
				p_u_7:setState({
					["innerXOffset"] = (v11 - v15) * v10.X
				})
				return
			end
			if v13 < 0 then
				p_u_7:setState({
					["innerXOffset"] = v11 * v10.X
				})
			end
		end
	end
	p_u_7.clipBox = v_u_5.createRef()
	p_u_7.textboxRef = p_u_7.props.forwardRef or v_u_5.createRef()
	p_u_7.state = {
		["fontDims"] = nil,
		["innerXOffset"] = 0,
		["fontDims"] = v9
	}
end
function v_u_6.didMount(p_u_16) -- name: didMount
	-- upvalues: (copy) v_u_2
	if not p_u_16.onFocusConnection then
		p_u_16.onFocusConnection = v_u_2.InputBegan:Connect(function(p17)
			-- upvalues: (copy) p_u_16
			if p_u_16.textboxRef.current and p_u_16.textboxRef.current:IsFocused() then
				if p17.KeyCode == Enum.KeyCode.Home then
					p_u_16.textboxRef.current.CursorPosition = 0
					return
				end
				if p17.KeyCode == Enum.KeyCode.End then
					p_u_16.textboxRef.current.CursorPosition = #p_u_16.textboxRef.current.text + 1
					return
				end
				p_u_16.adjustOffset()
			end
		end)
	end
end
function v_u_6.willUnmount(p18) -- name: willUnmount
	if p18.onFocusConnection then
		p18.onFocusConnection:Disconnect()
		p18.onFocusConnection = nil
	end
end
function v_u_6.render(p19) -- name: render
	-- upvalues: (copy) v_u_5
	local v20 = p19.props.Position
	local v21 = p19.props.Size
	local v22 = p19.props.PlaceholderText
	local v23 = p19.props.TextColor3
	local v24 = p19.props.TextSize
	local v25 = p19.props.Font
	local v26 = p19.props.Text
	local v27 = p19.props.ClearTextOnFocus
	local v28 = p19.props.ShowNativeInput
	local v29 = p19.props.TextBoxFocusLost
	local v30 = p19.state.innerXOffset
	local v31 = v_u_5.createElement
	local v32 = {
		["Position"] = v20,
		["Size"] = v21,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		[v_u_5.Ref] = p19.clipBox
	}
	local v33 = {
		["TextBox"] = v_u_5.createElement("TextBox", {
			["Position"] = UDim2.new(0, -v30, 0, 0),
			["Size"] = UDim2.new(1, v30, 1, 0),
			["BackgroundTransparency"] = 1,
			["ShowNativeInput"] = v28,
			["ClearTextOnFocus"] = v27,
			["TextColor3"] = v23,
			["TextXAlignment"] = 0,
			["TextSize"] = v24,
			["Text"] = v26,
			["Font"] = v25,
			["PlaceholderText"] = v22,
			[v_u_5.Ref] = p19.textboxRef,
			[v_u_5.Change.CursorPosition] = p19.adjustOffset,
			[v_u_5.Event.FocusLost] = v29
		})
	}
	return v31("Frame", v32, v33)
end
return v_u_5.forwardRef(function(p34, p35)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_4
	return v_u_5.createElement(v_u_6, v_u_4.Dictionary.join(p34, {
		["forwardRef"] = p35
	}))
end)