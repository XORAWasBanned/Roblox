local Players, CoreGui, TeleportService, GameId, ServerId = game:GetService("Players"), game:GetService("CoreGui"), game:GetService("TeleportService"), game.PlaceId, game.JobId

local RobloxPromptGui = CoreGui:WaitForChild("RobloxPromptGui", 60)
local PromptOverlay = RobloxPromptGui:WaitForChild("promptOverlay", 60)

local LocalPlayer = Players.LocalPlayer

PromptOverlay.ChildAdded:Connect(function()
    while true do
        pcall(function()
            if #Players:GetPlayers() > 1 then
                TeleportService:TeleportToPlaceInstance(GameId, ServerId, LocalPlayer)
            else
                TeleportService:Teleport(GameId, LocalPlayer)
            end
        end)
        task.wait(3)
    end
end)
