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

local function NormalizeKeyName(Key)
	return (tostring(Key):lower():gsub("[^%alnum]", ""))
end

local function Pick(Config, Aliases, DefaultValue)
	if type(Config) ~= "table" then
		return DefaultValue
	end

	local Normalized = {}
	for Key, Value in pairs(Config) do
		Normalized[NormalizeKeyName(Key)] = Value
	end

	for _, Alias in ipairs(Aliases) do
		local Value = Normalized[NormalizeKeyName(Alias)]
		if Value ~= nil then
			return Value
		end
	end

	return DefaultValue
end

local function PickBool(Config, Aliases, DefaultValue)
	local Value = Pick(Config, Aliases, DefaultValue)

	if Value == nil then
		return DefaultValue
	end

	if type(Value) == "boolean" then
		return Value
	end

	if type(Value) == "number" then
		return Value ~= 0
	end

	if type(Value) == "string" then
		local LowerValue = Value:lower()
		return LowerValue == "true" or LowerValue == "yes" or LowerValue == "on" or LowerValue == "1"
	end

	return Value and true or false
end

local function PickNumber(Config, Aliases, DefaultValue)
	local Value = Pick(Config, Aliases, DefaultValue)
	local NumberValue = tonumber(Value)

	if NumberValue == nil then
		return DefaultValue
	end

	return NumberValue
end

local LabelAliases = {"Label", "Name", "Text", "Title"}
local CallbackAliases = {"Callback", "OnChange", "Changed", "OnChanged"}
local DefaultAliases = {"Default", "Value", "DefaultValue", "Start"}
local ToggleDefaultAliases = {"DefaultState", "Default", "Value", "Enabled", "State"}
local FlagAliases = {"Flag", "ID", "Id", "Key"}
local MinAliases = {"Min", "Minimum", "MinValue", "MinimumValue", "Low", "Lower"}
local MaxAliases = {"Max", "Maximum", "MaxValue", "MaximumValue", "High", "Higher"}
local StepAliases = {"Step", "Increment", "StepSize"}
local PlaceholderAliases = {"Placeholder", "PlaceholderText", "Hint"}
local NumericAliases = {"Numeric", "NumericOnly", "NumberOnly", "NumbersOnly", "Number", "Numbers", "DigitOnly", "DigitsOnly"}
local MultiAliases = {"Multi", "MultiSelect", "Multiple", "MultiSelection", "AllowMultiple"}
local OptionsAliases = {"Options", "Items", "Values", "List", "Choices"}
local SettingsAliases = {"Settings", "SettingsTable", "Children", "Controls", "Options"}
local TypeAliases = {"Type", "Kind", "Control", "ControlType"}
local OnResizeAliases = {"OnResizeRequested", "OnResize", "ResizeCallback"}
local KeyAliases = {"DefaultKey", "Key", "Default", "Bind", "Keybind", "KeyCode"}
local ColorAliases = {"DefaultColor", "Color", "Default", "Value"}
local AlphaAliases = {"HasAlpha", "Alpha", "UseAlpha", "AlphaEnabled", "Transparency"}
local ThemeAliases = {"Theme", "ThemeColor", "Color", "AccentColor"}
local CategoryWrapAliases = {"CategoryWrap", "WrapCategories", "Wrap"}
local ToggleButtonPositionAliases = {"ToggleButtonPosition", "TogglePosition", "ButtonPosition"}
local ConfigCategoryAliases = {"ConfigCategory", "ConfigurationCategory", "ConfigSystem", "Configs", "EnableConfig"}

local function MakeDraggable(DragHandle, TargetFrame, OnClickCallback)
	local Dragging = false
	local DragStartInput = nil
	local StartMousePosition = Vector3.zero
	local StartFramePosition = UDim2.new()
	local MovedFarEnough = false
	local DragThreshold = 6

	DragHandle.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStartInput = Input
			StartMousePosition = Input.Position
			StartFramePosition = TargetFrame.Position
			MovedFarEnough = false

			local ChangedConnection, EndedConnection

			ChangedConnection = UserInputService.InputChanged:Connect(function(ChangedInput)
				if ChangedInput == DragStartInput or ChangedInput.UserInputType == Enum.UserInputType.MouseMovement or ChangedInput.UserInputType == Enum.UserInputType.Touch then
					local Delta = ChangedInput.Position - StartMousePosition
					if Delta.Magnitude > DragThreshold then
						MovedFarEnough = true
					end

					if MovedFarEnough then
						TargetFrame.Position = UDim2.new(
							StartFramePosition.X.Scale,
							StartFramePosition.X.Offset + Delta.X,
							StartFramePosition.Y.Scale,
							StartFramePosition.Y.Offset + Delta.Y
						)
					end
				end
			end)

			EndedConnection = UserInputService.InputEnded:Connect(function(EndedInput)
				if EndedInput.UserInputType == Enum.UserInputType.MouseButton1 or EndedInput.UserInputType == Enum.UserInputType.Touch then
					Dragging = false
					ChangedConnection:Disconnect()
					EndedConnection:Disconnect()

					if not MovedFarEnough and OnClickCallback then
						OnClickCallback()
					end
				end
			end)
		end
	end)
end

local Library = {}

function Library.New(Options)
	Options = Options or {}

	local Name = Pick(Options, {"Name", "Title", "GuiName", "LibraryName"}, "MultiPanel UI")
	local ConfigFolder = Pick(Options, {"ConfigFolder", "Folder", "ConfigDirectory", "SaveFolder"}, Name .. "Configs")

	if makefolder and isfolder and not isfolder(ConfigFolder) then
		makefolder(ConfigFolder)
	end

	local Configuration = {
		Name = Name,
		ToggleKey = Pick(Options, {"ToggleKey", "ToggleKeyCode", "HideKey", "GuiKey"}, Enum.KeyCode.RightShift),
		PanelsKey = Pick(Options, {"PanelsKey", "PanelKey", "PanelsToggleKey", "CategoriesKey"}, Enum.KeyCode.H),
		ThemeColor = Pick(Options, ThemeAliases, Color3.fromRGB(0, 150, 255)),
		BackgroundColor = Pick(Options, {"BackgroundColor", "Background", "BackgroundColor3", "BgColor"}, Color3.fromRGB(15, 15, 18)),
		HeaderColor = Pick(Options, {"HeaderColor", "Header", "HeaderBackgroundColor", "TitleColor"}, Color3.fromRGB(24, 24, 28)),
		PanelWidth = PickNumber(Options, {"PanelWidth", "Width", "CategoryWidth", "PanelSize"}, 195),
		HeaderHeight = PickNumber(Options, {"HeaderHeight", "HeaderSize", "TitleHeight"}, 34),
		ModuleHeight = PickNumber(Options, {"ModuleHeight", "ModuleSize", "ButtonHeight"}, 28),
		TweenTime = PickNumber(Options, {"TweenTime", "TweenSpeed", "AnimationTime"}, 0.2),
		CornerRadius = PickNumber(Options, {"CornerRadius", "Radius", "Roundness"}, 6),
		CategoryStartX = PickNumber(Options, {"CategoryStartX", "StartX", "OffsetX"}, 15),
		CategoryStartY = PickNumber(Options, {"CategoryStartY", "StartY", "OffsetY"}, 60),
		CategorySpacing = PickNumber(Options, {"CategorySpacing", "Spacing", "Padding"}, 12),
		CategoryWrap = PickBool(Options, CategoryWrapAliases, true),
		ToggleButtonSize = Pick(Options, {"ToggleButtonSize", "ToggleSize", "ButtonSize"}, UDim2.new(0, 150, 0, 32)),
	}

	local FlagRegistry = {}
	local DropdownRegistry = {}

	local function CreateToggle(Parent, ToggleConfig)
		local Label = Pick(ToggleConfig, LabelAliases, "")
		local DefaultState = PickBool(ToggleConfig, ToggleDefaultAliases, false)
		local Callback = Pick(ToggleConfig, CallbackAliases, nil)

		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Size = UDim2.new(1, -45, 1, 0)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = Label
		TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.TextSize = 11
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Parent = Frame

		local ToggleButton = Instance.new("TextButton")
		ToggleButton.Size = UDim2.new(0, 40, 0, 18)
		ToggleButton.Position = UDim2.new(1, -40, 0, 4)
		ToggleButton.BackgroundColor3 = DefaultState and Configuration.ThemeColor or Color3.fromRGB(35, 35, 42)
		ToggleButton.Text = DefaultState and "ON" or "OFF"
		ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleButton.Font = Enum.Font.GothamBold
		ToggleButton.TextSize = 9
		ToggleButton.AutoButtonColor = false
		ToggleButton.Parent = Frame

		Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 4)

		local Toggled = DefaultState or false

		local function Fire(Value, SkipCallback)
			Toggled = Value
			TweenService:Create(ToggleButton, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				BackgroundColor3 = Toggled and Configuration.ThemeColor or Color3.fromRGB(35, 35, 42)
			}):Play()
			ToggleButton.Text = Toggled and "ON" or "OFF"
			if Callback and not SkipCallback then Callback(Toggled) end
		end

		ToggleButton.MouseButton1Click:Connect(function()
			Fire(not Toggled)
		end)

		return {
			Get = function() return Toggled end,
			Set = function(Value, SkipCallback) Fire(Value and true or false, SkipCallback) end
		}
	end

	local function CreateSlider(Parent, SliderConfig)
		local Label = Pick(SliderConfig, LabelAliases, "")
		local Minimum = PickNumber(SliderConfig, MinAliases, 0)
		local Maximum = PickNumber(SliderConfig, MaxAliases, 100)
		local DefaultValue = PickNumber(SliderConfig, DefaultAliases, Minimum)
		local StepValue = PickNumber(SliderConfig, StepAliases, 0.5)
		local ThemeOverride = Pick(SliderConfig, ThemeAliases, nil)
		local Callback = Pick(SliderConfig, CallbackAliases, nil)

		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 36)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Size = UDim2.new(0.6, 0, 0, 14)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = Label
		TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.TextSize = 11
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Parent = Frame

		local ValueBox = Instance.new("TextBox")
		ValueBox.Size = UDim2.new(0, 45, 0, 16)
		ValueBox.Position = UDim2.new(1, -45, 0, 0)
		ValueBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
		ValueBox.Text = tostring(DefaultValue)
		ValueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueBox.Font = Enum.Font.GothamBold
		ValueBox.TextSize = 10
		ValueBox.ClearTextOnFocus = false
		ValueBox.Parent = Frame
		Instance.new("UICorner", ValueBox).CornerRadius = UDim.new(0, 3)

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
		Fill.BackgroundColor3 = ThemeOverride or Configuration.ThemeColor
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

		local CurrentValue = DefaultValue

		local StepDecimals = 0
		do
			local StepString = tostring(StepValue)
			local DecimalPart = StepString:match("%.(%d+)")
			StepDecimals = DecimalPart and #DecimalPart or 0
		end

		local function UpdateDisplay(DisplayValue)
			ValueBox.Text = string.format("%." .. StepDecimals .. "f", DisplayValue)
			local Alpha = math.clamp((DisplayValue - Minimum) / (Maximum - Minimum), 0, 1)
			TweenService:Create(Fill, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(Alpha, 0, 1, 0)
			}):Play()
			TweenService:Create(Knob, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = UDim2.new(Alpha, -7, 0.5, -7)
			}):Play()
		end

		UpdateDisplay(DefaultValue)

		local function ApplyValue(NewValue, SkipCallback)
			if StepValue > 0 then
				NewValue = math.round(NewValue / StepValue) * StepValue
			end
			CurrentValue = math.clamp(NewValue, Minimum, Maximum)
			UpdateDisplay(CurrentValue)
			if Callback and not SkipCallback then Callback(CurrentValue) end
		end

		local IsDraggingSlider = false

		local function UpdateSliderFromInput(Input)
			local AbsolutePosition = Track.AbsolutePosition
			local AbsoluteSize = Track.AbsoluteSize
			local RelativeX = math.clamp((Input.Position.X - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
			local RawValue = Minimum + RelativeX * (Maximum - Minimum)
			ApplyValue(RawValue)
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

		ValueBox.FocusLost:Connect(function()
			local NumericValue = tonumber(ValueBox.Text)
			if NumericValue then
				ApplyValue(NumericValue)
			else
				UpdateDisplay(CurrentValue)
			end
		end)

		return {
			Get = function() return CurrentValue end,
			Set = function(Value, SkipCallback) ApplyValue(Value, SkipCallback) end
		}
	end

	local function CreateTextBox(Parent, TextBoxConfig)
		local Label = Pick(TextBoxConfig, LabelAliases, "")
		local DefaultValue = Pick(TextBoxConfig, DefaultAliases, "")
		local Callback = Pick(TextBoxConfig, CallbackAliases, nil)
		local PlaceholderText = Pick(TextBoxConfig, PlaceholderAliases, "")
		local NumericOnly = PickBool(TextBoxConfig, NumericAliases, false)

		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Size = UDim2.new(1, -70, 1, 0)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = Label
		TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.TextSize = 11
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Parent = Frame

		local InputBox = Instance.new("TextBox")
		InputBox.Size = UDim2.new(0, 65, 0, 18)
		InputBox.Position = UDim2.new(1, -65, 0, 4)
		InputBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
		InputBox.Text = tostring(DefaultValue or "")
		InputBox.PlaceholderText = PlaceholderText or ""
		InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
		InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		InputBox.Font = Enum.Font.Gotham
		InputBox.TextSize = 10
		InputBox.ClearTextOnFocus = false
		InputBox.Parent = Frame
		Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 4)

		if NumericOnly then
			InputBox:GetPropertyChangedSignal("Text"):Connect(function()
				local FilteredText = InputBox.Text:gsub("[^%d%.%-]", "")
				local DecimalCount = select(2, FilteredText:gsub("%.", ""))
				local MinusCount = select(2, FilteredText:gsub("%-", ""))

				if DecimalCount > 1 then
					FilteredText = FilteredText:match("^(.-)%..*$") .. "." .. FilteredText:match("^.*%.(.+)$"):gsub("%.", "")
				end

				if MinusCount > 1 or (MinusCount == 1 and FilteredText:sub(1,1) ~= "-") then
					FilteredText = FilteredText:gsub("%-", "")
				end

				if FilteredText ~= InputBox.Text then
					InputBox.Text = FilteredText
				end
			end)
		end

		InputBox.FocusLost:Connect(function()
			if Callback then
				if NumericOnly then
					local NumericValue = tonumber(InputBox.Text)
					Callback(NumericValue or 0)
				else
					Callback(InputBox.Text)
				end
			end
		end)

		return {
			Get = function()
				if NumericOnly then return tonumber(InputBox.Text) or 0 end
				return InputBox.Text
			end,
			Set = function(Value, SkipCallback)
				InputBox.Text = tostring(Value)
				if Callback and not SkipCallback then
					if NumericOnly then
						Callback(tonumber(InputBox.Text) or 0)
					else
						Callback(InputBox.Text)
					end
				end
			end
		}
	end

	local function CreateDropdown(Parent, DropdownConfig)
		local Label = Pick(DropdownConfig, LabelAliases, "")
		local OptionsList = Pick(DropdownConfig, OptionsAliases, {})
		local DefaultValue = Pick(DropdownConfig, DefaultAliases, nil)
		local Callback = Pick(DropdownConfig, CallbackAliases, nil)
		local OnResizeRequested = Pick(DropdownConfig, OnResizeAliases, nil)
		local MultiSelect = PickBool(DropdownConfig, MultiAliases, false)

		if type(OptionsList) ~= "table" then
			OptionsList = {}
		end

		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Size = UDim2.new(1, -75, 0, 26)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = Label
		TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.TextSize = 11
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Parent = Frame

		local DropdownButton = Instance.new("TextButton")
		DropdownButton.Size = UDim2.new(0, 70, 0, 18)
		DropdownButton.Position = UDim2.new(1, -70, 0, 4)
		DropdownButton.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
		DropdownButton.Text = (type(DefaultValue) == "string" and DefaultValue) or (OptionsList[1] or "None")
		DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		DropdownButton.Font = Enum.Font.GothamMedium
		DropdownButton.TextSize = 10
		DropdownButton.AutoButtonColor = false
		DropdownButton.Parent = Frame
		Instance.new("UICorner", DropdownButton).CornerRadius = UDim.new(0, 4)

		local SelectedOption = DropdownButton.Text
		local SelectedSet = {}
		local SelectedList = {}
		local OptionButtons = {}
		local IsOpen = false

		local function UpdateMultiText()
			if #SelectedList == 0 then
				DropdownButton.Text = "None"
			elseif #SelectedList == 1 then
				DropdownButton.Text = SelectedList[1]
			else
				DropdownButton.Text = #SelectedList .. " selected"
			end
		end

		if MultiSelect then
			local DefaultList = type(DefaultValue) == "table" and DefaultValue or {}
			for _, Option in ipairs(DefaultList) do
				SelectedSet[Option] = true
				table.insert(SelectedList, Option)
			end
			UpdateMultiText()
		end

		local Container = Instance.new("Frame")
		Container.Size = UDim2.new(1, 0, 0, 0)
		Container.Position = UDim2.new(0, 0, 0, 28)
		Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
		Container.Visible = false
		Container.ClipsDescendants = true
		Container.Parent = Frame
		Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 4)

		local ContainerPadding = Instance.new("UIPadding")
		ContainerPadding.PaddingTop = UDim.new(0, 4)
		ContainerPadding.PaddingBottom = UDim.new(0, 4)
		ContainerPadding.PaddingLeft = UDim.new(0, 4)
		ContainerPadding.PaddingRight = UDim.new(0, 4)
		ContainerPadding.Parent = Container

		local ListLayout = Instance.new("UIListLayout")
		ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ListLayout.Padding = UDim.new(0, 3)
		ListLayout.Parent = Container

		local function RefreshOptions()
			for _, Child in ipairs(Container:GetChildren()) do
				if Child:IsA("TextButton") then Child:Destroy() end
			end

			OptionButtons = {}

			for _, Option in ipairs(OptionsList) do
				local OptionButton = Instance.new("TextButton")
				OptionButton.Size = UDim2.new(1, 0, 0, 18)
				OptionButton.BackgroundColor3 = (MultiSelect and SelectedSet[Option]) and Configuration.ThemeColor or Color3.fromRGB(28, 28, 35)
				OptionButton.Text = Option
				OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
				OptionButton.Font = Enum.Font.Gotham
				OptionButton.TextSize = 10
				OptionButton.Parent = Container
				Instance.new("UICorner", OptionButton).CornerRadius = UDim.new(0, 3)
				OptionButtons[Option] = OptionButton

				OptionButton.MouseButton1Click:Connect(function()
					if MultiSelect then
						if SelectedSet[Option] then
							SelectedSet[Option] = nil
							for Index, Value in ipairs(SelectedList) do
								if Value == Option then
									table.remove(SelectedList, Index)
									break
								end
							end
						else
							SelectedSet[Option] = true
							table.insert(SelectedList, Option)
						end

						OptionButton.BackgroundColor3 = SelectedSet[Option] and Configuration.ThemeColor or Color3.fromRGB(28, 28, 35)
						UpdateMultiText()

						if Callback then
							Callback(SelectedList)
						end
					else
						SelectedOption = Option
						DropdownButton.Text = Option
						IsOpen = false
						Container.Visible = false
						Frame.Size = UDim2.new(1, 0, 0, 26)

						if Callback then
							Callback(Option)
						end

						if OnResizeRequested then
							OnResizeRequested()
						end
					end
				end)
			end
		end

		RefreshOptions()

		DropdownButton.MouseButton1Click:Connect(function()
			IsOpen = not IsOpen
			Container.Visible = IsOpen
			local TargetHeight = IsOpen and (#OptionsList * 21 + 8) or 0
			Container.Size = UDim2.new(1, 0, 0, TargetHeight)
			Frame.Size = UDim2.new(1, 0, 0, IsOpen and (28 + TargetHeight + 4) or 26)

			if OnResizeRequested then
				OnResizeRequested()
			end
		end)

		local API = {
			Get = function()
				if MultiSelect then
					local Copy = {}
					for _, Value in ipairs(SelectedList) do
						table.insert(Copy, Value)
					end
					return Copy
				end
				return SelectedOption
			end,
			Set = function(Value, SkipCallback)
				if MultiSelect then
					SelectedSet = {}
					SelectedList = {}

					for _, Option in ipairs(Value or {}) do
						SelectedSet[Option] = true
						table.insert(SelectedList, Option)
					end

					UpdateMultiText()

					for Option, OptionButton in pairs(OptionButtons) do
						OptionButton.BackgroundColor3 = SelectedSet[Option] and Configuration.ThemeColor or Color3.fromRGB(28, 28, 35)
					end

					if Callback and not SkipCallback then
						Callback(SelectedList)
					end
				else
					SelectedOption = Value
					DropdownButton.Text = Value

					if Callback and not SkipCallback then
						Callback(Value)
					end
				end
			end,
			UpdateOptions = function(NewOptions)
				OptionsList = NewOptions
				RefreshOptions()
			end
		}

		return API
	end

	local function CreateKeybind(Parent, KeybindConfig)
		local Label = Pick(KeybindConfig, LabelAliases, "")
		local DefaultKey = Pick(KeybindConfig, KeyAliases, nil)
		local Callback = Pick(KeybindConfig, CallbackAliases, nil)
		local ToggleParentModule = Pick(KeybindConfig, {"ToggleParentModule", "ToggleParent", "ToggleModule"}, nil)

		if IsTouchDevice then
			return nil
		end

		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 26)
		Frame.BackgroundTransparency = 1
		Frame.Parent = Parent

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Size = UDim2.new(1, -65, 1, 0)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = Label
		TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.TextSize = 11
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Parent = Frame

		local BindButton = Instance.new("TextButton")
		BindButton.Size = UDim2.new(0, 60, 0, 18)
		BindButton.Position = UDim2.new(1, -60, 0, 4)
		BindButton.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
		BindButton.Text = DefaultKey and (typeof(DefaultKey) == "EnumItem" and DefaultKey.Name or tostring(DefaultKey)) or "None"
		BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		BindButton.Font = Enum.Font.GothamMedium
		BindButton.TextSize = 10
		BindButton.AutoButtonColor = false
		BindButton.Parent = Frame
		Instance.new("UICorner", BindButton).CornerRadius = UDim.new(0, 4)

		local BoundKey = nil

		if typeof(DefaultKey) == "EnumItem" then
			BoundKey = DefaultKey
		elseif type(DefaultKey) == "string" then
			local Success, Key = pcall(function()
				return Enum.KeyCode[DefaultKey]
			end)

			if Success and Key then
				BoundKey = Key
			end
		end

		local IsListening = false

		BindButton.MouseButton1Click:Connect(function()
			IsListening = true
			BindButton.Text = "[...]"
			TweenService:Create(BindButton, TweenInfo.new(Configuration.TweenTime), {
				BackgroundColor3 = Configuration.ThemeColor
			}):Play()
		end)

		local InputConnection
		InputConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			if IsListening then
				if Input.UserInputType == Enum.UserInputType.Keyboard then
					IsListening = false
					TweenService:Create(BindButton, TweenInfo.new(Configuration.TweenTime), {
						BackgroundColor3 = Color3.fromRGB(28, 28, 34)
					}):Play()

					if Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.Backspace then
						BoundKey = nil
						BindButton.Text = "None"
					else
						BoundKey = Input.KeyCode
						BindButton.Text = BoundKey.Name
					end

					if Callback then
						Callback(BoundKey)
					end
				end
			elseif BoundKey and Input.KeyCode == BoundKey and not GameProcessed then
				if ToggleParentModule then
					ToggleParentModule()
				end
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

				BindButton.Text = BoundKey and BoundKey.Name or "None"

				if Callback and not SkipCallback then
					Callback(BoundKey)
				end
			end,
			Destroy = function()
				if InputConnection then
					InputConnection:Disconnect()
				end
			end
		}
	end

	local function CreateColorPicker(Parent, ColorPickerConfig)
		local Label = Pick(ColorPickerConfig, LabelAliases, "")
		local RawDefaultColor = Pick(ColorPickerConfig, ColorAliases, Color3.fromRGB(255, 255, 255))
		local Callback = Pick(ColorPickerConfig, CallbackAliases, nil)
		local HasAlpha = PickBool(ColorPickerConfig, AlphaAliases, false)
		local OnResizeRequested = Pick(ColorPickerConfig, OnResizeAliases, nil)

		local DefaultColor = RawDefaultColor
		local CurrentAlpha = 1

		if type(RawDefaultColor) == "table" then
			CurrentAlpha = RawDefaultColor.A or RawDefaultColor.a or 1
			DefaultColor = Color3.new(RawDefaultColor.R or RawDefaultColor.r or 1, RawDefaultColor.G or RawDefaultColor.g or 1, RawDefaultColor.B or RawDefaultColor.b or 1)
		elseif type(RawDefaultColor) == "string" then
			local Success, ParsedColor = pcall(function()
				return Color3.fromHex(RawDefaultColor)
			end)

			if Success and ParsedColor then
				DefaultColor = ParsedColor
			else
				DefaultColor = Color3.fromRGB(255, 255, 255)
			end
		end

		local HueValue, SaturationValue, BrightnessValue = Color3.toHSV(DefaultColor)

		local MainContainer = Instance.new("Frame")
		MainContainer.Size = UDim2.new(1, 0, 0, 26)
		MainContainer.BackgroundTransparency = 1
		MainContainer.Parent = Parent

		local HeaderRow = Instance.new("Frame")
		HeaderRow.Size = UDim2.new(1, 0, 0, 26)
		HeaderRow.BackgroundTransparency = 1
		HeaderRow.Parent = MainContainer

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Size = UDim2.new(1, -30, 1, 0)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = Label
		TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.TextSize = 11
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Parent = HeaderRow

		local PreviewCheckerBackground = Instance.new("Frame")
		PreviewCheckerBackground.Size = UDim2.new(0, 22, 0, 16)
		PreviewCheckerBackground.Position = UDim2.new(1, -22, 0, 5)
		PreviewCheckerBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
		PreviewCheckerBackground.Parent = HeaderRow
		Instance.new("UICorner", PreviewCheckerBackground).CornerRadius = UDim.new(0, 4)

		local CheckerInner = Instance.new("Frame")
		CheckerInner.Size = UDim2.new(0.5, 0, 0.5, 0)
		CheckerInner.Position = UDim2.new(0, 0, 0, 0)
		CheckerInner.BackgroundColor3 = Color3.fromRGB(80, 80, 95)
		CheckerInner.BorderSizePixel = 0
		CheckerInner.Parent = PreviewCheckerBackground

		local CheckerInner2 = Instance.new("Frame")
		CheckerInner2.Size = UDim2.new(0.5, 0, 0.5, 0)
		CheckerInner2.Position = UDim2.new(0.5, 0, 0.5, 0)
		CheckerInner2.BackgroundColor3 = Color3.fromRGB(80, 80, 95)
		CheckerInner2.BorderSizePixel = 0
		CheckerInner2.Parent = PreviewCheckerBackground

		local ColorPreviewButton = Instance.new("TextButton")
		ColorPreviewButton.Size = UDim2.new(1, 0, 1, 0)
		ColorPreviewButton.BackgroundColor3 = DefaultColor
		ColorPreviewButton.Text = ""
		ColorPreviewButton.AutoButtonColor = false
		ColorPreviewButton.Parent = PreviewCheckerBackground
		Instance.new("UICorner", ColorPreviewButton).CornerRadius = UDim.new(0, 4)

		local PreviewStroke = Instance.new("UIStroke")
		PreviewStroke.Color = Color3.fromRGB(80, 80, 100)
		PreviewStroke.Thickness = 1
		PreviewStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		PreviewStroke.Parent = PreviewCheckerBackground

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
		SatValCanvas.BackgroundColor3 = Color3.fromHSV(HueValue, 1, 1)
		SatValCanvas.BorderSizePixel = 0
		SatValCanvas.Text = ""
		SatValCanvas.AutoButtonColor = false
		SatValCanvas.ClipsDescendants = true
		SatValCanvas.Parent = PanelFrame

		local WhiteGradientFrame = Instance.new("Frame")
		WhiteGradientFrame.Size = UDim2.new(1, 0, 1, 0)
		WhiteGradientFrame.BackgroundTransparency = 0
		WhiteGradientFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		WhiteGradientFrame.BorderSizePixel = 0
		WhiteGradientFrame.Parent = SatValCanvas

		local UIGradientWhite = Instance.new("UIGradient")
		UIGradientWhite.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 1)
		})
		UIGradientWhite.Parent = WhiteGradientFrame

		local BlackGradientFrame = Instance.new("Frame")
		BlackGradientFrame.Size = UDim2.new(1, 0, 1, 0)
		BlackGradientFrame.BackgroundTransparency = 0
		BlackGradientFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		BlackGradientFrame.BorderSizePixel = 0
		BlackGradientFrame.Parent = SatValCanvas

		local UIGradientBlack = Instance.new("UIGradient")
		UIGradientBlack.Rotation = 90
		UIGradientBlack.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0)
		})
		UIGradientBlack.Parent = BlackGradientFrame

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

		local HueGradient = Instance.new("UIGradient")
		HueGradient.Rotation = 90
		HueGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
			ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
		})
		HueGradient.Parent = HueBar

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

			local AlphaGradient = Instance.new("UIGradient")
			AlphaGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
			})
			AlphaGradient.Parent = AlphaBar

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

		local ModeButton = Instance.new("TextButton")
		ModeButton.Size = UDim2.new(0, 40, 1, 0)
		ModeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
		ModeButton.Text = "HEX"
		ModeButton.TextColor3 = Configuration.ThemeColor
		ModeButton.Font = Enum.Font.GothamBold
		ModeButton.TextSize = 10
		ModeButton.AutoButtonColor = false
		ModeButton.Parent = BottomRow
		Instance.new("UICorner", ModeButton).CornerRadius = UDim.new(0, 4)

		local ColorInputBox = Instance.new("TextBox")
		ColorInputBox.Size = UDim2.new(1, -46, 1, 0)
		ColorInputBox.Position = UDim2.new(0, 46, 0, 0)
		ColorInputBox.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
		ColorInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		ColorInputBox.Font = Enum.Font.Gotham
		ColorInputBox.TextSize = 10
		ColorInputBox.ClearTextOnFocus = false
		ColorInputBox.Parent = BottomRow
		Instance.new("UICorner", ColorInputBox).CornerRadius = UDim.new(0, 4)

		local Modes = {"HEX", "RGB", "HSV"}
		local ModeIndex = 1
		local IsExpanded = false

		local function FormatText(ColorValue, AlphaValue)
			local CurrentMode = Modes[ModeIndex]

			if CurrentMode == "HEX" then
				local HexString = ColorValue:ToHex():upper()
				return HasAlpha and string.format("#%s (%d%%)", HexString, math.floor(AlphaValue * 100)) or "#" .. HexString
			elseif CurrentMode == "RGB" then
				local RedValue, GreenValue, BlueValue = math.floor(ColorValue.R * 255), math.floor(ColorValue.G * 255), math.floor(ColorValue.B * 255)
				return HasAlpha and string.format("%d, %d, %d, %.2f", RedValue, GreenValue, BlueValue, AlphaValue) or string.format("%d, %d, %d", RedValue, GreenValue, BlueValue)
			elseif CurrentMode == "HSV" then
				local HueText, SaturationText, BrightnessText = Color3.toHSV(ColorValue)
				return string.format("%d, %d%%, %d%%", math.floor(HueText * 360), math.floor(SaturationText * 100), math.floor(BrightnessText * 100))
			end
		end

		local function SyncDisplay(SkipCallback)
			local FinalColor = Color3.fromHSV(HueValue, SaturationValue, BrightnessValue)
			SatValCanvas.BackgroundColor3 = Color3.fromHSV(HueValue, 1, 1)

			TweenService:Create(ColorPreviewButton, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				BackgroundColor3 = FinalColor,
				BackgroundTransparency = 1 - CurrentAlpha
			}):Play()

			Cursor.Position = UDim2.new(SaturationValue, 0, 1 - BrightnessValue, 0)
			HueCursor.Position = UDim2.new(0.5, 0, HueValue, 0)

			if HasAlpha and AlphaCursor then
				AlphaCursor.Position = UDim2.new(CurrentAlpha, 0, 0.5, 0)
			end

			ColorInputBox.Text = FormatText(FinalColor, CurrentAlpha)

			if Callback and not SkipCallback then
				Callback(FinalColor, CurrentAlpha)
			end
		end

		local DraggingSatVal = false
		local DraggingHue = false
		local DraggingAlpha = false

		local function UpdateSatVal(Input)
			local AbsolutePosition = SatValCanvas.AbsolutePosition
			local AbsoluteSize = SatValCanvas.AbsoluteSize
			SaturationValue = math.clamp((Input.Position.X - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
			BrightnessValue = 1 - math.clamp((Input.Position.Y - AbsolutePosition.Y) / AbsoluteSize.Y, 0, 1)
			SyncDisplay()
		end

		local function UpdateHue(Input)
			local AbsolutePosition = HueBar.AbsolutePosition
			local AbsoluteSize = HueBar.AbsoluteSize
			HueValue = math.clamp((Input.Position.Y - AbsolutePosition.Y) / AbsoluteSize.Y, 0, 1)
			SyncDisplay()
		end

		local function UpdateAlpha(Input)
			if not HasAlpha or not AlphaBar then return end
			local AbsolutePosition = AlphaBar.AbsolutePosition
			local AbsoluteSize = AlphaBar.AbsoluteSize
			CurrentAlpha = math.clamp((Input.Position.X - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
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

		ModeButton.MouseButton1Click:Connect(function()
			ModeIndex = ModeIndex % #Modes + 1
			ModeButton.Text = Modes[ModeIndex]
			ColorInputBox.Text = FormatText(Color3.fromHSV(HueValue, SaturationValue, BrightnessValue), CurrentAlpha)
		end)

		ColorInputBox.FocusLost:Connect(function()
			local TextInput = ColorInputBox.Text
			local CurrentMode = Modes[ModeIndex]

			if CurrentMode == "HEX" then
				local HexClean = TextInput:gsub("#", ""):gsub("%s.*", "")
				local Success, ParsedColor = pcall(function() return Color3.fromHex(HexClean) end)
				if Success and ParsedColor then
					HueValue, SaturationValue, BrightnessValue = Color3.toHSV(ParsedColor)
				end
			elseif CurrentMode == "RGB" then
				local RedText, GreenText, BlueText = TextInput:match("(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")
				if RedText and GreenText and BlueText then
					local ParsedColor = Color3.fromRGB(tonumber(RedText), tonumber(GreenText), tonumber(BlueText))
					HueValue, SaturationValue, BrightnessValue = Color3.toHSV(ParsedColor)
				end
			elseif CurrentMode == "HSV" then
				local HueText, SaturationText, BrightnessText = TextInput:match("(%d+)%s*,%s*(%d+)%%%s*,%s*(%d+)%%")
				if HueText and SaturationText and BrightnessText then
					HueValue = math.clamp(tonumber(HueText) / 360, 0, 1)
					SaturationValue = math.clamp(tonumber(SaturationText) / 100, 0, 1)
					BrightnessValue = math.clamp(tonumber(BrightnessText) / 100, 0, 1)
				end
			end

			SyncDisplay()
		end)

		ColorPreviewButton.MouseButton1Click:Connect(function()
			IsExpanded = not IsExpanded
			PanelFrame.Visible = IsExpanded
			local TargetHeight = IsExpanded and (PanelHeight + 36) or 26

			TweenService:Create(MainContainer, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Size = UDim2.new(1, 0, 0, TargetHeight)
			}):Play()

			if OnResizeRequested then
				task.spawn(function()
					local StartTime = tick()
					while tick() - StartTime < Configuration.TweenTime + 0.05 do
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
				local ColorResult = Color3.fromHSV(HueValue, SaturationValue, BrightnessValue)
				return {R = ColorResult.R, G = ColorResult.G, B = ColorResult.B, A = CurrentAlpha}
			end,
			Set = function(NewColor, NewAlpha, SkipCallback)
				if type(NewColor) == "table" then
					NewAlpha = NewColor.A or 1
					NewColor = Color3.new(NewColor.R, NewColor.G, NewColor.B)
				end

				HueValue, SaturationValue, BrightnessValue = Color3.toHSV(NewColor)

				if NewAlpha then
					CurrentAlpha = NewAlpha
				end

				SyncDisplay(SkipCallback)
			end
		}
	end

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = Configuration.Name .. "GUI"
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.DisplayOrder = 999
	ScreenGui.Parent = GetGuiParent()

	local PanelsList = {}
	local ArePanelsVisible = true
	local CategoryX = Configuration.CategoryStartX
	local CategoryY = Configuration.CategoryStartY

	local function CreateCategory(Name)
		local ViewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)

		if Configuration.CategoryWrap and CategoryX + Configuration.PanelWidth > ViewportSize.X - Configuration.CategoryStartX then
			CategoryX = Configuration.CategoryStartX
			CategoryY = CategoryY + Configuration.HeaderHeight + Configuration.CategorySpacing
		end

		local ThisX, ThisY = CategoryX, CategoryY
		CategoryX = CategoryX + Configuration.PanelWidth + Configuration.CategorySpacing

		local Panel = Instance.new("Frame")
		Panel.Size = UDim2.new(0, Configuration.PanelWidth, 0, Configuration.HeaderHeight)
		Panel.Position = UDim2.new(0, ThisX, 0, ThisY)
		Panel.BackgroundColor3 = Configuration.BackgroundColor
		Panel.BackgroundTransparency = 0.15
		Panel.ClipsDescendants = true
		Panel.Parent = ScreenGui
		table.insert(PanelsList, Panel)

		Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, Configuration.CornerRadius)

		local PanelStroke = Instance.new("UIStroke")
		PanelStroke.Color = Color3.fromRGB(35, 35, 45)
		PanelStroke.Thickness = 1
		PanelStroke.Parent = Panel

		local Header = Instance.new("Frame")
		Header.Size = UDim2.new(1, 0, 0, Configuration.HeaderHeight)
		Header.BackgroundColor3 = Configuration.HeaderColor
		Header.BackgroundTransparency = 0.1
		Header.Parent = Panel
		Instance.new("UICorner", Header).CornerRadius = UDim.new(0, Configuration.CornerRadius)

		local HeaderTitle = Instance.new("TextLabel")
		HeaderTitle.Size = UDim2.new(1, -32, 1, 0)
		HeaderTitle.Position = UDim2.new(0, 12, 0, 0)
		HeaderTitle.BackgroundTransparency = 1
		HeaderTitle.Text = Name
		HeaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		HeaderTitle.Font = Enum.Font.GothamBold
		HeaderTitle.TextSize = 12
		HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
		HeaderTitle.Parent = Header

		local ArrowLabel = Instance.new("TextLabel")
		ArrowLabel.Size = UDim2.new(0, 20, 1, 0)
		ArrowLabel.Position = UDim2.new(1, -24, 0, 0)
		ArrowLabel.BackgroundTransparency = 1
		ArrowLabel.Text = ">"
		ArrowLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		ArrowLabel.Font = Enum.Font.GothamBold
		ArrowLabel.TextSize = 13
		ArrowLabel.Rotation = -90
		ArrowLabel.Parent = Header

		local Content = Instance.new("Frame")
		Content.Size = UDim2.new(1, -16, 0, 0)
		Content.Position = UDim2.new(0, 8, 0, Configuration.HeaderHeight + 6)
		Content.BackgroundTransparency = 1
		Content.Parent = Panel

		local ListLayout = Instance.new("UIListLayout")
		ListLayout.Padding = UDim.new(0, 4)
		ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ListLayout.Parent = Content

		local IsExpanded = false

		local function UpdatePanelHeight()
			TweenService:Create(ArrowLabel, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Rotation = IsExpanded and 90 or -90
			}):Play()

			if not IsExpanded then
				Content.Visible = false
				TweenService:Create(Panel, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, Configuration.PanelWidth, 0, Configuration.HeaderHeight)
				}):Play()
				return
			end

			Content.Visible = true
			local ContentHeight = ListLayout.AbsoluteContentSize.Y
			TweenService:Create(Panel, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, Configuration.PanelWidth, 0, Configuration.HeaderHeight + ContentHeight + 12)
			}):Play()
		end

		Content.Visible = false

		MakeDraggable(Header, Panel, function()
			IsExpanded = not IsExpanded
			UpdatePanelHeight()
		end)

		local ModuleCount = 0

		local function AddModule(ModuleOptions)
			local ModuleName = Pick(ModuleOptions, LabelAliases, "Module")
			local SettingsTable = Pick(ModuleOptions, SettingsAliases, nil)
			local ModuleCallback = Pick(ModuleOptions, CallbackAliases, nil)
			local ConfigFlag = Pick(ModuleOptions, FlagAliases, nil)
			local IsActionButton = PickBool(ModuleOptions, {"IsActionButton", "ActionButton", "Button", "Action", "IsButton"}, false)

			local ModuleFrame = Instance.new("Frame")
			ModuleFrame.Size = UDim2.new(1, 0, 0, Configuration.ModuleHeight)
			ModuleFrame.BackgroundTransparency = 1
			ModuleFrame.LayoutOrder = ModuleCount
			ModuleFrame.Parent = Content

			local ModuleLayout = Instance.new("UIListLayout")
			ModuleLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ModuleLayout.Padding = UDim.new(0, 4)
			ModuleLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			ModuleLayout.Parent = ModuleFrame

			local Row = Instance.new("Frame")
			Row.Size = UDim2.new(1, 0, 0, Configuration.ModuleHeight)
			Row.BackgroundTransparency = 1
			Row.LayoutOrder = 0
			Row.Parent = ModuleFrame

			local HasSettings = SettingsTable and type(SettingsTable) == "table" and #SettingsTable > 0

			local ModuleButton = Instance.new("TextButton")
			ModuleButton.Size = HasSettings and UDim2.new(1, -26, 1, 0) or UDim2.new(1, 0, 1, 0)
			ModuleButton.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
			ModuleButton.BackgroundTransparency = 0.2
			ModuleButton.Text = "  " .. ModuleName
			ModuleButton.TextColor3 = Color3.fromRGB(210, 210, 215)
			ModuleButton.TextXAlignment = Enum.TextXAlignment.Left
			ModuleButton.Font = Enum.Font.GothamMedium
			ModuleButton.TextSize = 11
			ModuleButton.AutoButtonColor = false
			ModuleButton.Parent = Row
			Instance.new("UICorner", ModuleButton).CornerRadius = UDim.new(0, 4)

			local SettingControls = {}
			local SettingsFrame = nil
			local SettingsVisible = false
			local Toggled = false

			local function IsEnabled()
				return Toggled
			end

			local function SetModuleState(State, SkipCallback)
				Toggled = State
				TweenService:Create(ModuleButton, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					BackgroundColor3 = Toggled and Configuration.ThemeColor or Color3.fromRGB(24, 24, 28),
					BackgroundTransparency = Toggled and 0.1 or 0.2
				}):Play()
				ModuleButton.TextColor3 = Toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(210, 210, 215)

				if ModuleCallback and not SkipCallback then
					ModuleCallback(Toggled)
				end
			end

			local function RefreshSettingsHeight()
				if not SettingsVisible or not SettingsFrame then return end
				local SettingsHeight = SettingsFrame:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y + 8
				SettingsFrame.Size = UDim2.new(1, 0, 0, SettingsHeight)
				ModuleFrame.Size = UDim2.new(1, 0, 0, Configuration.ModuleHeight + SettingsHeight + 4)
				UpdatePanelHeight()
			end

			if HasSettings then
				local GearButton = Instance.new("TextButton")
				GearButton.Size = UDim2.new(0, 22, 0, 22)
				GearButton.AnchorPoint = Vector2.new(0.5, 0.5)
				GearButton.Position = UDim2.new(1, -11, 0.5, 0)
				GearButton.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
				GearButton.BackgroundTransparency = 0.3
				GearButton.Text = "⚙"
				GearButton.TextColor3 = Color3.fromRGB(200, 200, 200)
				GearButton.Font = Enum.Font.GothamBold
				GearButton.TextSize = 11
				GearButton.AutoButtonColor = false
				GearButton.Parent = Row
				Instance.new("UICorner", GearButton).CornerRadius = UDim.new(0, 4)

				SettingsFrame = Instance.new("Frame")
				SettingsFrame.Size = UDim2.new(1, 0, 0, 0)
				SettingsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
				SettingsFrame.BackgroundTransparency = 0.1
				SettingsFrame.LayoutOrder = 1
				SettingsFrame.Visible = false
				SettingsFrame.Parent = ModuleFrame
				Instance.new("UICorner", SettingsFrame).CornerRadius = UDim.new(0, 4)

				local SettingsLayout = Instance.new("UIListLayout")
				SettingsLayout.Padding = UDim.new(0, 4)
				SettingsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				SettingsLayout.SortOrder = Enum.SortOrder.LayoutOrder
				SettingsLayout.Parent = SettingsFrame

				local Padding = Instance.new("UIPadding")
				Padding.PaddingTop = UDim.new(0, 4)
				Padding.PaddingBottom = UDim.new(0, 4)
				Padding.PaddingLeft = UDim.new(0, 6)
				Padding.PaddingRight = UDim.new(0, 6)
				Padding.Parent = SettingsFrame

				for _, Setting in ipairs(SettingsTable) do
					local Control
					local SettingType = NormalizeKeyName(Pick(Setting, TypeAliases, ""))
					local SettingName = Pick(Setting, LabelAliases, "")
					local SettingFlag = Pick(Setting, FlagAliases, nil)
					local OriginalCallback = Pick(Setting, CallbackAliases, nil)

					local ProtectedCallback = function(...)
						if IsEnabled() and OriginalCallback then
							OriginalCallback(...)
						end
					end

					if SettingType == "toggle" or SettingType == "switch" or SettingType == "bool" or SettingType == "boolean" or SettingType == "checkbox" then
						Control = CreateToggle(SettingsFrame, {
							Label = SettingName,
							Default = Pick(Setting, ToggleDefaultAliases, false),
							Callback = ProtectedCallback
						})
					elseif SettingType == "slider" or SettingType == "slide" or SettingType == "range" or SettingType == "sliderbar" then
						Control = CreateSlider(SettingsFrame, {
							Label = SettingName,
							Min = PickNumber(Setting, MinAliases, 0),
							Max = PickNumber(Setting, MaxAliases, 100),
							Default = PickNumber(Setting, DefaultAliases, 0),
							Step = PickNumber(Setting, StepAliases, 0.5),
							Theme = Pick(Setting, ThemeAliases, Configuration.ThemeColor),
							Callback = ProtectedCallback
						})
					elseif SettingType == "textbox" or SettingType == "text" or SettingType == "input" or SettingType == "box" or SettingType == "string" then
						Control = CreateTextBox(SettingsFrame, {
							Label = SettingName,
							Default = Pick(Setting, DefaultAliases, ""),
							Callback = ProtectedCallback,
							Placeholder = Pick(Setting, PlaceholderAliases, ""),
							Numeric = PickBool(Setting, NumericAliases, false)
						})
					elseif SettingType == "dropdown" or SettingType == "drop" or SettingType == "select" or SettingType == "combobox" or SettingType == "combo" or SettingType == "list" then
						Control = CreateDropdown(SettingsFrame, {
							Label = SettingName,
							Options = Pick(Setting, OptionsAliases, {}),
							Default = Pick(Setting, DefaultAliases, nil),
							Callback = ProtectedCallback,
							OnResizeRequested = RefreshSettingsHeight,
							Multi = PickBool(Setting, MultiAliases, false)
						})
					elseif SettingType == "keybindtoggle" or SettingType == "keybind" or SettingType == "key" or SettingType == "bind" or SettingType == "hotkey" then
						Control = CreateKeybind(SettingsFrame, {
							Label = SettingName,
							DefaultKey = Pick(Setting, KeyAliases, nil),
							Callback = ProtectedCallback,
							ToggleParentModule = function()
								SetModuleState(not Toggled)
							end
						})
					elseif SettingType == "colorpicker" or SettingType == "color" or SettingType == "colour" or SettingType == "colourpicker" then
						Control = CreateColorPicker(SettingsFrame, {
							Label = SettingName,
							DefaultColor = Pick(Setting, ColorAliases, Color3.fromRGB(255, 255, 255)),
							Callback = ProtectedCallback,
							HasAlpha = PickBool(Setting, AlphaAliases, false),
							OnResizeRequested = RefreshSettingsHeight
						})
					end

					if Control then
						SettingControls[SettingName] = Control
						if SettingFlag then
							FlagRegistry[SettingFlag] = Control
						end
					end
				end

				GearButton.MouseButton1Click:Connect(function()
					SettingsVisible = not SettingsVisible
					SettingsFrame.Visible = SettingsVisible

					local TargetRotation = SettingsVisible and 180 or 0
					TweenService:Create(GearButton, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
						Rotation = TargetRotation
					}):Play()

					if SettingsVisible then
						RefreshSettingsHeight()
					else
						ModuleFrame.Size = UDim2.new(1, 0, 0, Configuration.ModuleHeight)
						UpdatePanelHeight()
					end
				end)
			end

			ModuleButton.MouseButton1Click:Connect(function()
				if IsActionButton then
					TweenService:Create(ModuleButton, TweenInfo.new(0.08, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
						BackgroundColor3 = Configuration.ThemeColor,
						BackgroundTransparency = 0.1
					}):Play()
					ModuleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

					if ModuleCallback then
						ModuleCallback(true)
					end

					task.delay(0.2, function()
						TweenService:Create(ModuleButton, TweenInfo.new(Configuration.TweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
							BackgroundColor3 = Color3.fromRGB(24, 24, 28),
							BackgroundTransparency = 0.2
						}):Play()
						ModuleButton.TextColor3 = Color3.fromRGB(210, 210, 215)
					end)
				else
					SetModuleState(not Toggled)
				end
			end)

			ModuleCount = ModuleCount + 1

			local ModuleAPI = {
				IsEnabled = IsEnabled,
				SetEnabled = SetModuleState,
				GetSetting = function(SettingName)
					return SettingControls[SettingName] and SettingControls[SettingName].Get()
				end,
				SetSetting = function(SettingName, Value, AlphaValue)
					if SettingControls[SettingName] then
						SettingControls[SettingName].Set(Value, AlphaValue, true)
					end
				end,
				Get = IsEnabled,
				Set = function(Value, SkipCallback) SetModuleState(Value, SkipCallback) end
			}

			if ConfigFlag then
				FlagRegistry[ConfigFlag] = ModuleAPI
			end

			return ModuleAPI
		end

		local function AddTextBoxModule(ModuleOptions)
			local ModuleName = Pick(ModuleOptions, LabelAliases, "")
			local DefaultValue = Pick(ModuleOptions, DefaultAliases, "")
			local PlaceholderText = Pick(ModuleOptions, PlaceholderAliases, "")
			local Callback = Pick(ModuleOptions, CallbackAliases, nil)
			local Flag = Pick(ModuleOptions, FlagAliases, nil)
			local NumericOnly = PickBool(ModuleOptions, NumericAliases, false)

			local ModuleFrame = Instance.new("Frame")
			ModuleFrame.Size = UDim2.new(1, 0, 0, Configuration.ModuleHeight)
			ModuleFrame.BackgroundTransparency = 1
			ModuleFrame.LayoutOrder = ModuleCount
			ModuleFrame.Parent = Content

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Size = UDim2.new(1, -70, 1, 0)
			TextLabel.Position = UDim2.new(0, 4, 0, 0)
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = ModuleName
			TextLabel.TextColor3 = Color3.fromRGB(210, 210, 215)
			TextLabel.Font = Enum.Font.GothamMedium
			TextLabel.TextSize = 11
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.Parent = ModuleFrame

			local InputBox = Instance.new("TextBox")
			InputBox.Size = UDim2.new(0, 65, 0, 20)
			InputBox.Position = UDim2.new(1, -65, 0, 4)
			InputBox.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
			InputBox.Text = tostring(DefaultValue or "")
			InputBox.PlaceholderText = PlaceholderText or ""
			InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
			InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			InputBox.Font = Enum.Font.Gotham
			InputBox.TextSize = 10
			InputBox.ClearTextOnFocus = false
			InputBox.Parent = ModuleFrame
			Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 4)

			if NumericOnly then
				InputBox:GetPropertyChangedSignal("Text"):Connect(function()
					local FilteredText = InputBox.Text:gsub("[^%d%.%-]", "")
					local DecimalCount = select(2, FilteredText:gsub("%.", ""))
					local MinusCount = select(2, FilteredText:gsub("%-", ""))

					if DecimalCount > 1 then
						FilteredText = FilteredText:match("^(.-)%..*$") .. "." .. FilteredText:match("^.*%.(.+)$"):gsub("%.", "")
					end

					if MinusCount > 1 or (MinusCount == 1 and FilteredText:sub(1,1) ~= "-") then
						FilteredText = FilteredText:gsub("%-", "")
					end

					if FilteredText ~= InputBox.Text then
						InputBox.Text = FilteredText
					end
				end)
			end

			InputBox.FocusLost:Connect(function()
				if Callback then
					if NumericOnly then
						Callback(tonumber(InputBox.Text) or 0)
					else
						Callback(InputBox.Text)
					end
				end
			end)

			ModuleCount = ModuleCount + 1

			local API = {
				Get = function()
					if NumericOnly then return tonumber(InputBox.Text) or 0 end
					return InputBox.Text
				end,
				Set = function(Value, SkipCallback)
					InputBox.Text = tostring(Value)
					if Callback and not SkipCallback then
						if NumericOnly then
							Callback(tonumber(InputBox.Text) or 0)
						else
							Callback(InputBox.Text)
						end
					end
				end
			}

			if Flag then
				FlagRegistry[Flag] = API
			end

			return API
		end

		local function AddDropdownModule(ModuleOptions)
			local ModuleName = Pick(ModuleOptions, LabelAliases, "")
			local OptionsList = Pick(ModuleOptions, OptionsAliases, {})
			local DefaultValue = Pick(ModuleOptions, DefaultAliases, nil)
			local Callback = Pick(ModuleOptions, CallbackAliases, nil)
			local Flag = Pick(ModuleOptions, FlagAliases, nil)
			local MultiSelect = PickBool(ModuleOptions, MultiAliases, false)

			if type(OptionsList) ~= "table" then
				OptionsList = {}
			end

			local ModuleFrame = Instance.new("Frame")
			ModuleFrame.Size = UDim2.new(1, 0, 0, Configuration.ModuleHeight)
			ModuleFrame.BackgroundTransparency = 1
			ModuleFrame.LayoutOrder = ModuleCount
			ModuleFrame.Parent = Content

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Size = UDim2.new(1, -75, 0, Configuration.ModuleHeight)
			TextLabel.Position = UDim2.new(0, 4, 0, 0)
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = ModuleName
			TextLabel.TextColor3 = Color3.fromRGB(210, 210, 215)
			TextLabel.Font = Enum.Font.GothamMedium
			TextLabel.TextSize = 11
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.Parent = ModuleFrame

			local DropdownButton = Instance.new("TextButton")
			DropdownButton.Size = UDim2.new(0, 70, 0, 20)
			DropdownButton.Position = UDim2.new(1, -70, 0, 4)
			DropdownButton.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
			DropdownButton.Text = (type(DefaultValue) == "string" and DefaultValue) or (OptionsList[1] or "None")
			DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownButton.Font = Enum.Font.GothamMedium
			DropdownButton.TextSize = 10
			DropdownButton.AutoButtonColor = false
			DropdownButton.Parent = ModuleFrame
			Instance.new("UICorner", DropdownButton).CornerRadius = UDim.new(0, 4)

			local SelectedOption = DropdownButton.Text
			local SelectedSet = {}
			local SelectedList = {}
			local OptionButtons = {}
			local IsOpen = false

			local function UpdateMultiText()
				if #SelectedList == 0 then
					DropdownButton.Text = "None"
				elseif #SelectedList == 1 then
					DropdownButton.Text = SelectedList[1]
				else
					DropdownButton.Text = #SelectedList .. " selected"
				end
			end

			if MultiSelect then
				local DefaultList = type(DefaultValue) == "table" and DefaultValue or {}
				for _, Option in ipairs(DefaultList) do
					SelectedSet[Option] = true
					table.insert(SelectedList, Option)
				end
				UpdateMultiText()
			end

			local Container = Instance.new("Frame")
			Container.Size = UDim2.new(1, 0, 0, 0)
			Container.Position = UDim2.new(0, 0, 0, Configuration.ModuleHeight + 2)
			Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
			Container.Visible = false
			Container.ClipsDescendants = true
			Container.Parent = ModuleFrame
			Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 4)

			local ContainerPadding = Instance.new("UIPadding")
			ContainerPadding.PaddingTop = UDim.new(0, 4)
			ContainerPadding.PaddingBottom = UDim.new(0, 4)
			ContainerPadding.PaddingLeft = UDim.new(0, 4)
			ContainerPadding.PaddingRight = UDim.new(0, 4)
			ContainerPadding.Parent = Container

			local ListLayout = Instance.new("UIListLayout")
			ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ListLayout.Padding = UDim.new(0, 3)
			ListLayout.Parent = Container

			local function RefreshOptions()
				for _, Child in ipairs(Container:GetChildren()) do
					if Child:IsA("TextButton") then Child:Destroy() end
				end

				OptionButtons = {}

				for _, Option in ipairs(OptionsList) do
					local OptionButton = Instance.new("TextButton")
					OptionButton.Size = UDim2.new(1, 0, 0, 18)
					OptionButton.BackgroundColor3 = (MultiSelect and SelectedSet[Option]) and Configuration.ThemeColor or Color3.fromRGB(28, 28, 35)
					OptionButton.Text = Option
					OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
					OptionButton.Font = Enum.Font.Gotham
					OptionButton.TextSize = 10
					OptionButton.Parent = Container
					Instance.new("UICorner", OptionButton).CornerRadius = UDim.new(0, 3)
					OptionButtons[Option] = OptionButton

					OptionButton.MouseButton1Click:Connect(function()
						if MultiSelect then
							if SelectedSet[Option] then
								SelectedSet[Option] = nil
								for Index, Value in ipairs(SelectedList) do
									if Value == Option then
										table.remove(SelectedList, Index)
										break
									end
								end
							else
								SelectedSet[Option] = true
								table.insert(SelectedList, Option)
							end

							OptionButton.BackgroundColor3 = SelectedSet[Option] and Configuration.ThemeColor or Color3.fromRGB(28, 28, 35)
							UpdateMultiText()

							if Callback then
								Callback(SelectedList)
							end
						else
							SelectedOption = Option
							DropdownButton.Text = Option
							IsOpen = false
							Container.Visible = false
							ModuleFrame.Size = UDim2.new(1, 0, 0, Configuration.ModuleHeight)
							UpdatePanelHeight()

							if Callback then
								Callback(Option)
							end
						end
					end)
				end
			end

			RefreshOptions()

			DropdownButton.MouseButton1Click:Connect(function()
				IsOpen = not IsOpen
				Container.Visible = IsOpen
				local TargetHeight = IsOpen and (#OptionsList * 21 + 8) or 0
				Container.Size = UDim2.new(1, 0, 0, TargetHeight)
				ModuleFrame.Size = UDim2.new(1, 0, 0, IsOpen and (Configuration.ModuleHeight + TargetHeight + 4) or Configuration.ModuleHeight)
				UpdatePanelHeight()
			end)

			ModuleCount = ModuleCount + 1

			local API = {
				Get = function()
					if MultiSelect then
						local Copy = {}
						for _, Value in ipairs(SelectedList) do
							table.insert(Copy, Value)
						end
						return Copy
					end
					return SelectedOption
				end,
				Set = function(Value, SkipCallback)
					if MultiSelect then
						SelectedSet = {}
						SelectedList = {}

						for _, Option in ipairs(Value or {}) do
							SelectedSet[Option] = true
							table.insert(SelectedList, Option)
						end

						UpdateMultiText()

						for Option, OptionButton in pairs(OptionButtons) do
							OptionButton.BackgroundColor3 = SelectedSet[Option] and Configuration.ThemeColor or Color3.fromRGB(28, 28, 35)
						end

						if Callback and not SkipCallback then
							Callback(SelectedList)
						end
					else
						SelectedOption = Value
						DropdownButton.Text = Value

						if Callback and not SkipCallback then
							Callback(Value)
						end
					end
				end,
				UpdateOptions = function(NewOptions)
					OptionsList = NewOptions
					RefreshOptions()
				end
			}

			if Flag then
				FlagRegistry[Flag] = API
			end

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

		if #Configs == 0 then
			table.insert(Configs, "default")
		end

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

	local DefaultTogglePosition

	if IsTouchDevice then
		DefaultTogglePosition = UDim2.new(1, -Configuration.CategoryStartX - Configuration.ToggleButtonSize.X.Offset, 0, 15)
	else
		DefaultTogglePosition = UDim2.new(0, Configuration.CategoryStartX, 0, 15)
	end

	local ToggleButton = Instance.new("TextButton")
	ToggleButton.Size = Configuration.ToggleButtonSize
	ToggleButton.Position = Pick(Options, ToggleButtonPositionAliases, DefaultTogglePosition)
	ToggleButton.BackgroundColor3 = Configuration.BackgroundColor
	ToggleButton.BackgroundTransparency = 0.15
	ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.Font = Enum.Font.GothamBold
	ToggleButton.TextSize = 11
	ToggleButton.AutoButtonColor = false
	ToggleButton.Parent = ScreenGui
	Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, Configuration.CornerRadius)

	local ToggleStroke = Instance.new("UIStroke")
	ToggleStroke.Color = Color3.fromRGB(35, 35, 45)
	ToggleStroke.Thickness = 1
	ToggleStroke.Parent = ToggleButton

	local function UpdateToggleText()
		ToggleButton.Text = (ArePanelsVisible and "Hide " or "Show ") .. Configuration.Name
	end

	UpdateToggleText()

	MakeDraggable(ToggleButton, ToggleButton, function()
		ArePanelsVisible = not ArePanelsVisible
		for _, Panel in ipairs(PanelsList) do
			Panel.Visible = ArePanelsVisible
		end
		UpdateToggleText()
	end)

	UserInputService.InputBegan:Connect(function(Input, GameProcessed)
		if GameProcessed then return end

		if Input.KeyCode == Configuration.PanelsKey then
			ArePanelsVisible = not ArePanelsVisible
			for _, Panel in ipairs(PanelsList) do
				Panel.Visible = ArePanelsVisible
			end
			UpdateToggleText()
		elseif Input.KeyCode == Configuration.ToggleKey then
			ScreenGui.Enabled = not ScreenGui.Enabled
		end
	end)

	local ConfigurationCategory = nil

	if PickBool(Options, ConfigCategoryAliases, false) then
		ConfigurationCategory = CreateConfigCategory()
	end

	return {
		Config = Configuration,
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
