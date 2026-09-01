getgenv().AfkMode = true
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Remotes = ReplicatedStorage.Assets.Remotes
local Interact, UsedAbility = Remotes.Interact, Remotes.UsedAbility
local CombatData = require(ReplicatedStorage.Assets.Modules.CombatData)

local Drops, Enemies = workspace.Thrown, workspace.Zombies

local Boss, CurrentAngle, M1LastTime, M1Cooldown, AbilityCooldowns, AbilitySlots = nil, 0, 0, 0.4, {}, {
    [4] = "Z",
    [2] = "X",
    [3] = "C"
}

local Client = Players.LocalPlayer
local HUD = Client.PlayerGui.HUD

local IsAbilityReady = function(Ability)
    local Cooldown = AbilityCooldowns[Ability]
    return not Cooldown or tick() >= Cooldown.EndTime
end

local SetAbilityCooldown = function(Ability, Name, Duration)
    if not (Ability and Name and Duration and Duration > 0) then return end
    AbilityCooldowns[Ability] = { Name = Name, Duration = Duration, EndTime = tick() + Duration }
end

local GetCharacter = function()
    return _G.LocalShowcasingAbility or (function()
        local AbilitySlots = Client:WaitForChild("Data"):WaitForChild("AbilitySlots")
        for _, Data in require(ReplicatedStorage.Assets.Modules.Utils).Decode(AbilitySlots.Value) do
            if Data and Data.Showcasing then return Data.Name end
        end
    end)()
end

local IsM1Ready = function(Character)
    local CurrentTime = workspace:GetServerTimeNow()
    local AttackSpeed = require(ReplicatedStorage.Assets.Modules.Utils).GetTraitBuffs(Client).AttackSpeedMulti or 1
    local HasteBoost = Client.Character and Client.Character:FindFirstChild("HasteBoost")
    if HasteBoost then AttackSpeed *= HasteBoost.Value end
    return M1Cooldown / AttackSpeed <= CurrentTime - M1LastTime, CurrentTime, AttackSpeed
end

local FireAbility = function(Ability, Character)
    if not IsAbilityReady(Ability) then return end
    Interact:FireServer("Ability", Ability, "Slot2", Character, "Began")
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
    Interact:FireServer("Gadget", "Slot2", Gadget, "Began")
end

UsedAbility.OnClientEvent:Connect(function(_, Duration, AbilityName, Slot)
    if not (Slot and AbilitySlots[Slot]) then return end
    SetAbilityCooldown(Slot, AbilityName, Duration)
end)

RunService.Heartbeat:Connect(function(DeltaTime)
    if not HUD.Enabled then
        HUD.Enabled = true
    end
    
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
    
    if #Enemies:GetChildren() == 0 then
        pcall(function()
            for _, Door in workspace.Map.Objective.Entries:GetChildren() do
                fireproximityprompt(Door.Attachment.ProximityPrompt)
            end
        end)
        return
    end
    
    task.spawn(function()
        if not Boss then
            for _, Enemy in Enemies:GetChildren() do
                if not Enemy:GetAttribute("RaidBoss") or Enemy:GetAttribute("Untargetable") then continue end
                local EnemyRootPart = Enemy:FindFirstChild("HumanoidRootPart")
                if not EnemyRootPart then continue end
                Boss = Enemy.Name
                break
            end
        end
        
        if not Boss then
            CurrentAngle = (CurrentAngle + (360 * math.pi) * DeltaTime) % 360
            RootPart.CFrame = CFrame.new(RootPart.Position) * CFrame.Angles(0, math.rad(CurrentAngle), 0)
            return
        end
        
        local BossEnemy = Enemies:FindFirstChild(Boss)
        local TargetRootPart = BossEnemy and BossEnemy:FindFirstChild("HumanoidRootPart")
        if not TargetRootPart or BossEnemy:GetAttribute("Untargetable") then Boss = nil return end
        local Origin, Target = RootPart.Position, TargetRootPart.Position
        
        if not AfkMode then
            RootPart.CFrame = CFrame.lookAt(Origin, vector.create(Target.X, Origin.Y, Target.Z))
        else
            RootPart.CFrame = CFrame.lookAt(Target + vector.create(0, 0, 0), Target)
            FireAbility(3, "Soul Reaper")
        end
    end)
    
    task.spawn(function()
        --FireAbility(4, "Soul Reaper")
        --FireAbility(2, "Soul Reaper")
        --FireAbility(3, "Soul Reaper")
        --FireM1("Soul Reaper")
        --FireGadget("Ice Amulet")
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

queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Anime%20Apocalypse.luau", true))
