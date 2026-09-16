local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")

local RobloxPromptGui = CoreGui:WaitForChild("RobloxPromptGui", 60)
local PromptOverlay = RobloxPromptGui:WaitForChild("promptOverlay", 60)

PromptOverlay.ChildAdded:Connect(function(Child)
    while task.wait() do
        Child.Visible = false
        GuiService:ClearError()
    end
end)
