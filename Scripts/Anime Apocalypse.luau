if not game.IsLoaded then game.Loaded:Wait() end
queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Anime%20Apocalypse.luau", true))

if workspace:GetAttribute("NoCooldowns") then return end
getgenv().AfkMode = false

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Assets = ReplicatedStorage:WaitForChild("Assets")
local Remotes = Assets:WaitForChild("Remotes")
local Interact, UsedAbility = Remotes:WaitForChild("Interact"), Remotes:WaitForChild("UsedAbility")
local CombatData = require(Assets:WaitForChild("Modules"):WaitForChild("CombatData"))
local Utils = require(Assets:WaitForChild("Modules"):WaitForChild("Utils"))

local Drops, Enemies = workspace:WaitForChild("Thrown"), workspace:WaitForChild("Zombies")

local Boss, CurrentAngle, M1LastTime, M1Cooldown, AbilityCooldowns = nil, 0, 0, 0, {}

local Client = Players.LocalPlayer
local HUD = Client:WaitForChild("PlayerGui"):WaitForChild("HUD")
local AbilitySlotData = Client:WaitForChild("Data"):WaitForChild("AbilitySlots")
local GadgetSlotData = Client:WaitForChild("Data"):WaitForChild("GadgetSlots")

local GetCharacterSlot = function(Character)
    for Slot, Data in Utils.Decode(AbilitySlotData.Value) do
        if Data and Data.Name == Character then return Slot end
        
    end
    
end

local GetGadgetSlot = function(Gadget)
    for Slot, Data in Utils.Decode(GadgetSlotData.Value) do
        if Data and Data.Name == Gadget and Data.Equipped then return Slot end
        
    end
    
end

local GetTarget = function(Origin, EnemyList)
    local Enemy = {
        Distance = math.huge
    }

    for _, Instance in EnemyList do
        if Instance:GetAttribute("Untargetable") then continue end
        
        local Humanoid = Instance:FindFirstChildOfClass("Humanoid")
        local RootPart = Instance:FindFirstChild("HumanoidRootPart")
        if not (Humanoid and RootPart and Humanoid.Health > 0) then continue end
        
        local Distance = (RootPart.Position - Origin).Magnitude
        if Distance >= Enemy.Distance then continue end
        
        Enemy = {
            Instance = Instance,
            Humanoid = Humanoid,
            RootPart = RootPart,
            Position = RootPart.Position,
            Distance = Distance,
            IsBoss = Instance:GetAttribute("RaidBoss")
        }
        
    end
    
    return Enemy.RootPart and Enemy or nil
end

local IsAbilityReady = function(Ability)
    local Cooldown = AbilityCooldowns[Ability]
    
    return not Cooldown or tick() >= Cooldown.EndTime
end

local SetAbilityCooldown = function(Ability, Name, Duration)
    if not (Ability and Name and Duration and Duration > 0) then return end
    
    AbilityCooldowns[Ability] = {
        Name = Name,
        Duration = Duration,
        EndTime = tick() + Duration
    }
    
end

local IsM1Ready = function(Character)
    local CurrentTime = workspace:GetServerTimeNow()
    local AttackSpeed = Utils.GetTraitBuffs(Client).AttackSpeedMulti or 1
    local HasteBoost = Client.Character and Client.Character:FindFirstChild("HasteBoost")
    
    if HasteBoost then AttackSpeed *= HasteBoost.Value end
    
    return M1Cooldown / AttackSpeed <= CurrentTime - M1LastTime, CurrentTime, AttackSpeed
end

local FireAbility = function(Ability, Character)
    if not IsAbilityReady(Ability) then return end
    
    local CharacterSlot = GetCharacterSlot(Character)
    if not CharacterSlot then return end
    
    Interact:FireServer("Ability", Ability, CharacterSlot, Character, "Began")
end

local FireM1 = function(Character)
    if not Character then return end
    
    local Ready, CurrentTime, AttackSpeed = IsM1Ready(Character)
    if not Ready then return end
    
    local Data = CombatData[Character]
    if not Data then return end
    
    local HitCount = 1
    
    if CurrentTime - M1LastTime <= 1 then
        HitCount = math.floor((CurrentTime - M1LastTime) / (M1Cooldown / AttackSpeed)) + 1
        HitCount = math.clamp(HitCount, 1, 4)
        
    end
    
    local AttackData = Data["LightAttack" .. HitCount]
    if not AttackData then return end
    
    M1Cooldown, M1LastTime = AttackData.M1CD or 0.4, CurrentTime
    Interact:FireServer("M1", Character, CurrentTime)
end

local FireGadget = function(Gadget)
    local Meter = Client:FindFirstChild("GadgetMeter")
    if not (Meter and Meter.Value >= 800) then return end
    
    local GadgetSlot = GetGadgetSlot(Gadget)
    if not GadgetSlot then return end
    
    Interact:FireServer("Gadget", GadgetSlot, Gadget, "Began")
end

UsedAbility.OnClientEvent:Connect(function(_, Duration, AbilityName, Slot)
    if not Slot then return end
    
    SetAbilityCooldown(Slot, AbilityName, Duration)
end)

RunService.Heartbeat:Connect(function(DeltaTime)
    if not HUD.Enabled then HUD.Enabled = true end
    
    if AfkMode and HUD.EndScreen.Visible then
        Interact:FireServer("PlayAgain")
        HUD.EndScreen.Visible = false
    end
    
    if HUD.StartRaid.Visible then
        Interact:FireServer("VoteSkipRaid")
        HUD.StartRaid.Visible = false
    end
    
    if HUD.BossSkipVote.Visible then
        Interact:FireServer("VoteSkipBossCutscene")
        HUD.BossSkipVote.Visible = false
    end
    
    local Character = Client.Character
    local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return end
    
    local EnemyList = Enemies:GetChildren()
    if #EnemyList == 0 then
        pcall(function()
            for _, Door in workspace.Map.Objective.Entries:GetChildren() do
                fireproximityprompt(Door.Attachment.ProximityPrompt)
                
            end
            
        end)
        
        return
    end
    
    task.spawn(function()
        local Enemy = GetTarget(RootPart.Position, EnemyList)
        if not Enemy then return end
        
        if AfkMode then
            RootPart.Velocity = vector.zero
            
        end
        
        if not Enemy.IsBoss then
            if not AfkMode then
                CurrentAngle = (CurrentAngle + (360 * math.pi) * DeltaTime) % 360
                RootPart.CFrame = CFrame.new(RootPart.Position) * CFrame.Angles(0, math.rad(CurrentAngle), 0)
            else
                local TargetPosition = Enemy.Position + Enemy.RootPart.CFrame.LookVector * 5
                RootPart.CFrame = CFrame.lookAt(TargetPosition, Enemy.Position)
            end
            
            return
        end
        
        local Origin, Target = RootPart.Position, Enemy.Position
        
        if not AfkMode then
            RootPart.CFrame = CFrame.lookAt(Origin, vector.create(Target.X, Origin.Y, Target.Z))
        else
            RootPart.CFrame = CFrame.lookAt(Target + vector.create(0, 15, 0), Target)
        end
        
    end)
    
    task.spawn(function()
        FireAbility(4, "Soul Reaper")
        FireGadget("Ice Amulet")
        FireM1("Elf Mage")
        FireAbility(1, "Elf Mage")
        FireAbility(2, "Elf Mage")
        FireAbility(3, "Elf Mage")
    end)
end)

Drops.ChildAdded:Connect(function(Child)
    if Child.Name:find("Hit") or Child.Name == "Cero" then Child:Destroy() return end
    if not Child:FindFirstChild("Pickup") then return end
    
    Child.Pickup:FireServer()
end)

workspace.Terrain.ChildAdded:Connect(function(Child)
    if Child.ClassName == "Beam" or Child.Name == "Start" then Child:Destroy() end
    
end)

workspace.ChildAdded:Connect(function(Child)
    if Child.Name == "CeroHitboxRoot" then Child:Destroy() end
    
end)
