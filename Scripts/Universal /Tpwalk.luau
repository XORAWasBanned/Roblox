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
Universal Tpwalk:
- Release: 2023/11/1
- Last Update: 2025/12/11
- Version: 1.2.5

- Lastest Update Log: Fixed issues within the script.

© 2023 X_ORA. All Rights Reserved.
]]--

if not game:IsLoaded() then game.Loaded:Wait() end

--// Script - Tpwalk \\--
getgenv().Tpwalk = Tpwalk or {}
Tpwalk.Name = Tpwalk.Name or "Teleport Walk"
Tpwalk.Enabled = Tpwalk.Enabled or false
Tpwalk.Speed = Tpwalk.Speed or 1
Tpwalk.GUI = Tpwalk.GUI
Tpwalk.Keybinds = Tpwalk.Keybinds or {}
Tpwalk.Keybinds.Tpwalk = Tpwalk.Keybinds.Tpwalk or "T" or "ButtonA"
Tpwalk.Keybinds.Hide = Tpwalk.Keybinds.Hide or "H" or "ButtonB"
Tpwalk.Keybinds.Remove = Tpwalk.Keybinds.Remove or "R" or "ButtonC"

if not game.IsLoaded then game.Loaded:Wait() end

loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Anti-Cheats%20Bypassers%20/Adonis.luau", true))()

local CloneReference = cloneref or function(...) return ... end
local Services = setmetatable({}, {
    __index = function(Self, Key)
        local Success, Service = pcall(game.FindService, game, Key)
        if not (Success and Service) then 
            Success, Service = pcall(game.FindService, game, Key.."Service") 
            if not (Success and Service) then warn(Key, "Doesn't exist as a service!") return end
        end
        rawset(Self, Key, CloneReference(Service))
        return rawget(Self, Key)
    end
})

local HiddenGui = gethui and gethui() or Services.CoreGui

local LocalPlayer = Services.Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local LocalHumanoid = LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid", 10)
local LocalRootPart = LocalHumanoid.RootPart or LocalCharacter:WaitForChild("HumanoidRootPart", 10)

local Connections = {}



--// FUNCTIONS



local function TeleportWalk(Enabled)
    if Enabled == true then
        Services.Run:BindToRenderStep("Teleport Walk", Enum.RenderPriority.Camera.Value - 1, function(DeltaTime)
            if not (LocalCharacter and LocalHumanoid and LocalRootPart) then return end
            LocalRootPart.CFrame = LocalRootPart.CFrame + LocalHumanoid.MoveDirection * DeltaTime * Tpwalk.Speed
        end)
    else
        Services.Run:UnbindFromRenderStep("Teleport Walk")
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



local DraggingTicks = { Tpwalk = 0, Hide = 0, Remove = 0 }

if Tpwalk.GUI then 
    Tpwalk.GUI:Destroy() 
    Tpwalk.GUI = nil
    
    Services.Run:UnbindFromRenderStep("Teleport Walk") 
    
    if Tpwalk.Connections then
        for Index, Connection in Tpwalk.Connections do
            Connection:Disconnect()
            Connections[Index] = nil
        end
        Tpwalk.Connections = nil
    end
    
    TeleportWalk(Tpwalk.Enabled)
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
TitleLabel.Text = Tpwalk.Name
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
SpeedLabel.Text = Tpwalk.Enabled and "Speed: "..tostring(Tpwalk.Speed) or "Greetings " .. LocalPlayer.DisplayName 
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
SpeedChanger.Text = Tpwalk.Enabled and tostring(Tpwalk.Speed) or ""
SpeedChanger.Font = Enum.Font.GothamBold
SpeedChanger.TextSize = 14.5
SpeedChanger.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedChanger.TextStrokeTransparency = 1
SpeedChanger.TextScaled = false
SpeedChanger.TextWrapped = true
SpeedChanger.PlaceholderText = "Change Tpwalk Here!"
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
    local TpwalkButton = Instance.new("TextButton", GUIHolder)
    TpwalkButton.Name = "TpwalkButton"
    TpwalkButton.Text = Tpwalk.Enabled and 'Tpwalk: <font color="rgb(0,255,0)" size="20">ON</font>' or 'Tpwalk: <font color="rgb(255,0,0)" size="20">OFF</font>'
    TpwalkButton.Font = Enum.Font.GothamBold
    TpwalkButton.TextSize = 20
    TpwalkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TpwalkButton.TextTransparency = 0
    TpwalkButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    TpwalkButton.TextStrokeTransparency = 0
    TpwalkButton.TextScaled = false
    TpwalkButton.RichText = true
    TpwalkButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    TpwalkButton.BorderSizePixel = 0
    TpwalkButton.Size = UDim2.new(0, 125, 0, 45) 
    TpwalkButton.Position = UDim2.new(0.5, 0, 0.19, 0) 
    TpwalkButton.AnchorPoint = Vector2.new(0.5, 0.5)
    TpwalkButton.AutoButtonColor = true
    TpwalkButton.Draggable = true
    TpwalkButton.Active = true
    TpwalkButton.ZIndex = 1
    
    local TeleportWalkButtonUIStroke = Instance.new("UIStroke",TpwalkButton)
    TeleportWalkButtonUIStroke.Thickness = 4
    TeleportWalkButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    TeleportWalkButtonUIStroke.Color = Color3.fromRGB(40, 40, 80)
    Instance.new("UICorner", TpwalkButton).CornerRadius = UDim.new(0, 10)
    
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
    
    
    
    Connections[#Connections+1] = TpwalkButton.MouseButton1Down:Connect(function()
        DraggingTicks.Tpwalk = os.clock()
    end)
    
    Connections[#Connections+1] = TpwalkButton.MouseButton1Up:Connect(function()
        if os.clock() - DraggingTicks.Tpwalk > 0.15 then return end
        SpeedLabel.Text = "Tpwalk: "..tostring(Tpwalk.Speed)
        Tpwalk.Enabled = not Tpwalk.Enabled
        TpwalkButton.Text = Tpwalk.Enabled and 'Tpwalk: <font color="rgb(0,255,0)" size="20">ON</font>' or 'Tpwalk: <font color="rgb(255,0,0)" size="20">OFF</font>'
        TeleportWalk(Tpwalk.Enabled)
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
        Tpwalk.Enabled = false
        Tpwalk.GUI = nil
        DraggingTicks = nil
        TeleportWalk(Tpwalk.Enabled)
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
        
        if Input.KeyCode == Enum.KeyCode[Tpwalk.Keybinds.Tpwalk] then
            Tpwalk.Enabled = not Tpwalk.Enabled
            TeleportWalk(Tpwalk.Enabled)
            SpeedLabel.Text = "Tpwalk Speed: " .. tostring(Tpwalk.Speed)
        end
        
        if Input.KeyCode == Enum.KeyCode[Tpwalk.Keybinds.Hide] then
            Container.Visible = not Container.Visible
        end
        
        if Input.KeyCode == Enum.KeyCode[Tpwalk.Keybinds.Remove] then
            Tpwalk.Enabled = false
            Tpwalk.GUI = nil
            DraggingTicks = nil
            TeleportWalk(Tpwalk.Enabled)
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
    
    SpeedChanger.Text = String ~= "nil" and SpeedChanger.Text or tostring(Tpwalk.Speed)
    SpeedLabel.Text = "Speed: "..SpeedChanger.Text
    Tpwalk.Speed = tonumber(SpeedChanger.Text)
end)

Tpwalk.GUI = GUIHolder
Tpwalk.Connections = Connections
