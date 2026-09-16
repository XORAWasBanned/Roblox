if not game.IsLoaded then game.Loaded:Wait() end
local GameInfo = loadstring(game:HttpGet("https://raw.githubusercontent.com/XORAWasBanned/Roblox/refs/heads/main/Scripts/Utilities%20/Others%20/Game%20Information%20Fetcher.luau", true))()
local Name, Decompile, GetNilInstances, NewDecompilation = GameInfo.Name .. " " .. GameInfo.ID, decompile, getnilinstances
local Folder = {
    Create = makefolder,
    Delete = deletefolder or delfolder,
    Edit = appendfolder,
    IsSelf = isfolder,
}
local File = {
    Create = writefile,
    Delete = deletefile or delfile,
    Edit = appendfile,
    IsSelf = isfile,
}

local function DecompileScripts(Service)
    if Service == "All" then
        for _, Service in game:GetChildren() do DecompileScripts(Service.Name:gsub("%s+", "")) end
        DecompileScripts("Deleted")
        return
    end
    local Scripts = Service == "Deleted" and GetNilInstances() or game:GetService(Service):GetDescendants()
    for _, Script in Scripts do
        if not Script:IsA("LuaSourceContainer") or Script.ClassName == "Script" and Script.RunContext ~= Enum.RunContext.Client then continue end
        local ServiceFolder = Name .. "/" .. Service
        local ClassFolder = ServiceFolder .. "/" .. Script.ClassName .. "s"
        local ScriptFile = ClassFolder .. "/" .. Script.Name .. ".luau"
        if File.IsSelf(ScriptFile) then
            local ID = 0
            while File.IsSelf(ClassFolder .. "/" .. Script.Name .. " (" .. ID .. ").luau") do ID += 1 end
            ScriptFile = ClassFolder .. "/" .. Script.Name .. " (" .. ID .. ").luau"
        end
        if Folder.IsSelf(Name) and not NewDecompilation then Folder.Delete(Name) NewDecompilation = true end
        Folder.Create(Name)
        Folder.Create(ServiceFolder)
        if not Folder.IsSelf(ClassFolder) then Folder.Create(ClassFolder) end
        local Success, DecompiledSource = pcall(Decompile, Script)
        File.Create(ScriptFile, "-- Path: " .. Script:GetFullName() .. "\n" .. DecompiledSource)
    end
end

DecompileScripts("Workspace")
DecompileScripts("ReplicatedStorage")
DecompileScripts("ReplicatedFirst")
DecompileScripts("Players")
DecompileScripts("Deleted")
