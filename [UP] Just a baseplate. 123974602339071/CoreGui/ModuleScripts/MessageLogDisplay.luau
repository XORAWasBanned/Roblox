-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.MessageLogDisplay
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local v_u_3 = v1 and v2
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local v_u_6 = v4 and v5
local v_u_7 = {
	["ScrollBarThickness"] = 4
}
local v8 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v9 = script.Parent
local v10 = require(v9:WaitForChild("MessageLabelCreator"))
local v_u_11 = require(v9:WaitForChild("CurveUtil"))
local v_u_12 = require(v8:WaitForChild("ChatSettings"))
local v_u_13 = v10.new()
local v_u_14 = {}
v_u_14.__index = v_u_14
local function v_u_18() -- name: CreateGuiObjects
	-- upvalues: (copy) v_u_12, (copy) v_u_7
	local v15 = Instance.new("Frame")
	v15.Selectable = false
	v15.Size = UDim2.new(1, 0, 1, 0)
	v15.BackgroundTransparency = 1
	local v16 = Instance.new("ScrollingFrame")
	v16.Selectable = v_u_12.GamepadNavigationEnabled
	v16.Name = "Scroller"
	v16.BackgroundTransparency = 1
	v16.BorderSizePixel = 0
	v16.Position = UDim2.new(0, 0, 0, 3)
	v16.Size = UDim2.new(1, -4, 1, -6)
	v16.CanvasSize = UDim2.new(0, 0, 0, 0)
	v16.ScrollBarThickness = v_u_7.ScrollBarThickness
	v16.Active = true
	v16.Parent = v15
	local v17 = Instance.new("UIListLayout")
	v17.SortOrder = Enum.SortOrder.LayoutOrder
	v17.Parent = v16
	return v15, v16, v17
end
function v_u_14.Destroy(p19) -- name: Destroy
	p19.GuiObject:Destroy()
	p19.Destroyed = true
end
function v_u_14.SetActive(p20, p21) -- name: SetActive
	p20.GuiObject.Visible = p21
end
function v_u_14.UpdateMessageFiltered(p22, p23) -- name: UpdateMessageFiltered
	-- upvalues: (ref) v_u_3
	local v24 = p22.MessageObjectLog
	local v25 = 1
	local v26 = nil
	while true do
		if v25 > #v24 then
			v27 = v26
			break
		end
		local v27 = v24[v25]
		if v27.ID == p23.ID then
			break
		end
		v25 = v25 + 1
	end
	if v27 then
		if v_u_3 then
			if p23.Message == "" then
				p22:RemoveMessageAtIndex(v25)
			else
				v27.UpdateTextFunction(p23)
				p22:PositionMessageLabelInWindow(v27, v25)
			end
		end
		v27.UpdateTextFunction(p23)
		p22:PositionMessageLabelInWindow(v27, v25)
	end
end
function v_u_14.RefreshMessagePlacement(p28, p29) -- name: RefreshMessagePlacement
	local v30 = p28.MessageObjectLog
	local v31 = 1
	local v32 = nil
	while true do
		if v31 > #v30 then
			v33 = v32
			break
		end
		local v33 = v30[v31]
		if v33.ID == p29.ID then
			break
		end
		v31 = v31 + 1
	end
	if v33 then
		p28:PositionMessageLabelInWindow(v33, v31)
	end
end
function v_u_14.AddMessage(p_u_34, p_u_35) -- name: AddMessage
	-- upvalues: (ref) v_u_6, (copy) v_u_13
	p_u_34:WaitUntilParentedCorrectly()
	local v36
	if v_u_6 then
		v36 = v_u_13:CreateMessageLabel_Chat(p_u_35, p_u_34.CurrentChannelName, function()
			-- upvalues: (copy) p_u_34, (copy) p_u_35
			p_u_34:RefreshMessagePlacement(p_u_35)
		end)
	else
		v36 = v_u_13:CreateMessageLabel(p_u_35, p_u_34.CurrentChannelName)
	end
	if v36 ~= nil then
		local v37 = p_u_34.MessageObjectLog
		table.insert(v37, v36)
		p_u_34:PositionMessageLabelInWindow(v36, #p_u_34.MessageObjectLog)
	end
end
function v_u_14.RemoveMessageAtIndex(p38, p39) -- name: RemoveMessageAtIndex
	p38:WaitUntilParentedCorrectly()
	local v40 = p38.MessageObjectLog[p39]
	if v40 then
		v40:Destroy()
		table.remove(p38.MessageObjectLog, p39)
	end
end
function v_u_14.AddMessageAtIndex(p_u_41, p_u_42, p43) -- name: AddMessageAtIndex
	-- upvalues: (ref) v_u_6, (copy) v_u_13
	local v44
	if v_u_6 then
		v44 = v_u_13:CreateMessageLabel_Chat(p_u_42, p_u_41.CurrentChannelName, function()
			-- upvalues: (copy) p_u_41, (copy) p_u_42
			p_u_41:RefreshMessagePlacement(p_u_42)
		end)
	else
		v44 = v_u_13:CreateMessageLabel(p_u_42, p_u_41.CurrentChannelName)
	end
	if v44 ~= nil then
		local v45 = p_u_41.MessageObjectLog
		table.insert(v45, p43, v44)
		p_u_41:PositionMessageLabelInWindow(v44, p43)
	end
end
function v_u_14.RemoveLastMessage(p46) -- name: RemoveLastMessage
	p46:WaitUntilParentedCorrectly()
	p46.MessageObjectLog[1]:Destroy()
	table.remove(p46.MessageObjectLog, 1)
end
function v_u_14.IsScrolledDown(p47) -- name: IsScrolledDown
	local v48 = p47.Scroller.CanvasSize.Y.Offset
	local v49 = p47.Scroller.AbsoluteWindowSize.Y
	local v50 = p47.Scroller.CanvasPosition.Y
	return v48 < v49 and true or v48 - v50 <= v49 + 5
end
function v_u_14.UpdateMessageTextHeight(p51, p52) -- name: UpdateMessageTextHeight
	local v53 = p52.BaseFrame
	for v54 = 1, 10 do
		if p52.BaseMessage.TextFits then
			break
		end
		local v55 = p51.Scroller.AbsoluteSize.X - v54
		v53.Size = UDim2.new(1, 0, 0, p52.GetHeightFunction(v55))
	end
end
function v_u_14.PositionMessageLabelInWindow(p56, p57, p58) -- name: PositionMessageLabelInWindow
	p56:WaitUntilParentedCorrectly()
	local v59 = p56:IsScrolledDown()
	local v60 = p57.BaseFrame
	local v61
	if p56.MessageObjectLog[p58 - 1] then
		if p58 == #p56.MessageObjectLog then
			v61 = p56.MessageObjectLog[p58 - 1].BaseFrame.LayoutOrder + 1
		else
			v61 = p56.MessageObjectLog[p58 - 1].BaseFrame.LayoutOrder
		end
	else
		v61 = 1
	end
	v60.LayoutOrder = v61
	v60.Size = UDim2.new(1, 0, 0, p57.GetHeightFunction(p56.Scroller.AbsoluteSize.X))
	v60.Parent = p56.Scroller
	if p57.BaseMessage then
		p56:UpdateMessageTextHeight(p57)
	end
	if v59 then
		local v62 = p56.Scroller
		local v63 = Vector2.new
		local v64 = p56.Scroller.CanvasSize.Y.Offset - p56.Scroller.AbsoluteSize.Y
		v62.CanvasPosition = v63(0, (math.max(0, v64)))
	end
end
function v_u_14.ReorderAllMessages(p65) -- name: ReorderAllMessages
	p65:WaitUntilParentedCorrectly()
	if p65.GuiObject.AbsoluteSize.Y < 1 then
		return
	else
		local v66 = p65.Scroller.CanvasPosition
		local v67 = p65:IsScrolledDown()
		for _, v68 in pairs(p65.MessageObjectLog) do
			p65:UpdateMessageTextHeight(v68)
		end
		if v67 then
			local v69 = p65.Scroller
			local v70 = Vector2.new
			local v71 = p65.Scroller.CanvasSize.Y.Offset - p65.Scroller.AbsoluteSize.Y
			v69.CanvasPosition = v70(0, (math.max(0, v71)))
		else
			p65.Scroller.CanvasPosition = v66
		end
	end
end
function v_u_14.Clear(p72) -- name: Clear
	for _, v73 in pairs(p72.MessageObjectLog) do
		v73:Destroy()
	end
	p72.MessageObjectLog = {}
end
function v_u_14.SetCurrentChannelName(p74, p75) -- name: SetCurrentChannelName
	p74.CurrentChannelName = p75
end
function v_u_14.FadeOutBackground(_, _) -- name: FadeOutBackground end
function v_u_14.FadeInBackground(_, _) -- name: FadeInBackground end
function v_u_14.FadeOutText(p76, p77) -- name: FadeOutText
	-- upvalues: (copy) v_u_11
	for v78 = 1, #p76.MessageObjectLog do
		if not p76.MessageObjectLog[v78].FadeOutFunction then
			continue
		end
		p76.MessageObjectLog[v78].FadeOutFunction(p77, v_u_11)
	end
end
function v_u_14.FadeInText(p79, p80) -- name: FadeInText
	-- upvalues: (copy) v_u_11
	for v81 = 1, #p79.MessageObjectLog do
		if not p79.MessageObjectLog[v81].FadeInFunction then
			continue
		end
		p79.MessageObjectLog[v81].FadeInFunction(p80, v_u_11)
	end
end
function v_u_14.Update(p82, p83) -- name: Update
	-- upvalues: (copy) v_u_11
	for v84 = 1, #p82.MessageObjectLog do
		if not p82.MessageObjectLog[v84].UpdateAnimFunction then
			continue
		end
		p82.MessageObjectLog[v84].UpdateAnimFunction(p83, v_u_11)
	end
end
function v_u_14.WaitUntilParentedCorrectly(p85) -- name: WaitUntilParentedCorrectly
	while not p85.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p85.GuiObject.AncestryChanged:wait()
	end
end
function v_u_7.new() -- name: new
	-- upvalues: (copy) v_u_14, (copy) v_u_18
	local v86 = v_u_14
	local v_u_87 = setmetatable({}, v86)
	v_u_87.Destroyed = false
	local v88, v89, v90 = v_u_18()
	v_u_87.GuiObject = v88
	v_u_87.Scroller = v89
	v_u_87.Layout = v90
	v_u_87.MessageObjectLog = {}
	v_u_87.Name = "MessageLogDisplay"
	v_u_87.GuiObject.Name = "Frame_" .. v_u_87.Name
	v_u_87.CurrentChannelName = ""
	v_u_87.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: (copy) v_u_87
		spawn(function()
			-- upvalues: (ref) v_u_87
			v_u_87:ReorderAllMessages()
		end)
	end)
	local v_u_91 = true
	v_u_87.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: (copy) v_u_87, (ref) v_u_91
		local v92 = v_u_87.Layout.AbsoluteContentSize
		v_u_87.Scroller.CanvasSize = UDim2.new(0, 0, 0, v92.Y)
		if v_u_91 then
			local v93 = v_u_87.Scroller.AbsoluteWindowSize
			v_u_87.Scroller.CanvasPosition = Vector2.new(0, v92.Y - v93.Y)
		end
	end)
	v_u_87.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		-- upvalues: (ref) v_u_91, (copy) v_u_87
		v_u_91 = v_u_87:IsScrolledDown()
	end)
	return v_u_87
end
return v_u_7