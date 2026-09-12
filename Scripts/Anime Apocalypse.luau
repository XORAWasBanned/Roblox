getgenv().Atomizer = {
    Match = {
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
        
        AutoReplay = true,
        AutoEscape = true,
        AutoOpenGates = true,
        AutoPickUpLoot = true,
        
        AutoVote = {
            StartRaidBoss = true,
            SkipBossCutscene = true,
            StartInfinity = true,
            SkipInfinityWave = true,
        },
        
        AutoPickCard = {
            Enabled = true,
            Pick = {
                Wealth = true,
                ReduceAbilityCooldown = false,
                IncreaseDamage = false,
                IncreseUltimateGain = false,
                IncreseGadgetGain = false,
                ExtraLife = false,
                IncreaseWalkSpeed = false,
            },
        },
    },
    Lobby = {
        AutoRedeemCodes = true,
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
    },
    Misc = {
        ExecuteOnTeleport = true,
        BoostPerformance = true,
    },
}

local Lobby, Match, Misc = Atomizer.Lobby, Atomizer.Match, Atomizer.Misc

if not game:IsLoaded() then game.Loaded:Wait() end

local Services = setmetatable({}, {
    __index = function(Self, Name)
        local FetchService = function(Name) local Success, Service = pcall(game.GetService, game, Name) return Success and Service end
        local Service = FetchService(Name) or FetchService(Name.."Service")
        rawset(Self, Name, cloneref and cloneref(Service) or Service)
        return rawget(Self, Name)
    end
})

local Client, Connections, RunIn, InLobby, MatchData = {}, {}, {Heartbeat = {}}, workspace:GetAttribute("NoCooldowns"), {}
local InMatch = not InLobby
local Assets = Services.ReplicatedStorage:FindFirstChild("Assets")
local Thrown, Enemies = workspace:FindFirstChild("Thrown"), workspace:FindFirstChild("Zombies")
local Modules, Remotes = {}, { Events = {}, Functions = {} }

--// Functions



local WhileLoop = function(Function, Wait)
    task.spawn(function()
        while true do Function() task.wait(Wait) end
    end)
end

local InitMatchData = function()
    MatchData.Self = workspace:FindFirstChild("MatchConfig")
    for _, Data in MatchData.Self:GetChildren() do
        if Data.ClassName:find("Value") then MatchData[Data.Name] = Data.Value end 
    end
end; if InMatch then InitMatchData() end

local InitModules = function(WantedModules)
    for _, Module in Assets:FindFirstChild("Modules"):QueryDescendants("ModuleScript") do
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
    end; GetRemotes(Assets:FindFirstChild("Remotes")) GetRemotes(Assets:FindFirstChild("Requests"))
end; InitRemotes()

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
        for _, SlotData in Client[Slots] do
            if not SlotData.Equipped then continue end
            if IsCharacters then
                table.insert(EquippedList, SlotData)
            else
                Client[Slots].Equipped = SlotData
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
            VirtualUser:ClickButton1(Vector2.new())
            VirtualUser:ClickButton2(Vector2.new())
            Modules.Utils.Notify("Anti Disconnect: Prevented You From Getting Disconnect!", "White", 5)
        end)
        local Original; Original = hookfunction(task.wait, function(Duration)
            if checkcaller() then return Original(Duration) end
            local Traceback = debug.traceback()
            if not Traceback:find("AFKTeleport") then return Original(Duration) end
            Modules.Utils.Notify("Anti Disconnect: Disabled AFK World Teleportation Script!", "White", 5)
            return coroutine.yield()
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
    
    if InMatch and MatchData.Gamemode == "Survival" then
        Connections.LocalEffectEscaped = Connections.LocalEffectEscaped or Remotes.Events.LocalEffect.OnClientEvent:Connect(function(Name)
            if Name == "Escaped" then Client.Escaped = true end
        end)
    end
    
    RunIn.Heartbeat.Client = function()
        GetCharactersAndGadgets() GetEquipped("Characters") GetEquipped("Gadgets")
    end
end; InitClient()

local InitLobby = function()
    if InMatch then return end
    
    local InitAutoRoll = function()
        local Rolled, NotifiedAbout, LastRollTime, Rolling, RarityColors, Traits = {}, {}, {}, {}, {Rare = "Blue", Legendary = "Gold", Epic = "Purple", Mythic = "Red", Supreme = "Lime", Majestic = "Red"}, {"Power", "Swift", "Timer", "Fortune", "Zombie", "Hunter", "Reaper", "Flash", "Shinigami"}
        
        local RollFor = function(Type)
            local Settings = Lobby.AutoRoll[Type]
            if not (Settings.Enabled and not Rolled[Type] and not Rolling[Type] and tick() - (LastRollTime[Type] or 0) >= 0.05) then return end
            
            if Type == "Trait" then
                local RollingFor, RollingSlot, RerollItem = Settings.RollFor, Client.Characters[Settings.RollSlot], Modules.Utils.GetItem(Client.Player, "Trait Reroll")
                local HasRerolls = RerollItem and (RerollItem.Amount or 0) > 0
                local ShouldRoll = table.find(Traits, RollingFor) and RollingSlot and RollingSlot.Trait ~= RollingFor and HasRerolls
                
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
    end InitAutoRoll()
    
    local HandleRedeemCodes = function()
        if not (InLobby and Lobby.AutoRedeemCodes and Client.Data:FindFirstChild("Codes") and Modules.CodeRewards) then return end
        local Redeemed = Modules.Utils.Decode(Client.Data.Codes.Value)
        for Code, Data in Modules.CodeRewards do
            if table.find(Redeemed, Code) or Data.Expired or Data.GroupRoleRequired or Data.GroupRankRequired then continue end
            Modules.Utils.Notify("Redeemed Code: "..Code, "White", 30)
            Remotes.Functions.FuncInteract:InvokeServer("UseCode", Code)
        end
    end WhileLoop(HandleRedeemCodes, 0.1)
end InitLobby()

local InitMatch = function()
    if InLobby then return end
    
    local InitCombat = function()
        local Enemy, M1, Abilities = nil, {LastTime = 0, Cooldown = 0, Hit = 0}, {OnCooldown = {}}
        
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
        
        local IsReady = function(Type, ...)
            if Type == "M1" then
                local CurrentTime, AttackSpeed, HasteBoost = workspace:GetServerTimeNow(), Modules.Utils.GetTraitBuffs(Client.Player).AttackSpeedMulti or 1, Client.Character and Client.Character:FindFirstChild("HasteBoost")
                if HasteBoost then AttackSpeed *= HasteBoost.Value end
                return M1.Cooldown / AttackSpeed <= CurrentTime - M1.LastTime, CurrentTime, AttackSpeed
            elseif Type == "Ability" then
                local CharacterSlot, AbilityNumber = ...
                return Abilities.OnCooldown[CharacterSlot.."_"..AbilityNumber] == nil
            end
        end
        
        local Fire = function(Name, Type, AbilityNumber)
            if Type == "M1" then
                local Combat = Modules.CombatData[Name]
                local Ready, CurrentTime, AttackSpeed = IsReady("M1")
                if not (Ready and Combat) then return end
                if CurrentTime - M1.LastTime > 1 then M1.Hit = 1 else M1.Hit = M1.Hit % 4 + 1 end
                local AttackData = Combat["LightAttack" .. M1.Hit]
                if not AttackData then return end
                M1.Cooldown, M1.LastTime = AttackData.M1CD or 0.4, CurrentTime
                Remotes.Events.Interact:FireServer("M1", Name, CurrentTime)
            elseif Type == "Ability" and AbilityNumber then
                local Character = Client.Get(Name)
                if not (Character and IsReady("Ability", Character.Slot, AbilityNumber)) then return end
                local Equipped = Remotes.Functions.FuncInteract:InvokeServer("EquipAbility", Character.Slot)
                if Equipped then Remotes.Events.Interact:FireServer("Ability", AbilityNumber, Character.Slot, Character.Name, "Began") end
            elseif Type == "Gadget" then
                local Gadget, Meter = Client.Get(Name), Client.Player:FindFirstChild("GadgetMeter")
                if not (Gadget and Meter and Meter.Value >= Gadget.MaxMeter) then return end
                Remotes.Events.Interact:FireServer("Gadget", Gadget.Slot, Name, "Began")
            end
        end
        
        Connections.UsedAbilityEvent = Remotes.Events.UsedAbility.OnClientEvent:Connect(function(_, AbilityDuration, CharacterSlot, AbilityNumber)
            if not (CharacterSlot and AbilityNumber and AbilityDuration) then return end
            CharacterSlot = CharacterSlot:find("Slot") and CharacterSlot or Client.Get(CharacterSlot) and Client.Get(CharacterSlot).Slot
            local Key = CharacterSlot.."_"..AbilityNumber
            Abilities.OnCooldown[Key] = true
            task.wait(AbilityDuration)
            Abilities.OnCooldown[Key] = nil
        end)
        
        RunIn.Heartbeat.Combat = function()
            if not Client.RootPart then return end
            local Highlight = Enemies:FindFirstChild("Highlight") or Instance.new("Highlight", Enemies)
            
            Enemy = GetTarget()
            if not Enemy then return end
            
            if Match.Combat.TeleportToEnemy then
                local TargetPosition = Enemy.CFrame.p - Enemy.CFrame.LookVector * 15
                Client.RootPart.Velocity, Client.RootPart.CFrame = vector.zero, CFrame.lookAt(TargetPosition, Enemy.CFrame.p)
            elseif Match.Combat.LookAtEnemy then
                Client.RootPart.CFrame = CFrame.lookAt(Client.RootPart.Position, vector.create(Enemy.CFrame.p.X, Client.RootPart.Position.Y, Enemy.CFrame.p.Z))
            end
            
            if Match.Combat.AutoGadgets.Enabled then
                local Gadgets = Match.Combat.AutoGadgets.Gadgets
                local Gadget = #Gadgets > 0 and Gadgets[math.random(1, #Gadgets)] or Client.Gadgets.Equipped and Client.Gadgets.Equipped.Name
                if Gadget then Fire(Gadget, "Gadget") end
            end
            
            if Match.Combat.AutoHit.Enabled then 
                local M1s = Match.Combat.AutoHit.M1s
                local Character = #M1s > 0 and M1s[math.random(1, #M1s)] or GetBestM1Character()
                if Character then Fire(Character.Name, "M1") end
            end
        end
        
        WhileLoop(function()
            if not (Enemy and Match.Combat.AutoAbilities.Enabled) then return end
            for Ability, Characters in ipairs(Match.Combat.AutoAbilities) do
                Characters = #Characters > 0 and Characters or Client.Characters.Equipped
                for _, Character in Characters do
                    Fire(typeof(Character) == "string" and Character or Character.Name, "Ability", Ability)
                end
            end
        end, 0.1)
    end InitCombat()
    
    local HandleDrops = function()
        if not (Match.AutoPickUpLoot) then
            if Connections.DropAdded then
                Connections.DropAdded:Disconnect()
                Connections.DropAdded = nil
            end
            return
        end
        
        if not Connections.DropAdded then
            for _, Thrown in Thrown:GetChildren() do
                local Pickup = Thrown:FindFirstChild("Pickup", true)
                if not Pickup then continue end
                Pickup:FireServer()
            end
        end
        
        Connections.DropAdded = Connections.DropAdded or Thrown.ChildAdded:Connect(function(Thrown)
            local Pickup = Thrown:FindFirstChild("Pickup", true)
            if not Pickup then return end
            Pickup:FireServer()
        end)
    end WhileLoop(HandleDrops, 1)
    
    local HandleCards = function()
        if not (Match.AutoPickCard.Enabled and (MatchData.Gamemode == "Survival" or MatchData.Gamemode == "Infinite")) then
            if Connections.DrawCardEvent then
                Connections.DrawCardEvent:Disconnect()
                Connections.DrawCardEvent = nil
            end
            Client.HUD.Main.Cards.Visible = true
            return
        end
        if Connections.DrawCardEvent then return end
        
        local CardMap = {
            Wealth = "wealth",
            ReduceAbilityCooldown = "abilitycd",
            IncreaseDamage = "damage",
            IncreseUltimateGain = "ultgain",
            IncreseGadgetGain = "gadgetcd",
            ExtraLife = "extralife",
            IncreaseWalkSpeed = "walkspeed",
        }
        
        Connections.DrawCardEvent = Connections.DrawCardEvent or Remotes.Events.DrawCard.OnClientEvent:Connect(function(Action, Cards)
            if not (Action == "Draw" and type(Cards) == "table") then return end
            local SelectedCard
            
            for _, Card in Cards do
                if SelectedCard then break end
                for CardName, Pick in Match.AutoPickCard.Pick do
                    if not Pick or SelectedCard then continue end
                    local Name = Card.Name:lower():gsub("%W+", "")
                    if CardMap[CardName] ~= Name then continue end
                    SelectedCard = Card
                    break
                end
            end
            
            SelectedCard = SelectedCard or Cards[math.random(1, #Cards or 1)]
            if not SelectedCard then return end
            Remotes.Functions.FuncInteract:InvokeServer("DrawCard", SelectedCard.Name)
            Client.HUD.Main.Cards.Visible = false
            Modules.Utils.Notify("Selected Card: " .. Modules.ItemsData.Cards[SelectedCard.Name].CardName, "White", 3)
        end)
    end WhileLoop(HandleCards, 1)
    
    local InitVoteHandler = function()
        if not (InMatch and Client.HUD) then return end
        local Voted = {}
        local CheckVote = function(Key, Instance, Enabled, Callback)
            if not (Enabled and Instance and Instance.Visible) then
                Voted[Key] = nil
                return
            end
            if Voted[Key] then return end
            Voted[Key] = true
            Callback()
        end
        
        local HandleVotes = function()
            if not Client.HUD then return end
            if not Client.HUD.Enabled then
                Client.HUD.Enabled = true
            end
            
            CheckVote("VoteReplay", Client.HUD.EndScreen, Match.AutoReplay and Modules.ReplayPolicy.CanPlayAgain(MatchData.Self), function()
                Remotes.Events.Interact:FireServer("PlayAgain")
            end)
            
            CheckVote("VoteStartRaid", Client.HUD.StartRaid, Match.AutoVote.StartRaidBoss and (MatchData.Gamemode == "Raid" or MatchData.Gamemode == "World Boss" or MatchData.Gamemode == "Bizarre Pursuit"), function()
                Remotes.Events.Interact:FireServer("VoteSkipRaid")
            end)
            
            CheckVote("VoteSkipCutscene", Client.HUD.BossSkipVote, Match.AutoVote.SkipBossCutscene, function()
                Remotes.Events.Interact:FireServer("VoteSkipBossCutscene")
            end)
            
            if MatchData.Gamemode == "Infinite" then
                local Start, Skip = Client.HUD.Tabs.InfinitePanel.StartInfinite, Client.HUD.Tabs.InfinitePanel.SkipWave
                
                CheckVote("VoteStartInfinite", Start, Match.AutoVote.StartInfinity, function()
                    Remotes.Events.Interact:FireServer("VoteSkipInfinite")
                end)
                
                CheckVote("VoteSkipWave", Skip, Match.AutoVote.SkipInfinityWave, function()
                    Remotes.Events.Interact:FireServer("VoteSkipWave")
                end)
            end
        end WhileLoop(HandleVotes, 0.1)
    end InitVoteHandler()
    
    local InitSurvivalHandler = function()
        WhileLoop(function()
            if not (MatchData.Gamemode == "Survival" and Match.AutoEscape and Client.RootPart and not Client.Escaped) then return end
            local Map = workspace:FindFirstChild("Map")
            local Objective = Map and Map:FindFirstChild("Objective")
            local Entries = Objective and Objective:FindFirstChild("Entries")
            if not Entries then return end
            
            for _, Entry in Entries:GetChildren() do
                local ProximityPrompt = Entry:FindFirstChildWhichIsA("ProximityPrompt", true)
                if not ProximityPrompt then continue end
                Client.RootPart.CFrame = MatchData.Map == "Shibuya" and Entry:GetPivot() or MatchData.Map == "Prison" and Entry:FindFirstChild("Door"):GetPivot()
                fireproximityprompt(ProximityPrompt)
            end
        end, 0.1)
        
        WhileLoop(function()
            if not (MatchData.Gamemode == "Survival" and Match.AutoOpenGates) then return end
            for _, Hitbox in Services.Collection:GetTagged("GateHitbox") do
                local Gate = Hitbox.Parent
                if not Gate or Gate:GetAttribute("Opened") then continue end
                Remotes.Events.Interact:FireServer("GateHit", Gate)
                Gate:SetAttribute("Opened", true)
            end
        end, 0.1)
    end InitSurvivalHandler()
end InitMatch()

local InitMisc = function()
    local InitAutoExecute = function()
        if not Misc.ExecuteOnTeleport then return end
        queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Anime%20Apocalypse.luau", true))
    end InitAutoExecute()
    
    local InitBoostPerformance = function()
        if not Misc.BoostPerformance then return end
        local Terrain = workspace.Terrain
        local EmitterContainer = Terrain:FindFirstChild("EmittedPartsUsingPart_icle")
        if EmitterContainer then EmitterContainer:Destroy() end
        Connections["TerrainChildAdded"] = Terrain.ChildAdded:Connect(function(Child)
            if Child.Name == "EmittedPartsUsingPart_icle" then Child:Destroy() end
        end)
        Connections["ThrownChildAdded"] = Thrown.ChildAdded:Connect(function(Child)
            if not Child:FindFirstChild("Pickup", true) then Child:Destroy() end
        end)
        Connections["CameraChildAdded"] = workspace.CurrentCamera.ChildAdded:Connect(function(Child)
            Child:Destroy()
        end)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Universal%20/Performance%20Booster.luau", true))()
    end InitBoostPerformance()
end InitMisc()



--// Connections



Connections.Heartbeat = Services.Run.Heartbeat:Connect(function()
    Lobby, Match, Misc = Atomizer.Lobby, Atomizer.Match, Atomizer.Misc
    for Name, Function in RunIn.Heartbeat do
        Function()
    end
end)

Modules.Utils.Notify("Injected Script Successfully", "Green", 5)
