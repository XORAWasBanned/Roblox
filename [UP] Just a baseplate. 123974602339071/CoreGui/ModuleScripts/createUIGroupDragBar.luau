-- Path: CoreGui.RobloxGui.Modules.UIManager.createUIGroupDragBar
local v1 = script.Parent
local v_u_2 = require(v1.DragBar)
local v_u_3 = require(v1.Constants)
local v_u_4 = game:GetService("CoreGui")
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	local v6 = Instance.new("Part")
	v6.Size = Vector3.new(0.6, 0.12, 0.00001)
	v6.Name = p5.name .. "_DragBar"
	v6.Color = Color3.new(1, 1, 1)
	v6.Parent = workspace.CurrentCamera
	v6.Anchored = true
	v6.CanTouch = true
	v6.CanCollide = false
	v6.CastShadow = false
	v6.Material = Enum.Material.Glass
	v6.Transparency = 1
	local v7 = Instance.new("DragDetector")
	v7.Enabled = true
	v7.Parent = v6
	v7.DragStyle = Enum.DragDetectorDragStyle.BestForDevice
	local v8 = Instance.new("SurfaceGui", v_u_4)
	v8.Name = "dragBar_SurfaceGui"
	v8.Enabled = true
	v8.CanvasSize = Vector2.new(v6.Size.X, v6.Size.Y) * v_u_3.VR_PANEL_RESOLUTION_MULTIPLIER
	v8.AlwaysOnTop = true
	v8.Shape = Enum.SurfaceGuiShape.Flat
	v8.HorizontalCurvature = 0
	v8.Active = true
	v8.Adornee = v6
	v8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	v8.LightInfluence = 0
	v8.ZOffset = 0
	v8.Face = Enum.NormalId.Back
	local v9 = Instance.new("ImageLabel")
	v9.Image = "rbxasset://textures/ui/InGameMenu/DragBar_Bright.png"
	v9.Parent = v8
	v9.BackgroundTransparency = 1
	v9.BackgroundColor3 = Color3.new(1, 1, 1)
	v9.AnchorPoint = Vector2.new(0.5, 0.5)
	v9.Position = UDim2.new(0.5, 0, 0.5, 0)
	v9.Size = UDim2.new(0.5, 0, 0.25, 0)
	v9.ImageColor3 = Color3.new(1, 1, 1)
	v7.RunLocally = true
	if p5.dragFunction then
		v7.DragContinue:Connect(p5.dragFunction)
	end
	if p5.dragStartFunction then
		v7.DragStart:Connect(p5.dragStartFunction)
	end
	if p5.dragEndFunction then
		v7.DragEnd:Connect(p5.dragEndFunction)
	end
	return v_u_2.new(v6, v9)
end