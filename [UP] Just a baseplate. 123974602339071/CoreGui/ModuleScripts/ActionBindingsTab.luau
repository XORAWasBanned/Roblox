-- Path: CoreGui.RobloxGui.Modules.ActionBindingsTab
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("CorePackages")
v1:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Workspace.Packages.AppCommonLib).Create
local v_u_6 = Color3.new(0.1, 0, 0)
local v_u_7 = Color3.new(0, 0, 0)
TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local v_u_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true, 0)
local v_u_9 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local v_u_10 = nil
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local v_u_19 = true
local function v_u_24(p20, p21) -- name: sortInputTypeRows
	-- upvalues: (copy) v_u_12
	local v22 = v_u_12[p20]
	local v23 = v_u_12[p21]
	return tostring(v22) < tostring(v23)
end
local function v_u_33(p25, p26) -- name: sortActionRows
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	local v27 = v_u_14[p25]
	local v28 = v_u_14[p26]
	if not (v27 and v28) then
		return true
	end
	local v29 = v_u_15[p25]
	local v30 = v_u_15[p26]
	if v29 ~= v30 then
		return tostring(v29) < tostring(v30)
	end
	if v27.isCore and not v28.isCore then
		return true
	end
	if not v27.isCore and v28.isCore then
		return false
	end
	local v31 = v27.stackOrder
	local v32 = v28.stackOrder
	return not (v31 and v32) and true or v32 < v31
end
local function v_u_37(p34, p35) -- name: createEmptyRow
	-- upvalues: (copy) v_u_5
	local v36 = v_u_5("Frame")({
		["Name"] = nil,
		["BackgroundTransparency"] = 1,
		["ZIndex"] = 6,
		["Size"] = nil,
		["Name"] = p34,
		["Size"] = UDim2.new(1, 0, 0, p35 or 0)
	})
	v_u_5("UIListLayout")({
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, 5),
		["Parent"] = v36
	})
	return v36
end
local function v_u_41(p38, p39) -- name: createButtonRow
	-- upvalues: (copy) v_u_5
	local v40 = v_u_5("TextButton")({
		["Name"] = nil,
		["BackgroundTransparency"] = 1,
		["ZIndex"] = 6,
		["Text"] = "",
		["Size"] = nil,
		["Name"] = p38,
		["Size"] = UDim2.new(1, 0, 0, p39 or 0)
	})
	v_u_5("UIListLayout")({
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, 5),
		["Parent"] = v40
	})
	return v40
end
local function v_u_44(p42, p43) -- name: createEmptyColumn
	-- upvalues: (copy) v_u_5
	return v_u_5("Frame")({
		["Name"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.75,
		["BorderSizePixel"] = 0,
		["Size"] = nil,
		["ZIndex"] = 6,
		["ClipsDescendants"] = true,
		["Parent"] = nil,
		["Name"] = p43,
		["BackgroundColor3"] = Color3.new(0, 0, 0),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Parent"] = p42
	})
end
local function v_u_51(p45, p46, p47, p48, p49) -- name: createImageColumn
	-- upvalues: (copy) v_u_44, (copy) v_u_5
	local v50 = v_u_44(p45, p46)
	v_u_5("UIAspectRatioConstraint")({
		["AspectRatio"] = p48 or 1,
		["Parent"] = v50
	})
	v_u_5("ImageLabel")({
		["Name"] = "ColumnImage",
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["ZIndex"] = 6,
		["Image"] = nil,
		["Parent"] = nil,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(p49 or 1, 0, p49 or 1, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Image"] = p47,
		["Parent"] = v50
	})
	return v50
end
local function v_u_56(p52, p53, p54) -- name: createTextColumn
	-- upvalues: (copy) v_u_44, (copy) v_u_5
	local v55 = v_u_44(p52, p53)
	v_u_5("TextLabel")({
		["Name"] = "ColumnText",
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["ZIndex"] = 6,
		["Text"] = nil,
		["TextSize"] = 18,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Font"] = nil,
		["Parent"] = nil,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(1, -10, 1, -10),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Text"] = p54,
		["TextColor3"] = Color3.new(1, 1, 1),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Font"] = Enum.Font.SourceSans,
		["Parent"] = v55
	})
	return v55
end
local function v_u_67(p57, p58) -- name: createActionColumns
	-- upvalues: (copy) v_u_44, (copy) v_u_56
	local v59 = v_u_44(p57, "Inset")
	v59.LayoutOrder = 0
	v59.BackgroundTransparency = 1
	v59.Size = UDim2.new(0, 30, 1, 0)
	local v60 = 0 + 30 + 5
	local v61 = v_u_56(p57, "Priority", "Priority")
	v61.LayoutOrder = 1
	v61.BackgroundColor3 = p58
	v61.Size = UDim2.new(0, 80, 1, 0)
	local v62 = v60 + 80 + 5
	local v63 = v_u_56(p57, "Security", "Security")
	v63.LayoutOrder = 2
	v63.BackgroundColor3 = p58
	v63.Size = UDim2.new(0, 80, 1, 0)
	local v64 = v62 + 80 + 5
	local v65 = v_u_56(p57, "ActionName", "Action Name")
	v65.LayoutOrder = 3
	v65.BackgroundColor3 = p58
	v65.Size = UDim2.new(0.25, 0, 1, 0)
	local v66 = v_u_56(p57, "InputTypes", "Input Types")
	v66.LayoutOrder = 4
	v66.BackgroundColor3 = p58
	v66.Size = UDim2.new(0.75, -v64 - 5, 1, 0)
	return v59, v61, v63, v65, v66
end
local function v_u_78() -- name: updateContainerCanvas
	-- upvalues: (ref) v_u_19, (copy) v_u_11, (copy) v_u_24, (copy) v_u_12, (copy) v_u_17, (copy) v_u_13, (copy) v_u_33
	debug.profilebegin("updateContainerCanvas")
	if v_u_19 then
		v_u_19 = false
		local v68 = {}
		local v69 = 1
		for _, v70 in pairs(v_u_11) do
			table.insert(v68, v70)
		end
		table.sort(v68, v_u_24)
		for _, v71 in pairs(v68) do
			local v72 = v_u_12[v71]
			v71.LayoutOrder = v69
			v69 = v69 + 1
			local v73 = v_u_17[v72]
			if v73 then
				v73.LayoutOrder = v69
				v69 = v69 + 1
			end
			local v74 = v_u_13[v72]
			if not v74 then
				continue
			end
			local v75 = {}
			for _, v76 in pairs(v74) do
				table.insert(v75, v76)
			end
			table.sort(v75, v_u_33)
			for _, v77 in pairs(v75) do
				v77.LayoutOrder = v69
				v69 = v69 + 1
			end
		end
	end
	debug.profileend()
end
local function v_u_81(p79) -- name: scrollContainerToRow
	-- upvalues: (ref) v_u_10, (copy) v_u_3, (copy) v_u_9
	local v80 = p79.AbsolutePosition.Y - v_u_10.AbsolutePosition.Y
	v_u_3:Create(v_u_10, v_u_9, {
		["CanvasPosition"] = v_u_10.CanvasPosition + Vector2.new(0, v80)
	}):Play()
end
local v_u_132 = {
	["initializeGui"] = function(p82) -- name: initializeGui
		-- upvalues: (copy) v_u_5, (ref) v_u_10, (copy) v_u_132, (copy) v_u_2, (ref) v_u_19, (copy) v_u_78
		local v83 = v_u_5("ScrollingFrame")({
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["BorderSizePixel"] = 0,
			["ScrollBarThickness"] = 4,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 6,
			["Parent"] = nil,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(1, -10, 1, -10),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Parent"] = p82
		})
		v_u_10 = v83
		local v_u_84 = v_u_5("UIListLayout")({
			["Padding"] = UDim.new(0, 5),
			["Parent"] = v83
		})
		v_u_84.SortOrder = Enum.SortOrder.LayoutOrder
		v_u_84:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			-- upvalues: (ref) v_u_10, (copy) v_u_84
			v_u_10.CanvasSize = UDim2.new(0, 0, 0, v_u_84.AbsoluteContentSize.Y)
		end)
		v_u_132.updateGuis()
		v_u_2.BoundActionAdded:connect(function(p85, _, p86, p87)
			-- upvalues: (ref) v_u_132, (ref) v_u_19, (ref) v_u_78
			p86.isCore = p87
			v_u_132.updateActionRows(p85, p86)
			v_u_19 = true
			v_u_78()
		end)
		v_u_2.BoundActionRemoved:connect(function(p88, p89, p90)
			-- upvalues: (ref) v_u_132, (ref) v_u_19, (ref) v_u_78
			p89.isCore = p90
			v_u_132.removeActionRows(p88, p89)
			v_u_19 = true
			v_u_78()
		end)
	end,
	["updateBoundInputTypeRow"] = function(p_u_91) -- name: updateBoundInputTypeRow
		-- upvalues: (copy) v_u_11, (copy) v_u_41, (copy) v_u_51, (copy) v_u_56, (copy) v_u_37, (copy) v_u_67, (copy) v_u_7, (copy) v_u_12, (copy) v_u_16, (copy) v_u_17, (ref) v_u_10, (copy) v_u_3, (copy) v_u_8, (copy) v_u_18, (copy) v_u_13, (copy) v_u_78, (copy) v_u_81
		if not v_u_11[p_u_91] then
			local v_u_92 = v_u_41("BoundInputType", 30)
			local v_u_93 = v_u_51(v_u_92, "ExpandImage", "rbxasset://textures/ui/ExpandArrowSheet.png", 1, 0.35)
			v_u_93.ColumnImage.ImageRectSize = Vector2.new(21, 21)
			v_u_93.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
			local v_u_94 = v_u_56(v_u_92, "InputType", (tostring(p_u_91)))
			v_u_94.Size = UDim2.new(1, -35, 1, 0)
			v_u_94.ColumnText.Font = Enum.Font.SourceSansBold
			local v_u_95 = v_u_37("TableHeader", 20)
			v_u_95.Visible = false
			local _, v96, v97, v98, v99 = v_u_67(v_u_95, v_u_7)
			v96.ColumnText.Font = Enum.Font.SourceSansBold
			v97.ColumnText.Font = Enum.Font.SourceSansBold
			v98.ColumnText.Font = Enum.Font.SourceSansBold
			v99.ColumnText.Font = Enum.Font.SourceSansBold
			v_u_11[p_u_91] = v_u_92
			v_u_12[v_u_92] = p_u_91
			v_u_16[v_u_95] = p_u_91
			v_u_17[p_u_91] = v_u_95
			v_u_95.Parent = v_u_10
			v_u_92.Parent = v_u_10
			v_u_3:Create(v_u_94, v_u_8, {
				["BackgroundColor3"] = Color3.new(0.5, 0.5, 0.5)
			}):Play()
			v_u_18[p_u_91] = false
			v_u_92.MouseButton1Click:connect(function()
				-- upvalues: (ref) v_u_18, (copy) p_u_91, (ref) v_u_13, (copy) v_u_93, (copy) v_u_95, (ref) v_u_78, (ref) v_u_3, (copy) v_u_94, (ref) v_u_8, (ref) v_u_81, (copy) v_u_92
				v_u_18[p_u_91] = not v_u_18[p_u_91]
				local v100 = v_u_13[p_u_91]
				if v_u_18[p_u_91] then
					v_u_93.ColumnImage.ImageRectOffset = Vector2.new(21, 0)
					v_u_95.Visible = true
					if v100 then
						for _, v101 in pairs(v100) do
							v101.Visible = true
						end
					end
				else
					v_u_93.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
					v_u_95.Visible = false
					if v100 then
						for _, v102 in pairs(v100) do
							v102.Visible = false
						end
					end
				end
				v_u_78()
				if v_u_18[p_u_91] then
					v_u_3:Create(v_u_94, v_u_8, {
						["BackgroundColor3"] = Color3.new(0.5, 0.5, 0.5)
					}):Play()
					v_u_81(v_u_92)
				end
			end)
		end
	end,
	["updateActionRowForInputType"] = function(p103, p104, p105) -- name: updateActionRowForInputType
		-- upvalues: (copy) v_u_13, (copy) v_u_37, (copy) v_u_18, (copy) v_u_67, (copy) v_u_6, (copy) v_u_7, (copy) v_u_15, (copy) v_u_14, (ref) v_u_10, (copy) v_u_3, (copy) v_u_8, (copy) v_u_11
		local v106 = v_u_13[p105]
		if not v106 then
			v106 = {}
			v_u_13[p105] = v106
		end
		if not v106[p103] then
			local v107 = v_u_37("BoundAction", 20)
			v107.Visible = v_u_18[p105]
			local v108 = {}
			for v109, v110 in pairs(p104.inputTypes) do
				v108[v109] = tostring(v110)
			end
			local _, v111, v112, v113, v114 = v_u_67(v107, p104.isCore and v_u_6 or v_u_7)
			v111.ColumnText.Text = p104.priorityLevel or "Default"
			v112.ColumnText.Text = p104.isCore and "Core" or "Developer"
			v113.ColumnText.Text = p103
			v114.ColumnText.Text = table.concat(v108, ", ")
			if p104.isCore then
				v111.ColumnText.Font = Enum.Font.SourceSansItalic
				v112.ColumnText.Font = Enum.Font.SourceSansItalic
				v113.ColumnText.Font = Enum.Font.SourceSansItalic
				v114.ColumnText.Font = Enum.Font.SourceSansItalic
			end
			v106[p103] = v107
			v_u_15[v107] = p105
			v_u_14[v107] = p104
			v107.Parent = v_u_10
			if v107.Visible then
				v_u_3:Create(v113, v_u_8, {
					["BackgroundColor3"] = Color3.new(0.5, 0.5, 0.5)
				}):Play()
			else
				local v115 = v_u_11[p105]
				if v115 then
					v_u_3:Create(v115.InputType, v_u_8, {
						["BackgroundColor3"] = Color3.new(0.5, 0.5, 0.5)
					}):Play()
				end
			end
		end
	end,
	["updateActionRows"] = function(p116, p117) -- name: updateActionRows
		-- upvalues: (copy) v_u_132
		for _, v118 in pairs(p117.inputTypes) do
			v_u_132.updateBoundInputTypeRow(v118)
			v_u_132.updateActionRowForInputType(p116, p117, v118)
		end
	end,
	["removeActionRows"] = function(p119, p120) -- name: removeActionRows
		-- upvalues: (copy) v_u_13, (copy) v_u_11, (copy) v_u_17, (copy) v_u_78, (ref) v_u_10
		for _, v121 in pairs(p120.inputTypes) do
			local v122 = v_u_13[v121]
			if not v122 then
				continue
			end
			v122[p119]:Destroy()
			v122[p119] = nil
			local v123 = true
			for _, _ in pairs(v122) do
				v123 = false
			end
			if not v123 then
				continue
			end
			local v124 = v_u_11[v121]
			if v124 then
				v124:Destroy()
				v_u_11[v121] = nil
			end
			local v125 = v_u_17[v121]
			if not v125 then
				continue
			end
			v_u_17[v125] = nil
			v125:Destroy()
			v_u_17[v121] = nil
		end
		v_u_78()
		v_u_10.UIListLayout:ApplyLayout()
	end,
	["updateGuis"] = function() -- name: updateGuis
		-- upvalues: (copy) v_u_2, (copy) v_u_132, (ref) v_u_19, (copy) v_u_78
		local v126 = v_u_2:GetAllBoundCoreActionInfo()
		for v127, v128 in pairs(v126) do
			v128.isCore = true
			v_u_132.updateActionRows(v127, v128)
		end
		local v129 = v_u_2:GetAllBoundActionInfo()
		for v130, v131 in pairs(v129) do
			v131.isCore = false
			v_u_132.updateActionRows(v130, v131)
		end
		v_u_19 = true
		v_u_78()
	end
}
return v_u_132