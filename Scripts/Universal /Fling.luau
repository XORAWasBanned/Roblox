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
Universal Fling Script:
- Release Date: 2026/09/17
- Last Update: -
- Verison: 1.0.0

- Lastest Update Log: -

© 2026 X_ORA. All Rights Reserved.
]]--

if not game:IsLoaded() then game.Loaded:Wait() end

local Services = setmetatable({}, {
    __index = function(Self, Name)
        local FetchService = function(Name) local Success, Service = pcall(game.GetService, game, Name) return Success and Service end
        local Service = FetchService(Name) or FetchService(Name.."Service")
        rawset(Self, Name, cloneref and cloneref(Service) or Service)
        return rawget(Self, Name)
    end
})

local Client, Connections, Max = {}, {}, 16384



--// FUNCTIONS



local RandomSign = function()
    return math.random(0, 1) == 1 and 1 or -1
end

local RandomAngle = function()
    return math.random() * math.pi * 2
end

local RandomVector = function(Min, Max)
    return vector.create(math.random(Min, Max), math.random(Min, Max), math.random(Min, Max))
end

local WaitForChild = function(Configuration)
    local Parent, Child, Duration, WhichIsA, DeepSearch = Configuration.Parent, Configuration.Child, Configuration.Duration, Configuration.WhichIsA, Configuration.DeepSearch
    local Start, Target = tick()
    while not Target do
        if Duration and tick() - Start >= Duration then break end
        if WhichIsA and Child then
            for _, Instance in (DeepSearch and Parent:QueryDescendants(WhichIsA) or Parent:GetChildren()) do
                if (DeepSearch and not Instance:IsA(WhichIsA)) or Instance.Name ~= Child then continue end
                Target = Instance
                break
            end
        else
            Target = WhichIsA and Parent:FindFirstChildWhichIsA(WhichIsA, DeepSearch) or Parent:FindFirstChild(Child, DeepSearch)
        end
        task.wait()
    end
    return Target
end

local InitClient = function()
    Client.Player, Client.Original = Services.Players.LocalPlayer, {}
    Client.Camera = workspace.CurrentCamera
    Client.Character = Client.Player.Character or Client.Player.CharacterAdded:Wait()
    Client.RootPart = WaitForChild({Parent = Client.Character, Child = "HumanoidRootPart"})
    
    Client.VisualizerCreate = function(Configuration)
        if not Client.Character then return end
        local Name, Material, DeleteAccessories = Configuration.Name or "Visualizer", Configuration.Material or Enum.Material.ForceField, Configuration.DeleteAccessories
        local Material = Configuration.Material or Enum.Material.ForceField
        
        Client.Character.Archivable = true
        local Clone = Client.Character:Clone()
        Client.Character.Archivable = false
        
        if not Clone then return end
        Clone.Archivable = false
        Clone.Name = Name
        Clone:PivotTo(CFrame.new(0, 1/0, 0))
        Clone.Parent = Client.Character.Parent
        
        for _, Instance in Clone:GetDescendants() do
            if Instance:IsA("BasePart") then
                Instance.Anchored = true
                Instance.CanCollide = false
                Instance.CanQuery = false
                Instance.CanTouch = false
                Instance.Massless = true
                Instance.Material = Material
                Instance.CastShadow = false
                Instance.Transparency = 1
            elseif Instance:IsA("Decal") or Instance:IsA("Texture") then
                Instance:Destroy()
            elseif Instance:IsA("Script") or Instance:IsA("LocalScript") or Instance:IsA("Sound") then
                Instance:Destroy()
            elseif DeleteAccessories and Instance:IsA("Accessory") then
                Instance:Destroy()
            elseif Instance:IsA("Humanoid") then
                Instance.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            end
        end
        
        local Visualizer = {Self = Clone}
        
        Visualizer.SetCFrame = function(CFrameValue)
            Clone:PivotTo(CFrameValue)
        end
        
        Visualizer.SetVisibility = function(Visible)
            for _, Instance in Clone:GetDescendants() do
                if Instance:IsA("BasePart") then Instance.Transparency = Visible and 0 or 1 end
            end
            if not Visible then Visualizer.SetCFrame(CFrame.new(0, 1/0, 0)) end
        end
        
        Visualizer.Destroy = function()
            Clone:Destroy()
        end
        
        return Visualizer
    end
    
    local function InitAFKDisabler()
        Connections.ClientIdled = Client.Player.Idled:Connect(function()
            Services.VirtualUser:CaptureController()
            Services.VirtualUser:ClickButton2(Vector2.new())
        end)
    end; InitAFKDisabler()
    
    local function OnDeath()
        if Connections.ClientCharacterRemoving then Connections.ClientCharacterRemoving:Disconnect() Connections.ClientCharacterRemoving = nil end
        Connections.ClientCharacterRemoving = Client.Player.CharacterRemoving:Once(function()
            Client.Character, Client.RootPart, Client.Original = nil, nil, {}
        end)
    end; OnDeath()
    
    Connections.ClientCharacterAdded = Client.Player.CharacterAdded:Connect(function(Character)
        Client.Character = Character
        Client.RootPart = WaitForChild({Parent = Client.Character, Child = "HumanoidRootPart"})
        OnDeath()
    end)
    
    Connections.CameraChanged = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        Client.Camera = workspace.CurrentCamera
    end)
end; InitClient()

local InitFling = function()
    local ScreenGui, Target = Instance.new("ScreenGui", gethui())
    ScreenGui.ResetOnSpawn = false
    ScreenGui.DisplayOrder = 2^31
    
    local TargetSelector = Instance.new("TextButton", ScreenGui)
    TargetSelector.AnchorPoint = Vector2.one * 0.5
    TargetSelector.Size = UDim2.fromOffset(150, 50)
    TargetSelector.Position = UDim2.fromScale(0.5, 0.25)
    TargetSelector.Active = true
    TargetSelector.Draggable = true
    TargetSelector.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    TargetSelector.Text = "Target: None"
    TargetSelector.TextScaled = true
    TargetSelector.TextWrapped = true
    TargetSelector.TextColor3 = Color3.new(1,1,1)
    
    local GetTarget = function()
        local Target = {Distance = math.huge}
        for _, Player in Services.Players:GetChildren() do
            if not (Player ~= Client.Player and Client.RootPart and Client.Camera) then continue end
            local Character = Player.Character
            local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
            if not RootPart then continue end
            local Position, OnScreen = Client.Camera:WorldToViewportPoint(RootPart.Position)
            local Distance = (Client.Camera.ViewportSize * 0.5 - Vector2.new(Position.X, Position.Y)).Magnitude
            if not OnScreen or Distance > Target.Distance then continue end
            Target = {Player = Player, Character = Character, RootPart = RootPart, Distance = Distance}
        end
        Target.Distance = nil
        return Target.Player and Target or nil
    end
    
    local ToggleFling = function()
        Target = not Target and GetTarget() or nil
        TargetSelector.Text = Target and "Target: " .. Target.Player.DisplayName or "Target: None"
        
        if not Target then
            Services.Run:UnbindFromRenderStep("Client Desync")
            
            if Connections.Heartbeat then
                Connections.Heartbeat:Disconnect()
                Connections.Heartbeat = nil
            end
            
            if Connections.TargetCharacterAdded then
                Connections.TargetCharacterAdded:Disconnect()
                Connections.TargetCharacterAdded = nil
            end
            
            if Connections.TargetCharacterRemoving then
                Connections.TargetCharacterRemoving:Disconnect()
                Connections.TargetCharacterRemoving = nil
            end
            
            if Client.FlingVisualizer then
                Client.FlingVisualizer.Destroy()
                Client.FlingVisualizer = nil
            end
            
            if not Client.RootPart then return end
            for Property, Value in Client.Original do
                Client.RootPart[Property] = Value or Client.RootPart[Property]
            end Client.Original = {}
        else
            Client.FlingVisualizer = Client.VisualizerCreate({
                Name = "FlingVisualizer",
                Material = Enum.Material.ForceField,
            })
            
            Connections.TargetCharacterAdded = Target.Player.CharacterAdded:Connect(function(Character)
                Target.Character = Character
                Target.RootPart = WaitForChild({Parent = Character, Child = "HumanoidRootPart"})
            end)
            
            Connections.TargetCharacterRemoving = Target.Player.CharacterRemoving:Connect(function(Character)
                Target.Character, Target.RootPart = nil, nil
            end)
            
            Connections.Heartbeat = Services.Run.Heartbeat:Connect(function()
                if Target.Player.Parent == nil then return ToggleFling() end
                if not (Client.RootPart and Target.RootPart) then return Client.FlingVisualizer and Client.FlingVisualizer.SetVisibility(false) end
                
                Client.Original = {
                    CFrame = Client.RootPart.CFrame,
                    Velocity = Client.RootPart.Velocity
                }
                
                local NewCFrame = CFrame.new(Target.RootPart.Position + RandomVector(-1, 1)) * CFrame.Angles(RandomAngle(), RandomAngle(), RandomAngle())
                
                if Client.FlingVisualizer then
                    Client.FlingVisualizer.SetVisibility(true)
                    Client.FlingVisualizer.SetCFrame(NewCFrame)
                end
                
                Client.RootPart.CFrame = NewCFrame
                Client.RootPart.Velocity = vector.create(RandomSign(), RandomSign(), RandomSign()) * Max
            end)
            
            Services.Run:BindToRenderStep("Client Desync", 199, function()
                if not (Client.RootPart and Target.RootPart) then return end
                for Property, Value in Client.Original do
                    Client.RootPart[Property] = Value
                end
            end)
        end
    end
    
    Connections.Holding = TargetSelector.MouseButton1Down:Connect(function()
        local Start = tick()
        Connections.Released = TargetSelector.MouseButton1Up:Once(function()
            if tick() - Start > 0.3 then return end
            ToggleFling()
        end)
    end)
end; InitFling()

while setfflag and task.wait(1) do
    setfflag("S2PhysicsSenderRate", "2147483648")
    setfflag("PhysicsSenderMaxBandwidthBps", "2147483648")
    setfflag("PhysicsSenderMaxBandwidthBpsScaling", "2147483648")
end
