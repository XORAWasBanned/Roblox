getgenv().AfkMode = true

if not game.IsLoaded then game.Loaded:Wait() end
if AfkMode then queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Anime%20Apocalypse.luau", true)) end

if workspace:GetAttribute("NoCooldowns") then return end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Assets = ReplicatedStorage:WaitForChild("Assets")
local Remotes = Assets:WaitForChild("Remotes")
local Interact, UsedAbility = Remotes:WaitForChild("Interact"), Remotes:WaitForChild("UsedAbility")
local CombatData = require(Assets:WaitForChild("Modules"):WaitForChild("CombatData"))
local Utils = require(Assets:WaitForChild("Modules"):WaitForChild("Utils"))

local Drops, Enemies = workspace:WaitForChild("Thrown"), workspace:WaitForChild("Zombies")

local CurrentAngle, M1LastTime, M1Cooldown, AbilityCooldowns = 0, 0, 0, {}

local Client = Players.LocalPlayer
local Data = Client:WaitForChild("Data")
local PlayerGui = Client:WaitForChild("PlayerGui")
local HUD = PlayerGui:WaitForChild("HUD")
local AbilitySlots, GadgetSlots = Data:WaitForChild("AbilitySlots"), Data:WaitForChild("GadgetSlots")

local GetTarget = function(Origin, EnemiesList)
    local Target = { Distance = math.huge }
    for _, Enemy in (EnemiesList or Enemies:GetChildren()) do
        if Enemy:GetAttribute("Untargetable") then continue end
        local RootPart, Config = Enemy:FindFirstChild("HumanoidRootPart"), Enemy:FindFirstChild("Config")
        local Health = Config and Config:FindFirstChild("Health")
        local Distance = RootPart and (RootPart.Position - Origin).Magnitude
        if not (RootPart and Health and Health.Value > 0) then continue end
        local IsBoss = Enemy:GetAttribute("RaidBoss")
        if IsBoss and not Target.IsBoss or IsBoss == Target.IsBoss and Distance < Target.Distance then
            Target = {
                Config = Config,
                Character = Enemy,
                RootPart = RootPart,
                Position = RootPart.Position,
                Distance = Distance,
                IsBoss = IsBoss
            }
        end
    end
    return Target.RootPart and Target or nil
end
local GetSlot = function(Name, IsGadget)
    local Slots = IsGadget and GadgetSlots or AbilitySlots
    for Slot, Data in Utils.Decode(Slots.Value) do
        if Data and Data.Name == Name and (not IsGadget or Data.Equipped) then return Slot end
    end
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

local Fire = function(Name, Type, ...)
    if Type == "M1" then
        local Ready, CurrentTime, AttackSpeed = IsM1Ready(Name)
        if not Ready then return end
        local Combat = CombatData[Name]
        if not Combat then return end
        local HitCount = 1
        if CurrentTime - M1LastTime <= 1 then
            HitCount = math.floor((CurrentTime - M1LastTime) / (M1Cooldown / AttackSpeed)) + 1
            HitCount = math.clamp(HitCount, 1, 4)
        end
        local AttackData = Combat["LightAttack" .. HitCount]
        if not AttackData then return end
        M1Cooldown, M1LastTime = AttackData.M1CD or 0.4, CurrentTime
        Interact:FireServer("M1", Name, CurrentTime)
    elseif Type == "Ability" then
        local Ability, Slot = select(1, ...), GetSlot(Name)
        if not (IsAbilityReady(Ability) and Slot) then return end
        Interact:FireServer("Ability", Ability, Slot, Name, "Began")
    elseif Type == "Gadget" then
        local Meter, Slot = Client:FindFirstChild("GadgetMeter"), GetSlot(Name, true)
        if not (Meter and Meter.Value >= 800 and Slot) then return end
        Interact:FireServer("Gadget", Slot, Name, "Began")
    end
end

UsedAbility.OnClientEvent:Connect(function(_, Duration, AbilityName, Slot)
    if not Slot then return end
    SetAbilityCooldown(Slot, AbilityName, Duration)
end)

RunService.Heartbeat:Connect(function(DeltaTime)
    PlayerGui = Client:WaitForChild("PlayerGui")
    if PlayerGui then HUD = PlayerGui:WaitForChild("HUD") end
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
    
    local EnemiesList = Enemies:GetChildren()
    if #EnemiesList == 0 then
        pcall(function()
            for _, Door in workspace.Map.Objective.Entries:GetChildren() do
                if AfkMode then RootPart.CFrame = Door:GetPivot() end
                fireproximityprompt(Door.Attachment.ProximityPrompt) 
            end
        end)
        return
    end
    
    task.spawn(function()
        local Enemy = GetTarget(RootPart.Position, EnemiesList)
        if not Enemy then return end
        
        if AfkMode then
            local TargetPosition = Enemy.Position - Enemy.RootPart.CFrame.LookVector * 10
            RootPart.Velocity = vector.zero
            RootPart.CFrame = CFrame.lookAt(TargetPosition, Enemy.Position)
        else
            local Origin, Target = RootPart.Position, Enemy.Position
            RootPart.CFrame = CFrame.lookAt(Origin, vector.create(Target.X, Origin.Y, Target.Z))
        end
    end)
    
    task.spawn(function()
        Fire("Soul Reaper", "Ability", 4)
        Fire("Ice Amulet", "Gadget")
        Fire("Elf Mage", "M1")
        Fire("Elf Mage", "Ability", 1)
        Fire("Elf Mage", "Ability", 2)
        Fire("Elf Mage", "Ability", 3)
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
