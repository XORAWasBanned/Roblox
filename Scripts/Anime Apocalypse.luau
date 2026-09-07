getgenv().Atomizer = {
    Combat = {
        TeleportToEnemy = true,
        LookAtEnemy = true,
        AutoHit = {
            Enabled = true,
            M1s = {},
        },
        AutoAbilities = {
            Enabled = true,
            [1] = {"Elf Mage"},
            [2] = {"Elf Mage", "Soul Repear"},
            [3] = {"Elf Mage"},
            [4] = {"Soul Repear"}
        },
        AutoGadgets = {
            Enabled = true,
            Gadgets = {},
        },
    },
    Misc = {
        ExecuteOnTeleport = true,
        Replay = true,
        AutoEscape = true,
        OpenGates = true,
        VoteStartRaidBoss = true,
        VoteSkipBossCutscene = true,
        RedeemCodes = true,
    },
}

local Combat = Atomizer.Combat
local Misc = Atomizer.Misc

if not game:IsLoaded() then game.Loaded:Wait() end
if Misc.ExecuteOnTeleport then queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Anime%20Apocalypse.luau", true)) end

local Services = setmetatable({}, {
    __index = function(Self, Name)
        local FetchService = function(Name) local Success, Service = pcall(game.GetService, game, Name) return Success and Service end
        local Service = FetchService(Name) or FetchService(Name.."Service")
        rawset(Self, Name, cloneref and cloneref(Service) or Service)
        return rawget(Self, Name)
    end
})

local Client, Connections, RunIn, InLobby = {}, {}, {Heartbeat = {}}, workspace:GetAttribute("NoCooldowns")
local Assets = Services.ReplicatedStorage:FindFirstChild("Assets")
local ModulesFolder, RemotesFolder, RequestsFolder = Assets:FindFirstChild("Modules"), Assets:FindFirstChild("Remotes"), Assets:FindFirstChild("Requests")
local Drops, Enemies, MatchConfig = workspace:FindFirstChild("Thrown"), workspace:FindFirstChild("Zombies"), workspace:FindFirstChild("MatchConfig")
local Modules, Remotes = {}, { Events = {}, Functions = {} }

--// Functions

local InitModules = function(WantedModules)
    for _, Module in ModulesFolder:QueryDescendants("ModuleScript") do
        if not table.find(WantedModules, Module.Name) or Module.Parent.Name == "BezierTween" and Module.Name == "Utils" then continue end
        task.spawn(function()
            local Success, RequiredModule = pcall(require, Module)
            Modules[Module.Name] = Success and RequiredModule or nil
        end)
    end
end; InitModules({"ItemsData", "CombatData", "Utils", "ReplayPolicy", "CodeRewards"})


local InitRemotes = function()
    local GetRemotes = function(Container) 
        for _, Remote in Container:GetDescendants() do
            if Remote.ClassName == "RemoteEvent" then
                Remotes.Events[Remote.Name] = Remote
            elseif Remote.ClassName == "RemoteFunction" then
                Remotes.Functions[Remote.Name] = Remote
            end
        end
    end; GetRemotes(RemotesFolder) GetRemotes(RequestsFolder)
end; InitRemotes()

local InitClient = function()
    Client.Player, Client.Movesets, Client.Gadgets = Services.Players.LocalPlayer, {}, {}
    repeat task.wait() until Client.Player:GetAttribute("Loaded")
    Client.Guis, Client.Character = Client.Player:FindFirstChildOfClass("PlayerGui"), Client.Player.Character
    Client.Humanoid, Client.Head = Client.Character and Client.Character:FindFirstChildOfClass("Humanoid"), Client.Character and Client.Character:FindFirstChild("Head")
    Client.RootPart = Client.Humanoid and Client.Humanoid.RootPart
    Client.Data, Client.HUD = Client.Player:FindFirstChild("Data"), Client.Guis:FindFirstChild("HUD")
    
    for Slot, Moveset in Modules.Utils.Decode(Client.Data.AbilitySlots.Value) do Moveset.Slot = Slot table.insert(Client.Movesets, Moveset) end
    for Slot, Gadget in Modules.Utils.Decode(Client.Data.GadgetSlots.Value) do Gadget.Slot = Slot table.insert(Client.Gadgets, Gadget) end
    
    Client.Get = function(Name)
        for _, Moveset in Client.Movesets do
            if Moveset.Name == Name then return Moveset end
        end
        for _, Gadget in Client.Gadgets do
            if Gadget.Name == Name then return Gadget end
        end
    end
    
    local function Died()
        local function OnDeath()
            Client.Character, Client.Humanoid, Client.RootPart, Client.Head = nil, nil, nil, nil
        end
        Connections["ClientCharacterRemoving"] = Client.Player.CharacterRemoving:Once(OnDeath)
    end; Died()
    
    local function GetEquipped(Slots)
        for _, Slot in Client[Slots] do
            if not Slot.Equipped then continue end
            Client[Slots].Equipped = Slot
        end
    end
    
    Connections["ClientCharacterAdded"] = Client.Player.CharacterAdded:Connect(function(Character)
        Client.Character = Character
        while not (Client.Humanoid and Client.RootPart and Client.Head) do
            Client.Humanoid, Client.Head = Character:FindFirstChildOfClass("Humanoid"), Character:FindFirstChild("Head")
            Client.RootPart = Client.Humanoid and Client.Humanoid.RootPart
            task.wait()
        end
        Died()
    end)
    
    RunIn.Heartbeat.Client = function()
        GetEquipped("Movesets") GetEquipped("Gadgets")
    end
end; InitClient()

local InitCombat = function()
    local M1, AbilitiesCooldowns = {LastTime = 0, Cooldown = 0, Hit = 0}, {}
    
    local GetTarget = function(EnemiesList)
        local Target = {Distance = math.huge}
        for _, Enemy in (EnemiesList or Enemies:GetChildren()) do
            if Enemy:GetAttribute("Untargetable") or not Client.RootPart then continue end
            local RootPart, Config = Enemy:FindFirstChild("HumanoidRootPart"), Enemy:FindFirstChild("Config")
            local Health = Config and Config:FindFirstChild("Health")
            local Distance = RootPart and (RootPart.Position - Client.RootPart.Position).Magnitude
            if not (RootPart and Health and Health.Value > 0) then continue end
            local IsBoss = Enemy:GetAttribute("RaidBoss")
            if not (IsBoss and not Target.IsBoss or IsBoss == Target.IsBoss and Distance < Target.Distance) then continue end
            Target = {Config = Config, Character = Enemy, RootPart = RootPart, CFrame = RootPart.CFrame, Distance = Distance, IsBoss = IsBoss}
        end
        return Target.RootPart and Target or nil
    end
    
    local IsM1Ready = function()
        local CurrentTime = workspace:GetServerTimeNow()
        local AttackSpeed = Modules.Utils.GetTraitBuffs(Client.Player).AttackSpeedMulti or 1
        local HasteBoost = Client.Character and Client.Character:FindFirstChild("HasteBoost")
        if HasteBoost then AttackSpeed *= HasteBoost.Value end
        return M1.Cooldown / AttackSpeed <= CurrentTime - M1.LastTime, CurrentTime, AttackSpeed
    end
    
    local IsAbilityReady = function(Ability)
        local Cooldown = AbilitiesCooldowns[Ability]
        return not Cooldown or workspace:GetServerTimeNow() >= Cooldown
    end
    
    local SetAbilityCooldown = function(Ability, Duration)
        if not (Ability and Duration and Duration > 0) then return end
        AbilitiesCooldowns[Ability] = workspace:GetServerTimeNow() + Duration
    end
    
    local Fire = function(Name, Type, ...)
        if Type == "M1" then
            local Ready, CurrentTime, AttackSpeed = IsM1Ready()
            if not Ready then return end
            local Combat = Modules.CombatData[Name]
            if not Combat then return end
            if CurrentTime - M1.LastTime > 1 then M1.Hit = 1 else M1.Hit = M1.Hit % 4 + 1 end
            local AttackData = Combat["LightAttack" .. M1.Hit]
            if not AttackData then return end
            M1.Cooldown, M1.LastTime = AttackData.M1CD or 0.4, CurrentTime
            Remotes.Events.Interact:FireServer("M1", Name, CurrentTime)
        elseif Type == "Ability" then
            local Ability, Moveset = select(1, ...), Client.Get(Name)
            if not (Ability and Moveset and IsAbilityReady(Ability)) then return end
            Remotes.Events.Interact:FireServer("Ability", Ability, Moveset.Slot, Name, "Began")
        elseif Type == "Gadget" then
            local Gadget, Data, Meter = Client.Get(Name), Modules.ItemsData.Gadgets[Name], Client.Player:FindFirstChild("GadgetMeter")
            if not (Gadget and Data and Meter and Meter.Value >= Data.GadgetMeter) then return end
            Remotes.Events.Interact:FireServer("Gadget", Gadget.Slot, Name, "Began")
        end
    end
    
    Remotes.Events.UsedAbility.OnClientEvent:Connect(function(_, Duration, _, Slot)
        if Slot then SetAbilityCooldown(Slot, Duration) end
    end)
    
    RunIn.Heartbeat.Combat = function()
        if not Client.RootPart then return end
        local Enemy = GetTarget()
        if not Enemy then return end
        if Combat.TeleportToEnemy then
            local TargetPosition = Enemy.CFrame.p - Enemy.CFrame.LookVector * 10
            Client.RootPart.Velocity, Client.RootPart.CFrame = vector.zero, CFrame.lookAt(TargetPosition, Enemy.CFrame.p)
        elseif Combat.LookAtEnemy then
            Client.RootPart.CFrame = CFrame.lookAt(Client.RootPart.Position, vector.create(Enemy.CFrame.p.X, Client.RootPart.Position.Y, Enemy.CFrame.p.Z))
        end
        
        if Combat.AutoHit.Enabled then
            local M1s = Combat.AutoHit.M1s
            Fire(#M1s > 0 and M1s[math.random(1, #M1s)] or Client.Movesets.Equipped.Name, "M1")
        end
        
        if Combat.AutoAbilities.Enabled then
            for Ability, Movesets in ipairs(Combat.AutoAbilities) do
                local Moveset = #Movesets > 0 and Client.Get(Movesets[math.random(1, #Movesets)]) or Client.Movesets.Equipped
                if Moveset then Fire(Moveset.Name, "Ability", Ability) end
            end
        end
        
        if Combat.AutoGadgets.Enabled then
            local Gadgets = Combat.AutoGadgets.Gadgets
            Fire(#Gadgets > 0 and Gadgets[math.random(1, #Gadgets)] or Client.Gadgets.Equipped.Name, "Gadget")
        end
    end
end; if not InLobby then InitCombat() end

local InitMisc = function()
    local Escaped = false RunIn.Heartbeat.Misc = function()
        if InLobby then
            if Misc.RedeemCodes and Client.Data:FindFirstChild("Codes") and Modules.CodeRewards then
                local Redeemed = Modules.Utils.Decode(Client.Data.Codes.Value)
                for Code, Data in Modules.CodeRewards do
                    if table.find(Redeemed, Code) or Data.Expired or Data.GroupRoleRequired or Data.GroupRankRequired then continue end
                    print("Redeemed Code:", Code)
                    Remotes.Functions.FuncInteract:InvokeServer("UseCode", Code)
                end
            end
            return
        end
        
        local Map = workspace:FindFirstChild("Map")
        local Gates = Map and Map:FindFirstChild("Gates")
        local Objective = Map and Map:FindFirstChild("Objective")
        local Entries = Objective and Objective:FindFirstChild("Entries")
        
        if Client.HUD then
            if not Client.HUD.Enabled then
                Client.HUD.Enabled = true
            end
            if Misc.Replay and Modules.ReplayPolicy and Modules.ReplayPolicy.CanPlayAgain(MatchConfig.Gamemode) and Client.HUD.EndScreen.Visible then
                Remotes.Events.Interact:FireServer("PlayAgain")
            end
            if Misc.VoteStartRaidBoss and Client.HUD.StartRaid.Visible then
                Remotes.Events.Interact:FireServer("VoteSkipRaid") Client.HUD.StartRaid.Visible = false
            end
            if Misc.VoteSkipBossCutscene and Client.HUD.BossSkipVote.Visible then
                Remotes.Events.Interact:FireServer("VoteSkipBossCutscene") Client.HUD.BossSkipVote.Visible = false
            end
        end
        
        if Misc.AutoEscape and Entries and Client.RootPart and not Escaped then
            for _, Door in Entries:GetChildren() do
                local ProximityPrompt = Door:FindFirstChildWhichIsA("ProximityPrompt", true)
                if not ProximityPrompt then continue end
                Client.RootPart.CFrame = Door:GetPivot()
                task.wait(0.5)
                fireproximityprompt(ProximityPrompt) 
                Escaped = true
            end
        end
        
        if Misc.OpenGates and Gates then
            for _, Gate in Gates:GetChildren() do
                if Gate.Name:find("Opened") then continue end
                Remotes.Events.Interact:FireServer("GateHit", Gate)
                Gate.Name = Gate.Name.."Opened"
            end
        end
    end
end; InitMisc()

--// Connections

Connections["Heartbeat"] = Services.Run.Heartbeat:Connect(function()
    for Name, Function in RunIn.Heartbeat do
        task.spawn(Function)
    end
end)
