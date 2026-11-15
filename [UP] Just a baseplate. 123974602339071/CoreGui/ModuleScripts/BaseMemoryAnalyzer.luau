-- Path: CoreGui.RobloxGui.Modules.Stats.BaseMemoryAnalyzer
local v_u_1 = Color3.new(0.35, 0.55, 0.35)
local v_u_2 = Color3.new(0.15, 0.35, 0.15)
local v_u_3 = Color3.new(1, 1, 1)
local v_u_4 = Color3.new(1, 1, 1)
local v_u_5 = Color3.new(1, 1, 1)
local v_u_6 = UDim2.new(0, 0, 0, 0)
local v_u_7 = UDim2.new(1, -18, 0, 2)
local v_u_8 = UDim2.new(0, 16, 0, 16)
local v_u_9 = UDim2.new(1, -100, 0, 0)
local v_u_10 = UDim2.new(0, 100, 0, 20)
game:GetService("CoreGui")
local v_u_11 = {}
v_u_11.__index = v_u_11
function v_u_11.new(p12) -- name: new
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	local v_u_13 = {}
	local v14 = v_u_11
	setmetatable(v_u_13, v14)
	v_u_13._treeViewItem = p12
	v_u_13._expanded = true
	v_u_13._expansionToggleCallback = nil
	v_u_13._frame = Instance.new("Frame")
	v_u_13._frame.Name = "MemoryAnalyzerRowClassFrame"
	v_u_13._frame.BackgroundTransparency = 1
	v_u_13._buttonFrame = Instance.new("Frame")
	v_u_13._buttonFrame.Name = "ButtonFrame"
	v_u_13._buttonFrame.Parent = v_u_13._frame
	v_u_13._buttonFrame.Position = v_u_6
	local v15 = (1 + p12:getStackDepth()) * 20
	v_u_13._buttonFrame.Size = UDim2.new(0, v15, 0, 20)
	local v16 = v_u_13._buttonFrame
	v16.BorderColor3 = v_u_4
	v16.BorderSizePixel = 1
	v16.BackgroundTransparency = 0.6
	v_u_13._button = Instance.new("TextButton")
	v_u_13._button.Name = "Button"
	v_u_13._button.Parent = v_u_13._buttonFrame
	local v17 = v_u_13._button
	v17.TextXAlignment = Enum.TextXAlignment.Center
	v17.TextColor3 = v_u_3
	v17.BackgroundTransparency = 1
	v17.BorderColor3 = v_u_5
	v17.BorderSizePixel = 1
	v17.Position = v_u_7
	v17.Size = v_u_8
	v_u_13._button.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_13
		v_u_13:__toggleExpansion()
	end)
	v_u_13:__updateButtonState()
	v_u_13._labelFrame = Instance.new("Frame")
	v_u_13._labelFrame.Name = "LabelFrame"
	v_u_13._labelFrame.Parent = v_u_13._frame
	v_u_13._labelFrame.Position = UDim2.new(0, v15, 0, 0)
	v_u_13._labelFrame.Size = UDim2.new(1, -v15 - 100, 0, 20)
	local v18 = v_u_13._labelFrame
	v18.BorderColor3 = v_u_4
	v18.BorderSizePixel = 1
	v18.BackgroundTransparency = 0.6
	v_u_13._labelTextLabel = Instance.new("TextLabel")
	v_u_13._labelTextLabel.Name = "Label"
	v_u_13._labelTextLabel.Parent = v_u_13._labelFrame
	local v19 = v_u_13._labelTextLabel
	v19.TextXAlignment = Enum.TextXAlignment.Left
	v19.TextColor3 = v_u_3
	v19.BackgroundTransparency = 1
	v19.Position = UDim2.new(0, 5, 0, 0)
	v19.Size = UDim2.new(1, -10, 1, 0)
	v_u_13._labelTextLabel.Text = p12:getLabel()
	v_u_13._valueFrame = Instance.new("Frame")
	v_u_13._valueFrame.Name = "ValueFrame"
	v_u_13._valueFrame.Parent = v_u_13._frame
	v_u_13._valueFrame.Position = v_u_9
	v_u_13._valueFrame.Size = v_u_10
	local v20 = v_u_13._valueFrame
	v20.BorderColor3 = v_u_4
	v20.BorderSizePixel = 1
	v20.BackgroundTransparency = 0.6
	v_u_13._valueTextLabel = Instance.new("TextLabel")
	v_u_13._valueTextLabel.Name = "Value"
	v_u_13._valueTextLabel.Parent = v_u_13._valueFrame
	local v21 = v_u_13._valueTextLabel
	v21.TextXAlignment = Enum.TextXAlignment.Left
	v21.TextColor3 = v_u_3
	v21.BackgroundTransparency = 1
	v21.Position = UDim2.new(0, 5, 0, 0)
	v21.Size = UDim2.new(1, -10, 1, 0)
	v_u_13._valueHasBeenNonZero = false
	v_u_13:updateValue()
	return v_u_13
end
function v_u_11.isExpanded(p22) -- name: isExpanded
	return p22._expanded
end
function v_u_11.valueHasBeenNonZero(p23) -- name: valueHasBeenNonZero
	return p23._valueHasBeenNonZero
end
function v_u_11.setExpansionToggleCallback(p24, p25) -- name: setExpansionToggleCallback
	p24._expansionToggleCallback = p25
end
function v_u_11.__toggleExpansion(p26) -- name: __toggleExpansion
	p26._expanded = not p26._expanded
	p26:__updateButtonState()
	if p26._expansionToggleCallback ~= nil then
		p26._expansionToggleCallback()
	end
end
function v_u_11.__updateButtonState(p27) -- name: __updateButtonState
	if #p27._treeViewItem:getChildren() == 0 then
		p27._button.Visible = false
		return
	else
		p27._button.Visible = true
		if p27._expanded then
			p27._button.Text = "-"
		else
			p27._button.Text = "+"
		end
	end
end
function v_u_11.updateValue(p28) -- name: updateValue
	if p28._treeViewItem:getValue() >= 0.001 then
		p28._valueHasBeenNonZero = true
	end
	p28._valueTextLabel.Text = string.format("%.3f", p28._treeViewItem:getValue())
end
function v_u_11.setZIndex(p29, p30) -- name: setZIndex
	p29._frame.ZIndex = p30
	p29._labelTextLabel.ZIndex = p30
	p29._valueTextLabel.ZIndex = p30
end
function v_u_11.setRowValue(p31, p32) -- name: setRowValue
	p31._valueTextLabel.Text = string.format("%.3f", p32)
end
function v_u_11.getFrame(p33) -- name: getFrame
	return p33._frame
end
function v_u_11.setRowNumber(p34, p35) -- name: setRowNumber
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if p35 % 2 == 1 then
		p34._buttonFrame.BackgroundColor3 = v_u_1
		p34._labelFrame.BackgroundColor3 = v_u_1
		p34._valueFrame.BackgroundColor3 = v_u_1
	else
		p34._buttonFrame.BackgroundColor3 = v_u_2
		p34._labelFrame.BackgroundColor3 = v_u_2
		p34._valueFrame.BackgroundColor3 = v_u_2
	end
end
local v_u_36 = {}
v_u_36.__index = v_u_36
v_u_36.Indent = string.rep(" ", 4)
function v_u_36.new(p37) -- name: new
	-- upvalues: (copy) v_u_36
	local v38 = {}
	local v39 = v_u_36
	setmetatable(v38, v39)
	v38._frame = Instance.new("Frame")
	v38._frame.Name = "MemoryAnalyzerClassFrame"
	v38._frame.ZIndex = p37.ZIndex
	v38._frame.BackgroundTransparency = 1
	v38._rowsByTreeViewItem = {}
	v38._layoutDirty = false
	v38._heightChangedCallback = nil
	v38._heightInPix = 0
	v38._frame.Parent = p37
	return v38
end
function v_u_36.getMemoryUsageTree(_) -- name: getMemoryUsageTree
	return nil
end
function v_u_36.setHeightChangedCallback(p40, p41) -- name: setHeightChangedCallback
	p40._heightChangedCallback = p41
end
function v_u_36.__getOrMakeRowForTreeViewItem(p_u_42, p43) -- name: __getOrMakeRowForTreeViewItem
	-- upvalues: (copy) v_u_11
	if p_u_42._rowsByTreeViewItem[p43] == nil then
		local v44 = v_u_11.new(p43)
		v44:setExpansionToggleCallback(function()
			-- upvalues: (copy) p_u_42
			p_u_42:__layoutRows()
		end)
		v44:getFrame().Parent = p_u_42._frame
		p_u_42._rowsByTreeViewItem[p43] = v44
		p_u_42._layoutDirty = true
	end
	return p_u_42._rowsByTreeViewItem[p43]
end
function v_u_36.__recursiveUpdateStatValue(p45, p46) -- name: __recursiveUpdateStatValue
	p45:__getOrMakeRowForTreeViewItem(p46):updateValue()
	local v47 = p46:getChildren()
	for _, v48 in ipairs(v47) do
		p45:__recursiveUpdateStatValue(v48)
	end
end
function v_u_36.renderUpdates(p49) -- name: renderUpdates
	local v50 = p49:getMemoryUsageTree()
	if v50 ~= nil then
		p49:__recursiveUpdateStatValue(v50)
	end
	if p49._layoutDirty then
		p49:__layoutRows()
	end
end
function v_u_36.__layoutRows(p51) -- name: __layoutRows
	p51._layoutDirty = false
	p51._heightInPix = 0
	if p51:getMemoryUsageTree() ~= nil then
		p51:__recursiveLayoutTreeViewItem(p51:getMemoryUsageTree(), true)
	end
	p51._frame.Size = UDim2.new(1, 0, 0, p51._heightInPix)
	p51._frame.Position = UDim2.new(0, 0, 0, 0)
	if p51._heightChangedCallback then
		p51._heightChangedCallback(p51._heightInPix)
	end
end
function v_u_36.__recursiveLayoutTreeViewItem(p52, p53, p54) -- name: __recursiveLayoutTreeViewItem
	local v55 = p52:__getOrMakeRowForTreeViewItem(p53)
	local v56 = v55:getFrame()
	if p54 then
		p54 = v55:valueHasBeenNonZero()
	end
	if p54 then
		v56.Visible = true
		v56.Size = UDim2.new(1, 0, 0, 20)
		v56.Position = UDim2.new(0, 0, 0, p52._heightInPix)
		v55:setZIndex(p52._frame.ZIndex)
		v55:setRowNumber(p52._heightInPix / 20)
		p52._heightInPix = p52._heightInPix + 20
	else
		v56.Visible = false
	end
	local v57 = p53:getChildren()
	for _, v58 in ipairs(v57) do
		p52:__recursiveLayoutTreeViewItem(v58, v55:isExpanded() and p54)
	end
end
function v_u_36.getHeightInPix(p59) -- name: getHeightInPix
	return p59._heightInPix
end
return v_u_36