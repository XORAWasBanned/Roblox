-- Path: CoreGui.RobloxGui.Modules.KeyboardUINavigation
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("ContextActionService")
local v4 = game:GetService("CoreGui")
local v5 = game:GetService("CorePackages")
local v_u_6 = UserSettings().GameSettings
local v_u_7 = v4:WaitForChild("RobloxGui"):WaitForChild("SendNotificationInfo")
local v_u_8 = require(v5.Workspace.Packages.RobloxTranslator)
local v_u_9 = nil
local function v_u_23(_, p10, p11) -- name: ScrollSelectedElement
	-- upvalues: (copy) v_u_2
	if p10 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	local v12 = v_u_2.SelectedObject
	if v12 == nil then
		return Enum.ContextActionResult.Pass
	end
	local v13 = nil
	if v12.ClassName ~= "ScrollingFrame" then
		v12 = v12:FindFirstAncestorOfClass("ScrollingFrame")
		if v12 == nil then
			v12 = v13
		end
	end
	if v12 == nil then
		return Enum.ContextActionResult.Pass
	end
	local v14 = (p11.KeyCode == Enum.KeyCode.PageUp or p11.KeyCode == Enum.KeyCode.Home) and -100 or ((p11.KeyCode == Enum.KeyCode.PageDown or p11.KeyCode == Enum.KeyCode.End) and 100 or 0)
	local v15 = v12.CanvasPosition.X
	local v16 = v12.CanvasPosition.Y
	if p11.KeyCode == Enum.KeyCode.PageUp or p11.KeyCode == Enum.KeyCode.PageDown then
		local v17 = v16 + v14
		local v18 = v12.AbsoluteCanvasSize.Y
		local v19 = math.min(v17, v18)
		v16 = math.max(0, v19)
	elseif p11.KeyCode == Enum.KeyCode.Home or p11.KeyCode == Enum.KeyCode.End then
		local v20 = v15 + v14
		local v21 = v12.AbsoluteCanvasSize.X
		local v22 = math.min(v20, v21)
		v15 = math.max(0, v22)
	end
	v12.CanvasPosition = Vector2.new(v15, v16)
	return Enum.ContextActionResult.Pass
end
local function v_u_32(_, p24, _) -- name: EnableKeyboardNavigation
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (ref) v_u_9, (copy) v_u_1, (copy) v_u_8, (copy) v_u_7
	if not v_u_6.UiNavigationKeyBindEnabled then
		return Enum.ContextActionResult.Pass
	end
	if p24 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	if not v_u_2.AutoSelectGuiEnabled then
		return Enum.ContextActionResult.Pass
	end
	if v_u_2.SelectedObject then
		v_u_2.SelectedObject = nil
		return Enum.ContextActionResult.Sink
	end
	if v_u_9 == nil then
		v_u_9 = v_u_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	v_u_2:Select(v_u_9)
	if v_u_2.SelectedObject then
		local v_u_25 = nil
		local v_u_26 = "InGame.NotificationScript2.UINavigation.Title"
		local function v27()
			-- upvalues: (ref) v_u_25, (ref) v_u_8, (copy) v_u_26
			v_u_25 = v_u_8:FormatByKey(v_u_26)
		end
		pcall(v27)
		local v28 = v_u_25
		local v_u_29 = nil
		local v_u_30 = "InGame.NotificationScript2.UINavigation.Text"
		local function v31()
			-- upvalues: (ref) v_u_29, (ref) v_u_8, (copy) v_u_30
			v_u_29 = v_u_8:FormatByKey(v_u_30)
		end
		pcall(v31)
		v_u_7:Fire({
			["Title"] = nil,
			["Text"] = nil,
			["Duration"] = 3,
			["Title"] = v28,
			["Text"] = v_u_29
		})
	end
	return Enum.ContextActionResult.Sink
end
local v_u_33 = {}
v_u_33.__index = v_u_33
function v_u_33.new() -- name: new
	-- upvalues: (copy) v_u_33, (copy) v_u_3, (copy) v_u_32, (copy) v_u_23, (copy) v_u_6, (copy) v_u_2
	local v34 = v_u_33
	local v35 = setmetatable({}, v34)
	v_u_3:BindAction("EnableKeyboardUINavigation", v_u_32, false, Enum.KeyCode.BackSlash)
	v_u_3:BindAction("ScrollSelectedElement", v_u_23, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown, Enum.KeyCode.Home, Enum.KeyCode.End)
	v_u_6:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_2
		if not v_u_6.UiNavigationKeyBindEnabled then
			v_u_2.SelectedObject = nil
		end
	end)
	return v35
end
return v_u_33.new()