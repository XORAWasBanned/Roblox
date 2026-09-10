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
            [1] = {"King Of Greed", "Elf Mage"},
            [2] = {"King Of Greed", "Elf Mage"},
            [3] = {"King Of Greed", "Elf Mage"},
            [4] = {"Soul Reaper"},
        },
        AutoGadgets = {
            Enabled = true,
            Gadgets = {},
        },
    },
    AutoRoll = {
        Character = {
            Enabled = false,
            RollFor = "",
            RollSlot = 4,
            UseLuckySpin = false,
        },
        Gadget = {
            Enabled = false,
            RollFor = "",
            RollSlot = 4,
            UseLuckySpin = true,
        },
        Trait = {
            Enabled = false,
            RollFor = "Reaper",
            RollSlot = 4,
        },
    },
    Misc = {
        AutoExecuteOnTeleport = true,
        BoostPerformance = true,
        AutoReplay = true,
        AutoEscape = true,
        AutoOpenGates = true,
        AutoVoteStartRaidBoss = true,
        AutoVoteSkipBossCutscene = true,
        AutoRedeemCodes = true,
        AutoPickUpLoot = true,
    },
}

local Combat = Atomizer.Combat
local AutoRoll = Atomizer.AutoRoll
local Misc = Atomizer.Misc

if not game:IsLoaded() then game.Loaded:Wait() end
if Misc.AutoExecuteOnTeleport then queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Anime%20Apocalypse.luau", true)) end
if Misc.BoostPerformance then loadstring(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Universal%20/Performance%20Booster.luau", true))() end

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

local GetGamemode = function()
    return MatchConfig.Gamemode.Value
end

local GetMap = function()
    return MatchConfig.Map.Value
end

local InitClient = function()
    Client.Player, Client.Characters, Client.Gadgets = Services.Players.LocalPlayer, {}, {}
    --repeat task.wait() until Client.Player:GetAttribute("Loaded")
    Client.Guis, Client.Character = Client.Player:FindFirstChildOfClass("PlayerGui"), Client.Player.Character
    Client.Humanoid, Client.Head = Client.Character and Client.Character:FindFirstChildOfClass("Humanoid"), Client.Character and Client.Character:FindFirstChild("Head")
    Client.RootPart = Client.Humanoid and Client.Humanoid.RootPart
    Client.Data, Client.HUD = Client.Player:WaitForChild("Data"), Client.Guis:FindFirstChild("HUD")
    
    Client.Get = function(Name)
        for _, Character in ipairs(Client.Characters) do
            if Character.Name:lower() == Name:lower() then return Character end
        end
        for _, Gadget in ipairs(Client.Gadgets) do
            if Gadget.Name:lower() == Name:lower() then return Gadget end
        end
    end
    
    local function GetCharactersAndGadgets()
        local CharactersMastery = Modules.Utils.Decode(Client.Data:FindFirstChild("AbilityMastery").Value)
        for Slot, Character in Modules.Utils.Decode(Client.Data:FindFirstChild("AbilitySlots").Value) do
            local CharacterMastery = CharactersMastery[Character.Name] or {}
            Character.Slot, Character.Mastery, Character.Upgrades = Slot, {Level = CharacterMastery.Level or 0, Exp = CharacterMastery.EXP or 0}, CharactersMastery.Upgrades or {}
            Client.Characters[tonumber(string.match(Slot, "%d+"))] = Character
        end
        for Slot, Gadget in Modules.Utils.Decode(Client.Data:FindFirstChild("GadgetSlots").Value) do
            local Data = Modules.ItemsData.Gadgets[Gadget.Name] or {}
            Gadget.Slot, Gadget.MaxMeter = Slot, Data.GadgetMeter or math.huge
            Client.Gadgets[tonumber(string.match(Slot, "%d+"))] = Gadget 
        end
    end
    
    local function GetEquipped(Slots)
        local IsCharacters = Slots == "Characters"
        local EquippedList = IsCharacters and {}
        for _, Slot in Client[Slots] do
            if not Slot.Equipped then continue end
            if IsCharacters then
                table.insert(EquippedList, Slot)
            else
                Client[Slots].Equipped = Slot
            end
        end
        if IsCharacters then Client[Slots].Equipped = EquippedList end
    end
    
    local function InitOnDeath()
        local function OnDeath()
            Client.Character, Client.Humanoid, Client.RootPart, Client.Head = nil, nil, nil, nil
        end
        Connections.ClientCharacterRemoving = Client.Player.CharacterRemoving:Once(OnDeath)
    end; InitOnDeath()
    
    local function InitAntiDisconnect()
        local VirtualUser = Services.VirtualUser
        for _, Connection in getconnections(Client.Player.Idled) do Connection:Disconnect() end
        Connections.ClientIdled = Client.Player.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.zero)
            VirtualUser:ClickButton2(Vector2.zero)
        end)
    end; InitAntiDisconnect()
    
    Connections.ClientCharacterAdded = Client.Player.CharacterAdded:Connect(function(Character)
        Client.Character = Character
        while not (Client.Humanoid and Client.RootPart and Client.Head) do
            Client.Humanoid, Client.Head = Character:FindFirstChildOfClass("Humanoid"), Character:FindFirstChild("Head")
            Client.RootPart = Client.Humanoid and Client.Humanoid.RootPart
            task.wait()
        end
        InitOnDeath()
    end)
    
    RunIn.Heartbeat.Client = function()
        GetCharactersAndGadgets() GetEquipped("Characters") GetEquipped("Gadgets")
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
    
    local GetBestM1Character = function(MaxMaseryRequired)
        local Best = {TotalDamage = -math.huge}
        for _, Character in ipairs(Client.Characters) do
            if MaxMaseryRequired and Character.Mastery.Level < 100 then continue end
            local CombatData, TotalDamage = Modules.CombatData[Character.Name], 0
            if CombatData then for _, Attack in CombatData do TotalDamage += Attack.Damage or 0 end end
            if Best.TotalDamage >= TotalDamage then continue end
            Best = {Character = Character, TotalDamage = TotalDamage}
        end
        return Best.Character
    end
    
    local IsM1Ready = function()
        local CurrentTime, AttackSpeed, HasteBoost = workspace:GetServerTimeNow(), Modules.Utils.GetTraitBuffs(Client.Player).AttackSpeedMulti or 1, Client.Character and Client.Character:FindFirstChild("HasteBoost")
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
            local Combat = Modules.CombatData[Name]
            local Ready, CurrentTime, AttackSpeed = IsM1Ready()
            if not (Ready and Combat) then return end
            if CurrentTime - M1.LastTime > 1 then M1.Hit = 1 else M1.Hit = M1.Hit % 4 + 1 end
            local AttackData = Combat["LightAttack" .. M1.Hit]
            if not AttackData then return end
            M1.Cooldown, M1.LastTime = AttackData.M1CD or 0.4, CurrentTime
            Remotes.Events.Interact:FireServer("M1", Name, CurrentTime)
        elseif Type == "Ability" then
            local Ability, Character = select(1, ...), Client.Get(Name)
            if not (Ability and Character and IsAbilityReady(Ability)) then return end
            Remotes.Events.Interact:FireServer("Ability", Ability, Character.Slot, Name, "Began")
        elseif Type == "Gadget" then
            local Gadget, Meter = Client.Get(Name),  Client.Player:FindFirstChild("GadgetMeter")
            if not (Gadget and Meter and Meter.Value >= Gadget.MaxMeter) then return end
            Remotes.Events.Interact:FireServer("Gadget", Gadget.Slot, Name, "Began")
        end
    end
    
    Remotes.Events.UsedAbility.OnClientEvent:Connect(function(_, Duration, _, Slot)
        if Slot then SetAbilityCooldown(Slot, Duration) end
    end)
    
    RunIn.Heartbeat.Combat = function()
        if not Client.RootPart then return end
        local ShowEnemies = Enemies:FindFirstChild("ShowEnemies") or Instance.new("Highlight", Enemies)
        ShowEnemies.Name = "ShowEnemies"
        ShowEnemies.Enabled = false
        pcall(function()
            ShowEnemies.Parent = nil
            ShowEnemies.Parent = Enemies
        end)
        
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
            local Character = #M1s > 0 and M1s[math.random(1, #M1s)] or GetBestM1Character()
            if Character then Fire(Character.Name, "M1") end
        end
        
        if Combat.AutoAbilities.Enabled then
            for Ability, Characters in ipairs(Combat.AutoAbilities) do
                local Character = #Characters > 0 and Client.Get(Characters[math.random(1, #Characters)]) or GetBestM1Character(Ability == 4)
                if Character then Fire(Character.Name, "Ability", Ability) end
            end
        end
        
        if Combat.AutoGadgets.Enabled then
            local Gadgets = Combat.AutoGadgets.Gadgets
            local Gadget = #Gadgets > 0 and Gadgets[math.random(1, #Gadgets)] or Client.Gadgets.Equipped and Client.Gadgets.Equipped.Name
            if Gadget then Fire(Gadget, "Gadget") end
        end
    end
end; if not InLobby then InitCombat() end

local InitAutoRoll = function()
    local Rolled, NotifiedAbout, LastRollTime, Rolling, RarityColors, Traits = {}, {}, {}, {}, {Rare = "Blue", Legendary = "Gold", Epic = "Purple", Mythic = "Red", Supreme = "Lime", Majestic = "Red"}, {"Power", "Swift", "Timer", "Fortune", "Zombie", "Hunter", "Reaper", "Flash", "Shinigami"}
    
    local RollFor = function(Type)
        local Settings = AutoRoll[Type]
        if not (Settings.Enabled and not Rolled[Type] and not Rolling[Type] and tick() - (LastRollTime[Type] or 0) >= 0.05) then return end
        
        if Type == "Trait" then
            local RollingFor, RollingSlot = Settings.RollFor, Client.Characters[Settings.RollSlot]
            local RerollItem, ShouldRoll = Modules.Utils.GetItem(Client.Player, "Trait Reroll"), nil
            local HasRerolls = RerollItem and (RerollItem.Amount or 0) > 0
            ShouldRoll = table.find(Traits, RollingFor) and RollingSlot and RollingSlot.Trait ~= RollingFor and HasRerolls
            
            if ShouldRoll then
                NotifiedAbout[Type], LastRollTime[Type], Rolling[Type] = nil, tick(), true
                local Trait = Remotes.Functions.FuncInteract:InvokeServer("RollTrait", RollingSlot.Slot)
                Rolling[Type] = nil
                if Trait == RollingFor then
                    Rolled[Type] = true
                    Modules.Utils.Notify("Got "..Trait.." Trait!", "Gold", 5)
                    task.delay(1, function() Rolled[Type] = nil end)
                end
            else
                local Reason
                if not table.find(Traits, RollingFor) then Reason = "Rolling Trait Does Not Exist: "..tostring(RollingFor)
                elseif not RollingSlot then Reason = "Invaild Trait Rolling Slot: "..tostring(Settings.RollSlot)
                elseif not HasRerolls then Reason = "No Trait Rerolls Left" end
                
                if Reason and Reason ~= NotifiedAbout[Type] then
                    NotifiedAbout[Type] = Reason
                    Modules.Utils.Notify(Reason, "Red")
                end
            end
            return
        end
        
        local IsCharacter = Type == "Character"
        local Slots, ItemsData, LuckySpins, NormalSpins, RollingFor, UseLuckySpin = IsCharacter and Client.Characters or Client.Gadgets, IsCharacter and Modules.ItemsData.Abilities or Modules.ItemsData.Gadgets, IsCharacter and Client.Data.LuckyAbilitySpins or Client.Data.LuckyGadgetSpins, IsCharacter and Client.Data.NormalAbilitySpins or Client.Data.NormalGadgetSpins, Settings.RollFor, Settings.UseLuckySpin
        local RollingSlot = Slots[Settings.RollSlot]
        local ShouldRoll = ItemsData[RollingFor] and RollingSlot and not RollingSlot.Locked and RollingSlot.Name ~= RollingFor and (UseLuckySpin and LuckySpins.Value > 0 or not UseLuckySpin and (NormalSpins.Value > 0 or Client.Data.Coins.Value >= 3000))
        
        if ShouldRoll then
            NotifiedAbout[Type], LastRollTime[Type], Rolling[Type] = nil, tick(), true
            local Character, Rarity = Remotes.Functions.FuncInteract:InvokeServer(IsCharacter and "RollAbility" or "RollGadget", "Slot"..Settings.RollSlot, UseLuckySpin and "Lucky" or "Normal")
            Rolling[Type] = nil
            if Character == RollingFor then
                Rolled[Type] = true
                Modules.Utils.Notify("Got "..Character.." ("..Rarity..")!", RarityColors[Rarity] or "White", 5)
                task.delay(1, function() Rolled[Type] = nil end)
            end
        else
            local Reason
            if not ItemsData[RollingFor] then Reason = "Rolling "..Type.." Does Not Exist: "..tostring(RollingFor)
            elseif not RollingSlot then Reason = "Invaild Rolling Slot:"..tostring(Settings.RollSlot)
            elseif RollingSlot.Locked then Reason = "Slot "..Settings.RollSlot.." Is Locked"
            elseif UseLuckySpin and LuckySpins.Value <= 0 then Reason = "No Lucky Spins Left"
            elseif not UseLuckySpin and NormalSpins.Value <= 0 and Client.Data.Coins.Value < 3000 then Reason = "Cannot Afford Normal Spin" end
            
            if Reason and Reason ~= NotifiedAbout[Type] then
                NotifiedAbout[Type] = Reason
                Modules.Utils.Notify(Reason, "Red")
            end
        end
    end
    
    RunIn.Heartbeat.AutoRoll = function()
        RollFor("Character") RollFor("Gadget") RollFor("Trait")
    end
end; if InLobby then InitAutoRoll() end

local InitMisc = function()
    RunIn.Heartbeat.Misc = function()
        if InLobby then
            if Misc.AutoRedeemCodes and Client.Data:FindFirstChild("Codes") and Modules.CodeRewards then
                local Redeemed = Modules.Utils.Decode(Client.Data.Codes.Value)
                for Code, Data in Modules.CodeRewards do
                    if table.find(Redeemed, Code) or Data.Expired or Data.GroupRoleRequired or Data.GroupRankRequired then continue end
                    Modules.Utils.Notify("Redeemed Code: "..Code, "White")
                    Remotes.Functions.FuncInteract:InvokeServer("UseCode", Code, 30)
                end
            end
            return
        end
        
        local Map, Gamemode = workspace:FindFirstChild("Map"), GetGamemode()
        local Gates, Objective = Map and (Map:FindFirstChild("Gates") or Map:FindFirstChild("Door") or Map:FindFirstChild("Model")), Map and Map:FindFirstChild("Objective")
        local Entries = Objective and Objective:FindFirstChild("Entries")
        
        if Client.HUD then
            if not Client.HUD.Enabled then
                Client.HUD.Enabled = true
            end
            if Misc.AutoReplay and Modules.ReplayPolicy and Modules.ReplayPolicy.CanPlayAgain(MatchConfig) and Client.HUD.EndScreen.Visible then
                Remotes.Events.Interact:FireServer("PlayAgain")
            end
            if Gamemode == "Raid" or Gamemode == "World Boss" and Misc.AutoVoteStartRaidBoss and Client.HUD.StartRaid.Visible then
                Remotes.Events.Interact:FireServer("VoteSkipRaid") Client.HUD.StartRaid.Visible = false
            end
            if Misc.AutoVoteSkipBossCutscene and Client.HUD.BossSkipVote.Visible then
                Remotes.Events.Interact:FireServer("VoteSkipBossCutscene") Client.HUD.BossSkipVote.Visible = false
            end
        end
        
        if Gamemode == "Survival" then
            if Misc.AutoEscape and Entries and Client.RootPart and not workspace:FindFirstChild("GameFinished") then
                for _, Entry in Entries:GetChildren() do
                    local ProximityPrompt = Entry:FindFirstChildWhichIsA("ProximityPrompt", true)
                    if not ProximityPrompt then continue end
                    local Map = GetMap()
                    Client.RootPart.CFrame = Map == "Shibuya" and Entry:GetPivot() or Map == "Prison" and Entry:FindFirstChild("Door"):GetPivot()
                    fireproximityprompt(ProximityPrompt)
                end
            end
            
            if Misc.AutoOpenGates and Gates then
                for _, Gate in Gates:GetChildren() do
                    if not Gate.Name:find("Gate") or Gate.Name:find("Opened") then continue end
                    Remotes.Events.Interact:FireServer("GateHit", Gate)
                    Gate.Name = Gate.Name.."Opened"
                end
            end
        end
    end
end; InitMisc()

--// Connections



Connections.Heartbeat = Services.Run.Heartbeat:Connect(function()
    for Name, Function in RunIn.Heartbeat do
        task.spawn(Function)
    end
end)

Connections.DropAdded = Drops.ChildAdded:Connect(function(Child)
    if not (Misc.AutoPickUpLoot) then return end
    for _, Drop in Drops:GetChildren() do
        local Pickup = Drop:FindFirstChild("Pickup", true)
        if not Pickup then continue end
        Pickup:FireServer()
    end
end)
