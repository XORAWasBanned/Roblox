if not game:IsLoaded() then game.Loaded:Wait() end

local Services = setmetatable({}, {
    __index = function(Self, Name)
        local FetchService = function(Name) local Success, Service = pcall(game.GetService, game, Name) return Success and Service end
        local Service = FetchService(Name) or FetchService(Name.."Service")
        rawset(Self, Name, cloneref and cloneref(Service) or Service)
        return rawget(Self, Name)
    end
})

local Client, Connections = {}, {}



--// FUNCTIONS



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
    Client.Player = Services.Players.LocalPlayer
    Client.Character = Client.Player.Character or Client.Player.CharacterAdded:Wait()
    Client.RootPart = WaitForChild({Parent = Client.Character, Child = "HumanoidRootPart"})
    
    Client.VisualizerCreate = function(Configuration)
        if not Client.Character or not Client.RootPart then return end
        
        local Name, Material, DeleteAccessories = Configuration.Name or "Visualizer", Configuration.Material or Enum.Material.ForceField, Configuration.DeleteAccessories
        local RealDescendants, RealParts, CanCollideConnections = Client.Character:GetDescendants(), {}, {}
        local Buffer, Following, BufferMaxAge = {}, false, 1.5
        local BindName = "Visualizer_" .. Services.HttpService:GenerateGUID(false)
        
        Client.Character.Archivable = true
        local Clone = Client.Character:Clone()
        Client.Character.Archivable = false
        if not Clone then return end
        
        local CloneDescendants = Clone:GetDescendants()
        for Index, RealInstance in RealDescendants do
            local CloneInstance = CloneDescendants[Index]
            if RealInstance:IsA("BasePart") and CloneInstance and CloneInstance:IsA("BasePart") then
                RealParts[RealInstance] = CloneInstance
            end
        end
        
        Clone.Archivable, Clone.Name = false, Name
        Clone:PivotTo(CFrame.new(0, 1/0, 0))
        
        local FakeRoot = Clone:FindFirstChild("FakeRoot")
        if FakeRoot then FakeRoot:Destroy() end
        
        for _, Instance in Clone:GetDescendants() do
            if Instance:IsA("BasePart") then
                Instance.Anchored, Instance.CanCollide, Instance.CanQuery, Instance.CanTouch, Instance.Massless, Instance.Material, Instance.CastShadow, Instance.Transparency = true, false, false, false, true, Material, false, 1
                table.insert(CanCollideConnections, Instance:GetPropertyChangedSignal("CanCollide"):Connect(function()
                    Instance.CanCollide = false
                end))
                task.delay(0, function() Instance.CanCollide = false end)
            elseif Instance:IsA("Decal") or Instance:IsA("Texture") then
                Instance:Destroy()
            elseif Instance:IsA("Script") or Instance:IsA("LocalScript") or Instance:IsA("Animator") then
                Instance:Destroy()
            elseif DeleteAccessories and Instance:IsA("Accessory") then
                Instance:Destroy()
            elseif Instance:IsA("Humanoid") then
                Instance.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            end
        end
        
        for RealPart, ClonePart in RealParts do
            if not ClonePart:IsDescendantOf(Clone) then RealParts[RealPart] = nil end
        end
        
        Clone.Parent = Client.Character.Parent
        
        local RecordSnapshot = function(DisplayCFrame)
            if not Client.RootPart then return end
            local RealRoot, Offsets = Client.RootPart.CFrame, {}
            for RealPart, ClonePart in RealParts do
                Offsets[ClonePart] = RealRoot:ToObjectSpace(RealPart.CFrame)
            end
            table.insert(Buffer, {Time = os.clock(), CFrame = DisplayCFrame, Offsets = Offsets})
            while #Buffer > 0 and os.clock() - Buffer[1].Time > BufferMaxAge do table.remove(Buffer, 1) end
        end
        
        local ApplyDelayed = function(DelayTime)
            if #Buffer == 0 then return end
            local RenderTime = os.clock() - DelayTime
            local A, B = Buffer[1], Buffer[#Buffer]
            
            for Index = 1, #Buffer - 1 do
                if RenderTime >= Buffer[Index].Time and RenderTime <= Buffer[Index + 1].Time then
                    A, B = Buffer[Index], Buffer[Index + 1]
                    break
                end
            end
            
            local Alpha = A.Time == B.Time and 0 or math.clamp((RenderTime - A.Time) / (B.Time - A.Time), 0, 1)
            local DisplayCFrame = A.CFrame:Lerp(B.CFrame, Alpha)
            
            for ClonePart, OA in A.Offsets do
                local OB = B.Offsets[ClonePart]
                if OB then ClonePart.CFrame = DisplayCFrame * OA:Lerp(OB, Alpha) end
            end
        end
        
        Services.Run:BindToRenderStep(BindName, 1, function(DeltaTime)
            if Following and Client.RootPart then RecordSnapshot(Client.RootPart.CFrame) end
            local DataPing, PhysicsSenderRate = Services.Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000, 1/getfflag("S2PhysicsSenderRate")
            ApplyDelayed(DataPing + DeltaTime + PhysicsSenderRate)
        end)
        
        local Visualizer = {Self = Clone}
        
        Visualizer.SetCFrame = function(CFrameValue) RecordSnapshot(CFrameValue) end
        Visualizer.Follow = function(State) Following = State end
        
        Visualizer.SetVisibility = function(Visible)
            for _, Instance in Clone:GetDescendants() do
                if Instance:IsA("BasePart") then Instance.Transparency = Visible and 0.4 or 1 end
            end
            if not Visible then Clone:PivotTo(CFrame.new(0, 1/0, 0)) Buffer = {} end
        end
        
        Visualizer.Destroy = function()
            Services.Run:UnbindFromRenderStep(BindName)
            for _, Connection in CanCollideConnections do Connection:Disconnect() end
            Clone:Destroy()
        end
        
        return Visualizer
    end
    
    local function OnDeath()
        if Connections.ClientCharacterRemoving then Connections.ClientCharacterRemoving:Disconnect() Connections.ClientCharacterRemoving = nil end
        Connections.ClientCharacterRemoving = Client.Player.CharacterRemoving:Once(function()
            Client.Character, Client.RootPart = nil, nil
        end)
    end; OnDeath()
    
    Connections.ClientCharacterAdded = Client.Player.CharacterAdded:Connect(function(Character)
        Client.Character = Character
        Client.RootPart = WaitForChild({Parent = Client.Character, Child = "HumanoidRootPart"})
        OnDeath()
    end)
end; InitClient()

local InitServerVisualizer = function()
    Client.ServerVisualizer = Client.VisualizerCreate({Name = "ServerVisualizer", Material = Enum.Material.ForceField})
    if not Client.ServerVisualizer then return end
    Client.ServerVisualizer.SetVisibility(true)
    Client.ServerVisualizer.Follow(true)
end; InitServerVisualizer()
