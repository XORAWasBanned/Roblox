--// AI dump
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local function GetGuiParent()
	if gethui and type(gethui) == "function" then
		local Success, Result = pcall(gethui)
		if Success and Result then return Result end
	end
	return game:GetService("CoreGui")
end

local IsTouchDevice = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local function MakeDraggable(DragHandle, TargetFrame, OnClick)
	local Dragging = false
	local DragStartInput = nil
	local StartMousePos = Vector3.zero
	local StartFramePos = UDim2.new()
	local MovedFarEnough = false
	local DragThreshold = 6

	DragHandle.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStartInput = Input
			StartMousePos = Input.Position
			StartFramePos = TargetFrame.Position
			MovedFarEnough = false

			local ChangedConn, EndedConn
			
			ChangedConn = UserInputService.InputChanged:Connect(function(ChangedInput)
				if ChangedInput == DragStartInput or ChangedInput.UserInputType == Enum.UserInputType.MouseMovement or ChangedInput.UserInputType == Enum.UserInputType.Touch then
					local Delta = ChangedInput.Position - StartMousePos
					if Delta.Magnitude > DragThreshold then
						MovedFarEnough = true
					end

					if MovedFarEnough then
						TargetFrame.Position = UDim2.new(
							StartFramePos.X.Scale,
							StartFramePos.X.Offset + Delta.X,
							StartFramePos.Y.Scale,
							StartFramePos.Y.Offset + Delta.Y
						)
					end
				end
			end)

			EndedConn = UserInputService.InputEnded:Connect(function(EndedInput)
				if EndedInput.UserInputType == Enum.UserInputType.MouseButton1 or EndedInput.UserInputType == Enum.UserInputType.Touch then
					Dragging = false
					ChangedConn:Disconnect()
					EndedConn:Disconnect()

					if not MovedFarEnough and OnClick then
						OnClick()
					end
				end
			end)
		end
	end)
end

local Library = {}

function Library.New(Options)
	Options = Options or {}

	local ConfigFolder = Options.ConfigFolder or ((Options.Name or "SleekClient") .. "Configs")
	if makefolder and isfolder and not isfolder(ConfigFolder) then
		makefolder(ConfigFolder)
	end

	local Config = {
		Name = Options.Name or "Test",
		ToggleKey = Options.ToggleKey or Enum.KeyCode.RightShift,
		PanelsKey = Options.PanelsKey or Enum.KeyCode.H,
		ThemeColor = Options.ThemeColor or Color3.fromRGB(0, 150, 255),
		BackgroundColor = Options.BackgroundColor or Color3.fromRGB(15, 15, 18),
		HeaderColor = Options.HeaderColor or Color3.fromRGB(24, 24, 28),
		PanelWidth = Options.PanelWidth or 165,
		HeaderHeight = Options.HeaderHeight or 34,
		ModuleHeight = Options.ModuleHeight or 28,
		TweenTime = Options.TweenTime or 0.2,
		ShowText = Options.Name or "Custom",
	}

	local FlagRegistry = {}
	local DropdownRegistry = {}

	local function CreateToggle(Parent, Label, DefaultState, Callback)
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLbl = Instance.new("TextLabel")
		TextLbl.Size = UDim2.new(1, -45, 1, 0)
		TextLbl.BackgroundTransparency = 1
		TextLbl.Text = Label
		TextLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLbl.Font = Enum.Font.GothamMedium
		TextLbl.TextSize = 11
		TextLbl.TextXAlignment = Enum.TextXAlignment.Left
		TextLbl.Parent = Frame

		local ToggleBtn = Instance.new("TextButton")
		ToggleBtn.Size = UDim2.new(0, 40, 0, 18)
		ToggleBtn.Position = UDim2.new(1, -40, 0, 4)
		ToggleBtn.BackgroundColor3 = DefaultState and Config.ThemeColor or Color3.fromRGB(35, 35, 42)
		ToggleBtn.Text = DefaultState and "ON" or "OFF"
		ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleBtn.Font = Enum.Font.GothamBold
		ToggleBtn.TextSize = 9
		ToggleBtn.AutoButtonColor = false
		ToggleBtn.Parent = Frame

		Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 4)

		local Toggled = DefaultState or false
		
		local function Fire(Value, SkipCallback)
			Toggled = Value
			TweenService:Create(ToggleBtn, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				BackgroundColor3 = Toggled and Config.ThemeColor or Color3.fromRGB(35, 35, 42)
			}):Play()
			ToggleBtn.Text = Toggled and "ON" or "OFF"
			if Callback and not SkipCallback then Callback(Toggled) end
		end

		ToggleBtn.MouseButton1Click:Connect(function()
			Fire(not Toggled)
		end)

		return {
			Get = function() return Toggled end,
			Set = function(Value, SkipCallback) Fire(Value and true or false, SkipCallback) end
		}
	end

	local function CreateSlider(Parent, Label, Min, Max, Default, Step, Theme, Callback)
		Step = Step or 0.5
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 36)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLbl = Instance.new("TextLabel")
		TextLbl.Size = UDim2.new(0.6, 0, 0, 14)
		TextLbl.BackgroundTransparency = 1
		TextLbl.Text = Label
		TextLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLbl.Font = Enum.Font.GothamMedium
		TextLbl.TextSize = 11
		TextLbl.TextXAlignment = Enum.TextXAlignment.Left
		TextLbl.Parent = Frame

		local ValBox = Instance.new("TextBox")
		ValBox.Size = UDim2.new(0, 45, 0, 16)
		ValBox.Position = UDim2.new(1, -45, 0, 0)
		ValBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
		ValBox.Text = tostring(Default)
		ValBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValBox.Font = Enum.Font.GothamBold
		ValBox.TextSize = 10
		ValBox.ClearTextOnFocus = false
		ValBox.Parent = Frame
		Instance.new("UICorner", ValBox).CornerRadius = UDim.new(0, 3)

		local TrackArea = Instance.new("Frame")
		TrackArea.Size = UDim2.new(1, 0, 0, 18)
		TrackArea.Position = UDim2.new(0, 0, 0, 18)
		TrackArea.BackgroundTransparency = 1
		TrackArea.Parent = Frame

		local Track = Instance.new("Frame")
		Track.Size = UDim2.new(1, 0, 0, 6)
		Track.Position = UDim2.new(0, 0, 0.5, -3)
		Track.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
		Track.Parent = TrackArea
		Instance.new("UICorner", Track).CornerRadius = UDim.new(0, 3)

		local Fill = Instance.new("Frame")
		Fill.BackgroundColor3 = Theme or Config.ThemeColor
		Fill.Parent = Track
		Instance.new("UICorner", Fill).CornerRadius = UDim.new(0, 3)

		local Knob = Instance.new("TextButton")
		Knob.Size = UDim2.new(0, 14, 0, 14)
		Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Knob.Text = ""
		Knob.AutoButtonColor = false
		Knob.Parent = Track
		Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)

		local KnobStroke = Instance.new("UIStroke")
		KnobStroke.Color = Color3.fromRGB(40, 40, 50)
		KnobStroke.Thickness = 1.5
		KnobStroke.Parent = Knob

		local Value = Default

		local function UpdateDisplay(Val)
			ValBox.Text = string.format("%.1f", Val)
			local Alpha = math.clamp((Val - Min) / (Max - Min), 0, 1)
			TweenService:Create(Fill, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(Alpha, 0, 1, 0)
			}):Play()
			TweenService:Create(Knob, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = UDim2.new(Alpha, -7, 0.5, -7)
			}):Play()
		end
		UpdateDisplay(Default)

		local function ApplyValue(NewVal, SkipCallback)
			if Step > 0 then
				NewVal = math.round(NewVal / Step) * Step
			end
			Value = math.clamp(NewVal, Min, Max)
			UpdateDisplay(Value)
			if Callback and not SkipCallback then Callback(Value) end
		end

		local IsDraggingSlider = false

		local function UpdateSliderFromInput(Input)
			local AbsolutePos = Track.AbsolutePosition
			local AbsoluteSize = Track.AbsoluteSize
			local RelativeX = math.clamp((Input.Position.X - AbsolutePos.X) / AbsoluteSize.X, 0, 1)
			local RawVal = Min + RelativeX * (Max - Min)
			ApplyValue(RawVal)
		end

		local function StartDrag(Input)
			IsDraggingSlider = true
			UpdateSliderFromInput(Input)
		end

		Knob.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				StartDrag(Input)
			end
		end)

		TrackArea.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				StartDrag(Input)
			end
		end)

		UserInputService.InputChanged:Connect(function(Input)
			if IsDraggingSlider and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
				UpdateSliderFromInput(Input)
			end
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				IsDraggingSlider = false
			end
		end)

		ValBox.FocusLost:Connect(function()
			local NumVal = tonumber(ValBox.Text)
			if NumVal then
				ApplyValue(NumVal)
			else
				UpdateDisplay(Value)
			end
		end)

		return {
			Get = function() return Value end,
			Set = function(Val, SkipCallback) ApplyValue(Val, SkipCallback) end
		}
	end

	local function CreateTextBox(Parent, Label, Default, Callback, Placeholder)
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLbl = Instance.new("TextLabel")
		TextLbl.Size = UDim2.new(1, -70, 1, 0)
		TextLbl.BackgroundTransparency = 1
		TextLbl.Text = Label
		TextLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLbl.Font = Enum.Font.GothamMedium
		TextLbl.TextSize = 11
		TextLbl.TextXAlignment = Enum.TextXAlignment.Left
		TextLbl.Parent = Frame

		local Box = Instance.new("TextBox")
		Box.Size = UDim2.new(0, 65, 0, 18)
		Box.Position = UDim2.new(1, -65, 0, 4)
		Box.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
		Box.Text = tostring(Default or "")
		Box.PlaceholderText = Placeholder or ""
		Box.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
		Box.TextColor3 = Color3.fromRGB(255, 255, 255)
		Box.Font = Enum.Font.Gotham
		Box.TextSize = 10
		Box.ClearTextOnFocus = false
		Box.Parent = Frame
		Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 4)

		Box.FocusLost:Connect(function()
			if Callback then Callback(Box.Text) end
		end)

		return {
			Get = function() return Box.Text end,
			Set = function(Val, SkipCallback)
				Box.Text = tostring(Val)
				if Callback and not SkipCallback then Callback(Box.Text) end
			end
		}
	end

	local function CreateDropdown(Parent, Label, Options, Default, Callback, OnResizeRequested)
		Options = Options or {}
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLbl = Instance.new("TextLabel")
		TextLbl.Size = UDim2.new(1, -75, 0, 26)
		TextLbl.BackgroundTransparency = 1
		TextLbl.Text = Label
		TextLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLbl.Font = Enum.Font.GothamMedium
		TextLbl.TextSize = 11
		TextLbl.TextXAlignment = Enum.TextXAlignment.Left
		TextLbl.Parent = Frame

		local DropBtn = Instance.new("TextButton")
		DropBtn.Size = UDim2.new(0, 70, 0, 18)
		DropBtn.Position = UDim2.new(1, -70, 0, 4)
		DropBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
		DropBtn.Text = Default or (Options[1] or "None")
		DropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		DropBtn.Font = Enum.Font.GothamMedium
		DropBtn.TextSize = 10
		DropBtn.AutoButtonColor = false
		DropBtn.Parent = Frame
		Instance.new("UICorner", DropBtn).CornerRadius = UDim.new(0, 4)

		local SelectedOption = DropBtn.Text
		local IsOpen = false

		local Container = Instance.new("Frame")
		Container.Size = UDim2.new(1, 0, 0, 0)
		Container.Position = UDim2.new(0, 0, 0, 28)
		Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
		Container.Visible = false
		Container.ClipsDescendants = true
		Container.Parent = Frame
		Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 4)

		local ContainerPad = Instance.new("UIPadding")
		ContainerPad.PaddingTop = UDim.new(0, 4)
		ContainerPad.PaddingBottom = UDim.new(0, 4)
		ContainerPad.PaddingLeft = UDim.new(0, 4)
		ContainerPad.PaddingRight = UDim.new(0, 4)
		ContainerPad.Parent = Container

		local List = Instance.new("UIListLayout")
		List.SortOrder = Enum.SortOrder.LayoutOrder
		List.Padding = UDim.new(0, 3)
		List.Parent = Container

		local function RefreshOptions()
			for _, Child in ipairs(Container:GetChildren()) do
				if Child:IsA("TextButton") then Child:Destroy() end
			end
			for _, Opt in ipairs(Options) do
				local OptBtn = Instance.new("TextButton")
				OptBtn.Size = UDim2.new(1, 0, 0, 18)
				OptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
				OptBtn.Text = Opt
				OptBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
				OptBtn.Font = Enum.Font.Gotham
				OptBtn.TextSize = 10
				OptBtn.Parent = Container
				Instance.new("UICorner", OptBtn).CornerRadius = UDim.new(0, 3)

				OptBtn.MouseButton1Click:Connect(function()
					SelectedOption = Opt
					DropBtn.Text = Opt
					IsOpen = false
					Container.Visible = false
					Frame.Size = UDim2.new(1, 0, 0, 26)
					if Callback then Callback(Opt) end
					if OnResizeRequested then OnResizeRequested() end
				end)
			end
		end
		RefreshOptions()

		DropBtn.MouseButton1Click:Connect(function()
			IsOpen = not IsOpen
			Container.Visible = IsOpen
			local TargetH = IsOpen and (#Options * 21 + 8) or 0
			Container.Size = UDim2.new(1, 0, 0, TargetH)
			Frame.Size = UDim2.new(1, 0, 0, IsOpen and (28 + TargetH + 4) or 26)
			if OnResizeRequested then OnResizeRequested() end
		end)

		local API = {
			Get = function() return SelectedOption end,
			Set = function(Val, SkipCallback)
				SelectedOption = Val
				DropBtn.Text = Val
				if Callback and not SkipCallback then Callback(Val) end
			end,
			UpdateOptions = function(NewOptions)
				Options = NewOptions
				RefreshOptions()
			end
		}
		return API
	end

	local function CreateKeybind(Parent, Label, DefaultKey, Callback, ToggleParentModule)
		if IsTouchDevice then return nil end

		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLbl = Instance.new("TextLabel")
		TextLbl.Size = UDim2.new(1, -65, 1, 0)
		TextLbl.BackgroundTransparency = 1
		TextLbl.Text = Label
		TextLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLbl.Font = Enum.Font.GothamMedium
		TextLbl.TextSize = 11
		TextLbl.TextXAlignment = Enum.TextXAlignment.Left
		TextLbl.Parent = Frame

		local BindBtn = Instance.new("TextButton")
		BindBtn.Size = UDim2.new(0, 60, 0, 18)
		BindBtn.Position = UDim2.new(1, -60, 0, 4)
		BindBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
		BindBtn.Text = DefaultKey and (typeof(DefaultKey) == "EnumItem" and DefaultKey.Name or tostring(DefaultKey)) or "None"
		BindBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		BindBtn.Font = Enum.Font.GothamMedium
		BindBtn.TextSize = 10
		BindBtn.AutoButtonColor = false
		BindBtn.Parent = Frame
		Instance.new("UICorner", BindBtn).CornerRadius = UDim.new(0, 4)

		local BoundKey = typeof(DefaultKey) == "EnumItem" and DefaultKey or nil
		local IsListening = false

		BindBtn.MouseButton1Click:Connect(function()
			IsListening = true
			BindBtn.Text = "[...]"
			TweenService:Create(BindBtn, TweenInfo.new(Config.TweenTime), {
				BackgroundColor3 = Config.ThemeColor
			}):Play()
		end)

		local InputConn
		InputConn = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			if IsListening then
				if Input.UserInputType == Enum.UserInputType.Keyboard then
					IsListening = false
					TweenService:Create(BindBtn, TweenInfo.new(Config.TweenTime), {
						BackgroundColor3 = Color3.fromRGB(28, 28, 34)
					}):Play()
					if Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.Backspace then
						BoundKey = nil
						BindBtn.Text = "None"
					else
						BoundKey = Input.KeyCode
						BindBtn.Text = BoundKey.Name
					end
					if Callback then Callback(BoundKey) end
				end
			elseif BoundKey and Input.KeyCode == BoundKey and not GameProcessed then
				if ToggleParentModule then ToggleParentModule() end
			end
		end)

		return {
			Get = function() return BoundKey and BoundKey.Name or "None" end,
			Set = function(Key, SkipCallback)
				if type(Key) == "string" then
					BoundKey = Enum.KeyCode[Key]
				else
					BoundKey = Key
				end
				BindBtn.Text = BoundKey and BoundKey.Name or "None"
				if Callback and not SkipCallback then Callback(BoundKey) end
			end,
			Destroy = function()
				if InputConn then InputConn:Disconnect() end
			end
		}
	end

	local function CreateColorPicker(Parent, Label, DefaultColor, Callback, HasAlpha, OnResizeRequested)
		DefaultColor = DefaultColor or Color3.fromRGB(255, 255, 255)
		local CurrentAlpha = 1
		local H, S, V = Color3.toHSV(DefaultColor)

		local MainContainer = Instance.new("Frame")
		MainContainer.Size = UDim2.new(1, 0, 0, 26)
		MainContainer.BackgroundTransparency = 1
		MainContainer.Parent = Parent

		local HeaderRow = Instance.new("Frame")
		HeaderRow.Size = UDim2.new(1, 0, 0, 26)
		HeaderRow.BackgroundTransparency = 1
		HeaderRow.Parent = MainContainer

		local TextLbl = Instance.new("TextLabel")
		TextLbl.Size = UDim2.new(1, -30, 1, 0)
		TextLbl.BackgroundTransparency = 1
		TextLbl.Text = Label
		TextLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLbl.Font = Enum.Font.GothamMedium
		TextLbl.TextSize = 11
		TextLbl.TextXAlignment = Enum.TextXAlignment.Left
		TextLbl.Parent = HeaderRow

		local PreviewCheckerBg = Instance.new("Frame")
		PreviewCheckerBg.Size = UDim2.new(0, 22, 0, 16)
		PreviewCheckerBg.Position = UDim2.new(1, -22, 0, 5)
		PreviewCheckerBg.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
		PreviewCheckerBg.Parent = HeaderRow
		Instance.new("UICorner", PreviewCheckerBg).CornerRadius = UDim.new(0, 4)

		local CheckerInner = Instance.new("Frame")
		CheckerInner.Size = UDim2.new(0.5, 0, 0.5, 0)
		CheckerInner.Position = UDim2.new(0, 0, 0, 0)
		CheckerInner.BackgroundColor3 = Color3.fromRGB(80, 80, 95)
		CheckerInner.BorderSizePixel = 0
		CheckerInner.Parent = PreviewCheckerBg

		local CheckerInner2 = Instance.new("Frame")
		CheckerInner2.Size = UDim2.new(0.5, 0, 0.5, 0)
		CheckerInner2.Position = UDim2.new(0.5, 0, 0.5, 0)
		CheckerInner2.BackgroundColor3 = Color3.fromRGB(80, 80, 95)
		CheckerInner2.BorderSizePixel = 0
		CheckerInner2.Parent = PreviewCheckerBg

		local ColorPreviewBtn = Instance.new("TextButton")
		ColorPreviewBtn.Size = UDim2.new(1, 0, 1, 0)
		ColorPreviewBtn.BackgroundColor3 = DefaultColor
		ColorPreviewBtn.Text = ""
		ColorPreviewBtn.AutoButtonColor = false
		ColorPreviewBtn.Parent = PreviewCheckerBg
		Instance.new("UICorner", ColorPreviewBtn).CornerRadius = UDim.new(0, 4)

		local PreviewStroke = Instance.new("UIStroke")
		PreviewStroke.Color = Color3.fromRGB(80, 80, 100)
		PreviewStroke.Thickness = 1
		PreviewStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		PreviewStroke.Parent = PreviewCheckerBg

		local PanelHeight = HasAlpha and 195 or 170
		local SatValHeight = 115

		local PanelFrame = Instance.new("Frame")
		PanelFrame.Size = UDim2.new(1, 0, 0, PanelHeight)
		PanelFrame.Position = UDim2.new(0, 0, 0, 30)
		PanelFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
		PanelFrame.Visible = false
		PanelFrame.Parent = MainContainer
		Instance.new("UICorner", PanelFrame).CornerRadius = UDim.new(0, 5)

		local PanelStroke = Instance.new("UIStroke")
		PanelStroke.Color = Color3.fromRGB(45, 45, 55)
		PanelStroke.Thickness = 1
		PanelStroke.Parent = PanelFrame

		local SatValCanvas = Instance.new("TextButton")
		SatValCanvas.Size = UDim2.new(1, -30, 0, SatValHeight)
		SatValCanvas.Position = UDim2.new(0, 8, 0, 8)
		SatValCanvas.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
		SatValCanvas.BorderSizePixel = 0
		SatValCanvas.Text = ""
		SatValCanvas.AutoButtonColor = false
		SatValCanvas.ClipsDescendants = true
		SatValCanvas.Parent = PanelFrame

		local WhiteGrad = Instance.new("Frame")
		WhiteGrad.Size = UDim2.new(1, 0, 1, 0)
		WhiteGrad.BackgroundTransparency = 0
		WhiteGrad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		WhiteGrad.BorderSizePixel = 0
		WhiteGrad.Parent = SatValCanvas

		local UIGradWhite = Instance.new("UIGradient")
		UIGradWhite.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 1)
		})
		UIGradWhite.Parent = WhiteGrad

		local BlackGrad = Instance.new("Frame")
		BlackGrad.Size = UDim2.new(1, 0, 1, 0)
		BlackGrad.BackgroundTransparency = 0
		BlackGrad.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		BlackGrad.BorderSizePixel = 0
		BlackGrad.Parent = SatValCanvas

		local UIGradBlack = Instance.new("UIGradient")
		UIGradBlack.Rotation = 90
		UIGradBlack.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0)
		})
		UIGradBlack.Parent = BlackGrad

		local Cursor = Instance.new("Frame")
		Cursor.Size = UDim2.new(0, 8, 0, 8)
		Cursor.AnchorPoint = Vector2.new(0.5, 0.5)
		Cursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Cursor.Parent = SatValCanvas
		Instance.new("UICorner", Cursor).CornerRadius = UDim.new(1, 0)

		local CursorStroke = Instance.new("UIStroke")
		CursorStroke.Color = Color3.fromRGB(0, 0, 0)
		CursorStroke.Thickness = 1
		CursorStroke.Parent = Cursor

		local HueBar = Instance.new("TextButton")
		HueBar.Size = UDim2.new(0, 10, 0, SatValHeight)
		HueBar.Position = UDim2.new(1, -16, 0, 8)
		HueBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		HueBar.BorderSizePixel = 0
		HueBar.Text = ""
		HueBar.AutoButtonColor = false
		HueBar.Parent = PanelFrame

		local HueGrad = Instance.new("UIGradient")
		HueGrad.Rotation = 90
		HueGrad.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
			ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
		})
		HueGrad.Parent = HueBar

		local HueCursor = Instance.new("Frame")
		HueCursor.Size = UDim2.new(1, 4, 0, 4)
		HueCursor.AnchorPoint = Vector2.new(0.5, 0.5)
		HueCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		HueCursor.Parent = HueBar

		local HueCursorStroke = Instance.new("UIStroke")
		HueCursorStroke.Color = Color3.fromRGB(0, 0, 0)
		HueCursorStroke.Thickness = 1
		HueCursorStroke.Parent = HueCursor

		local AlphaBar, AlphaCursor
		if HasAlpha then
			AlphaBar = Instance.new("TextButton")
			AlphaBar.Size = UDim2.new(1, -16, 0, 10)
			AlphaBar.Position = UDim2.new(0, 8, 0, SatValHeight + 16)
			AlphaBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			AlphaBar.BorderSizePixel = 0
			AlphaBar.Text = ""
			AlphaBar.AutoButtonColor = false
			AlphaBar.Parent = PanelFrame

			local AlphaGrad = Instance.new("UIGradient")
			AlphaGrad.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
			})
			AlphaGrad.Parent = AlphaBar

			AlphaCursor = Instance.new("Frame")
			AlphaCursor.Size = UDim2.new(0, 4, 1, 4)
			AlphaCursor.AnchorPoint = Vector2.new(0.5, 0.5)
			AlphaCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			AlphaCursor.Parent = AlphaBar

			local AlphaStroke = Instance.new("UIStroke")
			AlphaStroke.Color = Color3.fromRGB(0, 0, 0)
			AlphaStroke.Thickness = 1
			AlphaStroke.Parent = AlphaCursor
		end

		local BottomRow = Instance.new("Frame")
		BottomRow.Size = UDim2.new(1, -16, 0, 20)
		BottomRow.Position = UDim2.new(0, 8, 1, -26)
		BottomRow.BackgroundTransparency = 1
		BottomRow.Parent = PanelFrame

		local ModeBtn = Instance.new("TextButton")
		ModeBtn.Size = UDim2.new(0, 40, 1, 0)
		ModeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
		ModeBtn.Text = "HEX"
		ModeBtn.TextColor3 = Config.ThemeColor
		ModeBtn.Font = Enum.Font.GothamBold
		ModeBtn.TextSize = 10
		ModeBtn.AutoButtonColor = false
		ModeBtn.Parent = BottomRow
		Instance.new("UICorner", ModeBtn).CornerRadius = UDim.new(0, 4)

		local InputBox = Instance.new("TextBox")
		InputBox.Size = UDim2.new(1, -46, 1, 0)
		InputBox.Position = UDim2.new(0, 46, 0, 0)
		InputBox.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
		InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		InputBox.Font = Enum.Font.Gotham
		InputBox.TextSize = 10
		InputBox.ClearTextOnFocus = false
		InputBox.Parent = BottomRow
		Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 4)

		local Modes = {"HEX", "RGB", "HSV"}
		local ModeIdx = 1
		local IsExpanded = false

		local function FormatText(Col, AlphaVal)
			local CurrentMode = Modes[ModeIdx]
			if CurrentMode == "HEX" then
				local Hex = Col:ToHex():upper()
				return HasAlpha and string.format("#%s (%d%%)", Hex, math.floor(AlphaVal * 100)) or "#" .. Hex
			elseif CurrentMode == "RGB" then
				local R, G, B = math.floor(Col.R * 255), math.floor(Col.G * 255), math.floor(Col.B * 255)
				return HasAlpha and string.format("%d, %d, %d, %.2f", R, G, B, AlphaVal) or string.format("%d, %d, %d", R, G, B)
			elseif CurrentMode == "HSV" then
				local HueVal, SatVal, ValVal = Color3.toHSV(Col)
				return string.format("%d, %d%%, %d%%", math.floor(HueVal * 360), math.floor(SatVal * 100), math.floor(ValVal * 100))
			end
		end

		local function SyncDisplay(SkipCallback)
			local FinalCol = Color3.fromHSV(H, S, V)
			SatValCanvas.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
			
			TweenService:Create(ColorPreviewBtn, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				BackgroundColor3 = FinalCol,
				BackgroundTransparency = 1 - CurrentAlpha
			}):Play()

			Cursor.Position = UDim2.new(S, 0, 1 - V, 0)
			HueCursor.Position = UDim2.new(0.5, 0, H, 0)

			if HasAlpha and AlphaCursor then
				AlphaCursor.Position = UDim2.new(CurrentAlpha, 0, 0.5, 0)
			end

			InputBox.Text = FormatText(FinalCol, CurrentAlpha)

			if Callback and not SkipCallback then Callback(FinalCol, CurrentAlpha) end
		end

		local DraggingSatVal = false
		local DraggingHue = false
		local DraggingAlpha = false

		local function UpdateSatVal(Input)
			local AbsPos = SatValCanvas.AbsolutePosition
			local AbsSize = SatValCanvas.AbsoluteSize
			S = math.clamp((Input.Position.X - AbsPos.X) / AbsSize.X, 0, 1)
			V = 1 - math.clamp((Input.Position.Y - AbsPos.Y) / AbsSize.Y, 0, 1)
			SyncDisplay()
		end

		local function UpdateHue(Input)
			local AbsPos = HueBar.AbsolutePosition
			local AbsSize = HueBar.AbsoluteSize
			H = math.clamp((Input.Position.Y - AbsPos.Y) / AbsSize.Y, 0, 1)
			SyncDisplay()
		end

		local function UpdateAlpha(Input)
			if not HasAlpha or not AlphaBar then return end
			local AbsPos = AlphaBar.AbsolutePosition
			local AbsSize = AlphaBar.AbsoluteSize
			CurrentAlpha = math.clamp((Input.Position.X - AbsPos.X) / AbsSize.X, 0, 1)
			SyncDisplay()
		end

		SatValCanvas.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				DraggingSatVal = true
				UpdateSatVal(Input)
			end
		end)

		HueBar.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				DraggingHue = true
				UpdateHue(Input)
			end
		end)

		if HasAlpha and AlphaBar then
			AlphaBar.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					DraggingAlpha = true
					UpdateAlpha(Input)
				end
			end)
		end

		UserInputService.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
				if DraggingSatVal then
					UpdateSatVal(Input)
				elseif DraggingHue then
					UpdateHue(Input)
				elseif DraggingAlpha then
					UpdateAlpha(Input)
				end
			end
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				DraggingSatVal = false
				DraggingHue = false
				DraggingAlpha = false
			end
		end)

		ModeBtn.MouseButton1Click:Connect(function()
			ModeIdx = ModeIdx % #Modes + 1
			ModeBtn.Text = Modes[ModeIdx]
			InputBox.Text = FormatText(Color3.fromHSV(H, S, V), CurrentAlpha)
		end)

		InputBox.FocusLost:Connect(function()
			local Text = InputBox.Text
			local Mode = Modes[ModeIdx]
			if Mode == "HEX" then
				local HexClean = Text:gsub("#", ""):gsub("%s.*", "")
				local Success, Col = pcall(function() return Color3.fromHex(HexClean) end)
				if Success and Col then H, S, V = Color3.toHSV(Col) end
			elseif Mode == "RGB" then
				local R, G, B = Text:match("(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")
				if R and G and B then
					local Col = Color3.fromRGB(tonumber(R), tonumber(G), tonumber(B))
					H, S, V = Color3.toHSV(Col)
				end
			elseif Mode == "HSV" then
				local HueText, SatText, ValText = Text:match("(%d+)%s*,%s*(%d+)%%%s*,%s*(%d+)%%")
				if HueText and SatText and ValText then
					H = math.clamp(tonumber(HueText) / 360, 0, 1)
					S = math.clamp(tonumber(SatText) / 100, 0, 1)
					V = math.clamp(tonumber(ValText) / 100, 0, 1)
				end
			end
			SyncDisplay()
		end)

		ColorPreviewBtn.MouseButton1Click:Connect(function()
			IsExpanded = not IsExpanded
			PanelFrame.Visible = IsExpanded
			local TargetHeight = IsExpanded and (PanelHeight + 36) or 26
			
			TweenService:Create(MainContainer, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Size = UDim2.new(1, 0, 0, TargetHeight)
			}):Play()

			if OnResizeRequested then
				task.spawn(function()
					local StartTime = tick()
					while tick() - StartTime < Config.TweenTime + 0.05 do
						OnResizeRequested()
						task.wait()
					end
					OnResizeRequested()
				end)
			end
		end)

		SyncDisplay(true)

		return {
			Get = function() 
				local col = Color3.fromHSV(H, S, V)
				return {R = col.R, G = col.G, B = col.B, A = CurrentAlpha}
			end,
			Set = function(NewCol, NewAlpha, SkipCallback)
				if type(NewCol) == "table" then
					NewAlpha = NewCol.A or 1
					NewCol = Color3.new(NewCol.R, NewCol.G, NewCol.B)
				end
				H, S, V = Color3.toHSV(NewCol)
				if NewAlpha then CurrentAlpha = NewAlpha end
				SyncDisplay(SkipCallback)
			end
		}
	end

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = Config.Name .. "GUI"
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.DisplayOrder = 999
	ScreenGui.Parent = GetGuiParent()

	local PanelsList = {}
	local ArePanelsVisible = true
	local CategoryCount = 0

	local function CreateCategory(Name)
		local XPos = 15 + (CategoryCount * (Config.PanelWidth + 12))
		CategoryCount = CategoryCount + 1

		local Panel = Instance.new("Frame")
		Panel.Size = UDim2.new(0, Config.PanelWidth, 0, Config.HeaderHeight)
		Panel.Position = UDim2.new(0, XPos, 0.05, 0)
		Panel.BackgroundColor3 = Config.BackgroundColor
		Panel.BackgroundTransparency = 0.15
		Panel.ClipsDescendants = true
		Panel.Parent = ScreenGui
		table.insert(PanelsList, Panel)

		Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 6)

		local PanelStroke = Instance.new("UIStroke")
		PanelStroke.Color = Color3.fromRGB(35, 35, 45)
		PanelStroke.Thickness = 1
		PanelStroke.Parent = Panel

		local Header = Instance.new("Frame")
		Header.Size = UDim2.new(1, 0, 0, Config.HeaderHeight)
		Header.BackgroundColor3 = Config.HeaderColor
		Header.BackgroundTransparency = 0.1
		Header.Parent = Panel
		Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 6)

		local HeaderTitle = Instance.new("TextLabel")
		HeaderTitle.Size = UDim2.new(1, -12, 1, 0)
		HeaderTitle.Position = UDim2.new(0, 12, 0, 0)
		HeaderTitle.BackgroundTransparency = 1
		HeaderTitle.Text = Name
		HeaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		HeaderTitle.Font = Enum.Font.GothamBold
		HeaderTitle.TextSize = 12
		HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
		HeaderTitle.Parent = Header

		local Content = Instance.new("Frame")
		Content.Size = UDim2.new(1, -16, 0, 0)
		Content.Position = UDim2.new(0, 8, 0, Config.HeaderHeight + 6)
		Content.BackgroundTransparency = 1
		Content.Parent = Panel

		local ListLayout = Instance.new("UIListLayout")
		ListLayout.Padding = UDim.new(0, 4)
		ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ListLayout.Parent = Content

		local IsExpanded = false

		local function UpdatePanelHeight()
			if not IsExpanded then
				Content.Visible = false
				TweenService:Create(Panel, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, Config.PanelWidth, 0, Config.HeaderHeight)
				}):Play()
				return
			end

			Content.Visible = true
			local ContentHeight = ListLayout.AbsoluteContentSize.Y
			TweenService:Create(Panel, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, Config.PanelWidth, 0, Config.HeaderHeight + ContentHeight + 12)
			}):Play()
		end

		Content.Visible = false

		MakeDraggable(Header, Panel, function()
			IsExpanded = not IsExpanded
			UpdatePanelHeight()
		end)

		local ModuleCount = 0

		local function AddModule(Opts)
			local ModName = Opts.Name
			local SettingsTable = Opts.Settings or Opts.SettingsTable
			local ModuleCallback = Opts.Callback
			local ConfigFlag = Opts.Flag
			local IsActionButton = Opts.IsActionButton or false

			local ModFrame = Instance.new("Frame")
			ModFrame.Size = UDim2.new(1, 0, 0, Config.ModuleHeight)
			ModFrame.BackgroundTransparency = 1
			ModFrame.LayoutOrder = ModuleCount
			ModFrame.Parent = Content

			local ModLayout = Instance.new("UIListLayout")
			ModLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ModLayout.Padding = UDim.new(0, 4)
			ModLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			ModLayout.Parent = ModFrame

			local Row = Instance.new("Frame")
			Row.Size = UDim2.new(1, 0, 0, Config.ModuleHeight)
			Row.BackgroundTransparency = 1
			Row.LayoutOrder = 0
			Row.Parent = ModFrame

			local HasSettings = SettingsTable and #SettingsTable > 0

			local ModBtn = Instance.new("TextButton")
			ModBtn.Size = HasSettings and UDim2.new(1, -26, 1, 0) or UDim2.new(1, 0, 1, 0)
			ModBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
			ModBtn.BackgroundTransparency = 0.2
			ModBtn.Text = "  " .. ModName
			ModBtn.TextColor3 = Color3.fromRGB(210, 210, 215)
			ModBtn.TextXAlignment = Enum.TextXAlignment.Left
			ModBtn.Font = Enum.Font.GothamMedium
			ModBtn.TextSize = 11
			ModBtn.AutoButtonColor = false
			ModBtn.Parent = Row
			Instance.new("UICorner", ModBtn).CornerRadius = UDim.new(0, 4)

			local SettingControls = {}
			local SettingsFrame = nil
			local SettingsVisible = false
			local Toggled = false

			local function IsEnabled()
				return Toggled
			end

			local function SetModuleState(State, SkipCallback)
				Toggled = State
				TweenService:Create(ModBtn, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					BackgroundColor3 = Toggled and Config.ThemeColor or Color3.fromRGB(24, 24, 28),
					BackgroundTransparency = Toggled and 0.1 or 0.2
				}):Play()
				ModBtn.TextColor3 = Toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(210, 210, 215)
				if ModuleCallback and not SkipCallback then
					ModuleCallback(Toggled)
				end
			end

			local function RefreshSettingsHeight()
				if not SettingsVisible or not SettingsFrame then return end
				local SettingsHeight = SettingsFrame:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y + 8
				SettingsFrame.Size = UDim2.new(1, 0, 0, SettingsHeight)
				ModFrame.Size = UDim2.new(1, 0, 0, Config.ModuleHeight + SettingsHeight + 4)
				UpdatePanelHeight()
			end

			if HasSettings then
				local GearBtn = Instance.new("TextButton")
				GearBtn.Size = UDim2.new(0, 22, 0, 22)
				GearBtn.AnchorPoint = Vector2.new(0.5, 0.5)
				GearBtn.Position = UDim2.new(1, -11, 0.5, 0)
				GearBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
				GearBtn.BackgroundTransparency = 0.3
				GearBtn.Text = "⚙"
				GearBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
				GearBtn.Font = Enum.Font.GothamBold
				GearBtn.TextSize = 11
				GearBtn.AutoButtonColor = false
				GearBtn.Parent = Row
				Instance.new("UICorner", GearBtn).CornerRadius = UDim.new(0, 4)

				SettingsFrame = Instance.new("Frame")
				SettingsFrame.Size = UDim2.new(1, 0, 0, 0)
				SettingsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
				SettingsFrame.BackgroundTransparency = 0.1
				SettingsFrame.LayoutOrder = 1
				SettingsFrame.Visible = false
				SettingsFrame.Parent = ModFrame
				Instance.new("UICorner", SettingsFrame).CornerRadius = UDim.new(0, 4)

				local SettingsLayout = Instance.new("UIListLayout")
				SettingsLayout.Padding = UDim.new(0, 4)
				SettingsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				SettingsLayout.SortOrder = Enum.SortOrder.LayoutOrder
				SettingsLayout.Parent = SettingsFrame

				local Pad = Instance.new("UIPadding")
				Pad.PaddingTop = UDim.new(0, 4)
				Pad.PaddingBottom = UDim.new(0, 4)
				Pad.PaddingLeft = UDim.new(0, 6)
				Pad.PaddingRight = UDim.new(0, 6)
				Pad.Parent = SettingsFrame

				for _, Setting in ipairs(SettingsTable) do
					local Control
					local OriginalCallback = Setting.Callback

					local ProtectedCallback = function(...)
						if IsEnabled() and OriginalCallback then
							OriginalCallback(...)
						end
					end

					if Setting.Type == "Toggle" then
						Control = CreateToggle(SettingsFrame, Setting.Name, Setting.Default, ProtectedCallback)
					elseif Setting.Type == "Slider" then
						Control = CreateSlider(SettingsFrame, Setting.Name, Setting.Min, Setting.Max, Setting.Default, Setting.Step, Config.ThemeColor, ProtectedCallback)
					elseif Setting.Type == "TextBox" then
						Control = CreateTextBox(SettingsFrame, Setting.Name, Setting.Default, ProtectedCallback, Setting.Placeholder)
					elseif Setting.Type == "Dropdown" then
						Control = CreateDropdown(SettingsFrame, Setting.Name, Setting.Options, Setting.Default, ProtectedCallback, RefreshSettingsHeight)
					elseif Setting.Type == "KeybindToggle" or Setting.Type == "Keybind" then
						Control = CreateKeybind(SettingsFrame, Setting.Name, Setting.Default, ProtectedCallback, function()
							SetModuleState(not Toggled)
						end)
					elseif Setting.Type == "ColorPicker" or Setting.Type == "Color" then
						Control = CreateColorPicker(SettingsFrame, Setting.Name, Setting.Default, ProtectedCallback, Setting.HasAlpha, RefreshSettingsHeight)
					end

					if Control then
						SettingControls[Setting.Name] = Control
						if Setting.Flag then
							FlagRegistry[Setting.Flag] = Control
						end
					end
				end

				GearBtn.MouseButton1Click:Connect(function()
					SettingsVisible = not SettingsVisible
					SettingsFrame.Visible = SettingsVisible

					local TargetRotation = SettingsVisible and 180 or 0
					TweenService:Create(GearBtn, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
						Rotation = TargetRotation
					}):Play()

					if SettingsVisible then
						RefreshSettingsHeight()
					else
						ModFrame.Size = UDim2.new(1, 0, 0, Config.ModuleHeight)
						UpdatePanelHeight()
					end
				end)
			end

			ModBtn.MouseButton1Click:Connect(function()
				if IsActionButton then
					TweenService:Create(ModBtn, TweenInfo.new(0.08, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
						BackgroundColor3 = Config.ThemeColor,
						BackgroundTransparency = 0.1
					}):Play()
					ModBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

					if ModuleCallback then
						ModuleCallback(true)
					end

					task.delay(0.2, function()
						TweenService:Create(ModBtn, TweenInfo.new(Config.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
							BackgroundColor3 = Color3.fromRGB(24, 24, 28),
							BackgroundTransparency = 0.2
						}):Play()
						ModBtn.TextColor3 = Color3.fromRGB(210, 210, 215)
					end)
				else
					SetModuleState(not Toggled)
				end
			end)

			ModuleCount = ModuleCount + 1

			local ModuleAPI = {
				IsEnabled = IsEnabled,
				SetEnabled = SetModuleState,
				GetSetting = function(SName)
					return SettingControls[SName] and SettingControls[SName].Get()
				end,
				SetSetting = function(SName, Value, AlphaVal)
					if SettingControls[SName] then
						SettingControls[SName].Set(Value, AlphaVal, true)
					end
				end,
				Get = IsEnabled,
				Set = function(Val, SkipCallback) SetModuleState(Val, SkipCallback) end
			}

			if ConfigFlag then
				FlagRegistry[ConfigFlag] = ModuleAPI
			end

			return ModuleAPI
		end

		local function AddTextBoxModule(Opts)
			local ModName = Opts.Name
			local Default = Opts.Default
			local Placeholder = Opts.Placeholder
			local Callback = Opts.Callback
			local Flag = Opts.Flag

			local ModFrame = Instance.new("Frame")
			ModFrame.Size = UDim2.new(1, 0, 0, Config.ModuleHeight)
			ModFrame.BackgroundTransparency = 1
			ModFrame.LayoutOrder = ModuleCount
			ModFrame.Parent = Content

			local TextLbl = Instance.new("TextLabel")
			TextLbl.Size = UDim2.new(1, -70, 1, 0)
			TextLbl.Position = UDim2.new(0, 4, 0, 0)
			TextLbl.BackgroundTransparency = 1
			TextLbl.Text = ModName
			TextLbl.TextColor3 = Color3.fromRGB(210, 210, 215)
			TextLbl.Font = Enum.Font.GothamMedium
			TextLbl.TextSize = 11
			TextLbl.TextXAlignment = Enum.TextXAlignment.Left
			TextLbl.Parent = ModFrame

			local Box = Instance.new("TextBox")
			Box.Size = UDim2.new(0, 65, 0, 20)
			Box.Position = UDim2.new(1, -65, 0, 4)
			Box.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
			Box.Text = tostring(Default or "")
			Box.PlaceholderText = Placeholder or ""
			Box.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
			Box.TextColor3 = Color3.fromRGB(255, 255, 255)
			Box.Font = Enum.Font.Gotham
			Box.TextSize = 10
			Box.ClearTextOnFocus = false
			Box.Parent = ModFrame
			Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 4)

			Box.FocusLost:Connect(function()
				if Callback then Callback(Box.Text) end
			end)

			ModuleCount = ModuleCount + 1

			local API = {
				Get = function() return Box.Text end,
				Set = function(Val, SkipCallback)
					Box.Text = tostring(Val)
					if Callback and not SkipCallback then Callback(Box.Text) end
				end
			}

			if Flag then FlagRegistry[Flag] = API end
			return API
		end

		local function AddDropdownModule(Opts)
			local ModName = Opts.Name
			local OptionsList = Opts.Options or {}
			local Default = Opts.Default
			local Callback = Opts.Callback
			local Flag = Opts.Flag

			local ModFrame = Instance.new("Frame")
			ModFrame.Size = UDim2.new(1, 0, 0, Config.ModuleHeight)
			ModFrame.BackgroundTransparency = 1
			ModFrame.LayoutOrder = ModuleCount
			ModFrame.Parent = Content

			local TextLbl = Instance.new("TextLabel")
			TextLbl.Size = UDim2.new(1, -75, 0, Config.ModuleHeight)
			TextLbl.Position = UDim2.new(0, 4, 0, 0)
			TextLbl.BackgroundTransparency = 1
			TextLbl.Text = ModName
			TextLbl.TextColor3 = Color3.fromRGB(210, 210, 215)
			TextLbl.Font = Enum.Font.GothamMedium
			TextLbl.TextSize = 11
			TextLbl.TextXAlignment = Enum.TextXAlignment.Left
			TextLbl.Parent = ModFrame

			local DropBtn = Instance.new("TextButton")
			DropBtn.Size = UDim2.new(0, 70, 0, 20)
			DropBtn.Position = UDim2.new(1, -70, 0, 4)
			DropBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
			DropBtn.Text = Default or (OptionsList[1] or "None")
			DropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropBtn.Font = Enum.Font.GothamMedium
			DropBtn.TextSize = 10
			DropBtn.AutoButtonColor = false
			DropBtn.Parent = ModFrame
			Instance.new("UICorner", DropBtn).CornerRadius = UDim.new(0, 4)

			local SelectedOption = DropBtn.Text
			local IsOpen = false

			local Container = Instance.new("Frame")
			Container.Size = UDim2.new(1, 0, 0, 0)
			Container.Position = UDim2.new(0, 0, 0, Config.ModuleHeight + 2)
			Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
			Container.Visible = false
			Container.ClipsDescendants = true
			Container.Parent = ModFrame
			Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 4)

			local ContainerPad = Instance.new("UIPadding")
			ContainerPad.PaddingTop = UDim.new(0, 4)
			ContainerPad.PaddingBottom = UDim.new(0, 4)
			ContainerPad.PaddingLeft = UDim.new(0, 4)
			ContainerPad.PaddingRight = UDim.new(0, 4)
			ContainerPad.Parent = Container

			local List = Instance.new("UIListLayout")
			List.SortOrder = Enum.SortOrder.LayoutOrder
			List.Padding = UDim.new(0, 3)
			List.Parent = Container

			local function RefreshOptions()
				for _, Child in ipairs(Container:GetChildren()) do
					if Child:IsA("TextButton") then Child:Destroy() end
				end
				for _, Opt in ipairs(OptionsList) do
					local OptBtn = Instance.new("TextButton")
					OptBtn.Size = UDim2.new(1, 0, 0, 18)
					OptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
					OptBtn.Text = Opt
					OptBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
					OptBtn.Font = Enum.Font.Gotham
					OptBtn.TextSize = 10
					OptBtn.Parent = Container
					Instance.new("UICorner", OptBtn).CornerRadius = UDim.new(0, 3)

					OptBtn.MouseButton1Click:Connect(function()
						SelectedOption = Opt
						DropBtn.Text = Opt
						IsOpen = false
						Container.Visible = false
						ModFrame.Size = UDim2.new(1, 0, 0, Config.ModuleHeight)
						UpdatePanelHeight()
						if Callback then Callback(Opt) end
					end)
				end
			end
			RefreshOptions()

			DropBtn.MouseButton1Click:Connect(function()
				IsOpen = not IsOpen
				Container.Visible = IsOpen
				local TargetH = IsOpen and (#OptionsList * 21 + 8) or 0
				Container.Size = UDim2.new(1, 0, 0, TargetH)
				ModFrame.Size = UDim2.new(1, 0, 0, IsOpen and (Config.ModuleHeight + TargetH + 4) or Config.ModuleHeight)
				UpdatePanelHeight()
			end)

			ModuleCount = ModuleCount + 1

			local API = {
				Get = function() return SelectedOption end,
				Set = function(Val, SkipCallback)
					SelectedOption = Val
					DropBtn.Text = Val
					if Callback and not SkipCallback then Callback(Val) end
				end,
				UpdateOptions = function(NewOptions)
					OptionsList = NewOptions
					RefreshOptions()
				end
			}

			if Flag then FlagRegistry[Flag] = API end
			return API
		end

		return { 
			AddModule = AddModule,
			AddTextBoxModule = AddTextBoxModule,
			AddDropdownModule = AddDropdownModule
		}
	end

	local function GetAvailableConfigs()
		local Configs = {}
		if listfiles then
			local Files = listfiles(ConfigFolder)
			for _, Path in ipairs(Files) do
				local FileName = Path:match("[^\\]+$"):match("[^/]+$")
				if FileName and FileName:sub(-5) == ".json" and FileName ~= "AutoloadState.json" then
					table.insert(Configs, FileName:sub(1, -6))
				end
			end
		end
		if #Configs == 0 then table.insert(Configs, "default") end
		return Configs
	end

	local function SaveConfigToFile(ConfigName)
		if not ConfigName or ConfigName == "" then return end
		local SaveData = {}
		for Flag, Control in pairs(FlagRegistry) do
			if Control.Get and Flag ~= "Config_AutoLoad_Enabled" then
				SaveData[Flag] = Control.Get()
			end
		end
		
		local FilePath = ConfigFolder .. "/" .. ConfigName .. ".json"
		local Encoded = HttpService:JSONEncode(SaveData)
		
		if writefile then
			writefile(FilePath, Encoded)
		end
	end

	-- Two-pass load: settings load silently first, then "_Enabled" toggles load
	-- last with SkipCallback tied to their saved value. This makes modules like
	-- Auto Save actually spawn their thread when saved as true, while modules
	-- saved as false stay fully silent and don't run their off-state callback
	-- (which would otherwise touch things like Lighting even though disabled).
	local function LoadConfigFromFile(ConfigName)
		if not ConfigName or ConfigName == "" then return end
		local FilePath = ConfigFolder .. "/" .. ConfigName .. ".json"
		
		if readfile and isfile and isfile(FilePath) then
			local Raw = readfile(FilePath)
			local Success, Decoded = pcall(function() return HttpService:JSONDecode(Raw) end)
			if Success and type(Decoded) == "table" then
				for Flag, Value in pairs(Decoded) do
					if FlagRegistry[Flag] and FlagRegistry[Flag].Set and not Flag:match("_Enabled$") then
						FlagRegistry[Flag].Set(Value, true)
					end
				end
				for Flag, Value in pairs(Decoded) do
					if FlagRegistry[Flag] and FlagRegistry[Flag].Set and Flag:match("_Enabled$") then
						FlagRegistry[Flag].Set(Value, not Value)
					end
				end
				for _, DropdownControl in ipairs(DropdownRegistry) do
					DropdownControl.Set(ConfigName, true)
				end
			end
		end
	end

	local function DeleteConfigFile(ConfigName)
		if not ConfigName or ConfigName == "" then return end
		local FilePath = ConfigFolder .. "/" .. ConfigName .. ".json"
		if delfile and isfile and isfile(FilePath) then
			delfile(FilePath)
		end
	end

	local function SaveAutoLoadState(Enabled, ConfigName)
		if writefile then
			local Data = { Enabled = Enabled, Config = ConfigName }
			writefile(ConfigFolder .. "/AutoloadState.json", HttpService:JSONEncode(Data))
		end
	end

	local function LoadAutoLoadState()
		local FilePath = ConfigFolder .. "/AutoloadState.json"
		if readfile and isfile and isfile(FilePath) then
			local Success, Data = pcall(function() return HttpService:JSONDecode(readfile(FilePath)) end)
			if Success and type(Data) == "table" then
				return Data.Enabled, Data.Config
			end
		end
		return false, "default"
	end

	local function CreateConfigCategory()
		local ConfigCategory = CreateCategory("Configuration")

		local ConfigNameBox = ConfigCategory.AddTextBoxModule({
			Name = "Config Name",
			Default = "",
			Placeholder = "Name..."
		})

		local CreateConfigMod = ConfigCategory.AddModule({
			Name = "Create Config",
			IsActionButton = true,
			Callback = function()
				local Name = ConfigNameBox.Get()
				if Name and Name ~= "" then
					SaveConfigToFile(Name)
					local UpdatedList = GetAvailableConfigs()
					for _, DropdownControl in ipairs(DropdownRegistry) do
						DropdownControl.UpdateOptions(UpdatedList)
						DropdownControl.Set(Name, true)
					end
					ConfigNameBox.Set("")
				end
			end
		})

		local SelectConfigDrop = ConfigCategory.AddDropdownModule({
			Name = "Select Config",
			Options = GetAvailableConfigs(),
			Default = "default",
			Callback = function(SelectedConfig)
				local AutoLoadEnabled = FlagRegistry["Config_AutoLoad_Enabled"] and FlagRegistry["Config_AutoLoad_Enabled"].Get()
				if AutoLoadEnabled then
					SaveAutoLoadState(true, SelectedConfig)
				end
			end
		})
		table.insert(DropdownRegistry, SelectConfigDrop)

		local SaveMod = ConfigCategory.AddModule({
			Name = "Save",
			IsActionButton = true,
			Callback = function()
				local ActiveConfig = SelectConfigDrop.Get()
				SaveConfigToFile(ActiveConfig)
				local AutoLoadEnabled = FlagRegistry["Config_AutoLoad_Enabled"] and FlagRegistry["Config_AutoLoad_Enabled"].Get()
				if AutoLoadEnabled then
					SaveAutoLoadState(true, ActiveConfig)
				end
			end
		})

		local DeleteMod = ConfigCategory.AddModule({
			Name = "Delete",
			IsActionButton = true,
			Callback = function()
				local ActiveConfig = SelectConfigDrop.Get()
				DeleteConfigFile(ActiveConfig)
				local UpdatedList = GetAvailableConfigs()
				for _, DropdownControl in ipairs(DropdownRegistry) do
					DropdownControl.UpdateOptions(UpdatedList)
					DropdownControl.Set(UpdatedList[1] or "default", true)
				end
			end
		})

		local AutoSaveThread = nil
		local AutoSaveMod = ConfigCategory.AddModule({
			Name = "Auto Save",
			Flag = "Config_AutoSave_Enabled",
			Settings = {
				{ Type = "Slider", Name = "Delay (s)", Min = 1, Max = 60, Default = 30, Step = 1, Flag = "Config_AutoSave_Delay" }
			},
			Callback = function(State)
				if State then
					AutoSaveThread = task.spawn(function()
						while true do
							local DelayTime = 30
							if FlagRegistry["Config_AutoSave_Delay"] then
								DelayTime = FlagRegistry["Config_AutoSave_Delay"].Get()
							end
							task.wait(DelayTime)
							local ActiveConfig = SelectConfigDrop.Get()
							SaveConfigToFile(ActiveConfig)
						end
					end)
				else
					if AutoSaveThread then
						task.cancel(AutoSaveThread)
						AutoSaveThread = nil
					end
				end
			end
		})

		local LoadMod = ConfigCategory.AddModule({
			Name = "Load",
			IsActionButton = true,
			Callback = function()
				local ActiveConfig = SelectConfigDrop.Get()
				LoadConfigFromFile(ActiveConfig)
				local AutoLoadEnabled = FlagRegistry["Config_AutoLoad_Enabled"] and FlagRegistry["Config_AutoLoad_Enabled"].Get()
				if AutoLoadEnabled then
					SaveAutoLoadState(true, ActiveConfig)
				end
			end
		})

		local SavedAutoLoadState, SavedAutoLoadConfig = LoadAutoLoadState()

		local AutoLoadMod = ConfigCategory.AddModule({
			Name = "Auto Load",
			Flag = "Config_AutoLoad_Enabled",
			Callback = function(State)
				local ActiveConfig = SelectConfigDrop.Get()
				SaveAutoLoadState(State, ActiveConfig)
				if State then
					LoadConfigFromFile(ActiveConfig)
				end
			end
		})

		if SavedAutoLoadState then
			task.defer(function()
				if AutoLoadMod and AutoLoadMod.Set then
					AutoLoadMod.Set(true, true)
				end
				if SavedAutoLoadConfig and SavedAutoLoadConfig ~= "" then
					for _, DropdownControl in ipairs(DropdownRegistry) do
						DropdownControl.Set(SavedAutoLoadConfig, true)
					end
					LoadConfigFromFile(SavedAutoLoadConfig)
				end
			end)
		end

		return ConfigCategory
	end

	local ToggleBtn = Instance.new("TextButton")
	ToggleBtn.Size = UDim2.new(0, 150, 0, 32)
	ToggleBtn.Position = UDim2.new(1, -165, 0, 15)
	ToggleBtn.BackgroundColor3 = Config.BackgroundColor
	ToggleBtn.BackgroundTransparency = 0.15
	ToggleBtn.Text = "Hide " .. Config.ShowText .. " GUI"
	ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleBtn.Font = Enum.Font.GothamBold
	ToggleBtn.TextSize = 11
	ToggleBtn.AutoButtonColor = false
	ToggleBtn.Parent = ScreenGui
	Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

	local ToggleStroke = Instance.new("UIStroke")
	ToggleStroke.Color = Color3.fromRGB(35, 35, 45)
	ToggleStroke.Thickness = 1
	ToggleStroke.Parent = ToggleBtn

	MakeDraggable(ToggleBtn, ToggleBtn, function()
		ArePanelsVisible = not ArePanelsVisible
		for _, Panel in ipairs(PanelsList) do
			Panel.Visible = ArePanelsVisible
		end
		ToggleBtn.Text = ArePanelsVisible and ("Hide " .. Config.ShowText .. " GUI") or ("Show " .. Config.ShowText .. " GUI")
	end)

	UserInputService.InputBegan:Connect(function(Input, GameProcessed)
		if GameProcessed then return end
		if Input.KeyCode == Config.PanelsKey then
			ArePanelsVisible = not ArePanelsVisible
			for _, Panel in ipairs(PanelsList) do
				Panel.Visible = ArePanelsVisible
			end
			ToggleBtn.Text = ArePanelsVisible and ("Hide " .. Config.ShowText .. " GUI") or ("Show " .. Config.ShowText .. " GUI")
		elseif Input.KeyCode == Config.ToggleKey then
			ScreenGui.Enabled = not ScreenGui.Enabled
		end
	end)

	local ConfigurationCategory = nil
	
    if Options.ConfigCategory == true then
		ConfigurationCategory = CreateConfigCategory()
	end

	return {
		Config = Config,
		FlagRegistry = FlagRegistry,
		DropdownRegistry = DropdownRegistry,
		ScreenGui = ScreenGui,
		Configuration = ConfigurationCategory,
		CreateCategory = CreateCategory,
		CreateConfigCategory = CreateConfigCategory,
		SaveConfigToFile = SaveConfigToFile,
		LoadConfigFromFile = LoadConfigFromFile,
		DeleteConfigFile = DeleteConfigFile,
		GetAvailableConfigs = GetAvailableConfigs,
	}
end


return Library
