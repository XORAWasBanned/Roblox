if not game.IsLoaded then game.Loaded:Wait() end
local CoreGui, GuiService = game:GetService("CoreGui"), game:GetService("GuiService")

local RobloxPromptGui = CoreGui:WaitForChild("RobloxPromptGui", 60)
local PromptOverlay = RobloxPromptGui:WaitForChild("promptOverlay", 60)

PromptOverlay.ChildAdded:Connect(function(Child)
    while task.wait() do
        Child.Visible = false
        GuiService:ClearError()
    end
end)
