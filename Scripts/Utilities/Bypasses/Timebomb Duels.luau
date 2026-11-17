local Environment, Missing = getfenv(), false

for _, Name in {"getgenv", "loadstring", "getgc", "hookfunction", "islclosure", "isexecutorclosure"} do
    if typeof(Environment[Name]) ~= "function" then
        Missing = true
        warn("Missing Function: " .. Name)
    end
end

if Missing or getgenv()["BYPASSED TIMEBOMB DUELS ANTI-CHEAT"] then return end

local Whitelist = {getactors = true, getallactors = true, getdeletedactors = true, getdestroyedactors = true}

local Code, Getters, Runners, Actors = [[
    for _, Collected in getgc() do
        if not (typeof(Collected) == "function" and debug.info(Collected, "s"):find("ReplicatedFirst") and islclosure(Collected) and not isexecutorclosure(Collected)) then continue end
        hookfunction(Collected, function() end)
    end
]], {}, {}, {}

for _, Table in {getgenv(), Environment} do
    for Name, Value in Table do
        if typeof(Name) ~= "string" or typeof(Value) ~= "function" then continue end
        local Clean = Name:lower():gsub("_", "")
        if Whitelist[Clean] then Getters[Value] = true
        elseif Clean == "runonactor" then Runners[Value] = true end
    end
end

for Getter in Getters do
    local Success, Result = pcall(Getter)
    if not Success or typeof(Result) ~= "table" then continue end
    for _, Actor in Result do Actors[Actor] = true end
end

if next(Getters) and next(Runners) then
    loadstring(Code)()
    for Actor in Actors do
        for Runner in Runners do
            print(Actor)
            local Ok, Err = pcall(Runner, Actor, Code)
            if Ok then break end
            warn(Err)
        end
    end
    getgenv()["BYPASSED TIMEBOMB DUELS ANTI-CHEAT"] = true
    return
end

if typeof(Environment["getfflag"]) ~= "function" or typeof(Environment["setfflag"]) ~= "function" then return warn("Missing Function: getfflag / setfflag") end

local ParallelLuaUOnMainThread = getfflag("DebugRunParallelLuaOnMainThread")

if ParallelLuaUOnMainThread == "false" then
    setfflag("DebugRunParallelLuaOnMainThread", "true")
    queue_on_teleport(Code)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
elseif ParallelLuaUOnMainThread == "true" then
    loadstring(Code)()
else
    game:GetService("Players").LocalPlayer:Kick("DebugRunParallelLuaOnMainThread FFlag Doesn't Exist No More :(")
end

getgenv()["BYPASSED TIMEBOMB DUELS ANTI-CHEAT"] = true
