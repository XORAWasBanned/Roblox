local RunService = game:GetService("RunService")
local ActiveAutoRotations, HeartbeatConnection = {}
local HiddenUI = gethui and gethui() or game:GetService("CoreGui").RobloxGui
local Drawing = {}

local DrawingDirectory = HiddenUI:FindFirstChild("Drawing Directory") or Instance.new("ScreenGui", HiddenUI)
DrawingDirectory.Name, DrawingDirectory.ResetOnSpawn, DrawingDirectory.IgnoreGuiInset, DrawingDirectory.DisplayOrder = "Drawing Directory", false, true, 2147483648

local BaseObject = setmetatable({
    __SHAPE = "Unknown",
    Visible = true,
    Transparency = 1,
    Color = Color3.new(1, 1, 1),
    ZIndex = 0,
    AnchorPoint = Vector2.one / 2,
    Remove = function(Self)
        if Self.__CLEANUP then Self.__CLEANUP() end
        pcall(Self.__INSTANCE.Destroy, Self.__INSTANCE)
        setmetatable(Self, nil)
    end,
    Destroy = function(Self)
        if Self.__CLEANUP then Self.__CLEANUP() end
        pcall(Self.__INSTANCE.Destroy, Self.__INSTANCE)
        setmetatable(Self, nil)
    end
}, {
    __add = function(Self, Object)
        local Clone = table.clone(Self)
        for Index, Value in Object do
            Clone[Index] = Value
        end
        return Clone
    end
})

local Letters = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L" }
local SideCounts = { Triangle = 3, Quad = 4, Pentagon = 5,Hexagon = 6, Heptagon = 7, Octagon = 8, Nonagon = 9, Decagon = 10, Hendecagon = 11, Dodecagon = 12 }



--// HELPER FUNCTIONS



local function AssertType(Value, ExpectedType, PropertyName)
    assert(typeof(Value) == ExpectedType, "Property '" .. PropertyName .. "' Expects " .. ExpectedType .. " But Got " .. typeof(Value))
end

local function GetCamera()
    local Camera = workspace.CurrentCamera
    if not (typeof(Camera) == "Instance" and Camera.ClassName == "Camera") then return end
    return Camera, Camera.ViewportSize
end

local function ConvertUDim2ToVector2(Value)
    AssertType(Value, "UDim2", "Value")
    local Camera, Resolution = GetCamera()
    if not Camera then return Vector2.new(Value.X.Offset, Value.Y.Offset) end
    return Vector2.new(
        Value.X.Scale * Resolution.X + Value.X.Offset,
        Value.Y.Scale * Resolution.Y + Value.Y.Offset
    )
end

local function GetClosestPoint(Part, Camera, HalfResolution)
    local ToCenter = Part.Position - Camera.CFrame.p
    local ViewRayDirection = (Camera:ViewportPointToRay(HalfResolution.X, HalfResolution.Y)).Direction
    local ProjectionLength = ToCenter:Dot(ViewRayDirection)
    if ProjectionLength < 0 then return end
    local HalfSize = Part.Size * 0.5
    local ProjectedPoint = Camera.CFrame.p + ViewRayDirection * ProjectionLength
    local Projected = Part.CFrame:PointToObjectSpace(ProjectedPoint)
    local Clamped = vector.create(
        math.clamp(Projected.X, -HalfSize.X, HalfSize.X),
        math.clamp(Projected.Y, -HalfSize.Y, HalfSize.Y),
        math.clamp(Projected.Z, -HalfSize.Z, HalfSize.Z)
    )
    return Part.CFrame:PointToWorldSpace(Clamped)
end

local function ConvertTargetToScreenPosition(Target, PropertyName, OnScreenCheck)
    local Type = typeof(Target)
    
    if Type == "Instance" and (Target:IsA("BasePart") or Target.ClassName == "Model") then
        local Camera, Resolution = GetCamera()
        if not Camera then return end
        local IsModel = Target.ClassName == "Model"
        local HalfResolution = Resolution / 2
        local TargetPart
        
        if IsModel then
            local BestDistance = math.huge
            
            for _, Child in Target:GetChildren() do
                if not Child:IsA("BasePart") then continue end
                
                local ClosestPoint = GetClosestPoint(Child, Camera, HalfResolution)
                if not ClosestPoint then continue end
                
                local Position, OnScreen = Camera:WorldToViewportPoint(ClosestPoint)
                if OnScreenCheck ~= false and not OnScreen then continue end
                
                local Distance = (Vector2.new(Position.X, Position.Y) - HalfResolution).Magnitude
                if Distance >= BestDistance then continue end
                
                BestDistance = Distance
            end
            TargetPart = Target:FindFirstChild("UpperTorso") or Target:FindFirstChild("Torso")
        else
            TargetPart = Target
        end
        
        if not TargetPart then return end
        local ClosestPoint = GetClosestPoint(TargetPart, Camera, HalfResolution)
        if not ClosestPoint or not select(2, Camera:WorldToViewportPoint(ClosestPoint)) then return end
        
        local FinalPosition = IsModel and Camera:WorldToViewportPoint(TargetPart.Name:find("Torso") and TargetPart.Position or Target:GetPivot().p) or Camera:WorldToViewportPoint(TargetPart.Position)
        return Vector2.new(FinalPosition.X, FinalPosition.Y)
    elseif Type == "Vector3" then
        local Camera = GetCamera()
        if not Camera then return end
        
        local Position, OnScreen = Camera:WorldToViewportPoint(Target)
        if not OnScreen then return end
        
        return Vector2.new(Position.X, Position.Y)
    elseif Type == "UDim2" then
        return ConvertUDim2ToVector2(Target)
    elseif Type == "Vector2" then
        return Target
    else
        error(PropertyName .. " Expects Vector2 Or UDim2 Or Vector3 Or BasePart Or Model But Got " .. Type, 2)
    end
end

local function CreateDrawingObject(ObjectType, UpdateFunction)
    return setmetatable({}, {
        __index = ObjectType,
        __newindex = function(_, Key, Value)
            if table.find({ "__SHAPE", "__INSTANCE", "__CLEANUP", "Remove", "Destroy", "Trace" }, Key) then
                error("You Cannot Set " .. Key)
            elseif ObjectType.Stroke and Key == "Stroke" or ObjectType.Gradient and Key == "Gradient" or ObjectType.Outlines and Key == "Outlines" or ObjectType.AutoRotation and Key == "AutoRotation" then
                error("Cannot Set " .. Key .. " Directly, Use " .. ObjectType.__SHAPE .. "Drawing." .. Key .. ".PropertyName")
            end
            
            if ObjectType.__SHAPE == "NGon" then
                if Key == "Points" then
                    assert(typeof(Value) == "number" and Value == math.floor(Value) and Value >= 3, "Points Must Be A Whole Integer >= 3")
                    local OldCount = ObjectType.Points
                    ObjectType.Points = Value
                    for Index = OldCount + 1, Value do
                        if ObjectType["Point" .. Index] ~= nil then continue end
                        ObjectType["Point" .. Index] = Vector2.zero
                    end
                    UpdateFunction()
                    return
                end
                
                local PointIndex = tonumber(Key:match("^Point(%d+)$"))
                
                if PointIndex then
                    assert(PointIndex >= 1 and PointIndex <= ObjectType.Points, "Point Index " .. PointIndex .. " Is Out Of Range (1 To " .. ObjectType.Points .. ")")
                    assert(typeof(Value) == "Vector2", "Property '" .. Key .. "' Expects Vector2 But Got " .. typeof(Value))
                    ObjectType[Key] = Value
                    UpdateFunction()
                    return
                end
            end
            
            assert(ObjectType[Key] ~= nil, "Invalid Property '" .. Key .. "' For " .. ObjectType.__SHAPE)
            
            if table.find(ObjectType.__SHAPE == "Text" and {"Position", "From", "To"} or {"Position", "From", "To", "Size"}, Key) then
                assert(typeof(Value) == "Vector2" or typeof(Value) == "UDim2", "Property '" .. Key .. "' Expects Vector2 Or UDim2 But Got " .. typeof(Value))
                Value = typeof(Value) == "UDim2" and ConvertUDim2ToVector2(Value) or Value
            else
                AssertType(Value, typeof(ObjectType[Key]), Key)
            end
            
            ObjectType[Key] = Value
            UpdateFunction()
        end
    })
end

local function FlipTransparency(Transparency)
    return math.clamp(1 - Transparency, 0, 1)
end

local function ApplyAutoRotation(Parent, OnTick)
    local AutoRotation = { Enabled = false, Amount = 90, Speed = 1, Start = 0, End = 360 }
    
    local function Tick(DeltaTime)
        local Range = AutoRotation.End - AutoRotation.Start
        if Range <= 0 then return end
        local Step = AutoRotation.Amount * AutoRotation.Speed * DeltaTime
        if OnTick then
            OnTick(AutoRotation, Step)
        else
            Parent.Rotation = AutoRotation.Start + ((Parent.Rotation - AutoRotation.Start + Step) % Range)
        end
    end
    
    local function Cleanup()
        local ID = table.find(ActiveAutoRotations, Tick)
        if not ID then return end
        table.remove(ActiveAutoRotations, ID)
    end
    
    return setmetatable({}, {
        __index = AutoRotation,
        __newindex = function(_, Key, Value)
            assert(AutoRotation[Key] ~= nil, "Invalid Property '" .. Key .. "' For Auto Rotation")
            AssertType(Value, typeof(AutoRotation[Key]), Key)
            AutoRotation[Key] = Value
            
            if Key ~= "Enabled" then return end
            
            if Value then
                if not table.find(ActiveAutoRotations, Tick) then
                    table.insert(ActiveAutoRotations, Tick)
                end
                if HeartbeatConnection then return end
                HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime)
                    for _, Tick in ActiveAutoRotations do
                        task.spawn(Tick, DeltaTime)
                    end
                    
                    if #ActiveAutoRotations ~= 0 then return end
                    HeartbeatConnection:Disconnect()
                    HeartbeatConnection = nil
                end)
            else
                Cleanup()
            end
        end,
        __metatable = { Cleanup = Cleanup },
    })
end

local function GetAutoRotationCleanup(AutoRotation)
    return getmetatable(AutoRotation) and getmetatable(AutoRotation).Cleanup
end

local function ApplyRoundness(Parent)
    local Rounder = Instance.new("UICorner", Parent)
    Rounder.CornerRadius = UDim.new(0, 0)
    return Rounder
end

local function ApplyGradient(Parent)
    local Gradient = Instance.new("UIGradient", Parent)
    
    local Properties = {
        Enabled = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
        }),
        Rotation = 0,
        Transparency = NumberSequence.new(0),
        Offset = Vector2.new(0, 0),
        AutoRotation = ApplyAutoRotation(Gradient)
    }
    
    for Property, Value in Properties do
        if Property == "AutoRotation" or Gradient[Property] == nil then continue end
        Gradient[Property] = Value
    end
    
    return setmetatable({}, {
        __index = Properties,
        __newindex = function(_, Key, Value)
            if Properties[Key] == nil or Key == "AutoRotation" then return end
            Properties[Key], Gradient[Key] = Value, Value
        end,
    })
end

local function ApplyStroke(Parent)
    local UIStroke = Instance.new("UIStroke", Parent)
    
    local Stroke = {
        Enabled = true,
        Color = Color3.new(1, 1, 1),
        Transparency = 1,
        Thickness = 1,
        LineJoinMode = Enum.LineJoinMode.Miter,
        Gradient = ApplyGradient(UIStroke),
    }
    
    for Property, Value in Stroke do
        if Property == "Gradient" or UIStroke[Property] == nil then continue end
        UIStroke[Property] = Property == "Transparency" and FlipTransparency(Value) or Value
    end
    
    return setmetatable({}, {
        __index = Stroke,
        __newindex = function(_, Key, Value)
            if Key == "Gradient" then
                error("Cannot Set Gradient Directly, Use Stroke.Gradient.PropertyName")
            end
            
            assert(UIStroke[Key] ~= nil, "Invalid Property '" .. Key .. "' For Stroke Object")
            AssertType(Value, typeof(Stroke[Key]), Key)
            
            Value = Key == "Transparency" and FlipTransparency(Value) or Value
            Stroke[Key], UIStroke[Key] = Value, Value
        end
    })
end



--// DRAWING FUNCTIONS



local function DrawText()
    local Text = BaseObject + {
        __SHAPE = "Text",
        __INSTANCE = Instance.new("TextLabel", DrawingDirectory),
        Text = "",
        Size = 14,
        Position = Vector2.zero,
        Rotation = 0,
        Bold = false,
        Italic = false,
        Underline = false,
        Strikethrough = false,
        Outline = false,
        OutlineColor = Color3.new(0, 0, 0),
        Font = Font.new("rbxasset://fonts/families/RobotoMono.json"),
    }

    local Label = Text.__INSTANCE
    Label.BorderSizePixel, Label.BackgroundTransparency, Label.TextXAlignment, Label.TextYAlignment = 0, 1, Enum.TextXAlignment.Left, Enum.TextYAlignment.Top

    local function UpdateText()
        Label.Visible, Label.TextTransparency, Label.TextColor3, Label.ZIndex, Label.AnchorPoint = Text.Visible, FlipTransparency(Text.Transparency), Text.Color, Text.ZIndex, Text.AnchorPoint
        Label.Text, Label.TextSize, Label.Position, Label.Rotation = Text.Text, Text.Size, UDim2.fromOffset(Text.Position.X, Text.Position.Y), Text.Rotation
        Label.FontFace = Font.new(
            Text.Font.Family,
            Text.Bold and Enum.FontWeight.Bold or Enum.FontWeight.Regular,
            Text.Italic and Enum.FontStyle.Italic or Enum.FontStyle.Normal
        )
        Label.TextStrokeColor3, Label.TextStrokeTransparency, Label.Size = Text.OutlineColor, Text.Outline and 0 or 1, UDim2.new(0, 1000, 0, 1000)
    end; UpdateText()

    return CreateDrawingObject(Text, UpdateText)
end

local function DrawLine(Parent)
    local Line = BaseObject + {
        __SHAPE = "Line",
        __INSTANCE = Instance.new("Frame", Parent or DrawingDirectory),
        From = Vector2.zero,
        To = Vector2.zero,
        Thickness = 1,
    }
    
    local Frame = Line.__INSTANCE
    Frame.BorderSizePixel = 0
    
    Line.Rounder = ApplyRoundness(Frame)
    Line.Stroke = ApplyStroke(Frame)
    Line.Gradient = ApplyGradient(Frame)
    
    local function UpdateLine()
        local Direction = (Line.To - Line.From)
        local Center = (Line.To + Line.From) / 2
        
        Frame.Visible, Frame.BackgroundTransparency, Frame.BackgroundColor3, Frame.ZIndex, Frame.AnchorPoint = Line.Visible, FlipTransparency(Line.Transparency), Line.Color, Line.ZIndex, Line.AnchorPoint
        Frame.Size, Frame.Position, Frame.Rotation = UDim2.fromOffset(Direction.Magnitude, Line.Thickness), UDim2.fromOffset(Center.X, Center.Y), math.deg(math.atan2(Direction.Y, Direction.X))
    end; UpdateLine()
    
    Line.__UPDATELINE = UpdateLine
    
    function Line:Trace(From, To)
        From, To = ConvertTargetToScreenPosition(From, "From"), ConvertTargetToScreenPosition(To, "To")
        if From and To then
            Line.Visible, Line.From, Line.To = true, From, To
        else
            Line.Visible = false
        end
        UpdateLine()
    end
    
    return CreateDrawingObject(Line, UpdateLine)
end

local function DrawSquare()
    local Square = BaseObject + {
        __SHAPE = "Square",
        __INSTANCE = Instance.new("Frame", DrawingDirectory),
        Size = Vector2.zero,
        Position = Vector2.zero,
        Filled = true,
        Rotation = 0,
    }
    
    local Frame = Square.__INSTANCE
    Frame.BorderSizePixel = 0
    
    Square.Rounder = ApplyRoundness(Frame)
    Square.Stroke = ApplyStroke(Frame)
    Square.Gradient = ApplyGradient(Frame)
    Square.AutoRotation = ApplyAutoRotation(Frame)
    
    Square.__CLEANUP = function()
        local Cleanup = GetAutoRotationCleanup(Square.AutoRotation)
        if Cleanup then Cleanup() end
        local GradientCleanup = GetAutoRotationCleanup(Square.Gradient.AutoRotation)
        if GradientCleanup then GradientCleanup() end
        local StrokeGradientCleanup = GetAutoRotationCleanup(Square.Stroke.Gradient.AutoRotation)
        if StrokeGradientCleanup then StrokeGradientCleanup() end
    end
    
    local function UpdateSquare()
        Frame.Visible, Frame.BackgroundTransparency, Frame.BackgroundColor3, Frame.ZIndex, Frame.AnchorPoint = Square.Visible, Square.Filled and FlipTransparency(Square.Transparency) or 1, Square.Color, Square.ZIndex, Square.AnchorPoint
        Frame.Size, Frame.Position = UDim2.fromOffset(Square.Size.X, Square.Size.Y), UDim2.fromOffset(Square.Position.X, Square.Position.Y)
        Frame.Rotation = Square.AutoRotation.Enabled and Frame.Rotation or Square.Rotation
        Square.Stroke.Enabled = not Square.Filled or Square.Stroke.Enabled
    end; UpdateSquare()
    
    return CreateDrawingObject(Square, UpdateSquare)
end

local function DrawCircle()
    local Circle = BaseObject + {
        __SHAPE = "Circle",
        __INSTANCE = Instance.new("Frame", DrawingDirectory),
        Radius = 0,
        Position = Vector2.zero,
        Filled = true,
        Rotation = 0,
    }
    
    local Frame = Circle.__INSTANCE
    Frame.BorderSizePixel = 0
    
    Circle.Rounder = ApplyRoundness(Frame)
    Circle.Stroke = ApplyStroke(Frame)
    Circle.Gradient = ApplyGradient(Frame)
    Circle.AutoRotation = ApplyAutoRotation(Frame)
    
    Circle.__CLEANUP = function()
        local Cleanup = GetAutoRotationCleanup(Circle.AutoRotation)
        if Cleanup then Cleanup() end
        local GradientCleanup = GetAutoRotationCleanup(Circle.Gradient.AutoRotation)
        if GradientCleanup then GradientCleanup() end
        local StrokeGradientCleanup = GetAutoRotationCleanup(Circle.Stroke.Gradient.AutoRotation)
        if StrokeGradientCleanup then StrokeGradientCleanup() end
    end
    
    Circle.Rounder.CornerRadius, Circle.Stroke.LineJoinMode = UDim.new(1, 0), Enum.LineJoinMode.Round
    
    local function UpdateCircle()
        Frame.Visible, Frame.BackgroundTransparency, Frame.BackgroundColor3, Frame.ZIndex, Frame.AnchorPoint = Circle.Visible, Circle.Filled and FlipTransparency(Circle.Transparency) or 1, Circle.Color, Circle.ZIndex, Circle.AnchorPoint
        Frame.Size, Frame.Position = UDim2.fromOffset(Circle.Radius * 2, Circle.Radius * 2), UDim2.fromOffset(Circle.Position.X, Circle.Position.Y)
        Circle.Stroke.Enabled = not Circle.Filled or Circle.Stroke.Enabled
    end; UpdateCircle()
    
    return CreateDrawingObject(Circle, UpdateCircle)
end

local function DrawPolygon(ShapeName, DefaultPoints)
    local IsNGon = ShapeName == "NGon"
    local SideCount = #DefaultPoints
    
    local Polygon = BaseObject + {
        __SHAPE = ShapeName,
        __INSTANCE = Instance.new("Folder", DrawingDirectory),
        Position = Vector2.zero,
        Filled = true,
        Radius = 0,
        Rotation = 0,
        Color = Color3.new(1, 1, 1),
    }
    
    if IsNGon then
        Polygon.Points = SideCount
        for Index = 1, SideCount do
            Polygon["Point" .. Index] = DefaultPoints[Index]
        end
    else
        for Index, Point in DefaultPoints do
            Polygon["Point" .. Letters[Index]] = Point
        end
    end
    
    local Folder = Polygon.__INSTANCE
    
    local Lines = {
        FillLines = {},
        Outlines = {}
    }
    
    for Index = 1, SideCount do
        table.insert(Lines.Outlines, DrawLine(Folder))
    end
    
    local FillLinePool = {}
    
    local function AcquireFillFrame()
        local Frame = table.remove(FillLinePool)
        if Frame then
            Frame.Parent = Folder
            return Frame
        end
        local Frame = Instance.new("Frame")
        Frame.BorderSizePixel, Frame.BackgroundColor3, Frame.AnchorPoint, Frame.Parent = 0, Color3.new(1, 1, 1), Vector2.new(0.5, 0.5), Folder
        return Frame
    end
    
    local function ReleaseFillFrame(Frame)
        Frame.Parent = nil
        table.insert(FillLinePool, Frame)
    end
    
    local function ReleaseAllFillLines()
        for Index = #Lines.FillLines, 1, -1 do
            ReleaseFillFrame(Lines.FillLines[Index])
            Lines.FillLines[Index] = nil
        end
    end
    
    
    
    --// Outlines
    
    
    
    local OutlineProps = {
        Visible = true,
        Transparency = 1,
        Color = Color3.new(1, 1, 1),
        ZIndex = 0,
        Thickness = 1,
    }
    
    local OutlinesGradientAutoRotation = setmetatable({}, {
        __index = function(_, Key)
            return Lines.Outlines[1].Gradient.AutoRotation[Key]
        end,
        __newindex = function(_, Key, Value)
            for _, Line in Lines.Outlines do Line.Gradient.AutoRotation[Key] = Value end
        end
    })
    
    local OutlinesGradient = setmetatable({}, {
        __index = function(_, Key)
            if Key == "AutoRotation" then return OutlinesGradientAutoRotation end
            return Lines.Outlines[1].Gradient[Key]
        end,
        __newindex = function(_, Key, Value)
            for _, Line in Lines.Outlines do Line.Gradient[Key] = Value end
        end
    })
    
    OutlineProps.Gradient = OutlinesGradient
    
    local OutlinesStrokeGradientAutoRotation = setmetatable({}, {
        __index = function(_, Key)
            return Lines.Outlines[1].Stroke.Gradient.AutoRotation[Key]
        end,
        __newindex = function(_, Key, Value)
            for _, Line in Lines.Outlines do Line.Stroke.Gradient.AutoRotation[Key] = Value end
        end
    })
    
    local OutlinesStrokeGradient = setmetatable({}, {
        __index = function(_, Key)
            if Key == "AutoRotation" then return OutlinesStrokeGradientAutoRotation end
            return Lines.Outlines[1].Stroke.Gradient[Key]
        end,
        __newindex = function(_, Key, Value)
            for _, Line in Lines.Outlines do Line.Stroke.Gradient[Key] = Value end
        end
    })
    
    local OutlinesStroke = setmetatable({}, {
        __index = function(_, Key)
            if Key == "Gradient" then return OutlinesStrokeGradient end
            return Lines.Outlines[1].Stroke[Key]
        end,
        __newindex = function(_, Key, Value)
            for _, Line in Lines.Outlines do Line.Stroke[Key] = Value end
        end,
    })
    
    OutlineProps.Stroke = OutlinesStroke
    
    
    
    --// Update
    
    
    
    local function GetPoints()
        local OffsetX = Polygon.Position.X
        local OffsetY = Polygon.Position.Y
        local Points = {}
        local Count = IsNGon and Polygon.Points or SideCount
        
        if Polygon.Radius > 0 then
            local TwoPi = math.pi * 2
            local HalfPi = math.pi / 2
            local Radius = Polygon.Radius
            for Index = 1, Count do
                local Angle = (Index / Count) * TwoPi - HalfPi
                table.insert(Points, Vector2.new(
                    OffsetX + math.cos(Angle) * Radius,
                    OffsetY + math.sin(Angle) * Radius
                ))
            end
        else
            if IsNGon then
                for Index = 1, Count do
                    local Value = Polygon["Point" .. Index]
                    if Value == nil then break end
                    table.insert(Points, Vector2.new(OffsetX + Value.X, OffsetY + Value.Y))
                end
            else
                for _, Letter in Letters do
                    local Value = Polygon["Point" .. Letter]
                    if Value == nil then break end
                    table.insert(Points, Vector2.new(OffsetX + Value.X, OffsetY + Value.Y))
                end
            end
        end
        
        if Polygon.Rotation ~= 0 then
            local Radians = math.rad(Polygon.Rotation)
            local Cos, Sin = math.cos(Radians), math.sin(Radians)
            local RotatedPoints = {}
            local PosX = Polygon.Position.X
            local PosY = Polygon.Position.Y
            for _, Point in Points do
                local DX = Point.X - PosX
                local DY = Point.Y - PosY
                table.insert(RotatedPoints, Vector2.new(
                    PosX + DX * Cos - DY * Sin,
                    PosY + DX * Sin + DY * Cos
                ))
            end
            Points = RotatedPoints
        end
        
        return Points
    end
    
    local CachedEdges = {}
    local CachedIntersections = {}
    local UpdatePending = false
    
    local function UpdatePolygon()
        local Points = GetPoints()
        local PointCount = #Points
        
        while #Lines.Outlines < PointCount do
            table.insert(Lines.Outlines, DrawLine(Folder))
        end
        
        local OutlineVisible = Polygon.Visible and OutlineProps.Visible
        local OutlineTransp = OutlineProps.Transparency
        local OutlineColor = OutlineProps.Color
        local OutlineThickness = OutlineProps.Thickness
        local OutlineZIndex = OutlineProps.ZIndex + 1
        local OutlineStrokeEnabled = OutlineProps.Stroke.Enabled
        local OutlineGradEnabled = OutlineProps.Gradient.Enabled
        local HalfThickness = OutlineThickness / 2
        local CornerRadius = UDim.new(1, 0)
        
        for Index = 1, PointCount do
            local A = Points[Index]
            local B = Points[Index % PointCount + 1]
            local Dir = B - A
            local Ext = Dir.Magnitude > 0 and Dir.Unit * HalfThickness or Vector2.zero
            local Line = Lines.Outlines[Index]
            
            Line.From, Line.To = A - Ext, B + Ext
            Line.Visible, Line.Transparency, Line.Color, Line.Thickness, Line.ZIndex = OutlineVisible, OutlineTransp, OutlineColor, OutlineThickness, OutlineZIndex
            Line.Rounder.CornerRadius = CornerRadius
            Line.Stroke.Enabled, Line.Stroke.LineJoinMode = OutlineStrokeEnabled, Enum.LineJoinMode.Round
            Line.Gradient.Enabled = OutlineGradEnabled
        end
        
        for Index = PointCount + 1, #Lines.Outlines do
            Lines.Outlines[Index].Visible = false
        end
        
        if not Polygon.Filled then
            ReleaseAllFillLines()
            return
        end
        
        local MinY = math.huge
        local MaxY = -math.huge
        
        for _, Point in Points do
            if Point.Y < MinY then MinY = Point.Y end
            if Point.Y > MaxY then MaxY = Point.Y end
        end
        
        MinY, MaxY = math.floor(MinY), math.ceil(MaxY)
        
        for Index = 1, PointCount do
            local Edge = CachedEdges[Index]
            if not Edge then
                CachedEdges[Index] = { Points[Index], Points[Index % PointCount + 1] }
            else
                Edge[1], Edge[2] = Points[Index], Points[Index % PointCount + 1]
            end
        end
        for Index = PointCount + 1, #CachedEdges do
            CachedEdges[Index] = nil
        end
        
        local FillColor = Polygon.Color
        local FillTransparency = FlipTransparency(Polygon.Transparency)
        local FillZIndex = Polygon.ZIndex
        local FillVisible = Polygon.Visible
        
        local FillLineIndex = 1
        
        for Y = MinY, MaxY do
            local ICount = 0
            
            for _, Edge in CachedEdges do
                local A, B = Edge[1], Edge[2]
                if not ((A.Y <= Y and B.Y >= Y) or (A.Y >= Y and B.Y <= Y)) then continue end
                if A.Y == B.Y then continue end
                local T = (Y - A.Y) / (B.Y - A.Y)
                if not (T >= 0 and T < 1) then continue end
                ICount = ICount + 1
                CachedIntersections[ICount] = A.X + T * (B.X - A.X)
            end
            
            if ICount < 2 then continue end
            
            for I = 2, ICount do
                local V = CachedIntersections[I]
                local J = I - 1
                while J >= 1 and CachedIntersections[J] > V do
                    CachedIntersections[J + 1] = CachedIntersections[J]
                    J = J - 1
                end
                CachedIntersections[J + 1] = V
            end
            
            for I = 1, ICount - 1, 2 do
                local X1 = CachedIntersections[I]
                local X2 = CachedIntersections[I + 1]
                
                local Frame = Lines.FillLines[FillLineIndex]
                if not Frame then
                    Frame = AcquireFillFrame()
                    Lines.FillLines[FillLineIndex] = Frame
                end
                
                local Width = X2 - X1
                local CX = X1 + Width * 0.5
                
                Frame.Visible, Frame.BackgroundColor3, Frame.BackgroundTransparency, Frame.ZIndex = FillVisible, FillColor, FillTransparency, FillZIndex
                Frame.Size, Frame.Position = UDim2.fromOffset(Width, 1), UDim2.fromOffset(CX, Y)
                
                FillLineIndex = FillLineIndex + 1
            end
        end
        
        for Index = FillLineIndex, #Lines.FillLines do
            ReleaseFillFrame(Lines.FillLines[Index])
            Lines.FillLines[Index] = nil
        end
    end
    
    local function DeferredUpdate()
        if UpdatePending then return end
        UpdatePending = true
        task.defer(function()
            UpdatePending = false
            UpdatePolygon()
        end)
    end
    
    local WrappedUpdate = IsNGon and DeferredUpdate or UpdatePolygon
    
    UpdatePolygon()
    
    Polygon.Outlines = setmetatable({}, {
        __index = function(_, Key)
            return OutlineProps[Key]
        end,
        __newindex = function(_, Key, Value)
            if Key == "Stroke" or Key == "Gradient" then
                error("Cannot set " .. Key .. " directly, use Outlines." .. Key .. ".PropertyName")
            end
            assert(OutlineProps[Key] ~= nil, "Invalid property '" .. Key .. "' for Outlines")
            AssertType(Value, typeof(OutlineProps[Key]), Key)
            OutlineProps[Key] = Value
            UpdatePolygon()
        end,
    })
    
    Polygon.AutoRotation = ApplyAutoRotation(nil, function(AutoRotation, Step)
        local Range = AutoRotation.End - AutoRotation.Start
        Polygon.Rotation = AutoRotation.Start + ((Polygon.Rotation - AutoRotation.Start + Step) % Range)
        UpdatePolygon()
    end)
    
    Polygon.__CLEANUP = function()
        local Cleanup = GetAutoRotationCleanup(Polygon.AutoRotation)
        if Cleanup then Cleanup() end
        ReleaseAllFillLines()
    end
    
    return CreateDrawingObject(Polygon, WrappedUpdate)
end

local function CreateEmptyPoints(Amount)
    local EmptyPoints = {}
    for Index = 1, Amount do
        table.insert(EmptyPoints, Vector2.zero)
    end
    return EmptyPoints
end

local function DrawTriangle()
    return DrawPolygon("Triangle", CreateEmptyPoints(3))
end

local function DrawQuad()
    return DrawPolygon("Quad", CreateEmptyPoints(4))
end

local function DrawPentagon()
    return DrawPolygon("Pentagon", CreateEmptyPoints(5))
end

local function DrawHexagon()
    return DrawPolygon("Hexagon", CreateEmptyPoints(6))
end

local function DrawHeptagon()
    return DrawPolygon("Heptagon", CreateEmptyPoints(7))
end

local function DrawOctagon()
    return DrawPolygon("Octagon", CreateEmptyPoints(8))
end

local function DrawNonagon()
    return DrawPolygon("Nonagon", CreateEmptyPoints(9))
end

local function DrawDecagon()
    return DrawPolygon("Decagon", CreateEmptyPoints(10))
end

local function DrawHendecagon()
    return DrawPolygon("Hendecagon", CreateEmptyPoints(11))
end

local function DrawDodecagon()
    return DrawPolygon("Dodecagon", CreateEmptyPoints(12))
end

local function DrawNGon()
    return DrawPolygon("NGon", CreateEmptyPoints(3))
end

local DrawingFunctions = {
    ["text"] = DrawText,
    ["line"] = DrawLine,
    ["square"] = DrawSquare,
    ["circle"] = DrawCircle,
    ["triangle"] = DrawTriangle,
    ["quad"] = DrawQuad,
    ["pentagon"] = DrawPentagon,
    ["hexagon"] = DrawHexagon,
    ["heptagon"] = DrawHeptagon,
    ["octagon"] = DrawOctagon,
    ["nonagon"] = DrawNonagon,
    ["decagon"] = DrawDecagon,
    ["hendecagon"] = DrawHendecagon,
    ["dodecagon"] = DrawDodecagon,
    ["ngon"] = DrawNGon,
}



--// DRAWING API



function Drawing.new(Shape)
    assert(typeof(Shape) == "string", "Expected A Shape Name But Got " .. typeof(Shape))
    Shape = Shape:lower():gsub("%W", "")
    local DrawShape = DrawingFunctions[Shape]
    assert(DrawShape, "Expected A Valid Shape Name But Got " .. Shape)
    return DrawShape()
end

function Drawing.IsInShape(Shape, Target, OnScreenCheck)
    assert(typeof(Shape) == "table" and Shape.__SHAPE, "Shape Expects A Valid Drawing Object But Got " .. typeof(Shape))
    local ShapeType = Shape.__SHAPE
    local Position = ConvertTargetToScreenPosition(Target, "Position/Target", OnScreenCheck)
    
    if ShapeType == "Circle" then
        local Distance = (Position - Shape.Position).Magnitude
        return Distance <= Shape.Radius, Distance
    elseif ShapeType == "Square" then
        local Left = Shape.Position.X - Shape.AnchorPoint.X * Shape.Size.X
        local Top = Shape.Position.Y - Shape.AnchorPoint.Y * Shape.Size.Y
        local CenterX = Left + Shape.Size.X / 2
        local CenterY = Top + Shape.Size.Y / 2
        local Distance = (Position - Vector2.new(CenterX, CenterY)).Magnitude
        local IsInside = Position.X >= Left and Position.X <= Left + Shape.Size.X and Position.Y >= Top and Position.Y <= Top + Shape.Size.Y
        return IsInside, Distance
    elseif ShapeType == "Line" then
        local LineDirection = Shape.To - Shape.From
        local LineLengthSquared = LineDirection:Dot(LineDirection)
        local HowFarAlongLine = LineLengthSquared > 0 and math.clamp((Position - Shape.From):Dot(LineDirection) / LineLengthSquared, 0, 1) or 0
        local ClosestPointOnLine = Shape.From + LineDirection * HowFarAlongLine
        local Distance = (Position - ClosestPointOnLine).Magnitude
        return Distance <= Shape.Thickness / 2, Distance
        
    else
        local Count = SideCounts[ShapeType] or (ShapeType == "NGon" and (Shape.Points or 3))
        local Verts = {}
        
        if Shape.Radius > 0 then
            for Index = 1, Count do
                local Angle = (Index / Count) * (math.pi * 2) - math.pi / 2
                table.insert(Verts, Vector2.new(
                    Shape.Position.X + math.cos(Angle) * Shape.Radius,
                    Shape.Position.Y + math.sin(Angle) * Shape.Radius
                ))
            end
        elseif ShapeType == "NGon" then
            for Index = 1, Count do
                local Point = Shape["Point" .. Index]
                if not Point then break end
                table.insert(Verts, Shape.Position + Point)
            end
        else
            for _, Letter in Letters do
                local Point = Shape["Point" .. Letter]
                if not Point then break end
                table.insert(Verts, Shape.Position + Point)
            end
        end
        
        local IsInside = false
        local VertexCount = #Verts
        local PreviousIndex = VertexCount
        
        for Index = 1, VertexCount do
            local CurrentVertex = Verts[Index]
            local PreviousVertex = Verts[PreviousIndex]
            local EdgeCrossesRay = (CurrentVertex.Y > Position.Y) ~= (PreviousVertex.Y > Position.Y)
            
            if EdgeCrossesRay then
                local RayCrossX = (PreviousVertex.X - CurrentVertex.X) * (Position.Y - CurrentVertex.Y) / (PreviousVertex.Y - CurrentVertex.Y) + CurrentVertex.X
                if Position.X < RayCrossX then
                    IsInside = not IsInside
                end
            end
            
            PreviousIndex = Index
        end
        
        return IsInside, (Position - Shape.Position).Magnitude
    end
    
    return false, 0
end

return Drawing
