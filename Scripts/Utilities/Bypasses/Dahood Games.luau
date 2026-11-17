local GameData = loadstring(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Utilities%20/Others%20/Game%20Information%20Fetcher.luau", true))() 
loadstring(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Utilities%20/Bypasses/Adonis.luau", true))() 

local Name = (GameData.Name:lower():gsub("%b()", ""):gsub("%b[]", ""):gsub("%b{}", ""):gsub("%b<>", ""):gsub("%s+", ""):gsub("%W", ""))

local Namecall; Namecall = hookmetamethod(game, "__namecall", function(...)
    if checkcaller() then return Namecall(...) end
    local Arguments, Method, Script = {...}, getnamecallmethod(), getcallingscript()
    local Self = Arguments[1]
    
    if Method == "FireServer" and Self.ClassName == "RemoteEvent" then
        if Name == "dahood" and Script.Parent and Script.Parent.ClassName == "Script" and Script.Name == "LocalScript" then
            return coroutine.yield()
        elseif Name == "hoodmodded" and Script.Name:find("-") then
            return coroutine.yield()
        elseif Name == "dabattles" and Self.Name == "a" and Script == nil then
            return coroutine.yield()
        elseif Name == "danffa" and Script and Script.Parent and Script.Parent.ClassName == "Model" and (select(2, Script.Name:gsub("%d", "")) / #Script.Name) > 0.5 then
            return coroutine.yield()
        end
    end
    
    return Namecall(...)
end)
