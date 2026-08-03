--[[
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  ____  ____  | || |              | || |     ____     | || |  _______     | || |      __      | |
| | |_  _||_  _| | || |              | || |   .'    `.   | || | |_   __ \    | || |     /  \     | |
| |   \ \  / /   | || |              | || |  /  .--.  \  | || |   | |__) |   | || |    / /\ \    | |
| |    > `' <    | || |              | || |  | |    | |  | || |   |  __ /    | || |   / ____ \   | |
| |  _/ /'`\ \_  | || |              | || |  \  `--'  /  | || |  _| |  \ \_  | || | _/ /    \ \_ | |
| | |____||____| | || |   _______    | || |   `.____.'   | || | |____| |___| | || ||____|  |____|| |
| |              | || |  |_______|   | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
Universal Fly Script:
- Release Date: 2024/9/29
- Last Update: 2025/12/11
- Verison: 1.4.6

- Lastest Update Log: added new features

© 2024 X_ORA. All Rights Reserved.
]]--

if not game:IsLoaded() then game.Loaded:Wait() end

--// Script - Universal Fly \\--
getgenv().Fly = Fly or {}
Fly.Name = Fly.Name or "Universal Fly"
Fly.Enabled = Fly.Enabled or false
Fly.Speed = Fly.Speed or 50
Fly.Method = Fly.Method or "CFrame"
Fly.ZeroGravity = Fly.ZeroGravity or true
Fly.FaceCamera = Fly.FaceCamera or true
Fly.GUI = Fly.GUI
Fly.Keybinds = Fly.Keybinds or {}
Fly.Keybinds.Fly = Fly.Keybinds.Fly or "F" or "ButtonA"
Fly.Keybinds.Hide = Fly.Keybinds.Hide or "H" or "ButtonB"
Fly.Keybinds.Remove = Fly.Keybinds.Remove or "R" or "ButtonC"
Fly.Methods = Fly.Methods or { "CFrame", "Pivot To", "Translate By", "Apply Impulse", "Velocity", "Linear Velocity", "Body Velocity", "Align Position", "Body Position", "Vector Force", "Body Force" }

local FetchService = function(Name) local Success, Service = pcall(game.GetService, game, Name) return Success and Service end
local Services = setmetatable({}, {
    __index = function(Self, Name)
        local Service = FetchService(Name) or FetchService(Name.."Service")
        rawset(Self, Name, cloneref and cloneref(Service) or Service)
        return rawget(Self, Name)
    end
})

local HiddenGui = gethui and gethui() or Services.CoreGui.RobloxGui

local LocalPlayer = Services.Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local LocalRootPart = LocalCharacter:WaitForChild("HumanoidRootPart", 10)
local LocalCamera = workspace.CurrentCamera

local Variables = {}
local Connections = {}



--// FUNCTIONS



local function SetupInput()
    local TouchMoveVector = vector.zero
    if Services.UserInput.TouchEnabled then
        local ScreenSize, StickCenter, StickActive, TouchId = LocalCamera.ViewportSize
        local StickRadius = math.min(ScreenSize.X, ScreenSize.Y) * 0.15
        
        Connections[#Connections+1] = Services.UserInput.TouchStarted:Connect(function(Input)
            local Position = Input.Position
            if Position.X < ScreenSize.X * 0.4 and not StickActive then
                StickActive, TouchId = true, Input
                StickCenter = Vector2.new(Position.X, Position.Y)
            end
        end)
        
        Connections[#Connections+1] = Services.UserInput.TouchMoved:Connect(function(Input)
            if Input ~= TouchId or not StickCenter then return end
            local Position = Input.Position
            local Delta = Vector2.new(Position.X - StickCenter.X, Position.Y - StickCenter.Y)
            local Clamped = Delta.Magnitude > StickRadius and Delta.Unit * StickRadius or Delta
            local Normalized = Clamped / StickRadius
            TouchMoveVector = Normalized.Magnitude > 0.15 and vector.create(Normalized.X, 0, Normalized.Y) or vector.zero
        end)
        
        Connections[#Connections+1] = Services.UserInput.TouchEnded:Connect(function(Input)
            if Input ~= TouchId then return end
            StickActive, TouchId, StickCenter = false, nil, nil
            TouchMoveVector = vector.zero
        end)
    end
    
    return function()
        if Services.UserInput.TouchEnabled then return TouchMoveVector end
        local X, Z = 0, 0
        
        if Services.UserInput.KeyboardEnabled then
            local UIS = Services.UserInput
            X = (UIS:IsKeyDown(Enum.KeyCode.D) or UIS:IsKeyDown(Enum.KeyCode.Right) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.A) or UIS:IsKeyDown(Enum.KeyCode.Left) and 1 or 0)
            Z = (UIS:IsKeyDown(Enum.KeyCode.S) or UIS:IsKeyDown(Enum.KeyCode.Down) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.Up) and 1 or 0)
        end
        
        if Services.UserInput.GamepadEnabled then
            for _, Input in Services.UserInput:GetGamepadState(Enum.UserInputType.Gamepad1) do
                if Input.KeyCode ~= Enum.KeyCode.Thumbstick1 then continue end
                local Stick = Input.Position
                if Stick.Magnitude > 0.2 then X, Z = Stick.X, -Stick.Y end
                break
            end
        end
        
        return vector.create(X, 0, Z)
    end
end; Variables["GetMoveVector"] = SetupInput()

local function FlyFunction(Enabled)
    if Enabled == true then
        Services.Run:BindToRenderStep("Fly", Enum.RenderPriority.Camera.Value - 1, function(DeltaTime)
            if Fly.ZeroGravity and not Fly.OriginalGravity and not Connections["GravityChanged"] then
                Fly.OriginalGravity =  workspace.Gravity
                Connections["GravityChanged"] = workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
                    workspace.Gravity = 0
                end)
                workspace.Gravity = 0
            elseif not Fly.ZeroGravity and Fly.OriginalGravity and Connections["GravityChanged"] then
                Connections["GravityChanged"]:Disconnect()
                Connections["GravityChanged"] = nil
                workspace.Gravity = Fly.OriginalGravity
            end
            
            if not (LocalCharacter and LocalRootPart) then return end
            
            local Method = tostring(Fly.Method):lower():gsub("%s+", "")
            local CameraCFrame = LocalCamera.CFrame
            local MoveVector = Variables["GetMoveVector"]()
            local MoveDirection = (-CameraCFrame.LookVector * MoveVector.Z) + (CameraCFrame.RightVector * MoveVector.X)
            local MovePosition = MoveDirection * Fly.Speed * DeltaTime
            
            if Fly.FaceCamera and Method ~= "cframe" then
                local RootAttachment = LocalRootPart:FindFirstChild("RootAttachment") or Instance.new("Attachment", LocalRootPart)
                if RootAttachment.ClassName ~= "Attachment" then RootAttachment:Destroy() return end
                RootAttachment.Name = "RootAttachment"
                
                local FlyOrientation = LocalRootPart:FindFirstChild("Fly Orientation") or Instance.new("AlignOrientation", LocalRootPart)
                FlyOrientation.Name = "Fly Orientation"
                FlyOrientation.Mode = 0
                FlyOrientation.Attachment0 = RootAttachment
                FlyOrientation.MaxTorque = math.huge
                FlyOrientation.Responsiveness = 200
                FlyOrientation.CFrame = CFrame.new(vector.zero, LocalCamera.CFrame.LookVector)
            elseif not Fly.FaceCamera or Method == "cframe" then
                local FlyOrientation = LocalRootPart:FindFirstChild("Fly Orientation")
                if FlyOrientation and FlyOrientation.ClassName == "AlignOrientation" then FlyOrientation:Destroy() end
            end
            
            if Method ~= "velocity" then
                LocalRootPart.Velocity = vector.zero
                LocalRootPart.AssemblyLinearVelocity = vector.zero
                LocalRootPart.RotVelocity = vector.zero
                LocalRootPart.AssemblyAngularVelocity = vector.zero
            end
            
            if Method == "cframe" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler")
                if FlyHandler then FlyHandler:Destroy() end
                
                MovePosition = LocalRootPart.Position + MoveDirection * Fly.Speed * Services.Run.Heartbeat:Wait()
                LocalRootPart.CFrame = Fly.FaceCamera and CFrame.new(MovePosition, MovePosition + LocalCamera.CFrame.LookVector) or CFrame.new(MovePosition) * LocalRootPart.CFrame.Rotation
            elseif Method == "pivotto" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler")
                if FlyHandler then FlyHandler:Destroy() end
                LocalCharacter:PivotTo(CFrame.new(LocalCharacter:GetPivot().Position + MovePosition) * LocalCharacter:GetPivot().Rotation)
            elseif Method == "translateby" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler")
                if FlyHandler then FlyHandler:Destroy() end
                LocalCharacter:TranslateBy(MovePosition)
            elseif Method == "applyimpulse" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler")
                if FlyHandler then FlyHandler:Destroy() end
                LocalRootPart:ApplyImpulse(MovePosition * 775)
            elseif Method == "velocity" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler")
                if FlyHandler then FlyHandler:Destroy() end
                
                MovePosition = MovePosition * 62.5
                LocalRootPart.Velocity = MovePosition
                LocalRootPart.AssemblyLinearVelocity = MovePosition
            elseif Method == "linearvelocity" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler") or Instance.new("LinearVelocity", LocalRootPart)
                if FlyHandler.ClassName ~= "LinearVelocity" then FlyHandler:Destroy() return end
                
                local RootAttachment = LocalRootPart:FindFirstChild("RootAttachment") or Instance.new("Attachment", LocalRootPart)
                if RootAttachment.ClassName ~= "Attachment" then RootAttachment:Destroy() return end
                RootAttachment.Name = "RootAttachment"
                
                FlyHandler.Name = "Fly Handler"
                FlyHandler.ForceLimitMode = 1
                FlyHandler.ForceLimitsEnabled = false
                FlyHandler.Attachment0 = RootAttachment
                FlyHandler.VectorVelocity = MovePosition * 62.5
            elseif Method == "bodyvelocity" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler") or Instance.new("BodyVelocity", LocalRootPart)
                if FlyHandler.ClassName ~= "BodyVelocity" then FlyHandler:Destroy() return end
                
                FlyHandler.Name = "Fly Handler"
                FlyHandler.MaxForce = vector.one * math.huge
                FlyHandler.P = math.huge
                FlyHandler.Velocity = MovePosition * 62.5
            elseif Method == "alignposition" then
                local RootAttachment = LocalRootPart:FindFirstChild("RootAttachment") or Instance.new("Attachment", LocalRootPart)
                if RootAttachment.ClassName ~= "Attachment" then RootAttachment:Destroy() return end
                RootAttachment.Name = "RootAttachment"
                
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler") or Instance.new("AlignPosition", LocalRootPart)
                if FlyHandler.ClassName ~= "AlignPosition" then FlyHandler:Destroy() return end
                MovePosition = MovePosition * 73000
                
                FlyHandler.Name = "Fly Handler"
                FlyHandler.Mode = 0
                FlyHandler.Attachment0 = RootAttachment
                FlyHandler.ForceRelativeTo = 2
                FlyHandler.Responsiveness = 200
                FlyHandler.MaxForce = MovePosition.Magnitude
                FlyHandler.Position = LocalRootPart.Position + MovePosition
            elseif Method == "bodyposition" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler") or Instance.new("BodyPosition", LocalRootPart)
                if FlyHandler.ClassName ~= "BodyPosition" then FlyHandler:Destroy() return end
                FlyHandler.Name = "Fly Handler"
                FlyHandler.D = 0
                FlyHandler.MaxForce = vector.one * math.huge
                FlyHandler.P = 100
                FlyHandler.Position = LocalRootPart.Position + MovePosition * 60
            elseif Method == "vectorforce" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler") or Instance.new("VectorForce", LocalRootPart)
                if FlyHandler.ClassName ~= "VectorForce" then FlyHandler:Destroy() return end
                
                local RootAttachment = LocalRootPart:FindFirstChild("RootAttachment") or Instance.new("Attachment", LocalRootPart)
                if RootAttachment.ClassName ~= "Attachment" then RootAttachment:Destroy() return end
                RootAttachment.Name = "RootAttachment"
                
                FlyHandler.Name = "Fly Handler"
                FlyHandler.RelativeTo = 2
                FlyHandler.Attachment0 = RootAttachment
                FlyHandler.ApplyAtCenterOfMass = false
                FlyHandler.Force = MovePosition * 73000
            elseif Method == "bodyforce" then
                local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler") or Instance.new("BodyForce", LocalRootPart)
                if FlyHandler.ClassName ~= "BodyForce" then FlyHandler:Destroy() return end
                FlyHandler.Name = "Fly Handler"
                FlyHandler.Force = MovePosition * 73000
            end
        end)
    else
        Services.Run:UnbindFromRenderStep("Fly")
        
        if Fly.ZeroGravity then
            if Connections["GravityChanged"] then
                Connections["GravityChanged"]:Disconnect()
                Connections["GravityChanged"] = nil
            end
            workspace.Gravity = Fly.OriginalGravity or workspace.Gravity
            Fly.OriginalGravity = nil
        end
        
        if not (LocalCharacter and LocalRootPart) then return end
        
        local FlyHandler = LocalRootPart:FindFirstChild("Fly Handler")
        if FlyHandler then FlyHandler:Destroy() end
        
        local FlyOrientation = LocalRootPart:FindFirstChild("Fly Orientation")
        if FlyOrientation then FlyOrientation:Destroy() end 
    end
end



--// CONNECTIONS



Connections[#Connections+1] = LocalPlayer.CharacterAdded:Connect(function(AddedCharacter)
    LocalCharacter = AddedCharacter
    LocalRootPart = LocalCharacter:WaitForChild("HumanoidRootPart", 10)
end)

Connections[#Connections+1] = LocalPlayer.CharacterRemoving:Connect(function()
    LocalCharacter, LocalRootPart = nil, nil
end)



--// GUI



local DraggingTicks = { Fly = 0, Hide = 0, Remove = 0 }

if Fly.GUI then 
    Fly.GUI:Destroy() 
    Fly.GUI = nil
    
    Services.Run:UnbindFromRenderStep("Fly")
    
    if Fly.Connections then
        for Index, Connection in Fly.Connections do
            Connection:Disconnect()
            Connections[Index] = nil
        end
        Fly.Connections = nil
    end
    
    workspace.Gravity = Fly.OriginalGravity or workspace.Gravity
    FlyFunction(Fly.Enabled)
end

local GUIHolder = Instance.new("ScreenGui", HiddenGui)
GUIHolder.Name = "GUIHolder"
GUIHolder.Enabled = true
GUIHolder.ResetOnSpawn = false
GUIHolder.IgnoreGuiInset = true
GUIHolder.DisplayOrder = 2^31
GUIHolder.ZIndexBehavior = "Global"

local Container = Instance.new("Frame", GUIHolder)
Container.Name = "Container"
Container.Size = UDim2.new(0, 200, 0, 255)
Container.Position = UDim2.new(0.5, 0, 0.4, 0)
Container.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
Container.BackgroundTransparency = 0
Container.BorderSizePixel = 0
Container.AnchorPoint = Vector2.new(0.5, 0.5)
Container.Active = true
Container.Draggable = true
Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 10)

local ContainerUIStroke = Instance.new("UIStroke",Container)
ContainerUIStroke.Thickness = 4
ContainerUIStroke.ApplyStrokeMode = "Border"
ContainerUIStroke.Color = Color3.fromRGB(40, 40, 80)

local TitleLabel = Instance.new("TextLabel",Container)
TitleLabel.Name = "TitleLabel"
TitleLabel.Text = "Universal Fly"
TitleLabel.Font = "PermanentMarker"
TitleLabel.TextSize = 30
TitleLabel.TextColor3 = Color3.new(1,1,1)
TitleLabel.TextTransparency = 0
TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.TextStrokeTransparency = 0
TitleLabel.TextWrapped = true
TitleLabel.TextTruncate = Enum.TextTruncate.None
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
TitleLabel.RichText = true
TitleLabel.BackgroundTransparency = 1
TitleLabel.BorderSizePixel = 0
TitleLabel.Position = UDim2.new(0.5, 0, 0.0, 25)
TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.ZIndex = 1

local SpeedLabel = Instance.new("TextLabel", Container)
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Text = Fly.Enabled and "Speed: "..tostring(Fly.Speed) or "Greetings " .. LocalPlayer.DisplayName 
SpeedLabel.Font = "GothamBold"
SpeedLabel.TextSize = 17.5
SpeedLabel.TextColor3 = Color3.new(1,1,1)
SpeedLabel.TextStrokeTransparency = 1
SpeedLabel.TextScaled = false
SpeedLabel.TextWrapped = true
SpeedLabel.TextTruncate = Enum.TextTruncate.None
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Center
SpeedLabel.TextYAlignment = Enum.TextYAlignment.Center
SpeedLabel.RichText = true
SpeedLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
SpeedLabel.BorderSizePixel = 0
SpeedLabel.Position = UDim2.new(0.5, 0, 0, 75)
SpeedLabel.AnchorPoint = Vector2.new(0.5, 0.5)
SpeedLabel.Size = UDim2.new(0.85, 0, 0, 50)
SpeedLabel.ZIndex = 1
SpeedLabel.ClipsDescendants = false
Instance.new("UICorner", SpeedLabel).CornerRadius = UDim.new(0, 10)

local SpeedChanger = Instance.new("TextBox", Container)
SpeedChanger.Name = "Speed Changer"
SpeedChanger.Text = Fly.Enabled and tostring(Fly.Speed) or ""
SpeedChanger.Font = "GothamBold"
SpeedChanger.TextSize = 17.5
SpeedChanger.TextColor3 = Color3.new(1,1,1)
SpeedChanger.TextStrokeTransparency = 1
SpeedChanger.TextScaled = false
SpeedChanger.TextWrapped = true
SpeedChanger.PlaceholderText = "Change Fly Speed Here!"
SpeedChanger.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
SpeedChanger.ClearTextOnFocus = true
SpeedChanger.MultiLine = true
SpeedChanger.TextXAlignment = Enum.TextXAlignment.Center
SpeedChanger.TextYAlignment = Enum.TextYAlignment.Center
SpeedChanger.RichText = true
SpeedChanger.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
SpeedChanger.BorderSizePixel = 0
SpeedChanger.Position = UDim2.new(0.5, 0, 0, 130)
SpeedChanger.AnchorPoint = Vector2.new(0.5, 0.5)
SpeedChanger.Size = UDim2.new(0.85, 0, 0, 50)
SpeedChanger.ZIndex = 1
SpeedChanger.ClipsDescendants = false
Instance.new("UICorner", SpeedChanger).CornerRadius = UDim.new(0, 10)

local ShowDropdown = Instance.new("TextButton", Container)
ShowDropdown.Name = "Show Dropdown"
ShowDropdown.Text = "Method: " .. Fly.Method
ShowDropdown.Font = "GothamBold"
ShowDropdown.TextSize = 15
ShowDropdown.TextColor3 = Color3.new(1,1,1)
ShowDropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
ShowDropdown.Position = UDim2.new(0.5, 0, 0, 180)
ShowDropdown.AnchorPoint = Vector2.new(0.5, 0.5)
ShowDropdown.Size = UDim2.new(0.85, 0, 0, 40)
Instance.new("UICorner", ShowDropdown).CornerRadius = UDim.new(0, 10)

local DropdownItems = Instance.new("ScrollingFrame", Container)
DropdownItems.Name = "Dropdown Items"
DropdownItems.Size = UDim2.new(0.85, 0, 0, 0)
DropdownItems.Position = UDim2.new(0.5, 0, 0, 200)
DropdownItems.AnchorPoint = Vector2.new(0.5, 0)
DropdownItems.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
DropdownItems.ClipsDescendants = true
DropdownItems.ScrollBarThickness = 0
DropdownItems.ScrollingDirection = "Y"
DropdownItems.AutomaticCanvasSize = "None"
DropdownItems.ZIndex = 2
Instance.new("UICorner", DropdownItems).CornerRadius = UDim.new(0, 10)

local DropdownLayout = Instance.new("UIListLayout", DropdownItems)
DropdownLayout.Name = "Dropdown Layout"
DropdownLayout.SortOrder = "LayoutOrder"
DropdownLayout.Padding = UDim.new(0, 5)

local DropdownPadding = Instance.new("UIPadding", DropdownItems)
DropdownPadding.Name = "Dropdown Padding"
DropdownPadding.PaddingTop = UDim.new(0, 5)
DropdownPadding.PaddingBottom = UDim.new(0, 5)
DropdownPadding.PaddingLeft = UDim.new(0.05, 0)

local GravityButton = Instance.new("TextButton", Container)
GravityButton.Name = "GravityButton"
GravityButton.Text = Fly.ZeroGravity and 'Zero Gravity: <font color="rgb(0,255,0)">ON</font>' or 'Zero Gravity: <font color="rgb(255,0,0)">OFF</font>'
GravityButton.Font = "GothamBold"
GravityButton.TextSize = 10
GravityButton.TextColor3 = Color3.new(1,1,1)
GravityButton.TextTransparency = 0
GravityButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
GravityButton.TextStrokeTransparency = 0
GravityButton.TextScaled = true
GravityButton.RichText = true
GravityButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
GravityButton.BorderSizePixel = 0
GravityButton.Size = UDim2.new(0.45, 0, 0, 30)
GravityButton.Position = UDim2.new(0.265, 0, 0, 225) 
GravityButton.AnchorPoint = Vector2.new(0.5, 0.5)
GravityButton.AutoButtonColor = true
GravityButton.ZIndex = 1
Instance.new("UICorner", GravityButton).CornerRadius = UDim.new(0, 10)

local FaceCameraButton = Instance.new("TextButton", Container)
FaceCameraButton.Name = "FaceCameraButton"
FaceCameraButton.Text = Fly.FaceCamera and 'Face Camera: <font color="rgb(0,255,0)">ON</font>' or 'Face Camera: <font color="rgb(255,0,0)">OFF</font>'
FaceCameraButton.Font = "GothamBold"
FaceCameraButton.TextSize = 10
FaceCameraButton.TextColor3 = Color3.new(1,1,1)
FaceCameraButton.TextTransparency = 0
FaceCameraButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
FaceCameraButton.TextStrokeTransparency = 0
FaceCameraButton.TextScaled = true
FaceCameraButton.RichText = true
FaceCameraButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
FaceCameraButton.BorderSizePixel = 0
FaceCameraButton.Size = UDim2.new(0.45, 0, 0, 30)
FaceCameraButton.Position = UDim2.new(0.735, 0, 0, 225) 
FaceCameraButton.AnchorPoint = Vector2.new(0.5, 0.5)
FaceCameraButton.AutoButtonColor = true
FaceCameraButton.ZIndex = 1
Instance.new("UICorner", FaceCameraButton).CornerRadius = UDim.new(0, 10)

for Index, Method in Fly.Methods do
    local Option = Instance.new("TextButton", DropdownItems)
    Option.Text = Method
    Option.Font = Enum.Font.GothamBold
    Option.TextSize = 14
    Option.TextColor3 = Color3.new(1, 1, 1)
    Option.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    Option.Size = UDim2.new(0.95, 0, 0, 32.5)
    Option.LayoutOrder = Index
    Option.ZIndex = 2
    Instance.new("UICorner", Option).CornerRadius = UDim.new(0, 5)
    Option.MouseButton1Click:Connect(function()
        Fly.Method = Method
        ShowDropdown.Text = "Method: " .. Method
        DropdownItems:TweenSize(UDim2.new(0.85, 0, 0, 0), "Out", "Sine", 0.2, true)
        Variables["ShowDropDown"] = false
    end)
end

Connections[#Connections+1] = DropdownLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    DropdownItems.CanvasSize = UDim2.new(0, 0, 0, DropdownLayout.AbsoluteContentSize.Y + DropdownPadding.PaddingTop.Offset + DropdownPadding.PaddingBottom.Offset)
end)

Connections[#Connections+1] = ShowDropdown.MouseButton1Click:Connect(function()
    Variables["ShowDropDown"] = Variables["ShowDropDown"] == nil and true or not Variables["ShowDropDown"]
    local Height = Variables["ShowDropDown"] and math.min(#Fly.Methods * 30 + 15, 150) or 0
    DropdownItems:TweenSize(UDim2.new(0.85, 0, 0, Height), "Out", "Sine", 0.25, true)
end)

Connections[#Connections+1] = GravityButton.MouseButton1Click:Connect(function()
    Fly.ZeroGravity = not Fly.ZeroGravity
    GravityButton.Text = Fly.ZeroGravity and 'Zero Gravity: <font color="rgb(0,255,0)">ON</font>' or 'Zero Gravity: <font color="rgb(255,0,0)">OFF</font>'
end)

Connections[#Connections+1] = FaceCameraButton.MouseButton1Click:Connect(function()
    Fly.FaceCamera = not Fly.FaceCamera
    FaceCameraButton.Text = Fly.FaceCamera and 'Face Camera: <font color="rgb(0,255,0)">ON</font>' or 'Face Camera: <font color="rgb(255,0,0)">OFF</font>'
end)

if Services.UserInput.TouchEnabled  then
    local FlyButton = Instance.new("TextButton", GUIHolder)
    FlyButton.Name = "FlyButton"
    FlyButton.Text = Fly.Enabled and 'FLY: <font color="rgb(0,255,0)" size="20">ON</font>' or 'FLY: <font color="rgb(255,0,0)" size="20">OFF</font>'
    FlyButton.Font = "GothamBold"
    FlyButton.TextSize = 20
    FlyButton.TextColor3 = Color3.new(1,1,1)
    FlyButton.TextTransparency = 0
    FlyButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    FlyButton.TextStrokeTransparency = 0
    FlyButton.TextScaled = false
    FlyButton.RichText = true
    FlyButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    FlyButton.BorderSizePixel = 0
    FlyButton.Size = UDim2.new(0, 125, 0, 45) 
    FlyButton.Position = UDim2.new(0.5, 0, 0.19, 0) 
    FlyButton.AnchorPoint = Vector2.new(0.5, 0.5)
    FlyButton.AutoButtonColor = true
    FlyButton.Draggable = true
    FlyButton.Active = true
    FlyButton.ZIndex = 1
    
    local FlyButtonUIStroke = Instance.new("UIStroke",FlyButton)
    FlyButtonUIStroke.Thickness = 4
    FlyButtonUIStroke.ApplyStrokeMode = "Border"
    FlyButtonUIStroke.Color = Color3.fromRGB(40, 40, 80)
    Instance.new("UICorner", FlyButton).CornerRadius = UDim.new(0, 10)
    
    local HideButton = Instance.new("TextButton", GUIHolder)
    HideButton.Name = "HideButton"
    HideButton.Text = "Hide"
    HideButton.Font = "GothamBold"
    HideButton.TextSize = 20
    HideButton.TextColor3 = Color3.new(1,1,1)
    HideButton.TextTransparency = 0
    HideButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    HideButton.TextStrokeTransparency = 0
    HideButton.TextScaled = false
    HideButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    HideButton.BorderSizePixel = 0
    HideButton.Size = UDim2.new(0, 100, 0, 45) 
    HideButton.Position = UDim2.new(0.35, 0, 0.15, 0) 
    HideButton.AnchorPoint = Vector2.new(0.5, 0.5)
    HideButton.AutoButtonColor = true
    HideButton.Draggable = true
    HideButton.Active = true
    HideButton.ZIndex = 1
    Instance.new("UICorner", HideButton).CornerRadius = UDim.new(0, 10)
    
    local HideButtonUIStroke = Instance.new("UIStroke",HideButton)
    HideButtonUIStroke.Thickness = 4
    HideButtonUIStroke.ApplyStrokeMode = "Border"
    HideButtonUIStroke.Color = Color3.fromRGB(40, 40, 80)
    
    local RemoveButton = Instance.new("TextButton", GUIHolder)
    RemoveButton.Name = "RemoveButton"
    RemoveButton.Text = "Remove"
    RemoveButton.Font = "GothamBold"
    RemoveButton.TextSize = 20
    RemoveButton.TextColor3 = Color3.new(1,1,1)
    RemoveButton.TextTransparency = 0
    RemoveButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    RemoveButton.TextStrokeTransparency = 0
    RemoveButton.TextScaled = false
    RemoveButton.RichText = true
    RemoveButton.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    RemoveButton.BackgroundTransparency = 0
    RemoveButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    RemoveButton.BorderSizePixel = 0
    RemoveButton.Size = UDim2.new(0, 100, 0, 45) 
    RemoveButton.Position = UDim2.new(0.65, 0, 0.15, 0) 
    RemoveButton.AnchorPoint = Vector2.new(0.5, 0.5)
    RemoveButton.AutoButtonColor = true
    RemoveButton.Selected = false
    RemoveButton.Draggable = true
    RemoveButton.ZIndex = 1
    Instance.new("UICorner", RemoveButton).CornerRadius = UDim.new(0, 10)
    
    local RemoveButtonUIStroke = Instance.new("UIStroke",RemoveButton)
    RemoveButtonUIStroke.Thickness = 4
    RemoveButtonUIStroke.ApplyStrokeMode = "Border"
    RemoveButtonUIStroke.Color = Color3.fromRGB(40, 40, 80)
    
    
    
    --// CONNECTIONS
    
    
    
    Connections[#Connections+1] = FlyButton.MouseButton1Down:Connect(function()
        DraggingTicks.Fly = os.clock()
    end)
    
    Connections[#Connections+1] = FlyButton.MouseButton1Up:Connect(function()
        if os.clock() - DraggingTicks.Fly > 0.15 then return end
        SpeedLabel.Text = "Speed: "..tostring(Fly.Speed)
        Fly.Enabled = not Fly.Enabled
        FlyButton.Text = Fly.Enabled and 'FLY: <font color="rgb(0,255,0)" size="20">ON</font>' or 'FLY: <font color="rgb(255,0,0)" size="20">OFF</font>'
        FlyFunction(Fly.Enabled)
    end)
    
    Connections[#Connections+1] = HideButton.MouseButton1Down:Connect(function()
        DraggingTicks.Hide = os.clock()
    end)
    
    Connections[#Connections+1] = HideButton.MouseButton1Up:Connect(function()
        if os.clock() - DraggingTicks.Hide > 0.15 then return end
        HideButton.Text = HideButton.Text == "Hide" and "Show" or "Hide"
        Container.Visible = HideButton.Text == "Hide" and true or false
        RemoveButton.Visible = HideButton.Text == "Hide" and true or false
    end)
    
    Connections[#Connections+1] = RemoveButton.MouseButton1Down:Connect(function()
        DraggingTicks.Remove = os.clock()
    end)
    
    Connections[#Connections+1] = RemoveButton.MouseButton1Up:Connect(function()
        if os.clock() - DraggingTicks.Remove > 0.15 then return end
        Fly.Enabled = false
        Fly.GUI = nil
        Fly.Variables = nil
        Fly.Connections = nil
        FlyFunction(Fly.Enabled)
        GUIHolder:Destroy()
        for Index, Connection in Connections do 
            Connection:Disconnect() 
            Connections[Index] = nil 
        end
    end)
elseif Services.UserInput.KeyboardEnabled or Services.UserInput.GamepadEnabled then
    Connections["InputBegan"] = Services.UserInput.InputBegan:Connect(function(Input, Typing)
        if not Services.UserInput.KeyboardEnabled and not Services.UserInput.GamepadEnabled then Connections["InputBegan"]:Disconnect() Connections["InputBegan"] = nil end
        if Typing then return end
        
        if Input.KeyCode == Enum.KeyCode[Fly.Keybinds.Fly] then
            Fly.Enabled = not Fly.Enabled
            SpeedLabel.Text = "Speed: " .. tostring(Fly.Speed)
            FlyFunction(Fly.Enabled)
        end
        
        if Input.KeyCode == Enum.KeyCode[Fly.Keybinds.Hide] then
            Container.Visible = not Container.Visible
        end
        
        if Input.KeyCode == Enum.KeyCode[Fly.Keybinds.Remove] then
            Fly.Enabled = false
            Fly.GUI = nil
            Fly.Variables = nil
            Fly.Connections = nil
            FlyFunction(Fly.Enabled)
            GUIHolder:Destroy()
            for Index, Connection in Connections do 
                Connection:Disconnect() 
                Connections[Index] = nil 
            end
        end
    end)
end

Connections[#Connections+1] = SpeedChanger.FocusLost:Connect(function(EnterPressed, InputThatCausedFocusLoss)
    local Number = tonumber(SpeedChanger.Text)
    local String = tostring(Number)
    
    SpeedChanger.Text = String ~= "nil" and SpeedChanger.Text or tostring(Fly.Speed)
    SpeedLabel.Text = "Speed: "..SpeedChanger.Text
    Fly.Speed = tonumber(SpeedChanger.Text)
end)

Fly.GUI = GUIHolder
Fly.Connections = Connections
