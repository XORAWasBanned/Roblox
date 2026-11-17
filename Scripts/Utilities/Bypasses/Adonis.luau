local Environment, RequiredFunctions, Missing = getfenv(), {"getgenv", "hookfunction", "checkcaller", "getcallingscript", "getgc"}

for _, Name in RequiredFunctions do
    if type(Environment[Name]) == "function" then continue end
    warn("Missing Function: " .. Name)
    Missing = true
end

if Missing or getgenv().BYPASSED_ADONIS then return end
getgenv().ADONIS_BYPASS_DEBUG_MODE = false

game:GetService("ScriptContext"):SetTimeout(1)

local function StringArguments(...)
    local Arguments = {...}
    for Index, Value in Arguments do Arguments[Index] = tostring(Value) end
    return Arguments
end

local Kick; Kick = hookfunction(game:GetService("Players").LocalPlayer.Kick, function(...)
    if checkcaller() or tostring(getcallingscript()) ~= "ClientMover" then return Kick(...) end
    if getgenv().ADONIS_BYPASS_DEBUG_MODE then
        warn("\n------------------------------")
        warn("DEBUG: LocalPlayer Kick function has been called, arguments:", table.concat(StringArguments(...), ", ")) 
        warn("------------------------------\n")
    end
end)

if getgenv().ADONIS_BYPASS_DEBUG_MODE and Kick then print("Debugging: Hooked Kick function!") end

local DebugInfo; DebugInfo = hookfunction(debug.info, function(...)
    if checkcaller() or tostring(getcallingscript()) ~= "ClientMover" or select(2, ...) ~= "slanf" then return DebugInfo(...) end
    if getgenv().ADONIS_BYPASS_DEBUG_MODE then
        warn("\n------------------------------")
        warn("DEBUG: debug.info function has been called, arguments:", table.concat(StringArguments(...), ", ")) 
        warn("------------------------------\n")
    end
    return coroutine.yield()
end)

if getgenv().ADONIS_BYPASS_DEBUG_MODE and DebugInfo then print("Debugging: Hooked debug.info function!") end

for _, Collected in getgc(true) do
    if typeof(Collected) ~= "table" then continue end
    local Detected, Kill = rawget(Collected, "Detected"), rawget(Collected, "Kill")
    
    if typeof(Kill) == "function" and debug.info(Kill, "s") == ".Client.Client" then
        hookfunction(Kill, function(Info) 
            if getgenv().ADONIS_BYPASS_DEBUG_MODE then 
                warn("\n------------------------------")
                warn("DEBUG: Kill function has been called, Information argument:", tostring(Info))
                warn("------------------------------\n")
            end 
        end)
        if getgenv().ADONIS_BYPASS_DEBUG_MODE then print("Debugging: Hooked Kill function!") end
    end
    
    if typeof(Detected) == "function" and debug.info(Detected, "s") == ".Client.Core.Anti" then
        hookfunction(Detected, function(Action, Info, NoCrash) 
            if getgenv().ADONIS_BYPASS_DEBUG_MODE then
                warn("\n------------------------------")
                warn("DEBUG: Detected function has been called, Action argument:", tostring(Action), "Information argument:", tostring(Info), "No Crash argument:", tostring(NoCrash))
                warn("------------------------------\n")
            end
        end)
        if getgenv().ADONIS_BYPASS_DEBUG_MODE then print("Debugging: Hooked Detected function!") end
    end
end

getgenv().BYPASSED_ADONIS = true
