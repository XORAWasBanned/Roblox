-- Path: CoreGui.RobloxGui.Modules.Settings.SettingsPageFactory
local v_u_1 = game:GetService("GuiService")
local v_u_2 = UserSettings():GetService("UserGameSettings")
local v3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("CoreGui")
local v5 = v_u_4:WaitForChild("RobloxGui")
local v_u_6 = game:GetService("TweenService")
local v_u_7 = require(v5.Modules.Settings.Utility)
local v_u_8 = require(v5.Modules.Settings.Theme)
local v9 = require(v3.Workspace.Packages.AppCommonLib)
local v_u_10 = v9.Create
local v_u_11 = v9.Signal
local v12 = require(v3.Workspace.Packages.SharedFlags)
v5:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v13 = v12.FFlagResponsiveUnitsDeprecateTenFoot
local v_u_14 = require(v5.Modules.TenFootInterface):IsEnabled()
if v_u_14 then
	v_u_14 = not v13
end
local v_u_15 = require(script.Parent.Flags.GetFFlagFixIGMTabTransitions)
local v_u_16 = require(script.Parent.Flags.FFlagIEMSettingsGroups)
local v_u_17 = require(script.Parent.Flags.FFlagIEMFocusNavSupportNewButtons)
local v_u_18 = v12.FFlagIEMTabFocusNav
local v_u_19 = require(v3.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local function v_u_64() -- name: Initialize
	-- upvalues: (copy) v_u_19, (copy) v_u_11, (copy) v_u_18, (copy) v_u_10, (copy) v_u_7, (copy) v_u_14, (copy) v_u_8, (copy) v_u_1, (copy) v_u_16, (copy) v_u_17, (copy) v_u_4, (copy) v_u_2, (copy) v_u_15, (copy) v_u_6
	local v_u_20 = {
		["HubRef"] = nil,
		["LastSelectedObject"] = nil,
		["TabPosition"] = 0,
		["Active"] = false,
		["OpenStateChangedCount"] = 0,
		["ShouldShowBottomBar"] = not v_u_19,
		["ShouldShowHubBar"] = true,
		["ShouldDisableDefaultScroll"] = false,
		["IsPageClipped"] = true,
		["SelectARow"] = nil,
		["LastSelectableObjectsUpdated"] = v_u_11.new(),
		["LastSelectableObjects"] = {},
		["PageNextSelectionDown"] = nil
	}
	if v_u_18 then
		v_u_20.FirstSelectableObjectsUpdated = v_u_11.new()
		v_u_20.FirstSelectableObjects = {}
	end
	local v_u_21 = {}
	local v_u_22 = false
	v_u_20.TabHeader = v_u_10("TextButton")({
		["Name"] = "Header",
		["Text"] = "",
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Selectable"] = nil,
		["Size"] = UDim2.new(0.2, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Selectable"] = v_u_18 and true or false
	})
	if v_u_7:IsSmallTouchScreen() then
		v_u_20.TabHeader.Size = UDim2.new(0, 84, 1, 0)
	elseif v_u_14 then
		v_u_20.TabHeader.Size = UDim2.new(0, 220, 1, 0)
	end
	if v_u_18 then
		local function v23() -- name: switchToPage
			-- upvalues: (copy) v_u_20
			if v_u_20.HubRef and v_u_20.HubRef.Pages.CurrentPage ~= v_u_20 then
				v_u_20.HubRef:SwitchToPage(v_u_20, true)
			end
		end
		v_u_20.TabHeader.Activated:connect(v23)
		v_u_20.TabHeader.SelectionGained:connect(v23)
	else
		v_u_20.TabHeader.MouseButton1Click:connect(function()
			-- upvalues: (copy) v_u_20
			if v_u_20.HubRef then
				v_u_20.HubRef:SwitchToPage(v_u_20, true)
			end
		end)
	end
	local v_u_24 = v_u_10("TextLabel")({
		["Name"] = "Icon",
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Text"] = "",
		["TextColor3"] = nil,
		["TextScaled"] = true,
		["TextTransparency"] = 0.5,
		["Parent"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0, 10, 0.5, -18),
		["TextColor3"] = Color3.new(1, 1, 1),
		["Parent"] = v_u_20.TabHeader
	})
	v_u_10("UIAspectRatioConstraint")({
		["Name"] = "AspectRatioConstraint",
		["AspectRatio"] = 1,
		["Parent"] = nil,
		["Parent"] = v_u_24
	})
	local v_u_25 = v_u_10("TextLabel")({
		["Name"] = "Title",
		["Text"] = "",
		["Font"] = nil,
		["TextColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["TextXAlignment"] = nil,
		["TextTransparency"] = 0.5,
		["Font"] = v_u_8.font(Enum.Font.SourceSansBold, "Button"),
		["TextColor3"] = Color3.new(1, 1, 1),
		["Size"] = UDim2.new(1.05, 0, 1, 0),
		["Position"] = UDim2.new(1.2, v_u_8.TabHeaderIconPadding, 0, -2),
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
	v_u_25.TextSize = v_u_8.textSize(24)
	local v26 = Instance.new("UITextSizeConstraint")
	v26.MaxTextSize = v_u_8.textSize(24)
	v_u_25.Parent = v_u_24
	if v_u_7:IsPortrait() and v_u_7:IsSmallTouchScreen() then
		v26.Parent = v_u_25
	end
	if v_u_7:IsSmallTouchScreen() then
		v_u_25.TextSize = v_u_8.textSize(18)
		v26.MaxTextSize = v_u_8.textSize(18)
	elseif v_u_14 then
		v_u_25.TextSize = v_u_8.textSize(48)
		v26.MaxTextSize = v_u_8.textSize(48)
	end
	v_u_10("ImageLabel")({
		["Name"] = "TabSelection",
		["Visible"] = false,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["BorderSizePixel"] = 0,
		["Parent"] = nil,
		["BackgroundColor3"] = v_u_8.color("TabSelection"),
		["BackgroundTransparency"] = v_u_8.transparency("TabSelection"),
		["Size"] = UDim2.new(1, -2, 0, 2),
		["Position"] = UDim2.new(0, 3, 1, -2),
		["Parent"] = v_u_20.TabHeader
	})
	local v_u_27 = v_u_10("Frame")({
		["Name"] = "TabLabel",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Parent"] = v_u_20.TabHeader
	})
	v_u_10("UIListLayout")({
		["Name"] = "Layout",
		["FillDirection"] = nil,
		["VerticalAlignment"] = nil,
		["HorizontalAlignment"] = nil,
		["SortOrder"] = nil,
		["Padding"] = nil,
		["Parent"] = nil,
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, 10),
		["Parent"] = v_u_27
	})
	v_u_24.Parent = v_u_27
	v_u_25.Parent = v_u_27
	v_u_25.Size = UDim2.new(0, 0, 0, 0)
	v_u_25.AutomaticSize = Enum.AutomaticSize.XY
	local function v31() -- name: onResized
		-- upvalues: (copy) v_u_20, (ref) v_u_7, (copy) v_u_24, (ref) v_u_14, (ref) v_u_8, (copy) v_u_27, (copy) v_u_25
		if v_u_20.TabHeader then
			if v_u_7:IsSmallTouchScreen() then
				v_u_24.Size = UDim2.new(0, 34, 0, 28)
			elseif v_u_14 then
				v_u_24.Size = UDim2.new(0, 88, 0, 74)
			else
				local v28 = v_u_8.getIconSize(v_u_8.IconSize.Medium)
				v_u_24.Size = UDim2.fromOffset(v28, v28)
			end
			local v29 = v_u_7:IsPortrait()
			local v30 = v_u_27.Layout
			if v29 then
				if v_u_7:IsSmallTouchScreen() then
					v_u_25.FontSize = v_u_8.fontSize(Enum.FontSize.Size14)
				end
				v_u_24.Size = UDim2.new(0, 22, 0, 22)
				v30.FillDirection = Enum.FillDirection.Vertical
				v30.Padding = UDim.new(0, 0)
			else
				if v_u_7:IsSmallTouchScreen() then
					v_u_25.FontSize = v_u_8.fontSize(Enum.FontSize.Size18)
				end
				v30.FillDirection = Enum.FillDirection.Horizontal
				v30.Padding = UDim.new(0, 10)
			end
			v_u_24.Size = UDim2.fromOffset(v_u_24.Size.X.Offset * 0.6666666666666666, v_u_24.Size.Y.Offset * 0.6666666666666666)
		end
	end
	v_u_7:OnResized(v_u_20.TabHeader, v31)
	v_u_20.Page = v_u_10("Frame")({
		["Name"] = "Page",
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	})
	v_u_10("UIPadding")({
		["PaddingLeft"] = UDim.new(0, 12),
		["PaddingRight"] = UDim.new(0, 11),
		["Parent"] = v_u_20.Page
	})
	v_u_20.PageListLayout = v_u_10("UIListLayout")({
		["Name"] = "RowListLayout",
		["FillDirection"] = nil,
		["HorizontalAlignment"] = nil,
		["VerticalAlignment"] = nil,
		["Padding"] = nil,
		["SortOrder"] = nil,
		["Parent"] = nil,
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["Padding"] = UDim.new(0, 8),
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Parent"] = v_u_20.Page
	})
	v_u_20.Page.SelectionGroup = true
	v_u_20.Displaying = Instance.new("BindableEvent")
	v_u_20.Displaying.Name = "Displaying"
	v_u_20.Displayed = Instance.new("BindableEvent")
	v_u_20.Displayed.Name = "Displayed"
	v_u_20.Displayed.Event:connect(function()
		-- upvalues: (copy) v_u_20
		if v_u_20.HubRef.Shield.Visible then
			v_u_20:SelectARow()
		end
	end)
	v_u_20.Hidden = Instance.new("BindableEvent")
	v_u_20.Hidden.Event:connect(function()
		-- upvalues: (ref) v_u_1, (copy) v_u_20
		if v_u_1.SelectedCoreObject and v_u_1.SelectedCoreObject:IsDescendantOf(v_u_20.Page) then
			v_u_1.SelectedCoreObject = nil
		end
	end)
	v_u_20.Hidden.Name = "Hidden"
	function v_u_20.getValueChangerFrame(_, p32) -- name: getValueChangerFrame
		if type(p32) == "table" then
			return p32.SliderFrame and p32.SliderFrame or (p32.SelectorFrame or p32.DropDownFrame)
		else
			return p32
		end
	end
	function v_u_20.SelectARow(_, p33) -- name: SelectARow
		-- upvalues: (ref) v_u_18, (ref) v_u_1, (copy) v_u_20, (copy) v_u_21, (ref) v_u_16, (ref) v_u_17, (ref) v_u_4
		if not v_u_18 or (p33 or v_u_1.SelectedCoreObject ~= v_u_20.TabHeader) then
			if p33 or not (v_u_1.SelectedCoreObject and v_u_1.SelectedCoreObject:IsDescendantOf(v_u_20.Page)) then
				if v_u_20.LastSelectedObject then
					v_u_1.SelectedCoreObject = v_u_20.LastSelectedObject
					return
				end
				if v_u_21 and #v_u_21 > 0 then
					local v34
					if v_u_16 then
						local v35 = v_u_21[1].ValueChanger
						local v36 = (1 / 0)
						for _, v37 in v_u_21 do
							if not v37.SelectionFrame or v37.SelectionFrame.LayoutOrder >= v36 then
								continue
							end
							v36 = v37.SelectionFrame.LayoutOrder
							v35 = v37
						end
						v34 = v_u_20:getValueChangerFrame(v35.ValueChanger)
					else
						v34 = v_u_20:getValueChangerFrame(v_u_21[1].ValueChanger)
					end
					v_u_1.SelectedCoreObject = v34
					return
				end
				if v_u_20.PageNextSelectionDown and (not v_u_17 or v_u_20.PageNextSelectionDown:IsDescendantOf(v_u_4)) then
					v_u_1.SelectedCoreObject = v_u_20.PageNextSelectionDown
				end
			end
		end
	end
	function v_u_20.Display(_, p_u_38, p39) -- name: Display
		-- upvalues: (copy) v_u_20, (copy) v_u_24, (copy) v_u_25, (ref) v_u_2, (ref) v_u_15, (ref) v_u_22, (ref) v_u_6
		v_u_20.OpenStateChangedCount = v_u_20.OpenStateChangedCount + 1
		if v_u_20.TabHeader then
			v_u_20.TabHeader.TabSelection.Visible = true
			v_u_24.TextTransparency = 0
			v_u_25.TextTransparency = 0
		end
		v_u_20.Page.Parent = p_u_38
		v_u_20.Page.Visible = true
		v_u_20.Displaying:Fire()
		local v_u_40 = UDim2.new(0, 0, 0, 0)
		local function v41()
			-- upvalues: (ref) v_u_2, (copy) p_u_38, (ref) v_u_15, (ref) v_u_20, (copy) v_u_40, (ref) v_u_22
			if v_u_2.ReducedMotion then
				p_u_38.InnerCanvasGroupShow.Visible = false
			end
			if v_u_15() then
				if v_u_2.ReducedMotion then
					p_u_38.InnerCanvasGroupShow.GroupTransparency = 0
				end
				v_u_20.Page.Position = v_u_40
			end
			v_u_20.Page.Visible = true
			v_u_22 = true
			v_u_20.Displayed:Fire()
		end
		if p39 then
			v_u_20.Page.Position = v_u_40
			if v_u_2.ReducedMotion then
				p_u_38.InnerCanvasGroupShow.Visible = false
			end
			if v_u_15() then
				if v_u_2.ReducedMotion then
					p_u_38.InnerCanvasGroupShow.GroupTransparency = 0
				end
				v_u_20.Page.Position = v_u_40
			end
			v_u_20.Page.Visible = true
			v_u_22 = true
			v_u_20.Displayed:Fire()
			return
		elseif v_u_2.ReducedMotion then
			v_u_20.Page.Position = v_u_40
			p_u_38.InnerCanvasGroupShow.GroupTransparency = 1
			p_u_38.InnerCanvasGroupShow.Visible = true
			v_u_20.Page.Parent = p_u_38.InnerCanvasGroupShow
			v_u_20.Page.Visible = true
			local v42 = TweenInfo.new(0.25)
			local v43 = v_u_6:Create(p_u_38.InnerCanvasGroupShow, v42, {
				["GroupTransparency"] = 0
			})
			v43:Play()
			v43.Completed:Connect(function()
				-- upvalues: (ref) v_u_20, (copy) p_u_38, (ref) v_u_2, (ref) v_u_15, (copy) v_u_40, (ref) v_u_22
				v_u_20.Page.Parent = p_u_38
				if v_u_2.ReducedMotion then
					p_u_38.InnerCanvasGroupShow.Visible = false
				end
				if v_u_15() then
					if v_u_2.ReducedMotion then
						p_u_38.InnerCanvasGroupShow.GroupTransparency = 0
					end
					v_u_20.Page.Position = v_u_40
				end
				v_u_20.Page.Visible = true
				v_u_22 = true
				v_u_20.Displayed:Fire()
			end)
		else
			v_u_20.Page:TweenPositionInternal(v_u_40, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v41)
		end
	end
	function v_u_20.Hide(_, p44, p_u_45, p_u_46, p47, p_u_48, p_u_49) -- name: Hide
		-- upvalues: (copy) v_u_20, (copy) v_u_24, (copy) v_u_25, (ref) v_u_2, (ref) v_u_22, (ref) v_u_6
		v_u_20.OpenStateChangedCount = v_u_20.OpenStateChangedCount + 1
		if v_u_20.TabHeader then
			v_u_20.TabHeader.TabSelection.Visible = false
			v_u_24.TextTransparency = 0.5
			v_u_25.TextTransparency = 0.5
		end
		if v_u_20.Page.Parent then
			local v_u_50 = UDim2.new(1 * p44, 0, 0, 0)
			local function v_u_51()
				-- upvalues: (ref) v_u_2, (copy) p_u_49, (copy) p_u_48, (ref) v_u_20, (copy) p_u_45, (ref) v_u_22
				if v_u_2.ReducedMotion and p_u_49 then
					p_u_48.InnerCanvasGroupHide.Visible = false
				end
				v_u_20.Page.Visible = false
				v_u_20.Page.Position = UDim2.new(v_u_20.TabPosition - p_u_45, 0, 0, 0)
				v_u_22 = false
				v_u_20.Hidden:Fire()
			end
			local function v_u_54()
				-- upvalues: (copy) p_u_46, (ref) v_u_20, (copy) v_u_50, (ref) v_u_2, (copy) p_u_49, (copy) p_u_48, (copy) p_u_45, (ref) v_u_22, (ref) v_u_6, (copy) v_u_51
				if p_u_46 then
					v_u_20.Page.Position = v_u_50
					if v_u_2.ReducedMotion and p_u_49 then
						p_u_48.InnerCanvasGroupHide.Visible = false
					end
					v_u_20.Page.Visible = false
					v_u_20.Page.Position = UDim2.new(v_u_20.TabPosition - p_u_45, 0, 0, 0)
					v_u_22 = false
					v_u_20.Hidden:Fire()
					return
				elseif v_u_2.ReducedMotion and p_u_49 then
					p_u_48.InnerCanvasGroupHide.GroupTransparency = 0
					p_u_48.InnerCanvasGroupHide.Visible = true
					v_u_20.Page.Parent = p_u_48.InnerCanvasGroupHide
					local v52 = TweenInfo.new(0.25)
					local v53 = v_u_6:Create(p_u_48.InnerCanvasGroupHide, v52, {
						["GroupTransparency"] = 1
					})
					v53:Play()
					v53.Completed:Connect(function()
						-- upvalues: (ref) v_u_20, (ref) p_u_48, (ref) v_u_50, (ref) v_u_2, (ref) p_u_49, (ref) p_u_45, (ref) v_u_22
						v_u_20.Page.Parent = p_u_48
						v_u_20.Page.Position = v_u_50
						if v_u_2.ReducedMotion and p_u_49 then
							p_u_48.InnerCanvasGroupHide.Visible = false
						end
						v_u_20.Page.Visible = false
						v_u_20.Page.Position = UDim2.new(v_u_20.TabPosition - p_u_45, 0, 0, 0)
						v_u_22 = false
						v_u_20.Hidden:Fire()
					end)
				else
					v_u_20.Page:TweenPositionInternal(v_u_50, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v_u_51)
				end
			end
			if p47 then
				local v_u_55 = v_u_20.OpenStateChangedCount
				delay(p47, function()
					-- upvalues: (copy) v_u_55, (ref) v_u_20, (copy) v_u_54
					if v_u_55 == v_u_20.OpenStateChangedCount then
						v_u_54()
					end
				end)
				return
			end
			v_u_54()
		end
	end
	function v_u_20.GetDisplayed(_) -- name: GetDisplayed
		-- upvalues: (ref) v_u_22
		return v_u_22
	end
	function v_u_20.GetVisibility(_) -- name: GetVisibility
		-- upvalues: (copy) v_u_20
		return v_u_20.Page.Parent
	end
	function v_u_20.GetTabHeader(_) -- name: GetTabHeader
		-- upvalues: (copy) v_u_20
		return v_u_20.TabHeader
	end
	function v_u_20.GetRows(_) -- name: GetRows
		-- upvalues: (copy) v_u_21
		return v_u_21
	end
	function v_u_20.SetHub(_, p56) -- name: SetHub
		-- upvalues: (copy) v_u_20, (copy) v_u_21
		v_u_20.HubRef = p56
		for _, v57 in next, v_u_21 do
			local v58 = v57.ValueChanger
			if type(v58) ~= "table" then
				continue
			end
			v57.ValueChanger.HubRef = v_u_20.HubRef
		end
	end
	function v_u_20.GetSize(_) -- name: GetSize
		-- upvalues: (copy) v_u_20
		return v_u_20.Page.AbsoluteSize
	end
	function v_u_20.AddRow(_, p59, p60, p61, p62) -- name: AddRow
		-- upvalues: (copy) v_u_21, (copy) v_u_20
		v_u_21[#v_u_21 + 1] = {
			["SelectionFrame"] = p59,
			["Label"] = p60,
			["ValueChanger"] = p61
		}
		local v63 = not p59 and 0 or p59.Size.Y.Offset
		if p62 then
			v_u_20.Page.Size = UDim2.new(1, 0, 0, v_u_20.Page.Size.Y.Offset + v63 + p62)
		else
			v_u_20.Page.Size = UDim2.new(1, 0, 0, v_u_20.Page.Size.Y.Offset + v63)
		end
		if v_u_20.HubRef and type(p61) == "table" then
			p61.HubRef = v_u_20.HubRef
		end
	end
	return v_u_20
end
return {
	["CreateNewPage"] = function(_) -- name: CreateNewPage
		-- upvalues: (copy) v_u_64
		return v_u_64()
	end
}