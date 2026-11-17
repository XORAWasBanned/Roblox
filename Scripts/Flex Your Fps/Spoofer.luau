setfflag("DataSenderRate", "0")

local GameId, ServerId = game.PlaceId, game.JobId
local Players, TeleportService = game:GetService("Players"), game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

queue_on_teleport([[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Receiver, Sender = ReplicatedStorage.meow, ReplicatedStorage.nya
local ReceiverEvent = getcallbackvalue(Receiver, "OnClientEvent") or getconnections(Receiver.OnClientEvent)[1].Function
local QualityLevels = {
    Enum.SavedQualitySetting.QualityLevel1,
    Enum.SavedQualitySetting.QualityLevel2,
    Enum.SavedQualitySetting.QualityLevel3,
    Enum.SavedQualitySetting.QualityLevel4,
    Enum.SavedQualitySetting.QualityLevel5,
    Enum.SavedQualitySetting.QualityLevel6,
    Enum.SavedQualitySetting.QualityLevel7,
    Enum.SavedQualitySetting.QualityLevel8,
    Enum.SavedQualitySetting.QualityLevel9,
    Enum.SavedQualitySetting.QualityLevel10
}

local Original; Original = hookfunction(ReceiverEvent, function(Received)
    if typeof(Received) ~= "table" then return end
    local Token, Type = Received.token, Received.t
    if not (typeof(Token) == "number" and typeof(Type) == "string") then return end
    if Type == "device" then
        Sender:FireServer({
            t = Type,
            token = Token,
            tbl = {
                A = false, -- VR
                B = false, -- Console
                C = false, -- Window
                D = getfenv().version(),
                E = false, -- Android
                F = false, -- Touch Enabled -- android?
                G = true, -- Keyboard Enabled - linux?
                H = true, -- Mouse Enabled - linux
                I = false, -- ???
            }
        })
        return
    end
    if Type == "metrics" then
        Sender:FireServer({
            t = Type,
            token = Token,
            fps = math.random(1,3500),
            mem = math.random(1,5000),
            res = Vector2.new(math.random(1, 1000), math.random(1, 1000)),
            gfx = QualityLevels[math.random(1,10)]
        })
        return
    end
    return Original(Received)
end)

task.wait(1)

setfflag("DataSenderRate", "60")
]])

if #Players:GetPlayers() > 1 then
    TeleportService:TeleportToPlaceInstance(GameId, ServerId, LocalPlayer)
else
    TeleportService:Teleport(GameId, LocalPlayer)
end
