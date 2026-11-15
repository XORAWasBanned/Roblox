-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Log.DevConsoleCommandLine
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("LogService")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(script.Parent.Parent.DataConsumer)
local v_u_6 = require(script.Parent.Parent.ScrollingTextBox)
local v_u_7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = v_u_7.LogFormatting.CommandLineIndent
local v_u_9 = v_u_7.DefaultFontSize.CommandLine
local v_u_10 = v_u_7.Font.Log
local v11 = v_u_4.PureComponent:extend("DevConsoleCommandLine")
function v11.init(p12) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	function p12.onFocusLost(p13, p14, _)
		-- upvalues: (ref) v_u_3
		if p14 then
			v_u_3:ExecuteScript(p13.Text)
			p13:CaptureFocus()
		end
	end
	p12.textbox = v_u_4.createRef()
end
function v11.didMount(p_u_15) -- name: didMount
	-- upvalues: (copy) v_u_2
	if not p_u_15.onFocusConnection then
		p_u_15.onFocusConnection = v_u_2.InputBegan:Connect(function(p16)
			-- upvalues: (copy) p_u_15
			if p_u_15.textbox.current and p_u_15.textbox.current:IsFocused() then
				local v17 = p_u_15.textbox.current
				local v18 = p_u_15.props.ServerLogData
				local v19 = v18:getCommandLineHistory()
				local v20 = v18:getCommandLineIndex()
				local v21
				if p16.KeyCode == Enum.KeyCode.Up then
					local v22 = v20 + 1
					local v23 = v19:getSize()
					v21 = math.min(v23, v22)
					v17.Text = v19:reverseAt(v21) or ""
				elseif p16.KeyCode == Enum.KeyCode.Down then
					local v24 = v20 - 1
					v21 = math.max(0, v24)
					v17.Text = v19:reverseAt(v21) or ""
				elseif p16.KeyCode == Enum.KeyCode.Return then
					if #v17.Text:gsub("%s+", "") > 0 and v19:reverseAt(1) ~= v17.Text then
						v19:push_back(v17.Text)
						v21 = 0
					else
						v21 = 0
					end
				else
					v21 = v20 ~= 0 and 0 or v20
				end
				v18:setCommandLineIndex(v21)
			end
		end)
	end
	if not p_u_15.fixUnwantedReturnCapture then
		p_u_15.fixUnwantedReturnCapture = v_u_2.InputEnded:Connect(function(p25)
			-- upvalues: (copy) p_u_15
			if p_u_15.textbox.current and (p_u_15.textbox.current:IsFocused() and p25.KeyCode == Enum.KeyCode.Return) then
				p_u_15.textbox.current.Text = ""
			end
		end)
	end
end
function v11.willUnmount(p26) -- name: willUnmount
	if p26.onFocusConnection then
		p26.onFocusConnection:Disconnect()
		p26.onFocusConnection = nil
	end
	if p26.fixUnwantedReturnCapture then
		p26.fixUnwantedReturnCapture:Disconnect()
		p26.fixUnwantedReturnCapture = nil
	end
end
function v11.render(p27) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6
	local v28 = p27.props.height
	local v29 = p27.props.pos
	local v30 = p27.props.ServerLogData:getCommandLineIndex()
	local v31 = v30 == 0 and "" or (p27.props.ServerLogData:getCommandLineHistory():reverseAt(v30) or "")
	return v_u_4.createElement("Frame", {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["BorderColor3"] = nil,
		["BorderSizePixel"] = 1,
		["Position"] = v29,
		["Size"] = UDim2.new(1, 0, 0, v28),
		["BackgroundColor3"] = v_u_7.Color.TextBoxGray,
		["BorderColor3"] = v_u_7.Color.BorderGray
	}, {
		["Arrow"] = v_u_4.createElement("TextLabel", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["TextSize"] = nil,
			["Font"] = nil,
			["Text"] = "> ",
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["Size"] = UDim2.new(0, v_u_8, 1, 0),
			["TextSize"] = v_u_9,
			["Font"] = v_u_10,
			["TextColor3"] = v_u_7.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Right
		}),
		["InputField"] = v_u_4.createElement(v_u_6, {
			["Position"] = UDim2.new(0, v_u_8, 0, 0),
			["Size"] = UDim2.new(1, -v_u_8, 0, v28),
			["ShowNativeInput"] = true,
			["ClearTextOnFocus"] = false,
			["TextColor3"] = v_u_7.Color.Text,
			["TextXAlignment"] = 0,
			["TextSize"] = v_u_9,
			["Text"] = v31,
			["Font"] = v_u_10,
			["PlaceholderText"] = "command line",
			[v_u_4.Ref] = p27.textbox,
			["TextBoxFocusLost"] = p27.onFocusLost
		})
	})
end
return v5(v11, "ServerLogData")