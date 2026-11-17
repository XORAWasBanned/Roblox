local Environment, Missing = getfenv(), false

for _, Name in {"getgenv", "loadstring", "getgc", "hookfunction", "islclosure", "isexecutorclosure"} do
    if typeof(Environment[Name]) ~= "function" then warn("Missing Function: " .. Name) Missing = true end
end

if Missing or getgenv()["BYPASSED TIMEBOMB DUELS ANTI-CHEAT"] then return end

local Code, GetterNames, Getters, Runners, Seen, Actors = [[
    for _, Collected in getgc() do
        if not (typeof(Collected) == "function" and debug.info(Collected, "s"):find("ReplicatedFirst") and islclosure(Collected) and not isexecutorclosure(Collected)) then continue end
        hookfunction(Collected, function() end)
    end
]], {getactors = true, getallactors = true, getdeletedactors = true, getdestroyedactors = true}, {}, {}, {}, {}

for _, Table in {getgenv(), Environment} do
    for Name, Value in Table do
        if typeof(Name) ~= "string" or typeof(Value) ~= "function" or Seen[Value] then continue end
        local Clean = Name:lower():gsub("_", "")
        local List = GetterNames[Clean] and Getters or Clean == "runonactor" and Runners
        if List then Seen[Value] = true table.insert(List, Value) end
    end
end

for _, Getter in Getters do
    local Success, Result = pcall(Getter)
    if not Success or typeof(Result) ~= "table" then continue end
    for _, Actor in Result do
        if typeof(Actor) == "Instance" and not Seen[Actor] then Seen[Actor] = true table.insert(Actors, Actor) end
    end
end

if #Getters > 0 and #Runners > 0 then
    loadstring(Code)()
    for _, Actor in Actors do
        for _, Runner in Runners do if pcall(Runner, Actor, Code) then break end end
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
