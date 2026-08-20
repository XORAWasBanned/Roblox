--[[ 
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  ____  ____  | || |              | || |     ____     | || |  _______     | || |      __      | |
| | |_  _||_  _| | || |              | || |   .'    `.   | || | |_   __ \    | || |     /  \     | |
| |   \ \  / /   | || |              | || |  /  .--.  \  | || |   | |__) |   | || |    / /\ \    | |
| |    > `' <    | || |              | || |  | |    | |  | || |   |  __ /    | || |   / ____ \   | |
| |  _/ /'`\ \_  | || |              | || |  \  `--'  /  | || |  _| |  \ \_  | || | _/ /    \ \_ | |
| | |____||____| | || |   _______    | || |   `.____.'   | || | |____| |___| | || ||____|  |____|| |
| |              | || |  |_______|   | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
Velocity Speed:
- Release: 2025/12/11
- Last Update: ---
- Version: 1.0.0

- Lastest Update Log: ---

© 2025 X_ORA. All Rights Reserved.
]]--

--// Script - Velocity Speed \\--
getgenv().VSpeed = VSpeed or {}
VSpeed.Name = VSpeed.Name or "Velocity Speed"
VSpeed.Enabled = VSpeed.Enabled or false
VSpeed.Speed = VSpeed.Speed or 2
VSpeed.GUI = VSpeed.GUI
VSpeed.Keybinds = VSpeed.Keybinds or {}
VSpeed.Keybinds.VSpeed = VSpeed.Keybinds.VSpeed or "V" or "ButtonA"
VSpeed.Keybinds.Hide = VSpeed.Keybinds.Hide or "H" or "ButtonB"
VSpeed.Keybinds.Remove = VSpeed.Keybinds.Remove or "R" or "ButtonC"

if not game.IsLoaded then game.Loaded:Wait() end

loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Anti-Cheats%20Bypassers%20/Adonis.luau", true))()

local CloneReference = cloneref or function(...) return ... end
local Services = setmetatable({}, {
    __index = function(Self, Key)
        local Success, Service = pcall(game.FindService, game, Key)
        if not (Success and Service) then
            Success, Service = pcall(game.FindService, game, Key.."Service")
        end
        if not (Success and Service) then return warn(Key, "Doesn't exist as a service!") end
        return CloneReference(Service)
    end
})

local HiddenGui = gethui and gethui() or Services.CoreGui

local LocalPlayer = Services.Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local LocalHumanoid = LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid", 10)
local LocalRootPart = LocalHumanoid.RootPart or LocalCharacter:WaitForChild("HumanoidRootPart", 10)

local Connections = {}



--// FUNCTIONS



local function VelocitySpeed(Enabled)
    if Enabled == true then
        Services.Run:BindToRenderStep("Velocity Speed", Enum.RenderPriority.Character.Value, function(DeltaTime)
            if not (LocalCharacter and LocalHumanoid and LocalRootPart) then return end
            local WalkSpeed = LocalHumanoid.WalkSpeed
            local MoveDirection = LocalHumanoid.MoveDirection
            local Speed = 8 + WalkSpeed * VSpeed.Speed
            local YVelocity = vector.create(0, LocalRootPart.AssemblyLinearVelocity.Y, 0)
            local MoveVelocity = YVelocity + MoveDirection * Speed
            
            LocalRootPart.AssemblyLinearVelocity = MoveVelocity
        end)
    else
        Services.Run:UnbindFromRenderStep("Velocity Speed")
    end
end



--// CONNECTIONS



Connections[#Connections+1] = LocalPlayer.CharacterAdded:Connect(function(Character)
    task.wait(0.1)
    LocalCharacter = Character
    LocalHumanoid = LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid", 5)
    LocalRootPart = LocalHumanoid.RootPart or LocalCharacter:WaitForChild("HumanoidRootPart", 5)
end)

Connections[#Connections+1] = LocalPlayer.CharacterRemoving:Connect(function()
    LocalCharacter, LocalHumanoid, LocalRootPart = nil, nil, nil
end)



--// GUI



local DraggingTicks = { VSpeed = 0, Hide = 0, Remove = 0 }

if VSpeed.GUI then 
    VSpeed.GUI:Destroy() 
    VSpeed.GUI = nil
    
    Services.Run:UnbindFromRenderStep("Velocity Speed") 
    
    if VSpeed.Connections then
        for Index, Connection in VSpeed.Connections do
            Connection:Disconnect()
            Connections[Index] = nil
        end
        VSpeed.Connections = nil
    end
    
    VelocitySpeed(VSpeed.Enabled)
end

local GUIHolder = Instance.new("ScreenGui", HiddenGui)
GUIHolder.Name = "GUIHolder"
GUIHolder.Enabled = true
GUIHolder.ResetOnSpawn = false
GUIHolder.IgnoreGuiInset = true
GUIHolder.DisplayOrder = -1
GUIHolder.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Container = Instance.new("Frame", GUIHolder)
Container.Name = "Container"
Container.Size = UDim2.new(0, 200, 0, 200)
Container.Position = UDim2.new(0.5, 0, 0.36, 0)
Container.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
Container.BackgroundTransparency = 0
Container.BorderSizePixel = 0
Container.AnchorPoint = Vector2.new(0.5, 0.5)
Container.Active = true
Container.Draggable = true
Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 10)

local ContainerUIStroke = Instance.new("UIStroke",Container)
ContainerUIStroke.Thickness = 4
ContainerUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ContainerUIStroke.Color = Color3.fromRGB(40, 40, 80)

local TitleLabel = Instance.new("TextLabel",Container)
TitleLabel.Name = "TitleLabel"
TitleLabel.Text = "Velocity Speed"
TitleLabel.Font = Enum.Font.PermanentMarker
TitleLabel.TextSize = 25
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextTransparency = 0
TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.TextStrokeTransparency = 0
TitleLabel.TextWrapped = true
TitleLabel.TextTruncate = Enum.TextTruncate.None
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
TitleLabel.RichText = true
TitleLabel.BackgroundTransparency = 1
TitleLabel.BorderSizePixel = 0
TitleLabel.Position = UDim2.new(0.5, 0, 0.125, 0)
TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TitleLabel.Size = UDim2.new(1, 0, 0, 27.5)
TitleLabel.ZIndex = 1

local SpeedLabel = Instance.new("TextLabel", Container)
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Text = VSpeed.Enabled and "Velocity Speed: "..tostring(VSpeed.Speed) or "Greetings " .. LocalPlayer.DisplayName 
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.TextSize = 16
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextStrokeTransparency = 1
SpeedLabel.TextScaled = false
SpeedLabel.TextWrapped = true
SpeedLabel.TextTruncate = Enum.TextTruncate.None
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Center
SpeedLabel.TextYAlignment = Enum.TextYAlignment.Center
SpeedLabel.RichText = true
SpeedLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
SpeedLabel.BorderSizePixel = 0
SpeedLabel.Position = UDim2.new(0.5, 0, 0.35, 0)
SpeedLabel.AnchorPoint = Vector2.new(0.5, 0.5)
SpeedLabel.Size = UDim2.new(0.85, 0, 0, 50)
SpeedLabel.ZIndex = 1
SpeedLabel.ClipsDescendants = false
Instance.new("UICorner", SpeedLabel).CornerRadius = UDim.new(0, 10)

local SpeedChanger = Instance.new("TextBox", Container)
SpeedChanger.Name = "Speed Changer"
SpeedChanger.Text = VSpeed.Enabled and tostring(VSpeed.Speed) or ""
SpeedChanger.Font = Enum.Font.GothamBold
SpeedChanger.TextSize = 14.5
SpeedChanger.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedChanger.TextStrokeTransparency = 1
SpeedChanger.TextScaled = false
SpeedChanger.TextWrapped = true
SpeedChanger.PlaceholderText = "Change Velocity Speed Here!"
SpeedChanger.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
SpeedChanger.ClearTextOnFocus = true
SpeedChanger.MultiLine = true
SpeedChanger.TextXAlignment = Enum.TextXAlignment.Center
SpeedChanger.TextYAlignment = Enum.TextYAlignment.Center
SpeedChanger.RichText = true
SpeedChanger.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
SpeedChanger.BorderSizePixel = 0
SpeedChanger.Position = UDim2.new(0.5, 0, 0.65, 0)
SpeedChanger.AnchorPoint = Vector2.new(0.5, 0.5)
SpeedChanger.Size = UDim2.new(0.85, 0, 0, 50)
SpeedChanger.ZIndex = 1
SpeedChanger.ClipsDescendants = false
Instance.new("UICorner", SpeedChanger).CornerRadius = UDim.new(0, 10)

if Services.UserInput.TouchEnabled then
    local VSpeedButton = Instance.new("TextButton", GUIHolder)
    VSpeedButton.Name = "VSpeedButton"
    VSpeedButton.Text = VSpeed.Enabled and 'VSpeed: <font color="rgb(0,255,0)" size="20">ON</font>' or 'VSpeed: <font color="rgb(255,0,0)" size="20">OFF</font>'
    VSpeedButton.Font = Enum.Font.GothamBold
    VSpeedButton.TextSize = 20
    VSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    VSpeedButton.TextTransparency = 0
    VSpeedButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    VSpeedButton.TextStrokeTransparency = 0
    VSpeedButton.TextScaled = false
    VSpeedButton.RichText = true
    VSpeedButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    VSpeedButton.BorderSizePixel = 0
    VSpeedButton.Size = UDim2.new(0, 125, 0, 45) 
    VSpeedButton.Position = UDim2.new(0.5, 0, 0.19, 0) 
    VSpeedButton.AnchorPoint = Vector2.new(0.5, 0.5)
    VSpeedButton.AutoButtonColor = true
    VSpeedButton.Draggable = true
    VSpeedButton.Active = true
    VSpeedButton.ZIndex = 1
    Instance.new("UICorner", VSpeedButton).CornerRadius = UDim.new(0, 10)
    
    local VelocitySpeedButtonUIStroke = Instance.new("UIStroke",VSpeedButton)
    VelocitySpeedButtonUIStroke.Thickness = 4
    VelocitySpeedButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    VelocitySpeedButtonUIStroke.Color = Color3.fromRGB(40, 40, 80)
    
    local HideButton = Instance.new("TextButton", GUIHolder)
    HideButton.Name = "HideButton"
    HideButton.Text = "Hide"
    HideButton.Font = Enum.Font.GothamBold
    HideButton.TextSize = 20
    HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    HideButton.TextTransparency = 0
    HideButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    HideButton.TextStrokeTransparency = 0
    HideButton.TextScaled = false
    HideButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    HideButton.BorderSizePixel = 0
    HideButton.Size = UDim2.new(0, 100, 0, 45) 
    HideButton.Position = UDim2.new(0.35, 0, 0.15, 0) 
    HideButton.AnchorPoint = Vector2.new(0.5, 0.5)
    HideButton.AutoButtonColor = true
    HideButton.Draggable = true
    HideButton.Active = true
    HideButton.ZIndex = 1
    Instance.new("UICorner", HideButton).CornerRadius = UDim.new(0, 10)
    
    local HideButtonUIStroke = Instance.new("UIStroke",HideButton)
    HideButtonUIStroke.Thickness = 4
    HideButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    HideButtonUIStroke.Color = Color3.fromRGB(40, 40, 80)
    
    local RemoveButton = Instance.new("TextButton", GUIHolder)
    RemoveButton.Name = "RemoveButton"
    RemoveButton.Text = "Remove"
    RemoveButton.Font = Enum.Font.GothamBold
    RemoveButton.TextSize = 20
    RemoveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    RemoveButton.TextTransparency = 0
    RemoveButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    RemoveButton.TextStrokeTransparency = 0
    RemoveButton.TextScaled = false
    RemoveButton.RichText = true
    RemoveButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    RemoveButton.BackgroundTransparency = 0
    RemoveButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    RemoveButton.BorderSizePixel = 0
    RemoveButton.Size = UDim2.new(0, 100, 0, 45) 
    RemoveButton.Position = UDim2.new(0.65, 0, 0.15, 0) 
    RemoveButton.AnchorPoint = Vector2.new(0.5, 0.5)
    RemoveButton.AutoButtonColor = true
    RemoveButton.Selected = false
    RemoveButton.Draggable = true
    RemoveButton.ZIndex = 1
    Instance.new("UICorner", RemoveButton).CornerRadius = UDim.new(0, 10)
    
    local RemoveButtonUIStroke = Instance.new("UIStroke",RemoveButton)
    RemoveButtonUIStroke.Thickness = 4
    RemoveButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    RemoveButtonUIStroke.Color = Color3.fromRGB(40, 40, 80)
    
    
    
    --// CONNECTIONS
    
    
    
    Connections[#Connections+1] = VSpeedButton.MouseButton1Down:Connect(function()
        DraggingTicks.VSpeed = os.clock()
    end)
    
    Connections[#Connections+1] = VSpeedButton.MouseButton1Up:Connect(function()
        if os.clock() - DraggingTicks.VSpeed > 0.15 then return end
        SpeedLabel.Text = "Velocity Speed: "..tostring(VSpeed.Speed)
        VSpeed.Enabled = not VSpeed.Enabled
        VSpeedButton.Text = VSpeed.Enabled and 'VSpeed: <font color="rgb(0,255,0)" size="20">ON</font>' or 'VSpeed: <font color="rgb(255,0,0)" size="20">OFF</font>'
        VelocitySpeed(VSpeed.Enabled)
    end)
    
    Connections[#Connections+1] = HideButton.MouseButton1Down:Connect(function()
        DraggingTicks.Hide = os.clock()
    end)
    
    Connections[#Connections+1] = HideButton.MouseButton1Up:Connect(function()
        if os.clock() - DraggingTicks.Hide > 0.15 then return end
        HideButton.Text = HideButton.Text == "Hide" and "Show" or "Hide"
        Container.Visible = HideButton.Text == "Hide" and true or false
        RemoveButton.Visible = HideButton.Text == "Hide" and true or false
    end)
    
    Connections[#Connections+1] = RemoveButton.MouseButton1Down:Connect(function()
        DraggingTicks.Remove = os.clock()
    end)
    
    Connections[#Connections+1] = RemoveButton.MouseButton1Up:Connect(function()
        if os.clock() - DraggingTicks.Remove > 0.15 then return end
        VSpeed.Enabled = false
        VSpeed.GUI = nil
        DraggingTicks = nil
        VelocitySpeed(VSpeed.Enabled)
        GUIHolder:Destroy()
        for Index, Connection in Connections do 
            Connection:Disconnect() 
            Connections[Index] = nil 
        end
        Connections = nil
    end)
elseif Services.UserInput.KeyboardEnabled or Services.UserInput.GamepadEnabled then
    Connections["InputBegan"] = Services.UserInput.InputBegan:Connect(function(Input, Typing)
        if not Services.UserInput.KeyboardEnabled and not Services.UserInput.GamepadEnabled then Connections["InputBegan"]:Disconnect() Connections["InputBegan"] = nil end
        if Typing then return end
        
        if Input.KeyCode == Enum.KeyCode[VSpeed.Keybinds.VSpeed] then
            VSpeed.Enabled = not VSpeed.Enabled
            VelocitySpeed(VSpeed.Enabled)
            SpeedLabel.Text = "Tpwalk Speed: " .. tostring(VSpeed.Speed)
        end
        
        if Input.KeyCode == Enum.KeyCode[VSpeed.Keybinds.Hide] then
            Container.Visible = not Container.Visible
        end
        
        if Input.KeyCode == Enum.KeyCode[VSpeed.Keybinds.Remove] then
            VSpeed.Enabled = false
            VSpeed.GUI = nil
            DraggingTicks = nil
            VelocitySpeed(VSpeed.Enabled)
            GUIHolder:Destroy()
            for Index, Connection in Connections do 
                Connection:Disconnect() 
                Connections[Index] = nil 
            end
            Connections = nil
        end
    end)
end

Connections[#Connections+1] = SpeedChanger.FocusLost:Connect(function()
    local Number = tonumber(SpeedChanger.Text)
    local String = tostring(Number)
    
    SpeedChanger.Text = String ~= "nil" and SpeedChanger.Text or tostring(VSpeed.Speed)
    SpeedLabel.Text = "Speed: "..SpeedChanger.Text
    VSpeed.Speed = tonumber(SpeedChanger.Text)
end)

VSpeed.GUI = GUIHolder
VSpeed.Connections = Connections
