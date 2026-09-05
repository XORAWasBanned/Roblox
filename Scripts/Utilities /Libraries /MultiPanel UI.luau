local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local IsTouchDevice = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local Library = {}

local function MakeSetting(Type, Name, Default, Extra)
    local Setting = Extra and table.clone(Extra) or {}
    Setting.Type = Type
    Setting.Name = Name
    Setting.Default = Default
    return Setting
end

function Library.Toggle(Name, Default, Callback, Flag)
    return MakeSetting("Toggle", Name, Default, {
        Callback = Callback,
        Flag = Flag
    })
end

function Library.Slider(Name, Min, Max, Default, Step, Callback, Flag)
    return MakeSetting("Slider", Name, Default, {
        Min = Min,
        Max = Max,
        Step = Step or 1,
        Callback = Callback,
        Flag = Flag
    })
end

function Library.Dropdown(Name, Options, Default, Multi, Callback, Flag)
    return MakeSetting("Dropdown", Name, Default, {
        Options = Options,
        Multi = Multi == true,
        Callback = Callback,
        Flag = Flag
    })
end

function Library.TextBox(Name, Default, Placeholder, Numeric, Callback, Flag)
    return MakeSetting("TextBox", Name, Default, {
        Placeholder = Placeholder,
        Numeric = Numeric == true,
        Callback = Callback,
        Flag = Flag
    })
end

function Library.Keybind(Name, Default, Callback, Flag)
    return MakeSetting("Keybind", Name, Default, {
        Callback = Callback,
        Flag = Flag
    })
end

function Library.ColorPicker(Name, Default, Alpha, Callback, Flag)
    return MakeSetting("ColorPicker", Name, Default, {
        Alpha = Alpha == true,
        Callback = Callback,
        Flag = Flag
    })
end


local Defaults = {
    Theme = Color3.fromRGB(0, 150, 255),
    Background = Color3.fromRGB(15, 15, 18),
    Header = Color3.fromRGB(24, 24, 28),
    PanelWidth = 195,
    HeaderHeight = 34,
    ModuleHeight = 28,
    TweenTime = 0.2,
    CornerRadius = 6,
    CategoryStartX = 15,
    CategoryStartY = 60,
    CategorySpacing = 12,
    WrapCategories = true,
    ToggleButtonSize = UDim2.new(0, 150, 0, 32),
    ToggleKey = Enum.KeyCode.RightShift,
    PanelsKey = Enum.KeyCode.H
}

local function GetGuiParent()
    if gethui and type(gethui) == "function" then
        local Success, Result = pcall(gethui)
        if Success and Result then
            return Result
        end
    end
    return game:GetService("CoreGui")
end

local function Tween(Object, Time, Properties)
    return TweenService:Create(Object, TweenInfo.new(
        Time,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    ), Properties)
end

local function Corner(Object, Radius)
    local Instance = Instance.new("UICorner")
    Instance.CornerRadius = UDim.new(0, Radius or 4)
    Instance.Parent = Object
    return Instance
end

local function Stroke(Object, Color, Thickness)
    local Instance = Instance.new("UIStroke")
    Instance.Color = Color
    Instance.Thickness = Thickness or 1
    Instance.Parent = Object
    return Instance
end

local function MakeDraggable(Handle, Target, OnClick)
    local Dragging = false
    local Moved = false
    local StartInput
    local StartMouse
    local StartPosition
    local ChangedConnection
    local EndedConnection

    Handle.InputBegan:Connect(function(Input)
        if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        Dragging = true
        Moved = false
        StartInput = Input
        StartMouse = Input.Position
        StartPosition = Target.Position

        ChangedConnection = UserInputService.InputChanged:Connect(function(Changed)
            if not Dragging then
                return
            end

            if Changed ~= StartInput
                and Changed.UserInputType ~= Enum.UserInputType.MouseMovement
                and Changed.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            local Delta = Changed.Position - StartMouse
            if Delta.Magnitude > 6 then
                Moved = true
            end

            if Moved then
                Target.Position = UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            end
        end)

        EndedConnection = UserInputService.InputEnded:Connect(function(Ended)
            if Ended.UserInputType ~= Enum.UserInputType.MouseButton1
                and Ended.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            Dragging = false

            if ChangedConnection then
                ChangedConnection:Disconnect()
            end

            if EndedConnection then
                EndedConnection:Disconnect()
            end

            if not Moved and OnClick then
                OnClick()
            end
        end)
    end)
end

local function NormalizeNumber(Value, Minimum, Maximum, Step)
    Value = tonumber(Value) or Minimum

    if Step and Step > 0 then
        Value = math.round(Value / Step) * Step
    end

    return math.clamp(Value, Minimum, Maximum)
end

local function GetStepDecimals(Step)
    local Text = tostring(Step)
    local Decimal = Text:match("%.(%d+)")
    return Decimal and #Decimal or 0
end

local function ParseKey(Key)
    if typeof(Key) == "EnumItem" then
        return Key
    end

    if type(Key) == "string" then
        local Success, Result = pcall(function()
            return Enum.KeyCode[Key]
        end)

        if Success then
            return Result
        end
    end
end

local function ParseColor(Value)
    if typeof(Value) == "Color3" then
        return Value, 1
    end

    if type(Value) == "string" then
        local Success, Result = pcall(function()
            return Color3.fromHex(Value:gsub("#", ""))
        end)

        if Success then
            return Result, 1
        end
    end

    if type(Value) == "table" then
        local R = Value.R or Value.r
        local G = Value.G or Value.g
        local B = Value.B or Value.b
        local A = Value.A or Value.a or 1

        if R and G and B then
            return Color3.new(R, G, B), math.clamp(A, 0, 1)
        end
    end

    return Color3.fromRGB(255, 255, 255), 1
end

local function NewControl(Label)
    return {
        Name = Label,
        Get = function()
            return nil
        end,
        Set = function()
        end
    }
end

local function CreateToggle(Parent, Config, Theme)
    local Control = NewControl(Config.Name)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 26)
    Frame.BackgroundTransparency = 1
    Frame.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -45, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Config.Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 40, 0, 18)
    Button.Position = UDim2.new(1, -40, 0, 4)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 9
    Button.AutoButtonColor = false
    Button.Parent = Frame
    Corner(Button)

    local Value = Config.Default == true

    local function Apply(NewValue, SkipCallback)
        Value = NewValue == true
        Button.Text = Value and "ON" or "OFF"

        Tween(Button, Theme.TweenTime, {
            BackgroundColor3 = Value and Theme.Color or Color3.fromRGB(35, 35, 42)
        }):Play()

        if Config.Callback and not SkipCallback then
            Config.Callback(Value)
        end
    end

    Apply(Value, true)

    Button.MouseButton1Click:Connect(function()
        Apply(not Value)
    end)

    Control.Get = function()
        return Value
    end

    Control.Set = Apply

    return Control
end

local function CreateSlider(Parent, Config, Theme)
    local Control = NewControl(Config.Name)

    local Minimum = tonumber(Config.Min) or 0
    local Maximum = tonumber(Config.Max) or 100
    local Step = tonumber(Config.Step) or 0.5
    local Value = NormalizeNumber(Config.Default or Minimum, Minimum, Maximum, Step)
    local Decimals = GetStepDecimals(Step)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 36)
    Frame.BackgroundTransparency = 1
    Frame.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 14)
    Label.BackgroundTransparency = 1
    Label.Text = Config.Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local ValueBox = Instance.new("TextBox")
    ValueBox.Size = UDim2.new(0, 45, 0, 16)
    ValueBox.Position = UDim2.new(1, -45, 0, 0)
    ValueBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    ValueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    ValueBox.Font = Enum.Font.GothamBold
    ValueBox.TextSize = 10
    ValueBox.ClearTextOnFocus = false
    ValueBox.Parent = Frame
    Corner(ValueBox, 3)

    local TrackArea = Instance.new("TextButton")
    TrackArea.Size = UDim2.new(1, 0, 0, 18)
    TrackArea.Position = UDim2.new(0, 0, 0, 18)
    TrackArea.BackgroundTransparency = 1
    TrackArea.Text = ""
    TrackArea.AutoButtonColor = false
    TrackArea.Parent = Frame

    local Track = Instance.new("Frame")
    Track.Size = UDim2.new(1, 0, 0, 6)
    Track.Position = UDim2.new(0, 0, 0.5, -3)
    Track.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    Track.Parent = TrackArea
    Corner(Track, 3)

    local Fill = Instance.new("Frame")
    Fill.BackgroundColor3 = Config.Theme or Theme.Color
    Fill.Parent = Track
    Corner(Fill, 3)

    local Knob = Instance.new("TextButton")
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.AnchorPoint = Vector2.new(0.5, 0.5)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.Text = ""
    Knob.AutoButtonColor = false
    Knob.Parent = Track
    Corner(Knob, 7)
    Stroke(Knob, Color3.fromRGB(40, 40, 50), 1.5)

    local function UpdateDisplay()
        local Alpha = math.clamp((Value - Minimum) / (Maximum - Minimum), 0, 1)
        ValueBox.Text = string.format("%." .. Decimals .. "f", Value)

        Tween(Fill, 0.1, {
            Size = UDim2.new(Alpha, 0, 1, 0)
        }):Play()

        Tween(Knob, 0.1, {
            Position = UDim2.new(Alpha, 0, 0.5, 0)
        }):Play()
    end

    local function Apply(NewValue, SkipCallback)
        Value = NormalizeNumber(NewValue, Minimum, Maximum, Step)
        UpdateDisplay()

        if Config.Callback and not SkipCallback then
            Config.Callback(Value)
        end
    end

    local Dragging = false

    local function UpdateFromInput(Input)
        local Position = Track.AbsolutePosition
        local Size = Track.AbsoluteSize
        local Alpha = math.clamp((Input.Position.X - Position.X) / Size.X, 0, 1)
        Apply(Minimum + Alpha * (Maximum - Minimum))
    end

    local function BeginDrag(Input)
        Dragging = true
        UpdateFromInput(Input)
    end

    TrackArea.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch then
            BeginDrag(Input)
        end
    end)

    Knob.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch then
            BeginDrag(Input)
        end
    end)

    UserInputService.InputChanged:Connect(function(Input)
        if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement
            or Input.UserInputType == Enum.UserInputType.Touch) then
            UpdateFromInput(Input)
        end
    end)

    UserInputService.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch then
            Dragging = false
        end
    end)

    ValueBox.FocusLost:Connect(function()
        local Number = tonumber(ValueBox.Text)
        if Number then
            Apply(Number)
        else
            UpdateDisplay()
        end
    end)

    Control.Get = function()
        return Value
    end

    Control.Set = Apply

    Apply(Value, true)

    return Control
end

local function CreateTextBox(Parent, Config)
    local Control = NewControl(Config.Name)
    local Value = tostring(Config.Default or "")

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 26)
    Frame.BackgroundTransparency = 1
    Frame.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Config.Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Box = Instance.new("TextBox")
    Box.Size = UDim2.new(0, 65, 0, 18)
    Box.Position = UDim2.new(1, -65, 0, 4)
    Box.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Box.Text = Value
    Box.PlaceholderText = Config.Placeholder or ""
    Box.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 10
    Box.ClearTextOnFocus = false
    Box.Parent = Frame
    Corner(Box)

    if Config.Numeric then
        Box:GetPropertyChangedSignal("Text"):Connect(function()
            local Text = Box.Text:gsub("[^%d%.%-]", "")
            local Dots = select(2, Text:gsub("%.", ""))
            local Minuses = select(2, Text:gsub("%-", ""))

            if Dots > 1 then
                local First, Rest = Text:match("^(.-)%.(.*)$")
                Text = First .. "." .. Rest:gsub("%.", "")
            end

            if Minuses > 1 or (Minuses == 1 and Text:sub(1, 1) ~= "-") then
                Text = Text:gsub("%-", "")
            end

            if Text ~= Box.Text then
                Box.Text = Text
            end
        end)
    end

    local function Apply(NewValue, SkipCallback)
        Value = Config.Numeric and tonumber(NewValue) or tostring(NewValue or "")
        Box.Text = tostring(Value)

        if Config.Callback and not SkipCallback then
            Config.Callback(Config.Numeric and (tonumber(Value) or 0) or Value)
        end
    end

    Box.FocusLost:Connect(function()
        Apply(Box.Text)
    end)

    Control.Get = function()
        return Config.Numeric and (tonumber(Box.Text) or 0) or Box.Text
    end

    Control.Set = Apply

    return Control
end

local function CreateDropdown(Parent, Config, Theme, Resize)
    local Control = NewControl(Config.Name)

    local Options = Config.Options or {}
    local Multi = Config.Multi == true
    local Selected = {}
    local SelectedSet = {}
    local Current = Config.Default

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, Theme.ModuleHeight)
    Frame.BackgroundTransparency = 1
    Frame.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -75, 0, Theme.ModuleHeight)
    Label.BackgroundTransparency = 1
    Label.Text = Config.Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 70, 0, 20)
    Button.Position = UDim2.new(1, -70, 0, 4)
    Button.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamMedium
    Button.TextSize = 10
    Button.AutoButtonColor = false
    Button.Parent = Frame
    Corner(Button)

    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 0)
    Container.Position = UDim2.new(0, 0, 0, Theme.ModuleHeight + 2)
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Container.Visible = false
    Container.ClipsDescendants = true
    Container.Parent = Frame
    Corner(Container)

    local Padding = Instance.new("UIPadding")
    Padding.PaddingTop = UDim.new(0, 4)
    Padding.PaddingBottom = UDim.new(0, 4)
    Padding.PaddingLeft = UDim.new(0, 4)
    Padding.PaddingRight = UDim.new(0, 4)
    Padding.Parent = Container

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 3)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Parent = Container

    local Open = false
    local Buttons = {}

    local function UpdateText()
        if not Multi then
            Button.Text = tostring(Current or "None")
            return
        end

        if #Selected == 0 then
            Button.Text = "None"
        elseif #Selected == 1 then
            Button.Text = tostring(Selected[1])
        else
            Button.Text = #Selected .. " selected"
        end
    end

    local function Apply(Value, SkipCallback)
        if Multi then
            Selected = {}
            SelectedSet = {}

            for _, Option in ipairs(Value or {}) do
                SelectedSet[Option] = true
                table.insert(Selected, Option)
            end

            UpdateText()

            for Option, OptionButton in pairs(Buttons) do
                OptionButton.BackgroundColor3 = SelectedSet[Option]
                    and Theme.Color
                    or Color3.fromRGB(28, 28, 35)
            end

            if Config.Callback and not SkipCallback then
                Config.Callback(Selected)
            end

            return
        end

        Current = Value
        UpdateText()

        if Config.Callback and not SkipCallback then
            Config.Callback(Current)
        end
    end

    local function Refresh()
        for _, Child in ipairs(Container:GetChildren()) do
            if Child:IsA("TextButton") then
                Child:Destroy()
            end
        end

        Buttons = {}

        for Index, Option in ipairs(Options) do
            local OptionButton = Instance.new("TextButton")
            OptionButton.LayoutOrder = Index
            OptionButton.Size = UDim2.new(1, 0, 0, 18)
            OptionButton.BackgroundColor3 = Multi and SelectedSet[Option]
                and Theme.Color
                or Color3.fromRGB(28, 28, 35)
            OptionButton.Text = tostring(Option)
            OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            OptionButton.Font = Enum.Font.Gotham
            OptionButton.TextSize = 10
            OptionButton.Parent = Container
            Corner(OptionButton, 3)
            Buttons[Option] = OptionButton

            OptionButton.MouseButton1Click:Connect(function()
                if Multi then
                    if SelectedSet[Option] then
                        SelectedSet[Option] = nil

                        for I, Value in ipairs(Selected) do
                            if Value == Option then
                                table.remove(Selected, I)
                                break
                            end
                        end
                    else
                        SelectedSet[Option] = true
                        table.insert(Selected, Option)
                    end

                    UpdateText()
                    OptionButton.BackgroundColor3 = SelectedSet[Option]
                        and Theme.Color
                        or Color3.fromRGB(28, 28, 35)

                    if Config.Callback then
                        Config.Callback(Selected)
                    end
                else
                    Apply(Option)
                    Open = false
                    Container.Visible = false
                    Frame.Size = UDim2.new(1, 0, 0, Theme.ModuleHeight)

                    if Resize then
                        Resize()
                    end
                end
            end)
        end
    end

    Button.MouseButton1Click:Connect(function()
        Open = not Open
        Container.Visible = Open

        local Height = Open and (#Options * 21 + 8) or 0
        Container.Size = UDim2.new(1, 0, 0, Height)
        Frame.Size = UDim2.new(1, 0, 0, Open and (Theme.ModuleHeight + Height + 4) or Theme.ModuleHeight)

        if Resize then
            Resize()
        end
    end)

    if Multi then
        Apply(type(Current) == "table" and Current or {}, true)
    else
        Current = Current or Options[1]
        Apply(Current, true)
    end

    Refresh()

    Control.Get = function()
        if Multi then
            return table.clone(Selected)
        end
        return Current
    end

    Control.Set = function(Value, SkipCallback)
        Apply(Value, SkipCallback)
    end

    Control.UpdateOptions = function(NewOptions)
        Options = NewOptions or {}
        Refresh()
    end

    return Control
end

local function CreateKeybind(Parent, Config, Theme, ToggleParent)
    if IsTouchDevice then
        return nil
    end

    local Control = NewControl(Config.Name)
    local BoundKey = ParseKey(Config.Default)
    local Listening = false

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 26)
    Frame.BackgroundTransparency = 1
    Frame.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -65, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Config.Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 60, 0, 18)
    Button.Position = UDim2.new(1, -60, 0, 4)
    Button.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamMedium
    Button.TextSize = 10
    Button.AutoButtonColor = false
    Button.Parent = Frame
    Corner(Button)

    local function Update()
        Button.Text = BoundKey and BoundKey.Name or "None"
    end

    Button.MouseButton1Click:Connect(function()
        Listening = true
        Button.Text = "[...]"

        Tween(Button, Theme.TweenTime, {
            BackgroundColor3 = Theme.Color
        }):Play()
    end)

    local Connection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
        if Listening then
            if Input.UserInputType ~= Enum.UserInputType.Keyboard then
                return
            end

            Listening = false
            BoundKey = Input.KeyCode == Enum.KeyCode.Escape
                or Input.KeyCode == Enum.KeyCode.Backspace
                and nil
                or Input.KeyCode

            if Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.Backspace then
                BoundKey = nil
            end

            Tween(Button, Theme.TweenTime, {
                BackgroundColor3 = Color3.fromRGB(28, 28, 34)
            }):Play()

            Update()

            if Config.Callback then
                Config.Callback(BoundKey)
            end

            return
        end

        if BoundKey and Input.KeyCode == BoundKey and not GameProcessed and ToggleParent then
            ToggleParent()
        end
    end)

    Update()

    Control.Get = function()
        return BoundKey
    end

    Control.Set = function(Key, SkipCallback)
        BoundKey = ParseKey(Key)
        Update()

        if Config.Callback and not SkipCallback then
            Config.Callback(BoundKey)
        end
    end

    Control.Destroy = function()
        Connection:Disconnect()
    end

    return Control
end

local function CreateColorPicker(Parent, Config, Theme, Resize)
    local Control = NewControl(Config.Name)
    local Color, Alpha = ParseColor(Config.Default)
    local Hue, Saturation, Brightness = Color3.toHSV(Color)
    local HasAlpha = Config.Alpha == true

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(1, 0, 0, 26)
    Main.BackgroundTransparency = 1
    Main.Parent = Parent

    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 26)
    Header.BackgroundTransparency = 1
    Header.Parent = Main

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -30, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Config.Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Header

    local Preview = Instance.new("TextButton")
    Preview.Size = UDim2.new(0, 22, 0, 16)
    Preview.Position = UDim2.new(1, -22, 0, 5)
    Preview.BackgroundColor3 = Color
    Preview.Text = ""
    Preview.AutoButtonColor = false
    Preview.Parent = Header
    Corner(Preview)
    Stroke(Preview, Color3.fromRGB(80, 80, 100))

    local PanelHeight = HasAlpha and 195 or 170
    local CanvasHeight = 115

    local Panel = Instance.new("Frame")
    Panel.Size = UDim2.new(1, 0, 0, PanelHeight)
    Panel.Position = UDim2.new(0, 0, 0, 30)
    Panel.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Panel.Visible = false
    Panel.Parent = Main
    Corner(Panel, 5)
    Stroke(Panel, Color3.fromRGB(45, 45, 55))

    local SatVal = Instance.new("TextButton")
    SatVal.Size = UDim2.new(1, -30, 0, CanvasHeight)
    SatVal.Position = UDim2.new(0, 8, 0, 8)
    SatVal.BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)
    SatVal.Text = ""
    SatVal.AutoButtonColor = false
    SatVal.ClipsDescendants = true
    SatVal.Parent = Panel
    Corner(SatVal, 4)

    local White = Instance.new("Frame")
    White.Size = UDim2.new(1, 0, 1, 0)
    White.BackgroundColor3 = Color3.new(1, 1, 1)
    White.BorderSizePixel = 0
    White.Parent = SatVal

    local WhiteGradient = Instance.new("UIGradient")
    WhiteGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    WhiteGradient.Parent = White

    local Black = Instance.new("Frame")
    Black.Size = UDim2.new(1, 0, 1, 0)
    Black.BackgroundColor3 = Color3.new(0, 0, 0)
    Black.BorderSizePixel = 0
    Black.Parent = SatVal

    local BlackGradient = Instance.new("UIGradient")
    BlackGradient.Rotation = 90
    BlackGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 0)
    })
    BlackGradient.Parent = Black

    local Cursor = Instance.new("Frame")
    Cursor.Size = UDim2.new(0, 8, 0, 8)
    Cursor.AnchorPoint = Vector2.new(0.5, 0.5)
    Cursor.BackgroundColor3 = Color3.new(1, 1, 1)
    Cursor.Parent = SatVal
    Corner(Cursor, 8)
    Stroke(Cursor, Color3.new(0, 0, 0))

    local HueBar = Instance.new("TextButton")
    HueBar.Size = UDim2.new(0, 10, 0, CanvasHeight)
    HueBar.Position = UDim2.new(1, -16, 0, 8)
    HueBar.BackgroundColor3 = Color3.new(1, 1, 1)
    HueBar.Text = ""
    HueBar.AutoButtonColor = false
    HueBar.Parent = Panel
    Corner(HueBar, 4)

    local HueGradient = Instance.new("UIGradient")
    HueGradient.Rotation = 90
    HueGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    })
    HueGradient.Parent = HueBar

    local HueCursor = Instance.new("Frame")
    HueCursor.Size = UDim2.new(1, 4, 0, 4)
    HueCursor.AnchorPoint = Vector2.new(0.5, 0.5)
    HueCursor.BackgroundColor3 = Color3.new(1, 1, 1)
    HueCursor.Parent = HueBar
    Stroke(HueCursor, Color3.new(0, 0, 0))

    local AlphaBar
    local AlphaCursor

    if HasAlpha then
        AlphaBar = Instance.new("TextButton")
        AlphaBar.Size = UDim2.new(1, -16, 0, 10)
        AlphaBar.Position = UDim2.new(0, 8, 0, CanvasHeight + 16)
        AlphaBar.BackgroundColor3 = Color3.new(1, 1, 1)
        AlphaBar.Text = ""
        AlphaBar.AutoButtonColor = false
        AlphaBar.Parent = Panel
        Corner(AlphaBar, 3)

        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
        })
        Gradient.Parent = AlphaBar

        AlphaCursor = Instance.new("Frame")
        AlphaCursor.Size = UDim2.new(0, 4, 1, 4)
        AlphaCursor.AnchorPoint = Vector2.new(0.5, 0.5)
        AlphaCursor.BackgroundColor3 = Color3.new(1, 1, 1)
        AlphaCursor.Parent = AlphaBar
        Stroke(AlphaCursor, Color3.new(0, 0, 0))
    end

    local Bottom = Instance.new("Frame")
    Bottom.Size = UDim2.new(1, -16, 0, 20)
    Bottom.Position = UDim2.new(0, 8, 1, -26)
    Bottom.BackgroundTransparency = 1
    Bottom.Parent = Panel

    local ModeButton = Instance.new("TextButton")
    ModeButton.Size = UDim2.new(0, 40, 1, 0)
    ModeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    ModeButton.Text = "HEX"
    ModeButton.TextColor3 = Theme.Color
    ModeButton.Font = Enum.Font.GothamBold
    ModeButton.TextSize = 10
    ModeButton.AutoButtonColor = false
    ModeButton.Parent = Bottom
    Corner(ModeButton)

    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(1, -46, 1, 0)
    Input.Position = UDim2.new(0, 46, 0, 0)
    Input.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    Input.TextColor3 = Color3.fromRGB(255, 255, 255)
    Input.Font = Enum.Font.Gotham
    Input.TextSize = 10
    Input.ClearTextOnFocus = false
    Input.Parent = Bottom
    Corner(Input)

    local Modes = {"HEX", "RGB", "HSV"}
    local ModeIndex = 1
    local Expanded = false

    local function Format()
        local Current = Color3.fromHSV(Hue, Saturation, Brightness)
        local Mode = Modes[ModeIndex]

        if Mode == "HEX" then
            return "#" .. Current:ToHex():upper()
        elseif Mode == "RGB" then
            return string.format(
                "%d, %d, %d",
                math.floor(Current.R * 255),
                math.floor(Current.G * 255),
                math.floor(Current.B * 255)
            )
        end

        local H, S, V = Color3.toHSV(Current)
        return string.format(
            "%d, %d%%, %d%%",
            math.floor(H * 360),
            math.floor(S * 100),
            math.floor(V * 100)
        )
    end

    local function Sync(SkipCallback)
        local Current = Color3.fromHSV(Hue, Saturation, Brightness)

        SatVal.BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)
        Preview.BackgroundColor3 = Current
        Preview.BackgroundTransparency = 1 - Alpha
        Cursor.Position = UDim2.new(Saturation, 0, 1 - Brightness, 0)
        HueCursor.Position = UDim2.new(0.5, 0, Hue, 0)

        if AlphaCursor then
            AlphaCursor.Position = UDim2.new(Alpha, 0, 0.5, 0)
        end

        Input.Text = Format()

        if Config.Callback and not SkipCallback then
            Config.Callback(Current, Alpha)
        end
    end

    local function UpdateSatVal(InputObject)
        local Position = SatVal.AbsolutePosition
        local Size = SatVal.AbsoluteSize

        Saturation = math.clamp(
            (InputObject.Position.X - Position.X) / Size.X,
            0, 1
        )

        Brightness = 1 - math.clamp(
            (InputObject.Position.Y - Position.Y) / Size.Y,
            0, 1
        )

        Sync()
    end

    local function UpdateHue(InputObject)
        local Position = HueBar.AbsolutePosition
        local Size = HueBar.AbsoluteSize

        Hue = math.clamp(
            (InputObject.Position.Y - Position.Y) / Size.Y,
            0, 1
        )

        Sync()
    end

    local function UpdateAlpha(InputObject)
        if not AlphaBar then
            return
        end

        local Position = AlphaBar.AbsolutePosition
        local Size = AlphaBar.AbsoluteSize

        Alpha = math.clamp(
            (InputObject.Position.X - Position.X) / Size.X,
            0, 1
        )

        Sync()
    end

    local DragSatVal = false
    local DragHue = false
    local DragAlpha = false

    SatVal.InputBegan:Connect(function(InputObject)
        if InputObject.UserInputType == Enum.UserInputType.MouseButton1
            or InputObject.UserInputType == Enum.UserInputType.Touch then
            DragSatVal = true
            UpdateSatVal(InputObject)
        end
    end)

    HueBar.InputBegan:Connect(function(InputObject)
        if InputObject.UserInputType == Enum.UserInputType.MouseButton1
            or InputObject.UserInputType == Enum.UserInputType.Touch then
            DragHue = true
            UpdateHue(InputObject)
        end
    end)

    if AlphaBar then
        AlphaBar.InputBegan:Connect(function(InputObject)
            if InputObject.UserInputType == Enum.UserInputType.MouseButton1
                or InputObject.UserInputType == Enum.UserInputType.Touch then
                DragAlpha = true
                UpdateAlpha(InputObject)
            end
        end)
    end

    UserInputService.InputChanged:Connect(function(InputObject)
        if InputObject.UserInputType ~= Enum.UserInputType.MouseMovement
            and InputObject.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        if DragSatVal then
            UpdateSatVal(InputObject)
        elseif DragHue then
            UpdateHue(InputObject)
        elseif DragAlpha then
            UpdateAlpha(InputObject)
        end
    end)

    UserInputService.InputEnded:Connect(function(InputObject)
        if InputObject.UserInputType == Enum.UserInputType.MouseButton1
            or InputObject.UserInputType == Enum.UserInputType.Touch then
            DragSatVal = false
            DragHue = false
            DragAlpha = false
        end
    end)

    ModeButton.MouseButton1Click:Connect(function()
        ModeIndex = ModeIndex % #Modes + 1
        ModeButton.Text = Modes[ModeIndex]
        Input.Text = Format()
    end)

    Input.FocusLost:Connect(function()
        local Text = Input.Text
        local Mode = Modes[ModeIndex]

        if Mode == "HEX" then
            local Success, Parsed = pcall(function()
                return Color3.fromHex(Text:gsub("#", ""):gsub("%s.*", ""))
            end)

            if Success and Parsed then
                Hue, Saturation, Brightness = Color3.toHSV(Parsed)
            end
        elseif Mode == "RGB" then
            local R, G, B = Text:match("(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")

            if R and G and B then
                Hue, Saturation, Brightness = Color3.toHSV(
                    Color3.fromRGB(tonumber(R), tonumber(G), tonumber(B))
                )
            end
        elseif Mode == "HSV" then
            local H, S, V = Text:match("(%d+)%s*,%s*(%d+)%%%s*,%s*(%d+)%%")

            if H and S and V then
                Hue = math.clamp(tonumber(H) / 360, 0, 1)
                Saturation = math.clamp(tonumber(S) / 100, 0, 1)
                Brightness = math.clamp(tonumber(V) / 100, 0, 1)
            end
        end

        Sync()
    end)

    Preview.MouseButton1Click:Connect(function()
        Expanded = not Expanded
        Panel.Visible = Expanded

        local Height = Expanded and (PanelHeight + 36) or 26

        Tween(Main, Theme.TweenTime, {
            Size = UDim2.new(1, 0, 0, Height)
        }):Play()

        if Resize then
            task.defer(Resize)
        end
    end)

    Control.Get = function()
        local Current = Color3.fromHSV(Hue, Saturation, Brightness)

        return {
            R = Current.R,
            G = Current.G,
            B = Current.B,
            A = Alpha
        }
    end

    Control.Set = function(Value, NewAlpha, SkipCallback)
        local ParsedColor, ParsedAlpha = ParseColor(Value)

        Hue, Saturation, Brightness = Color3.toHSV(ParsedColor)
        Alpha = math.clamp(NewAlpha or ParsedAlpha or Alpha, 0, 1)

        Sync(SkipCallback)
    end

    Sync(true)

    return Control
end

local function CreateConfigSystem(UI)
    local Config = {}
    local Folder = UI.ConfigFolder
    local Flags = UI.Flags
    local AutoSaveThread

    local function Path(Name)
        return Folder .. "/" .. Name .. ".json"
    end

    local function GetAll()
        local Result = {}

        if listfiles and isfolder and isfolder(Folder) then
            for _, FilePath in ipairs(listfiles(Folder)) do
                local FileName = FilePath:match("[^\\]+$"):match("[^/]+$")

                if FileName
                    and FileName:sub(-5) == ".json"
                    and FileName ~= "AutoloadState.json" then
                    table.insert(Result, FileName:sub(1, -6))
                end
            end
        end

        if #Result == 0 then
            Result[1] = "default"
        end

        table.sort(Result)
        return Result
    end

    function Config:GetAll()
        return GetAll()
    end

    function Config:Save(Name)
        if not Name or Name == "" or not writefile then
            return false
        end

        local Data = {}

        for Flag, Control in pairs(Flags) do
            if Control and Control.Get then
                Data[Flag] = Control.Get()
            end
        end

        local Success = pcall(function()
            writefile(Path(Name), HttpService:JSONEncode(Data))
        end)

        return Success
    end

    function Config:Load(Name)
        if not Name or Name == "" or not readfile or not isfile then
            return false
        end

        local FilePath = Path(Name)

        if not isfile(FilePath) then
            return false
        end

        local Success, Data = pcall(function()
            return HttpService:JSONDecode(readfile(FilePath))
        end)

        if not Success or type(Data) ~= "table" then
            return false
        end

        -- Apply ordinary settings first.
        for Flag, Value in pairs(Data) do
            local Control = Flags[Flag]

            if Control and Control.Set and not Flag:match("_Enabled$") then
                Control.Set(Value, true)
            end
        end

        -- Apply module states afterwards so setting callbacks are only
        -- active when their owning module is enabled.
        for Flag, Value in pairs(Data) do
            local Control = Flags[Flag]

            if Control and Control.Set and Flag:match("_Enabled$") then
                Control.Set(Value, true)
            end
        end

        return true
    end

    function Config:Delete(Name)
        if not Name or Name == "" or not delfile or not isfile then
            return false
        end

        local FilePath = Path(Name)

        if not isfile(FilePath) then
            return false
        end

        return pcall(delfile, FilePath)
    end

    function Config:SetAutoLoad(Enabled, Name)
        if not writefile then
            return
        end

        pcall(function()
            writefile(
                Folder .. "/AutoloadState.json",
                HttpService:JSONEncode({
                    Enabled = Enabled == true,
                    Config = Name or "default"
                })
            )
        end)
    end

    function Config:GetAutoLoad()
        if not readfile or not isfile then
            return false, "default"
        end

        local FilePath = Folder .. "/AutoloadState.json"

        if not isfile(FilePath) then
            return false, "default"
        end

        local Success, Data = pcall(function()
            return HttpService:JSONDecode(readfile(FilePath))
        end)

        if Success and type(Data) == "table" then
            return Data.Enabled == true, Data.Config or "default"
        end

        return false, "default"
    end

    function Config:SetAutoSave(Enabled, Delay, NameGetter)
        if AutoSaveThread then
            task.cancel(AutoSaveThread)
            AutoSaveThread = nil
        end

        if not Enabled then
            return
        end

        AutoSaveThread = task.spawn(function()
            while true do
                task.wait(math.max(1, tonumber(Delay) or 30))

                local Name = NameGetter and NameGetter() or "default"
                if Name and Name ~= "" then
                    Config:Save(Name)
                end
            end
        end)
    end

    function Config:Destroy()
        if AutoSaveThread then
            task.cancel(AutoSaveThread)
            AutoSaveThread = nil
        end
    end

    return Config
end

function Library.New(Options)
    Options = Options or {}

    local Name = Options.Name or "MultiPanel UI"
    local Theme = {
        Name = Name,
        Color = Options.Theme or Options.ThemeColor or Defaults.Theme,
        Background = Options.Background or Options.BackgroundColor or Defaults.Background,
        Header = Options.Header or Options.HeaderColor or Defaults.Header,
        PanelWidth = Options.PanelWidth or Defaults.PanelWidth,
        HeaderHeight = Options.HeaderHeight or Defaults.HeaderHeight,
        ModuleHeight = Options.ModuleHeight or Defaults.ModuleHeight,
        TweenTime = Options.TweenTime or Defaults.TweenTime,
        CornerRadius = Options.CornerRadius or Defaults.CornerRadius,
        CategoryStartX = Options.CategoryStartX or Defaults.CategoryStartX,
        CategoryStartY = Options.CategoryStartY or Defaults.CategoryStartY,
        CategorySpacing = Options.CategorySpacing or Defaults.CategorySpacing,
        WrapCategories = Options.WrapCategories ~= false,
        ToggleKey = Options.ToggleKey or Defaults.ToggleKey,
        PanelsKey = Options.PanelsKey or Defaults.PanelsKey,
        ToggleButtonSize = Options.ToggleButtonSize or Defaults.ToggleButtonSize
    }

    local UI = {
        Name = Name,
        Theme = Theme,
        Flags = {},
        Categories = {},
        ConfigFolder = Options.ConfigFolder or (Name .. "Configs")
    }

    if makefolder and isfolder and not isfolder(UI.ConfigFolder) then
        pcall(makefolder, UI.ConfigFolder)
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = Name .. "GUI"
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 999
    ScreenGui.Parent = GetGuiParent()

    UI.ScreenGui = ScreenGui

    local Panels = {}
    local CategoryX = Theme.CategoryStartX
    local CategoryY = Theme.CategoryStartY
    local PanelsVisible = true

    function UI:Category(NameValue)
        local Camera = workspace.CurrentCamera
        local Viewport = Camera and Camera.ViewportSize or Vector2.new(1280, 720)

        if Theme.WrapCategories
            and CategoryX + Theme.PanelWidth > Viewport.X - Theme.CategoryStartX then
            CategoryX = Theme.CategoryStartX
            CategoryY += Theme.HeaderHeight + Theme.CategorySpacing
        end

        local Panel = Instance.new("Frame")
        Panel.Size = UDim2.new(0, Theme.PanelWidth, 0, Theme.HeaderHeight)
        Panel.Position = UDim2.new(0, CategoryX, 0, CategoryY)
        Panel.BackgroundColor3 = Theme.Background
        Panel.BackgroundTransparency = 0.15
        Panel.ClipsDescendants = true
        Panel.Parent = ScreenGui
        Corner(Panel, Theme.CornerRadius)
        Stroke(Panel, Color3.fromRGB(35, 35, 45))

        CategoryX += Theme.PanelWidth + Theme.CategorySpacing

        table.insert(Panels, Panel)

        local Header = Instance.new("Frame")
        Header.Size = UDim2.new(1, 0, 0, Theme.HeaderHeight)
        Header.BackgroundColor3 = Theme.Header
        Header.BackgroundTransparency = 0.1
        Header.Parent = Panel
        Corner(Header, Theme.CornerRadius)

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -32, 1, 0)
        Title.Position = UDim2.new(0, 12, 0, 0)
        Title.BackgroundTransparency = 1
        Title.Text = NameValue
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 12
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Header

        local Arrow = Instance.new("TextLabel")
        Arrow.Size = UDim2.new(0, 20, 1, 0)
        Arrow.Position = UDim2.new(1, -24, 0, 0)
        Arrow.BackgroundTransparency = 1
        Arrow.Text = ">"
        Arrow.TextColor3 = Color3.fromRGB(200, 200, 200)
        Arrow.Font = Enum.Font.GothamBold
        Arrow.TextSize = 13
        Arrow.Rotation = -90
        Arrow.Parent = Header

        local Content = Instance.new("Frame")
        Content.Size = UDim2.new(1, -16, 0, 0)
        Content.Position = UDim2.new(0, 8, 0, Theme.HeaderHeight + 6)
        Content.BackgroundTransparency = 1
        Content.Visible = false
        Content.Parent = Panel

        local Layout = Instance.new("UIListLayout")
        Layout.Padding = UDim.new(0, 4)
        Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Layout.Parent = Content

        local Expanded = false
        local ModuleCount = 0

        local Category = {
            Name = NameValue,
            Frame = Panel,
            Content = Content
        }

        local function UpdatePanel()
            Tween(Arrow, Theme.TweenTime, {
                Rotation = Expanded and 90 or -90
            }):Play()

            if not Expanded then
                Content.Visible = false
                Tween(Panel, Theme.TweenTime, {
                    Size = UDim2.new(0, Theme.PanelWidth, 0, Theme.HeaderHeight)
                }):Play()
                return
            end

            Content.Visible = true

            local Height = Layout.AbsoluteContentSize.Y
            Tween(Panel, Theme.TweenTime, {
                Size = UDim2.new(
                    0,
                    Theme.PanelWidth,
                    0,
                    Theme.HeaderHeight + Height + 12
                )
            }):Play()
        end

        MakeDraggable(Header, Panel, function()
            Expanded = not Expanded
            UpdatePanel()
        end)

        function Category:Module(NameOrConfig, MaybeConfig)
            local Config

            if type(NameOrConfig) == "table" then
                Config = table.clone(NameOrConfig)
            else
                Config = table.clone(MaybeConfig or {})
                Config.Name = NameOrConfig
            end

            Config.Name = Config.Name or "Module"

            local Module = {
                Name = Config.Name,
                Settings = {}
            }

            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(1, 0, 0, Theme.ModuleHeight)
            Frame.BackgroundTransparency = 1
            Frame.LayoutOrder = ModuleCount
            Frame.Parent = Content

            ModuleCount += 1

            local HasSettings = type(Config.Settings) == "table" and #Config.Settings > 0

            local Row = Instance.new("Frame")
            Row.Size = UDim2.new(1, 0, 0, Theme.ModuleHeight)
            Row.BackgroundTransparency = 1
            Row.Parent = Frame

            local Button = Instance.new("TextButton")
            Button.Size = HasSettings and UDim2.new(1, -26, 1, 0) or UDim2.new(1, 0, 1, 0)
            Button.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
            Button.BackgroundTransparency = 0.2
            Button.Text = "  " .. Config.Name
            Button.TextColor3 = Color3.fromRGB(210, 210, 215)
            Button.TextXAlignment = Enum.TextXAlignment.Left
            Button.Font = Enum.Font.GothamMedium
            Button.TextSize = 11
            Button.AutoButtonColor = false
            Button.Parent = Row
            Corner(Button)

            local Enabled = Config.Default == true
            local Action = Config.Button == true or Config.Action == true
            local SettingsVisible = false
            local SettingsFrame

            local function SetEnabled(State, SkipCallback)
                Enabled = State == true

                Tween(Button, Theme.TweenTime, {
                    BackgroundColor3 = Enabled and Theme.Color or Color3.fromRGB(24, 24, 28),
                    BackgroundTransparency = Enabled and 0.1 or 0.2
                }):Play()

                Button.TextColor3 = Enabled
                    and Color3.fromRGB(255, 255, 255)
                    or Color3.fromRGB(210, 210, 215)

                if Config.Callback and not SkipCallback then
                    Config.Callback(Enabled)
                end
            end

            if HasSettings then
                local Gear = Instance.new("TextButton")
                Gear.Size = UDim2.new(0, 22, 0, 22)
                Gear.AnchorPoint = Vector2.new(0.5, 0.5)
                Gear.Position = UDim2.new(1, -11, 0.5, 0)
                Gear.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
                Gear.BackgroundTransparency = 0.3
                Gear.Text = "⚙"
                Gear.TextColor3 = Color3.fromRGB(200, 200, 200)
                Gear.Font = Enum.Font.GothamBold
                Gear.TextSize = 11
                Gear.AutoButtonColor = false
                Gear.Parent = Row
                Corner(Gear)

                SettingsFrame = Instance.new("Frame")
                SettingsFrame.Size = UDim2.new(1, 0, 0, 0)
                SettingsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
                SettingsFrame.BackgroundTransparency = 0.1
                SettingsFrame.Visible = false
                SettingsFrame.Parent = Frame
                Corner(SettingsFrame)

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

                local function ResizeSettings()
                    if not SettingsVisible then
                        return
                    end

                    local Height = SettingsLayout.AbsoluteContentSize.Y + 8
                    SettingsFrame.Size = UDim2.new(1, 0, 0, Height)
                    Frame.Size = UDim2.new(1, 0, 0, Theme.ModuleHeight + Height + 4)
                    UpdatePanel()
                end

                for _, Setting in ipairs(Config.Settings) do
                    local SettingType = string.lower(Setting.Type or "toggle")
                    local Control

                    local ProtectedCallback
                    if Setting.Callback then
                        ProtectedCallback = function(...)
                            if Enabled then
                                Setting.Callback(...)
                            end
                        end
                    end

                    local SettingConfig = table.clone(Setting)
                    SettingConfig.Callback = ProtectedCallback

                    if SettingType == "toggle" then
                        Control = CreateToggle(SettingsFrame, SettingConfig, Theme)
                    elseif SettingType == "slider" then
                        Control = CreateSlider(SettingsFrame, SettingConfig, Theme)
                    elseif SettingType == "textbox" or SettingType == "text" then
                        Control = CreateTextBox(SettingsFrame, SettingConfig)
                    elseif SettingType == "dropdown" then
                        Control = CreateDropdown(SettingsFrame, SettingConfig, Theme, ResizeSettings)
                    elseif SettingType == "keybind" or SettingType == "key" then
                        Control = CreateKeybind(
                            SettingsFrame,
                            SettingConfig,
                            Theme,
                            function()
                                SetEnabled(not Enabled)
                            end
                        )
                    elseif SettingType == "colorpicker" or SettingType == "color" then
                        Control = CreateColorPicker(
                            SettingsFrame,
                            SettingConfig,
                            Theme,
                            ResizeSettings
                        )
                    end

                    if Control then
                        Module.Settings[Setting.Name] = Control

                        if Setting.Flag then
                            UI.Flags[Setting.Flag] = Control
                        end
                    end
                end

                Gear.MouseButton1Click:Connect(function()
                    SettingsVisible = not SettingsVisible
                    SettingsFrame.Visible = SettingsVisible

                    Tween(Gear, Theme.TweenTime, {
                        Rotation = SettingsVisible and 180 or 0
                    }):Play()

                    if SettingsVisible then
                        ResizeSettings()
                    else
                        Frame.Size = UDim2.new(1, 0, 0, Theme.ModuleHeight)
                        UpdatePanel()
                    end
                end)
            end

            Button.MouseButton1Click:Connect(function()
                if Action then
                    Tween(Button, 0.08, {
                        BackgroundColor3 = Theme.Color,
                        BackgroundTransparency = 0.1
                    }):Play()

                    if Config.Callback then
                        Config.Callback(true)
                    end

                    task.delay(0.2, function()
                        Tween(Button, Theme.TweenTime, {
                            BackgroundColor3 = Color3.fromRGB(24, 24, 28),
                            BackgroundTransparency = 0.2
                        }):Play()
                    end)

                    return
                end

                SetEnabled(not Enabled)
            end)

            Module.IsEnabled = function()
                return Enabled
            end

            Module.Get = Module.IsEnabled
            Module.SetEnabled = SetEnabled
            Module.Set = SetEnabled

            Module.GetSetting = function(NameValue)
                local Control = Module.Settings[NameValue]
                return Control and Control.Get()
            end

            Module.SetSetting = function(NameValue, Value)
                local Control = Module.Settings[NameValue]
                if Control and Control.Set then
                    Control.Set(Value, true)
                end
            end

            if Config.Flag then
                UI.Flags[Config.Flag] = Module
            end

            SetEnabled(Enabled, true)

            return Module
        end

        function Category:Toggle(NameValue, Default, Callback, Flag)
            return self:Module(NameValue, {
                Default = Default,
                Callback = Callback,
                Flag = Flag
            })
        end

        function Category:Button(NameValue, Callback)
            return self:Module(NameValue, {
                Button = true,
                Callback = Callback
            })
        end

        function Category:TextBox(NameValue, Default, Callback, Flag)
            local Control = CreateTextBox(Content, {
                Name = NameValue,
                Default = Default,
                Callback = Callback
            })

            if Flag then
                UI.Flags[Flag] = Control
            end

            return Control
        end

        function Category:Dropdown(NameValue, Options, Default, Callback, Multi, Flag)
            local Control = CreateDropdown(Content, {
                Name = NameValue,
                Options = Options,
                Default = Default,
                Callback = Callback,
                Multi = Multi
            }, Theme, UpdatePanel)

            if Flag then
                UI.Flags[Flag] = Control
            end

            return Control
        end

        table.insert(UI.Categories, Category)
        return Category
    end

    function UI:Toggle()
        PanelsVisible = not PanelsVisible

        for _, Panel in ipairs(Panels) do
            Panel.Visible = PanelsVisible
        end

        ToggleButton.Text = (PanelsVisible and "Hide " or "Show ") .. Name
    end

    function UI:Destroy()
        if UI.Config and UI.Config.Destroy then
            UI.Config:Destroy()
        end
        ScreenGui:Destroy()
    end

    local ToggleButton = Instance.new("TextButton")
    local TogglePosition

    if IsTouchDevice then
        TogglePosition = UDim2.new(
            1,
            -Theme.CategoryStartX - Theme.ToggleButtonSize.X.Offset,
            0,
            15
        )
    else
        TogglePosition = UDim2.new(0, Theme.CategoryStartX, 0, 15)
    end

    ToggleButton.Size = Theme.ToggleButtonSize
    ToggleButton.Position = Options.ToggleButtonPosition or TogglePosition
    ToggleButton.BackgroundColor3 = Theme.Background
    ToggleButton.BackgroundTransparency = 0.15
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.TextSize = 11
    ToggleButton.AutoButtonColor = false
    ToggleButton.Parent = ScreenGui
    Corner(ToggleButton, Theme.CornerRadius)
    Stroke(ToggleButton, Color3.fromRGB(35, 35, 45))

    ToggleButton.Text = "Hide " .. Name

    MakeDraggable(ToggleButton, ToggleButton, function()
        UI:Toggle()
    end)

    UserInputService.InputBegan:Connect(function(Input, GameProcessed)
        if GameProcessed then
            return
        end

        if Input.KeyCode == Theme.PanelsKey then
            UI:Toggle()
        elseif Input.KeyCode == Theme.ToggleKey then
            ScreenGui.Enabled = not ScreenGui.Enabled
        end
    end)

    UI.Config = CreateConfigSystem(UI)
    UI.Toggle = Library.Toggle
    UI.Slider = Library.Slider
    UI.Dropdown = Library.Dropdown
    UI.TextBox = Library.TextBox
    UI.Keybind = Library.Keybind
    UI.ColorPicker = Library.ColorPicker

    if Options.Config then
        local ConfigCategory = UI:Category("Configuration")
        local NameBox = ConfigCategory:TextBox("Config Name", "", nil)
        local Select = ConfigCategory:Dropdown(
            "Select Config",
            UI.Config:GetAll(),
            "default",
            nil,
            false
        )

        ConfigCategory:Button("Create", function()
            local NameValue = NameBox:Get()

            if NameValue and NameValue ~= "" then
                UI.Config:Save(NameValue)
                Select:UpdateOptions(UI.Config:GetAll())
                Select:Set(NameValue, true)
                NameBox:Set("")
            end
        end)

        ConfigCategory:Button("Save", function()
            UI.Config:Save(Select:Get())
        end)

        ConfigCategory:Button("Load", function()
            UI.Config:Load(Select:Get())
        end)

        ConfigCategory:Button("Delete", function()
            local NameValue = Select:Get()

            if NameValue ~= "default" then
                UI.Config:Delete(NameValue)
            end

            local Available = UI.Config:GetAll()
            Select:UpdateOptions(Available)
            Select:Set(Available[1] or "default", true)
        end)

        local AutoSave = ConfigCategory:Module("Auto Save", {
            Flag = "Config_AutoSave_Enabled",
            Settings = {
                Library.Slider(
                    "Delay (s)",
                    1,
                    60,
                    30,
                    1,
                    nil,
                    "Config_AutoSave_Delay"
                )
            },
            Callback = function(Enabled)
                local Delay = AutoSave.Settings["Delay (s)"]
                    and AutoSave.Settings["Delay (s)"]:Get()
                    or 30

                UI.Config:SetAutoSave(
                    Enabled,
                    Delay,
                    function()
                        return Select:Get()
                    end
                )
            end
        })

        ConfigCategory:Button("Auto Load", function()
            local Enabled, NameValue = UI.Config:GetAutoLoad()

            if Enabled then
                UI.Config:Load(NameValue)
            end
        end)

        local AutoLoadEnabled, AutoLoadName = UI.Config:GetAutoLoad()

        if AutoLoadEnabled then
            task.defer(function()
                Select:Set(AutoLoadName, true)
                UI.Config:Load(AutoLoadName)
            end)
        end

        UI.Configuration = ConfigCategory
        UI.ConfigCategory = ConfigCategory
    end

    return UI
end

return Library
