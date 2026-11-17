local Environment, RequiredFunctions, Missing = getfenv(), {"getgenv", "getfflag", "setfflag", "loadstring", "hookfunction", "islclosure", "isexecutorclosure"}

for _, Name in RequiredFunctions do
    if typeof(Environment[Name]) == "function" then continue end
    warn("Missing Function: " .. Name)
    Missing = true
end

if HasMissing or getgenv()["BYPASSED TIMEBOMB DUELS ANTI-CHEAT"] then return end

local ParallelLuaUOnMainThread, Code = getfflag("DebugRunParallelLuaOnMainThread"), [[
    for _, Collected in getgc() do
        if not (typeof(Collected) == "function" and debug.info(Collected, "s"):find("ReplicatedFirst") and islclosure(Collected) and not isexecutorclosure(Collected)) then continue end
        hookfunction(Collected, function() end)
    end
]]

if ParallelLuaUOnMainThread ~= "true" then
    setfflag("DebugRunParallelLuaOnMainThread", "true")
    queue_on_teleport(Code)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
elseif ParallelLuaUOnMainThread == "true" then
    loadstring(Code)()
end

getgenv()["BYPASSED TIMEBOMB DUELS ANTI-CHEAT"] = true
