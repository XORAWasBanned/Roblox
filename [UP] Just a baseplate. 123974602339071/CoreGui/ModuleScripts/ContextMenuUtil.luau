-- Path: CoreGui.RobloxGui.Modules.AvatarContextMenu.ContextMenuUtil
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("RobloxReplicatedStorage")
local v7 = game:GetService("CorePackages")
local v_u_8 = require(v7.Workspace.Packages.AppCommonLib).isTenFootInterface
local v9 = v1:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu")
require(v9.ThemeHandler)
local v_u_10 = require(v7.Workspace.Packages.BlockingUtility)
local v_u_11 = v_u_2.LocalPlayer
while not v_u_11 do
	v_u_2.PlayerAdded:Wait()
	v_u_11 = v_u_2.LocalPlayer
end
local v_u_12 = {}
v_u_12.__index = v_u_12
function v_u_12.GetHeadshotForPlayer(_, p13) -- name: GetHeadshotForPlayer
	return "rbxthumb://type=AvatarHeadShot&id=" .. p13.UserId .. "&w=150&h=150"
end
function v_u_12.HasOrGettingHeadShot(p14, p15) -- name: HasOrGettingHeadShot
	return p14.HeadShotUrlCache[p15] ~= nil
end
function v_u_12.FindPlayerFromPart(_, p16) -- name: FindPlayerFromPart
	-- upvalues: (copy) v_u_2
	if p16 and p16.Parent then
		while p16 and not p16:IsA("Model") do
			p16 = p16.Parent
		end
		if p16 then
			return v_u_2:GetPlayerFromCharacter(p16)
		end
	end
	return nil
end
function v_u_12.GetPlayerPosition(_, p17) -- name: GetPlayerPosition
	local v18 = p17.Character and p17.Character:FindFirstChild("HumanoidRootPart")
	if v18 then
		return v18.Position
	else
		return nil
	end
end
local v_u_19 = true
function v_u_12.DisablePlayerMovement(_) -- name: DisablePlayerMovement
	-- upvalues: (ref) v_u_19, (copy) v_u_3
	if v_u_19 then
		v_u_19 = false
		v_u_3:BindCoreActionAtPriority("AvatarContextMenuStopInput", function(_, p20)
			if p20 == Enum.UserInputState.End then
				return Enum.ContextActionResult.Pass
			else
				return Enum.ContextActionResult.Sink
			end
		end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
	end
end
function v_u_12.EnablePlayerMovement(_) -- name: EnablePlayerMovement
	-- upvalues: (ref) v_u_19, (copy) v_u_3
	if not v_u_19 then
		v_u_19 = true
		v_u_3:UnbindCoreAction("AvatarContextMenuStopInput")
	end
end
function v_u_12.GetFriendStatus(_, p_u_21) -- name: GetFriendStatus
	-- upvalues: (ref) v_u_11
	local function v22()
		-- upvalues: (ref) v_u_11, (copy) p_u_21
		return v_u_11:GetFriendStatus(p_u_21)
	end
	local v23, v24 = pcall(v22)
	if v23 then
		return v24
	else
		return Enum.FriendStatus.NotFriend
	end
end
local v_u_25 = {}
coroutine.wrap(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_25
	v_u_6:WaitForChild("CanChatWith", (1 / 0)).OnClientEvent:Connect(function(...)
		-- upvalues: (ref) v_u_25
		local v26 = { ... }
		if #v26 == 1 then
			local v27 = v26[1]
			for v28, v29 in pairs(v27) do
				v_u_25[v28] = v29
			end
		elseif #v26 == 2 then
			v_u_25[v26[1]] = v26[2]
		end
	end)
end)()
function v_u_12.GetCanChatWith(_, p30) -- name: GetCanChatWith
	-- upvalues: (copy) v_u_10, (copy) v_u_25
	if v_u_10:IsPlayerBlockedByUserId(p30.UserId) then
		return false
	else
		return v_u_25[p30.UserId] == nil and true or v_u_25[p30.UserId]
	end
end
local v_u_31 = Instance.new("ImageLabel")
v_u_31.Image = ""
v_u_31.BackgroundTransparency = 1
local function v_u_41(p32, p33, p_u_34, p_u_35) -- name: MakeDefaultButton
	-- upvalues: (copy) v_u_31, (copy) v_u_5, (copy) v_u_4
	local v_u_36 = Instance.new("ImageButton")
	v_u_36.Name = p32
	v_u_36.Image = p_u_35.ButtonImage
	v_u_36.ScaleType = p_u_35.ButtonImageScaleType
	v_u_36.SliceCenter = p_u_35.ButtonImageSliceCenter
	v_u_36.BackgroundColor3 = p_u_35.ButtonColor
	v_u_36.BackgroundTransparency = p_u_35.ButtonTransparency
	v_u_36.AutoButtonColor = false
	v_u_36.Size = p33
	v_u_36.ZIndex = 2
	v_u_36.SelectionImageObject = v_u_31
	v_u_36.BorderSizePixel = 0
	local v37 = Instance.new("Frame")
	v37.Name = "Underline"
	v37.BackgroundColor3 = p_u_35.ButtonUnderlineColor
	v37.AnchorPoint = Vector2.new(0.5, 1)
	v37.BorderSizePixel = 0
	v37.Position = UDim2.new(0.5, 0, 1, 0)
	v37.Size = UDim2.new(0.95, 0, 0, 1)
	v37.Parent = v_u_36
	if p_u_34 then
		v_u_36.MouseButton1Click:Connect(function()
			-- upvalues: (copy) p_u_34, (ref) v_u_5
			p_u_34(v_u_5:GetLastInputType())
		end)
	end
	v_u_36.InputBegan:Connect(function(p_u_38)
		-- upvalues: (copy) v_u_36, (copy) p_u_35
		if v_u_36.Selectable and (p_u_38.UserInputType == Enum.UserInputType.MouseMovement or p_u_38.UserInputType == Enum.UserInputType.Touch) then
			v_u_36.BackgroundColor3 = p_u_35.ButtonHoverColor
			v_u_36.BackgroundTransparency = p_u_35.ButtonHoverTransparency
			p_u_38:GetPropertyChangedSignal("UserInputState"):connect(function()
				-- upvalues: (copy) p_u_38, (ref) v_u_36, (ref) p_u_35
				if p_u_38.UserInputState == Enum.UserInputState.End then
					v_u_36.BackgroundColor3 = p_u_35.ButtonColor
					v_u_36.BackgroundTransparency = p_u_35.ButtonTransparency
				end
			end)
		end
	end)
	v_u_36.InputEnded:Connect(function(p39)
		-- upvalues: (copy) v_u_36, (ref) v_u_4, (copy) p_u_35
		if v_u_36.Selectable and v_u_4.SelectedCoreObject ~= v_u_36 and (p39.UserInputType == Enum.UserInputType.MouseMovement or p39.UserInputType == Enum.UserInputType.Touch) then
			v_u_36.BackgroundColor3 = p_u_35.ButtonColor
			v_u_36.BackgroundTransparency = p_u_35.ButtonTransparency
		end
	end)
	v_u_36.SelectionGained:Connect(function()
		-- upvalues: (copy) v_u_36, (copy) p_u_35
		v_u_36.BackgroundColor3 = p_u_35.ButtonHoverColor
		v_u_36.BackgroundTransparency = p_u_35.ButtonHoverTransparency
	end)
	v_u_36.SelectionLost:Connect(function()
		-- upvalues: (copy) v_u_36, (copy) p_u_35
		v_u_36.BackgroundColor3 = p_u_35.ButtonColor
		v_u_36.BackgroundTransparency = p_u_35.ButtonTransparency
	end)
	v_u_4.Changed:Connect(function(p40)
		-- upvalues: (ref) v_u_4, (copy) v_u_36, (copy) p_u_35
		if p40 == "SelectedCoreObject" then
			if v_u_4.SelectedCoreObject == nil or v_u_4.SelectedCoreObject ~= v_u_36 then
				v_u_36.BackgroundColor3 = p_u_35.ButtonColor
				v_u_36.BackgroundTransparency = p_u_35.ButtonTransparency
			elseif v_u_36.Selectable then
				v_u_36.BackgroundColor3 = p_u_35.ButtonHoverColor
				v_u_36.BackgroundTransparency = p_u_35.ButtonHoverTransparency
			end
		else
			return
		end
	end)
	return v_u_36
end
local function v_u_43() -- name: getViewportSize
	while not workspace.CurrentCamera do
		workspace.Changed:Wait()
	end
	local v42 = workspace.CurrentCamera
	assert(v42, "")
	while workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
		workspace.CurrentCamera.Changed:Wait()
	end
	return workspace.CurrentCamera.ViewportSize
end
function v_u_12.MakeStyledButton(_, p44, p45, p46, p47, p48) -- name: MakeStyledButton
	-- upvalues: (copy) v_u_41, (copy) v_u_43, (copy) v_u_5, (copy) v_u_8
	local v49 = v_u_41(p44, p46, p47, p48)
	local v50 = Instance.new("TextLabel")
	v50.Name = p44 .. "TextLabel"
	v50.BackgroundTransparency = 1
	v50.BorderSizePixel = 0
	v50.Size = UDim2.new(1, 0, 1, -8)
	v50.Position = UDim2.new(0, 0, 0, 0)
	v50.TextColor3 = Color3.fromRGB(255, 255, 255)
	v50.TextYAlignment = Enum.TextYAlignment.Center
	v50.Font = p48.Font
	v50.TextSize = 24 * p48.TextScale
	local v51 = v_u_43()
	local v52 = v_u_5.TouchEnabled
	if v52 then
		v52 = v51.Y < 500 and true or v51.X < 700
	end
	if v52 then
		v50.TextSize = 18 * p48.TextScale
	elseif v_u_8() then
		v50.TextSize = 36 * p48.TextScale
	end
	v50.Text = p45
	v50.TextScaled = true
	v50.TextWrapped = true
	v50.ZIndex = 2
	v50.Parent = v49
	Instance.new("UITextSizeConstraint", v50).MaxTextSize = v50.TextSize
	return v49, v50
end
function v_u_12.new() -- name: new
	-- upvalues: (copy) v_u_12
	local v53 = v_u_12
	return setmetatable({}, v53)
end
return v_u_12.new()